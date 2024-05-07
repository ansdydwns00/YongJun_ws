function ros1msg = yolov8_msgs_msg_Pose2D_2To1_Converter(message,ros1msg)
%yolov8_msgs_msg_Pose2D_2To1_Converter passes data of ROS 2 message to ROS message.
% Copyright 2019 The MathWorks, Inc.    
ros1msg.Position.X = message.position.x;
ros1msg.Position.Y = message.position.y;
ros1msg.Theta = message.theta;
end