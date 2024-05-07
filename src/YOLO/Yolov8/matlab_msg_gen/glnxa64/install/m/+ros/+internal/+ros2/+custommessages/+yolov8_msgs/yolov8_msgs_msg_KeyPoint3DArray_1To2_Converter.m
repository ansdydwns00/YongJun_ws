function ros2msg = yolov8_msgs_msg_KeyPoint3DArray_1To2_Converter(message,ros2msg)
%yolov8_msgs_msg_KeyPoint3DArray_1To2_Converter passes data of ROS message to ROS 2 message.
% Copyright 2019 The MathWorks, Inc.
ros2msg.data.id = message.Data.Id;
ros2msg.data.point.x = message.Data.Point.X;
ros2msg.data.point.y = message.Data.Point.Y;
ros2msg.data.point.z = message.Data.Point.Z;
ros2msg.data.score = message.Data.Score;
ros2msg.frame_id = message.FrameId;
end