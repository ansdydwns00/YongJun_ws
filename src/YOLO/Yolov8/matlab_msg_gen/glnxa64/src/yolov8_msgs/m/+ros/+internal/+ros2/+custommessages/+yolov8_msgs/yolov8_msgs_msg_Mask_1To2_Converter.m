function ros2msg = yolov8_msgs_msg_Mask_1To2_Converter(message,ros2msg)
%yolov8_msgs_msg_Mask_1To2_Converter passes data of ROS message to ROS 2 message.
% Copyright 2019 The MathWorks, Inc.
ros2msg.height = message.Height;
ros2msg.width = message.Width;
ros2msg.data.x = message.Data.X;
ros2msg.data.y = message.Data.Y;
end