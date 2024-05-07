function [data, info] = keyPoint2D
%KeyPoint2D gives an empty data for yolov8_msgs/KeyPoint2D
% Copyright 2019-2021 The MathWorks, Inc.
data = struct();
data.MessageType = 'yolov8_msgs/KeyPoint2D';
[data.id, info.id] = ros.internal.ros2.messages.ros2.default_type('int32',1,0);
[data.point, info.point] = ros.internal.ros2.custommessages.yolov8_msgs.point2D;
info.point.MLdataType = 'struct';
[data.score, info.score] = ros.internal.ros2.messages.ros2.default_type('double',1,0);
info.MessageType = 'yolov8_msgs/KeyPoint2D';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,5);
info.MatPath{1} = 'id';
info.MatPath{2} = 'point';
info.MatPath{3} = 'point.x';
info.MatPath{4} = 'point.y';
info.MatPath{5} = 'score';
