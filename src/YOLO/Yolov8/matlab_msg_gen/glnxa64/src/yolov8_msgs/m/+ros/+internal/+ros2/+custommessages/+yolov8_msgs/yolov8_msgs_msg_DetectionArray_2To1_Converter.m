function ros1msg = yolov8_msgs_msg_DetectionArray_2To1_Converter(message,ros1msg)
%yolov8_msgs_msg_DetectionArray_2To1_Converter passes data of ROS 2 message to ROS message.
% Copyright 2019 The MathWorks, Inc.    
ros1msg.Header.Stamp.Sec = message.header.stamp.sec;
ros1msg.Header.Stamp.Nsec = message.header.stamp.nanosec;
ros1msg.Header.FrameId = message.header.frame_id{1};
ros1msg.Detections.ClassId = message.detections.class_id;
ros1msg.Detections.ClassName = message.detections.class_name{1};
ros1msg.Detections.Score = message.detections.score;
ros1msg.Detections.Id = message.detections.id{1};
ros1msg.Detections.Bbox.Center.Position.X = message.detections.bbox.center.position.x;
ros1msg.Detections.Bbox.Center.Position.Y = message.detections.bbox.center.position.y;
ros1msg.Detections.Bbox.Center.Theta = message.detections.bbox.center.theta;
ros1msg.Detections.Bbox.Size.X = message.detections.bbox.size.x;
ros1msg.Detections.Bbox.Size.Y = message.detections.bbox.size.y;
ros1msg.Detections.Bbox3d.Center.Position.X = message.detections.bbox3d.center.position.x;
ros1msg.Detections.Bbox3d.Center.Position.Y = message.detections.bbox3d.center.position.y;
ros1msg.Detections.Bbox3d.Center.Position.Z = message.detections.bbox3d.center.position.z;
ros1msg.Detections.Bbox3d.Center.Orientation.X = message.detections.bbox3d.center.orientation.x;
ros1msg.Detections.Bbox3d.Center.Orientation.Y = message.detections.bbox3d.center.orientation.y;
ros1msg.Detections.Bbox3d.Center.Orientation.Z = message.detections.bbox3d.center.orientation.z;
ros1msg.Detections.Bbox3d.Center.Orientation.W = message.detections.bbox3d.center.orientation.w;
ros1msg.Detections.Bbox3d.Size.X = message.detections.bbox3d.size.x;
ros1msg.Detections.Bbox3d.Size.Y = message.detections.bbox3d.size.y;
ros1msg.Detections.Bbox3d.Size.Z = message.detections.bbox3d.size.z;
ros1msg.Detections.Bbox3d.FrameId = message.detections.bbox3d.frame_id{1};
ros1msg.Detections.Mask.Height = message.detections.mask.height;
ros1msg.Detections.Mask.Width = message.detections.mask.width;
ros1msg.Detections.Mask.Data.X = message.detections.mask.data.x;
ros1msg.Detections.Mask.Data.Y = message.detections.mask.data.y;
ros1msg.Detections.Keypoints.Data.Id = message.detections.keypoints.data.id;
ros1msg.Detections.Keypoints.Data.Point.X = message.detections.keypoints.data.point.x;
ros1msg.Detections.Keypoints.Data.Point.Y = message.detections.keypoints.data.point.y;
ros1msg.Detections.Keypoints.Data.Score = message.detections.keypoints.data.score;
ros1msg.Detections.Keypoints3d.Data.Id = message.detections.keypoints3d.data.id;
ros1msg.Detections.Keypoints3d.Data.Point.X = message.detections.keypoints3d.data.point.x;
ros1msg.Detections.Keypoints3d.Data.Point.Y = message.detections.keypoints3d.data.point.y;
ros1msg.Detections.Keypoints3d.Data.Point.Z = message.detections.keypoints3d.data.point.z;
ros1msg.Detections.Keypoints3d.Data.Score = message.detections.keypoints3d.data.score;
ros1msg.Detections.Keypoints3d.FrameId = message.detections.keypoints3d.frame_id{1};
end