function ros1msg = yolov8_msgs_msg_KeyPoint3D_2To1_Converter(message,ros1msg)
%yolov8_msgs_msg_KeyPoint3D_2To1_Converter passes data of ROS 2 message to ROS message.
% Copyright 2019 The MathWorks, Inc.    
ros1msg.Id = message.id;
ros1msg.Point.X = message.point.x;
ros1msg.Point.Y = message.point.y;
ros1msg.Point.Z = message.point.z;
ros1msg.Score = message.score;
end