function ros1msg = yolov8_msgs_msg_KeyPoint2DArray_2To1_Converter(message,ros1msg)
%yolov8_msgs_msg_KeyPoint2DArray_2To1_Converter passes data of ROS 2 message to ROS message.
% Copyright 2019 The MathWorks, Inc.    
ros1msg.Data.Id = message.data.id;
ros1msg.Data.Point.X = message.data.point.x;
ros1msg.Data.Point.Y = message.data.point.y;
ros1msg.Data.Score = message.data.score;
end