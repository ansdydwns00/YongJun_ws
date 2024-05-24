function [data, info] = classification
%Classification gives an empty data for vision_msgs/Classification
% Copyright 2019-2021 The MathWorks, Inc.
data = struct();
data.MessageType = 'vision_msgs/Classification';
[data.header, info.header] = ros.internal.ros2.messages.std_msgs.header;
info.header.MLdataType = 'struct';
[data.results, info.results] = ros.internal.ros2.custommessages.vision_msgs.objectHypothesis;
info.results.MLdataType = 'struct';
info.results.MaxLen = NaN;
info.results.MinLen = 0;
info.MessageType = 'vision_msgs/Classification';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,8);
info.MatPath{1} = 'header';
info.MatPath{2} = 'header.stamp';
info.MatPath{3} = 'header.stamp.sec';
info.MatPath{4} = 'header.stamp.nanosec';
info.MatPath{5} = 'header.frame_id';
info.MatPath{6} = 'results';
info.MatPath{7} = 'results.class_id';
info.MatPath{8} = 'results.score';
