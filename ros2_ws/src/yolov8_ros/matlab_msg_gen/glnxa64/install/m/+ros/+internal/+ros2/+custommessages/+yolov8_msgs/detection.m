function [data, info] = detection
%Detection gives an empty data for yolov8_msgs/Detection
% Copyright 2019-2021 The MathWorks, Inc.
data = struct();
data.MessageType = 'yolov8_msgs/Detection';
[data.class_id, info.class_id] = ros.internal.ros2.messages.ros2.default_type('int32',1,0);
[data.class_name, info.class_name] = ros.internal.ros2.messages.ros2.char('string',1,NaN,0);
[data.score, info.score] = ros.internal.ros2.messages.ros2.default_type('double',1,0);
[data.id, info.id] = ros.internal.ros2.messages.ros2.char('string',1,NaN,0);
[data.bbox, info.bbox] = ros.internal.ros2.custommessages.yolov8_msgs.boundingBox2D;
info.bbox.MLdataType = 'struct';
[data.bbox3d, info.bbox3d] = ros.internal.ros2.custommessages.yolov8_msgs.boundingBox3D;
info.bbox3d.MLdataType = 'struct';
[data.mask, info.mask] = ros.internal.ros2.custommessages.yolov8_msgs.mask;
info.mask.MLdataType = 'struct';
[data.keypoints, info.keypoints] = ros.internal.ros2.custommessages.yolov8_msgs.keyPoint2DArray;
info.keypoints.MLdataType = 'struct';
[data.keypoints3d, info.keypoints3d] = ros.internal.ros2.custommessages.yolov8_msgs.keyPoint3DArray;
info.keypoints3d.MLdataType = 'struct';
info.MessageType = 'yolov8_msgs/Detection';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,51);
info.MatPath{1} = 'class_id';
info.MatPath{2} = 'class_name';
info.MatPath{3} = 'score';
info.MatPath{4} = 'id';
info.MatPath{5} = 'bbox';
info.MatPath{6} = 'bbox.center';
info.MatPath{7} = 'bbox.center.position';
info.MatPath{8} = 'bbox.center.position.x';
info.MatPath{9} = 'bbox.center.position.y';
info.MatPath{10} = 'bbox.center.theta';
info.MatPath{11} = 'bbox.size';
info.MatPath{12} = 'bbox.size.x';
info.MatPath{13} = 'bbox.size.y';
info.MatPath{14} = 'bbox3d';
info.MatPath{15} = 'bbox3d.center';
info.MatPath{16} = 'bbox3d.center.position';
info.MatPath{17} = 'bbox3d.center.position.x';
info.MatPath{18} = 'bbox3d.center.position.y';
info.MatPath{19} = 'bbox3d.center.position.z';
info.MatPath{20} = 'bbox3d.center.orientation';
info.MatPath{21} = 'bbox3d.center.orientation.x';
info.MatPath{22} = 'bbox3d.center.orientation.y';
info.MatPath{23} = 'bbox3d.center.orientation.z';
info.MatPath{24} = 'bbox3d.center.orientation.w';
info.MatPath{25} = 'bbox3d.size';
info.MatPath{26} = 'bbox3d.size.x';
info.MatPath{27} = 'bbox3d.size.y';
info.MatPath{28} = 'bbox3d.size.z';
info.MatPath{29} = 'bbox3d.frame_id';
info.MatPath{30} = 'mask';
info.MatPath{31} = 'mask.height';
info.MatPath{32} = 'mask.width';
info.MatPath{33} = 'mask.data';
info.MatPath{34} = 'mask.data.x';
info.MatPath{35} = 'mask.data.y';
info.MatPath{36} = 'keypoints';
info.MatPath{37} = 'keypoints.data';
info.MatPath{38} = 'keypoints.data.id';
info.MatPath{39} = 'keypoints.data.point';
info.MatPath{40} = 'keypoints.data.point.x';
info.MatPath{41} = 'keypoints.data.point.y';
info.MatPath{42} = 'keypoints.data.score';
info.MatPath{43} = 'keypoints3d';
info.MatPath{44} = 'keypoints3d.data';
info.MatPath{45} = 'keypoints3d.data.id';
info.MatPath{46} = 'keypoints3d.data.point';
info.MatPath{47} = 'keypoints3d.data.point.x';
info.MatPath{48} = 'keypoints3d.data.point.y';
info.MatPath{49} = 'keypoints3d.data.point.z';
info.MatPath{50} = 'keypoints3d.data.score';
info.MatPath{51} = 'keypoints3d.frame_id';