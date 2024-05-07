function ros2msg = yolov8_msgs_msg_BoundingBox2D_1To2_Converter(message,ros2msg)
%yolov8_msgs_msg_BoundingBox2D_1To2_Converter passes data of ROS message to ROS 2 message.
% Copyright 2019 The MathWorks, Inc.
ros2msg.center.position.x = message.Center.Position.X;
ros2msg.center.position.y = message.Center.Position.Y;
ros2msg.center.theta = message.Center.Theta;
ros2msg.size.x = message.Size.X;
ros2msg.size.y = message.Size.Y;
end