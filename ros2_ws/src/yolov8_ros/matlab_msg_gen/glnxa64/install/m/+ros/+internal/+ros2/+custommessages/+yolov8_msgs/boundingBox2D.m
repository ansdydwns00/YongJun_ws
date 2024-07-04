function [data, info] = boundingBox2D
%BoundingBox2D gives an empty data for yolov8_msgs/BoundingBox2D
% Copyright 2019-2021 The MathWorks, Inc.
data = struct();
data.MessageType = 'yolov8_msgs/BoundingBox2D';
[data.center, info.center] = ros.internal.ros2.custommessages.yolov8_msgs.pose2D;
info.center.MLdataType = 'struct';
[data.size, info.size] = ros.internal.ros2.custommessages.yolov8_msgs.vector2;
info.size.MLdataType = 'struct';
info.MessageType = 'yolov8_msgs/BoundingBox2D';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,8);
info.MatPath{1} = 'center';
info.MatPath{2} = 'center.position';
info.MatPath{3} = 'center.position.x';
info.MatPath{4} = 'center.position.y';
info.MatPath{5} = 'center.theta';
info.MatPath{6} = 'size';
info.MatPath{7} = 'size.x';
info.MatPath{8} = 'size.y';
