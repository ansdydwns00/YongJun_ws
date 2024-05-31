function [data, info] = visionClass
%VisionClass gives an empty data for vision_msgs/VisionClass
% Copyright 2019-2021 The MathWorks, Inc.
data = struct();
data.MessageType = 'vision_msgs/VisionClass';
[data.class_id, info.class_id] = ros.internal.ros2.messages.ros2.default_type('uint16',1,0);
[data.class_name, info.class_name] = ros.internal.ros2.messages.ros2.char('string',1,NaN,0);
info.MessageType = 'vision_msgs/VisionClass';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,2);
info.MatPath{1} = 'class_id';
info.MatPath{2} = 'class_name';
