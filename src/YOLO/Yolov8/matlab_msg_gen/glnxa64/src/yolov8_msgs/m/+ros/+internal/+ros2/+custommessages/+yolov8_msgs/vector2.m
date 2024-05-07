function [data, info] = vector2
%Vector2 gives an empty data for yolov8_msgs/Vector2
% Copyright 2019-2021 The MathWorks, Inc.
data = struct();
data.MessageType = 'yolov8_msgs/Vector2';
[data.x, info.x] = ros.internal.ros2.messages.ros2.default_type('double',1,0);
[data.y, info.y] = ros.internal.ros2.messages.ros2.default_type('double',1,0);
info.MessageType = 'yolov8_msgs/Vector2';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,2);
info.MatPath{1} = 'x';
info.MatPath{2} = 'y';
