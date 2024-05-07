function ros1msg = yolov8_msgs_msg_BoundingBox3D_2To1_Converter(message,ros1msg)
%yolov8_msgs_msg_BoundingBox3D_2To1_Converter passes data of ROS 2 message to ROS message.
% Copyright 2019 The MathWorks, Inc.    
ros1msg.Center.Position.X = message.center.position.x;
ros1msg.Center.Position.Y = message.center.position.y;
ros1msg.Center.Position.Z = message.center.position.z;
ros1msg.Center.Orientation.X = message.center.orientation.x;
ros1msg.Center.Orientation.Y = message.center.orientation.y;
ros1msg.Center.Orientation.Z = message.center.orientation.z;
ros1msg.Center.Orientation.W = message.center.orientation.w;
ros1msg.Size.X = message.size.x;
ros1msg.Size.Y = message.size.y;
ros1msg.Size.Z = message.size.z;
ros1msg.FrameId = message.frame_id{1};
end