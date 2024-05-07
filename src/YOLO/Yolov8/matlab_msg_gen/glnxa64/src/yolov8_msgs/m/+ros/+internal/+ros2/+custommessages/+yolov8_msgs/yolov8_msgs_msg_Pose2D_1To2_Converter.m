function ros2msg = yolov8_msgs_msg_Pose2D_1To2_Converter(message,ros2msg)
%yolov8_msgs_msg_Pose2D_1To2_Converter passes data of ROS message to ROS 2 message.
% Copyright 2019 The MathWorks, Inc.
ros2msg.position.x = message.Position.X;
ros2msg.position.y = message.Position.Y;
ros2msg.theta = message.Theta;
end