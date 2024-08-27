function [data, info] = objectHypothesis
%ObjectHypothesis gives an empty data for vision_msgs/ObjectHypothesis
% Copyright 2019-2021 The MathWorks, Inc.
data = struct();
data.MessageType = 'vision_msgs/ObjectHypothesis';
[data.id, info.id] = ros.internal.ros2.messages.ros2.char('string',1,NaN,0);
[data.score, info.score] = ros.internal.ros2.messages.ros2.default_type('double',1,0);
info.MessageType = 'vision_msgs/ObjectHypothesis';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,2);
info.MatPath{1} = 'id';
info.MatPath{2} = 'score';
