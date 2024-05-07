function ros2msg = yolov8_msgs_msg_Detection_1To2_Converter(message,ros2msg)
%yolov8_msgs_msg_Detection_1To2_Converter passes data of ROS message to ROS 2 message.
% Copyright 2019 The MathWorks, Inc.
ros2msg.class_id = message.ClassId;
ros2msg.class_name = message.ClassName;
ros2msg.score = message.Score;
ros2msg.id = message.Id;
ros2msg.bbox.center.position.x = message.Bbox.Center.Position.X;
ros2msg.bbox.center.position.y = message.Bbox.Center.Position.Y;
ros2msg.bbox.center.theta = message.Bbox.Center.Theta;
ros2msg.bbox.size.x = message.Bbox.Size.X;
ros2msg.bbox.size.y = message.Bbox.Size.Y;
ros2msg.bbox3d.center.position.x = message.Bbox3d.Center.Position.X;
ros2msg.bbox3d.center.position.y = message.Bbox3d.Center.Position.Y;
ros2msg.bbox3d.center.position.z = message.Bbox3d.Center.Position.Z;
ros2msg.bbox3d.center.orientation.x = message.Bbox3d.Center.Orientation.X;
ros2msg.bbox3d.center.orientation.y = message.Bbox3d.Center.Orientation.Y;
ros2msg.bbox3d.center.orientation.z = message.Bbox3d.Center.Orientation.Z;
ros2msg.bbox3d.center.orientation.w = message.Bbox3d.Center.Orientation.W;
ros2msg.bbox3d.size.x = message.Bbox3d.Size.X;
ros2msg.bbox3d.size.y = message.Bbox3d.Size.Y;
ros2msg.bbox3d.size.z = message.Bbox3d.Size.Z;
ros2msg.bbox3d.frame_id = message.Bbox3d.FrameId;
ros2msg.mask.height = message.Mask.Height;
ros2msg.mask.width = message.Mask.Width;
ros2msg.mask.data.x = message.Mask.Data.X;
ros2msg.mask.data.y = message.Mask.Data.Y;
ros2msg.keypoints.data.id = message.Keypoints.Data.Id;
ros2msg.keypoints.data.point.x = message.Keypoints.Data.Point.X;
ros2msg.keypoints.data.point.y = message.Keypoints.Data.Point.Y;
ros2msg.keypoints.data.score = message.Keypoints.Data.Score;
ros2msg.keypoints3d.data.id = message.Keypoints3d.Data.Id;
ros2msg.keypoints3d.data.point.x = message.Keypoints3d.Data.Point.X;
ros2msg.keypoints3d.data.point.y = message.Keypoints3d.Data.Point.Y;
ros2msg.keypoints3d.data.point.z = message.Keypoints3d.Data.Point.Z;
ros2msg.keypoints3d.data.score = message.Keypoints3d.Data.Score;
ros2msg.keypoints3d.frame_id = message.Keypoints3d.FrameId;
end