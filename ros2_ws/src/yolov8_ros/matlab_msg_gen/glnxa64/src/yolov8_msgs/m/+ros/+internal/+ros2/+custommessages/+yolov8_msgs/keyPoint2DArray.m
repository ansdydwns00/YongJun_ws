function [data, info] = keyPoint2DArray
%KeyPoint2DArray gives an empty data for yolov8_msgs/KeyPoint2DArray
% Copyright 2019-2021 The MathWorks, Inc.
data = struct();
data.MessageType = 'yolov8_msgs/KeyPoint2DArray';
[data.data, info.data] = ros.internal.ros2.custommessages.yolov8_msgs.keyPoint2D;
info.data.MLdataType = 'struct';
info.data.MaxLen = NaN;
info.data.MinLen = 0;
info.MessageType = 'yolov8_msgs/KeyPoint2DArray';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,6);
info.MatPath{1} = 'data';
info.MatPath{2} = 'data.id';
info.MatPath{3} = 'data.point';
info.MatPath{4} = 'data.point.x';
info.MatPath{5} = 'data.point.y';
info.MatPath{6} = 'data.score';
