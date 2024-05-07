function ros1msg = yolov8_msgs_msg_Detection_2To1_Converter(message,ros1msg)
%yolov8_msgs_msg_Detection_2To1_Converter passes data of ROS 2 message to ROS message.
% Copyright 2019 The MathWorks, Inc.    
ros1msg.ClassId = message.class_id;
ros1msg.ClassName = message.class_name{1};
ros1msg.Score = message.score;
ros1msg.Id = message.id{1};
ros1msg.Bbox.Center.Position.X = message.bbox.center.position.x;
ros1msg.Bbox.Center.Position.Y = message.bbox.center.position.y;
ros1msg.Bbox.Center.Theta = message.bbox.center.theta;
ros1msg.Bbox.Size.X = message.bbox.size.x;
ros1msg.Bbox.Size.Y = message.bbox.size.y;
ros1msg.Bbox3d.Center.Position.X = message.bbox3d.center.position.x;
ros1msg.Bbox3d.Center.Position.Y = message.bbox3d.center.position.y;
ros1msg.Bbox3d.Center.Position.Z = message.bbox3d.center.position.z;
ros1msg.Bbox3d.Center.Orientation.X = message.bbox3d.center.orientation.x;
ros1msg.Bbox3d.Center.Orientation.Y = message.bbox3d.center.orientation.y;
ros1msg.Bbox3d.Center.Orientation.Z = message.bbox3d.center.orientation.z;
ros1msg.Bbox3d.Center.Orientation.W = message.bbox3d.center.orientation.w;
ros1msg.Bbox3d.Size.X = message.bbox3d.size.x;
ros1msg.Bbox3d.Size.Y = message.bbox3d.size.y;
ros1msg.Bbox3d.Size.Z = message.bbox3d.size.z;
ros1msg.Bbox3d.FrameId = message.bbox3d.frame_id{1};
ros1msg.Mask.Height = message.mask.height;
ros1msg.Mask.Width = message.mask.width;
ros1msg.Mask.Data.X = message.mask.data.x;
ros1msg.Mask.Data.Y = message.mask.data.y;
ros1msg.Keypoints.Data.Id = message.keypoints.data.id;
ros1msg.Keypoints.Data.Point.X = message.keypoints.data.point.x;
ros1msg.Keypoints.Data.Point.Y = message.keypoints.data.point.y;
ros1msg.Keypoints.Data.Score = message.keypoints.data.score;
ros1msg.Keypoints3d.Data.Id = message.keypoints3d.data.id;
ros1msg.Keypoints3d.Data.Point.X = message.keypoints3d.data.point.x;
ros1msg.Keypoints3d.Data.Point.Y = message.keypoints3d.data.point.y;
ros1msg.Keypoints3d.Data.Point.Z = message.keypoints3d.data.point.z;
ros1msg.Keypoints3d.Data.Score = message.keypoints3d.data.score;
ros1msg.Keypoints3d.FrameId = message.keypoints3d.frame_id{1};
end