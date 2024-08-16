import cv2
import numpy as np
from typing import List, Tuple

import rclpy
from rclpy.qos import QoSProfile
from rclpy.qos import QoSHistoryPolicy
from rclpy.qos import QoSDurabilityPolicy
from rclpy.qos import QoSReliabilityPolicy
from rclpy.node import Node

import message_filters
from cv_bridge import CvBridge
from tf2_ros.buffer import Buffer
from tf2_ros import TransformException
from tf2_ros.transform_listener import TransformListener

from sensor_msgs.msg import CameraInfo, Image
from geometry_msgs.msg import TransformStamped
from yolov8_msgs.msg import Detection
from yolov8_msgs.msg import DetectionArray
from yolov8_msgs.msg import KeyPoint3D
from yolov8_msgs.msg import KeyPoint3DArray
from yolov8_msgs.msg import BoundingBox3D


class Detect3DNode(Node):

    def __init__(self) -> None:
        super().__init__("bbox3d_node")

        # parameters
        self.declare_parameter("target_frame", "base_link")
        self.declare_parameter("maximum_detection_threshold", 0.3)
        self.declare_parameter("depth_image_units_divisor", 1000)
        self.declare_parameter("depth_image_reliability",
                               QoSReliabilityPolicy.BEST_EFFORT)
        self.declare_parameter("depth_info_reliability",
                               QoSReliabilityPolicy.BEST_EFFORT)

        # aux
        self.tf_buffer = Buffer()
        self.cv_bridge = CvBridge()

        self.target_frame = self.get_parameter(
            "target_frame").get_parameter_value().string_value
        self.maximum_detection_threshold = self.get_parameter(
            "maximum_detection_threshold").get_parameter_value().double_value
        self.depth_image_units_divisor = self.get_parameter(
            "depth_image_units_divisor").get_parameter_value().integer_value
        dimg_reliability = self.get_parameter(
            "depth_image_reliability").get_parameter_value().integer_value

        self.depth_image_qos_profile = QoSProfile(
            reliability=dimg_reliability,
            history=QoSHistoryPolicy.KEEP_LAST,
            durability=QoSDurabilityPolicy.VOLATILE,
            depth=1
        )

        dinfo_reliability = self.get_parameter(
            "depth_info_reliability").get_parameter_value().integer_value

        self.depth_info_qos_profile = QoSProfile(
            reliability=dinfo_reliability,
            history=QoSHistoryPolicy.KEEP_LAST,
            durability=QoSDurabilityPolicy.VOLATILE,
            depth=1
        )
        self.tf_listener = TransformListener(self.tf_buffer, self)

        # pubs
        self._pub = self.create_publisher(DetectionArray, "detections_3d", 10)

        # subs
        self.depth_sub = message_filters.Subscriber(
            self, Image, "depth_image",
            qos_profile=self.depth_image_qos_profile)
        self.depth_info_sub = message_filters.Subscriber(
            self, CameraInfo, "depth_info",
            qos_profile=self.depth_info_qos_profile)
        self.detections_sub = message_filters.Subscriber(
            self, DetectionArray, "detections")

        self._synchronizer = message_filters.ApproximateTimeSynchronizer(
            (self.depth_sub, self.depth_info_sub, self.detections_sub), 10, 0.5)
        self._synchronizer.registerCallback(self.on_detections)

    def on_detections(
        self,
        depth_msg: Image,
        depth_info_msg: CameraInfo,
        detections_msg: DetectionArray,
    ) -> None:

        new_detections_msg = DetectionArray()
        new_detections_msg.header = detections_msg.header
        new_detections_msg.detections = self.process_detections(
            depth_msg, depth_info_msg, detections_msg)
        self._pub.publish(new_detections_msg)

    def process_detections(
        self,
        depth_msg: Image,
        depth_info_msg: CameraInfo,
        detections_msg: DetectionArray
    ) -> List[Detection]:

        # check if there are detections
        if not detections_msg.detections:
            return []

        transform = self.get_transform(depth_info_msg.header.frame_id)

        if transform is None:
            return []

        new_detections = []
        depth_image = self.cv_bridge.imgmsg_to_cv2(depth_msg)

        for detection in detections_msg.detections:
            bbox3d = self.convert_bb_to_3d(
                depth_image, depth_info_msg, detection)

            if bbox3d is not None:
                new_detections.append(detection)

                bbox3d = Detect3DNode.transform_3d_box(
                    bbox3d, transform[0], transform[1])
                bbox3d.frame_id = self.target_frame
                new_detections[-1].bbox3d = bbox3d

                if detection.keypoints.data:
                    keypoints3d = self.convert_keypoints_to_3d(
                        depth_image, depth_info_msg, detection)
                    keypoints3d = Detect3DNode.transform_3d_keypoints(
                        keypoints3d, transform[0], transform[1])
                    keypoints3d.frame_id = self.target_frame
                    new_detections[-1].keypoints3d = keypoints3d

        return new_detections

    def convert_bb_to_3d(
        self,
        depth_image: np.ndarray,
        depth_info: CameraInfo,
        detection: Detection
    ) -> BoundingBox3D:

        center_x = int(detection.bbox.center.position.x)
        center_y = int(detection.bbox.center.position.y)
        size_x = int(detection.bbox.size.x)
        size_y = int(detection.bbox.size.y)

        if detection.mask.data:
            # crop depth image by mask
            mask_array = np.array([[int(ele.x), int(ele.y)]
                                   for ele in detection.mask.data])
            mask = np.zeros(depth_image.shape[:2], dtype=np.uint8)
            cv2.fillPoly(mask, [np.array(mask_array, dtype=np.int32)], 255)
            roi = cv2.bitwise_and(depth_image, depth_image, mask=mask)

        else:
            # crop depth image by the 2d BB
            u_min = max(center_x - size_x // 2, 0)
            u_max = min(center_x + size_x // 2, depth_image.shape[1] - 1)
            v_min = max(center_y - size_y // 2, 0)
            v_max = min(center_y + size_y // 2, depth_image.shape[0] - 1)

            roi = depth_image[v_min:v_max, u_min:u_max]

        roi = roi / self.depth_image_units_divisor  # convert to meters
        if not np.any(roi):
            return None

        # find the z coordinate on the 3D BB
        if detection.mask.data:
            roi = roi[roi > 0]
            bb_center_z_coord = np.median(roi)

        else:
            bb_center_z_coord = depth_image[int(center_y)][int(
                center_x)] / self.depth_image_units_divisor

        z_diff = np.abs(roi - bb_center_z_coord)
        mask_z = z_diff <= self.maximum_detection_threshold
        if not np.any(mask_z):
            return None

        roi = roi[mask_z]
        z_min, z_max = np.min(roi), np.max(roi)
        z = (z_max + z_min) / 2

        if z == 0:
            return None

        # project from image to world space
        k = depth_info.k
        px, py, fx, fy = k[2], k[5], k[0], k[4]
        x = z * (center_x - px) / fx
        y = z * (center_y - py) / fy
        w = z * (size_x / fx)
        h = z * (size_y / fy)

        # create 3D BB
        msg = BoundingBox3D()
        msg.center.position.x = x
        msg.center.position.y = y
        msg.center.position.z = z
        msg.size.x = w
        msg.size.y = h
        msg.size.z = float(z_max - z_min)

        return msg

    def convert_keypoints_to_3d(
        self,
        depth_image: np.ndarray,
        depth_info: CameraInfo,
        detection: Detection
    ) -> KeyPoint3DArray:

        # build an array of 2d keypoints
        keypoints_2d = np.array([[p.point.x, p.point.y]
                                for p in detection.keypoints.data], dtype=np.int16)
        u = np.array(keypoints_2d[:, 1]).clip(0, depth_info.height - 1)
        v = np.array(keypoints_2d[:, 0]).clip(0, depth_info.width - 1)

        # sample depth image and project to 3D
        z = depth_image[u, v]
        k = depth_info.k
        px, py, fx, fy = k[2], k[5], k[0], k[4]
        x = z * (v - px) / fx
        y = z * (u - py) / fy
        keypoints_3d = np.vstack([x, y, z]).transpose()

        # build the 3d keypoints message
        msg = KeyPoint3DArray()
        msg.keypoints = []
        for point in keypoints_3d:
            kp = KeyPoint3D()
            kp.point.x = float(point[0])
            kp.point.y = float(point[1])
            kp.point.z = float(point[2])
            msg.keypoints.append(kp)

        return msg

    def get_transform(self, from_frame: str) -> Tuple[np.ndarray, np.ndarray]:

        try:
            now = rclpy.time.Time()
            transform: TransformStamped = self.tf_buffer.lookup_transform(
                self.target_frame, from_frame, now)

        except TransformException as ex:
            self.get_logger().warn(
                f'Unable to find transform from {from_frame} to {self.target_frame}')
            return None

        translation = transform.transform.translation
        trans = np.array([translation.x, translation.y, translation.z])
        rotation = transform.transform.rotation
        quat = np.array([rotation.x, rotation.y, rotation.z, rotation.w])

        return (trans, quat)

    @staticmethod
    def transform_3d_box(
        bb3d: BoundingBox3D, trans: np.ndarray, quat: np.ndarray
    ) -> BoundingBox3D:
        # convert box coordinates to quaternion
        center_3d = np.array(
            [bb3d.center.position.x, bb3d.center.position.y, bb3d.center.position.z, 1])

        center_3d[:3] = Detect3DNode.quat_transform(
            quat, center_3d[:3]) + trans[:3]

        bb3d.center.position.x = center_3d[0]
        bb3d.center.position.y = center_3d[1]
        bb3d.center.position.z = center_3d[2]

        return bb3d

    @staticmethod
    def transform_3d_keypoints(
        keypoints3d: KeyPoint3DArray, trans: np.ndarray, quat: np.ndarray
    ) -> KeyPoint3DArray:
        # convert keypoints to quaternion
        for keypoint in keypoints3d.keypoints:
            k = np.array([keypoint.point.x, keypoint.point.y, keypoint.point.z])
            keypoint.point = Detect3DNode.quat_transform(quat, k) + trans[:3]

        return keypoints3d

    @staticmethod
    def quat_transform(quat: np.ndarray, vec: np.ndarray) -> np.ndarray:
        q = quat.copy()
        u = vec.copy()
        q_inv = np.array([q[0], -q[1], -q[2], -q[3]])
        return Detect3DNode.quat_mult(Detect3DNode.quat_mult(q, u), q_inv)[:3]

    @staticmethod
    def quat_mult(q: np.ndarray, r: np.ndarray) -> np.ndarray:
        return np.array(
            [
                r[0] * q[0] - r[1] * q[1] - r[2] * q[2] - r[3] * q[3],
                r[0] * q[1] + r[1] * q[0] + r[2] * q[3] - r[3] * q[2],
                r[0] * q[2] - r[1] * q[3] + r[2] * q[0] + r[3] * q[1],
                r[0] * q[3] + r[1] * q[2] - r[2] * q[1] + r[3] * q[0],
            ],
            dtype=np.float64,
        )


def main():
    rclpy.init()
    node = Detect3DNode()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()


if __name__ == "__main__":
    main()
