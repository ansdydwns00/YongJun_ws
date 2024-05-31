function [data, info] = labelInfo
%LabelInfo gives an empty data for vision_msgs/LabelInfo
% Copyright 2019-2021 The MathWorks, Inc.
data = struct();
data.MessageType = 'vision_msgs/LabelInfo';
[data.header, info.header] = ros.internal.ros2.messages.std_msgs.header;
info.header.MLdataType = 'struct';
[data.class_map, info.class_map] = ros.internal.ros2.custommessages.vision_msgs.visionClass;
info.class_map.MLdataType = 'struct';
info.class_map.MaxLen = NaN;
info.class_map.MinLen = 0;
[data.threshold, info.threshold] = ros.internal.ros2.messages.ros2.default_type('single',1,0);
info.MessageType = 'vision_msgs/LabelInfo';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,9);
info.MatPath{1} = 'header';
info.MatPath{2} = 'header.stamp';
info.MatPath{3} = 'header.stamp.sec';
info.MatPath{4} = 'header.stamp.nanosec';
info.MatPath{5} = 'header.frame_id';
info.MatPath{6} = 'class_map';
info.MatPath{7} = 'class_map.class_id';
info.MatPath{8} = 'class_map.class_name';
info.MatPath{9} = 'threshold';
