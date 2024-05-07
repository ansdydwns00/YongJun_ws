function ros2msg = yolov8_msgs_msg_BoundingBox3D_1To2_Converter(message,ros2msg)
%yolov8_msgs_msg_BoundingBox3D_1To2_Converter passes data of ROS message to ROS 2 message.
% Copyright 2019 The MathWorks, Inc.
ros2msg.center.position.x = message.Center.Position.X;
ros2msg.center.position.y = message.Center.Position.Y;
ros2msg.center.position.z = message.Center.Position.Z;
ros2msg.center.orientation.x = message.Center.Orientation.X;
ros2msg.center.orientation.y = message.Center.Orientation.Y;
ros2msg.center.orientation.z = message.Center.Orientation.Z;
ros2msg.center.orientation.w = message.Center.Orientation.W;
ros2msg.size.x = message.Size.X;
ros2msg.size.y = message.Size.Y;
ros2msg.size.z = message.Size.Z;
ros2msg.frame_id = message.FrameId;
end