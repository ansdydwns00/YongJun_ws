function [data, info] = classification3D
%Classification3D gives an empty data for vision_msgs/Classification3D
% Copyright 2019-2021 The MathWorks, Inc.
data = struct();
data.MessageType = 'vision_msgs/Classification3D';
[data.header, info.header] = ros.internal.ros2.messages.std_msgs.header;
info.header.MLdataType = 'struct';
[data.results, info.results] = ros.internal.ros2.custommessages.vision_msgs.objectHypothesis;
info.results.MLdataType = 'struct';
info.results.MaxLen = NaN;
info.results.MinLen = 0;
[data.source_cloud, info.source_cloud] = ros.internal.ros2.messages.sensor_msgs.pointCloud2;
info.source_cloud.MLdataType = 'struct';
info.MessageType = 'vision_msgs/Classification3D';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,34);
info.MatPath{1} = 'header';
info.MatPath{2} = 'header.stamp';
info.MatPath{3} = 'header.stamp.sec';
info.MatPath{4} = 'header.stamp.nanosec';
info.MatPath{5} = 'header.frame_id';
info.MatPath{6} = 'results';
info.MatPath{7} = 'results.id';
info.MatPath{8} = 'results.score';
info.MatPath{9} = 'source_cloud';
info.MatPath{10} = 'source_cloud.header';
info.MatPath{11} = 'source_cloud.header.stamp';
info.MatPath{12} = 'source_cloud.header.stamp.sec';
info.MatPath{13} = 'source_cloud.header.stamp.nanosec';
info.MatPath{14} = 'source_cloud.header.frame_id';
info.MatPath{15} = 'source_cloud.height';
info.MatPath{16} = 'source_cloud.width';
info.MatPath{17} = 'source_cloud.fields';
info.MatPath{18} = 'source_cloud.fields.INT8';
info.MatPath{19} = 'source_cloud.fields.UINT8';
info.MatPath{20} = 'source_cloud.fields.INT16';
info.MatPath{21} = 'source_cloud.fields.UINT16';
info.MatPath{22} = 'source_cloud.fields.INT32';
info.MatPath{23} = 'source_cloud.fields.UINT32';
info.MatPath{24} = 'source_cloud.fields.FLOAT32';
info.MatPath{25} = 'source_cloud.fields.FLOAT64';
info.MatPath{26} = 'source_cloud.fields.name';
info.MatPath{27} = 'source_cloud.fields.offset';
info.MatPath{28} = 'source_cloud.fields.datatype';
info.MatPath{29} = 'source_cloud.fields.count';
info.MatPath{30} = 'source_cloud.is_bigendian';
info.MatPath{31} = 'source_cloud.point_step';
info.MatPath{32} = 'source_cloud.row_step';
info.MatPath{33} = 'source_cloud.data';
info.MatPath{34} = 'source_cloud.is_dense';