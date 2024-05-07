function ros1msg = yolov8_msgs_msg_BoundingBox2D_2To1_Converter(message,ros1msg)
%yolov8_msgs_msg_BoundingBox2D_2To1_Converter passes data of ROS 2 message to ROS message.
% Copyright 2019 The MathWorks, Inc.    
ros1msg.Center.Position.X = message.center.position.x;
ros1msg.Center.Position.Y = message.center.position.y;
ros1msg.Center.Theta = message.center.theta;
ros1msg.Size.X = message.size.x;
ros1msg.Size.Y = message.size.y;
end