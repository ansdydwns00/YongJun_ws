function [data, info] = mask
%Mask gives an empty data for yolov8_msgs/Mask
% Copyright 2019-2021 The MathWorks, Inc.
data = struct();
data.MessageType = 'yolov8_msgs/Mask';
[data.height, info.height] = ros.internal.ros2.messages.ros2.default_type('int32',1,0);
[data.width, info.width] = ros.internal.ros2.messages.ros2.default_type('int32',1,0);
[data.data, info.data] = ros.internal.ros2.custommessages.yolov8_msgs.point2D;
info.data.MLdataType = 'struct';
info.data.MaxLen = NaN;
info.data.MinLen = 0;
info.MessageType = 'yolov8_msgs/Mask';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,5);
info.MatPath{1} = 'height';
info.MatPath{2} = 'width';
info.MatPath{3} = 'data';
info.MatPath{4} = 'data.x';
info.MatPath{5} = 'data.y';
