function ros1msg = yolov8_msgs_msg_Mask_2To1_Converter(message,ros1msg)
%yolov8_msgs_msg_Mask_2To1_Converter passes data of ROS 2 message to ROS message.
% Copyright 2019 The MathWorks, Inc.    
ros1msg.Height = message.height;
ros1msg.Width = message.width;
ros1msg.Data.X = message.data.x;
ros1msg.Data.Y = message.data.y;
end