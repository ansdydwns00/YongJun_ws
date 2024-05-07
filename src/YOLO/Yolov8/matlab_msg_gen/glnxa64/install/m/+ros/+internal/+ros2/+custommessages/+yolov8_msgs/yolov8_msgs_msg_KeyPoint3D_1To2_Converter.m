function ros2msg = yolov8_msgs_msg_KeyPoint3D_1To2_Converter(message,ros2msg)
%yolov8_msgs_msg_KeyPoint3D_1To2_Converter passes data of ROS message to ROS 2 message.
% Copyright 2019 The MathWorks, Inc.
ros2msg.id = message.Id;
ros2msg.point.x = message.Point.X;
ros2msg.point.y = message.Point.Y;
ros2msg.point.z = message.Point.Z;
ros2msg.score = message.Score;
end