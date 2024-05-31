function [data, info] = pose2D
%Pose2D gives an empty data for vision_msgs/Pose2D
% Copyright 2019-2021 The MathWorks, Inc.
data = struct();
data.MessageType = 'vision_msgs/Pose2D';
[data.position, info.position] = ros.internal.ros2.custommessages.vision_msgs.point2D;
info.position.MLdataType = 'struct';
[data.theta, info.theta] = ros.internal.ros2.messages.ros2.default_type('double',1,0);
info.MessageType = 'vision_msgs/Pose2D';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,4);
info.MatPath{1} = 'position';
info.MatPath{2} = 'position.x';
info.MatPath{3} = 'position.y';
info.MatPath{4} = 'theta';
