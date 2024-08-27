function [data, info] = detection2DArray
%Detection2DArray gives an empty data for vision_msgs/Detection2DArray
% Copyright 2019-2021 The MathWorks, Inc.
data = struct();
data.MessageType = 'vision_msgs/Detection2DArray';
[data.header, info.header] = ros.internal.ros2.messages.std_msgs.header;
info.header.MLdataType = 'struct';
[data.detections, info.detections] = ros.internal.ros2.custommessages.vision_msgs.detection2D;
info.detections.MLdataType = 'struct';
info.detections.MaxLen = NaN;
info.detections.MinLen = 0;
info.MessageType = 'vision_msgs/Detection2DArray';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,47);
info.MatPath{1} = 'header';
info.MatPath{2} = 'header.stamp';
info.MatPath{3} = 'header.stamp.sec';
info.MatPath{4} = 'header.stamp.nanosec';
info.MatPath{5} = 'header.frame_id';
info.MatPath{6} = 'detections';
info.MatPath{7} = 'detections.header';
info.MatPath{8} = 'detections.header.stamp';
info.MatPath{9} = 'detections.header.stamp.sec';
info.MatPath{10} = 'detections.header.stamp.nanosec';
info.MatPath{11} = 'detections.header.frame_id';
info.MatPath{12} = 'detections.results';
info.MatPath{13} = 'detections.results.id';
info.MatPath{14} = 'detections.results.score';
info.MatPath{15} = 'detections.results.pose';
info.MatPath{16} = 'detections.results.pose.pose';
info.MatPath{17} = 'detections.results.pose.pose.position';
info.MatPath{18} = 'detections.results.pose.pose.position.x';
info.MatPath{19} = 'detections.results.pose.pose.position.y';
info.MatPath{20} = 'detections.results.pose.pose.position.z';
info.MatPath{21} = 'detections.results.pose.pose.orientation';
info.MatPath{22} = 'detections.results.pose.pose.orientation.x';
info.MatPath{23} = 'detections.results.pose.pose.orientation.y';
info.MatPath{24} = 'detections.results.pose.pose.orientation.z';
info.MatPath{25} = 'detections.results.pose.pose.orientation.w';
info.MatPath{26} = 'detections.results.pose.covariance';
info.MatPath{27} = 'detections.bbox';
info.MatPath{28} = 'detections.bbox.center';
info.MatPath{29} = 'detections.bbox.center.x';
info.MatPath{30} = 'detections.bbox.center.y';
info.MatPath{31} = 'detections.bbox.center.theta';
info.MatPath{32} = 'detections.bbox.size_x';
info.MatPath{33} = 'detections.bbox.size_y';
info.MatPath{34} = 'detections.source_img';
info.MatPath{35} = 'detections.source_img.header';
info.MatPath{36} = 'detections.source_img.header.stamp';
info.MatPath{37} = 'detections.source_img.header.stamp.sec';
info.MatPath{38} = 'detections.source_img.header.stamp.nanosec';
info.MatPath{39} = 'detections.source_img.header.frame_id';
info.MatPath{40} = 'detections.source_img.height';
info.MatPath{41} = 'detections.source_img.width';
info.MatPath{42} = 'detections.source_img.encoding';
info.MatPath{43} = 'detections.source_img.is_bigendian';
info.MatPath{44} = 'detections.source_img.step';
info.MatPath{45} = 'detections.source_img.data';
info.MatPath{46} = 'detections.is_tracking';
info.MatPath{47} = 'detections.tracking_id';
