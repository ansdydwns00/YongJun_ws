function [data, info] = boundingBox2D
%BoundingBox2D gives an empty data for vision_msgs/BoundingBox2D
% Copyright 2019-2021 The MathWorks, Inc.
data = struct();
data.MessageType = 'vision_msgs/BoundingBox2D';
[data.center, info.center] = ros.internal.ros2.custommessages.vision_msgs.pose2D;
info.center.MLdataType = 'struct';
[data.size_x, info.size_x] = ros.internal.ros2.messages.ros2.default_type('double',1,0);
[data.size_y, info.size_y] = ros.internal.ros2.messages.ros2.default_type('double',1,0);
info.MessageType = 'vision_msgs/BoundingBox2D';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,7);
info.MatPath{1} = 'center';
info.MatPath{2} = 'center.position';
info.MatPath{3} = 'center.position.x';
info.MatPath{4} = 'center.position.y';
info.MatPath{5} = 'center.theta';
info.MatPath{6} = 'size_x';
info.MatPath{7} = 'size_y';
