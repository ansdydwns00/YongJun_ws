clear; clc

global G_bbox
global G_id
global G_cls

% Create a node for connection between MATLAB and ROS2
Pub_Node = ros2node("/IVL_Pub");
Sub_Node = ros2node("/IVL_Sub");


% Create Publish Node
pub.LiDAR = ros2publisher(Pub_Node,"/livox/lidar","sensor_msgs/PointCloud2");

% Create Subscribe Node
sub.lr_detection = ros2subscriber(Sub_Node,"/lr_detections","vision_msgs/Detection3DArray",@HelperCallbackPCDet);
%% 
% 
% 특정 경로의 파일 목록 가져오기
folder_path = '/home/aiv/YongJun_ws/matlab_ws/Livox_LiDAR/dd';
file_list = dir(fullfile(folder_path, '*.bin'));
player = pcplayer([0 60],[-10 10],[-2 4],"MarkerSize",10);


% 각 bin 파일 처리하기
for i = 1:length(file_list)
    % 현재 파일 경로 구성
    current_dir = fopen(fullfile(folder_path, file_list(i).name));
    current_file = single(fread(current_dir,[4 inf],'single')');

    ptCloud = pointCloud(current_file(:,1:3),"Intensity",current_file(:,4));

    msg_LiDAR = ros2message(pub.LiDAR);
    msg_LiDAR = rosWriteXYZ(msg_LiDAR,(ptCloud.Location));
    msg_LiDAR = rosWriteIntensity(msg_LiDAR,(ptCloud.Intensity));
    send(pub.LiDAR,msg_LiDAR);


    % 포인트 클라우드 플롯
    view(player,ptCloud);
    pause(1)
end

% folder_path = '/home/aiv/YongJun_ws/matlab_ws/Livox_LiDAR/dd';
% file_list = dir(fullfile(folder_path, '*.bin'));
% 
% while true
%     current_dir = fopen(fullfile(folder_path, file_list(1).name));
%     current_file = single(fread(current_dir,[4 inf],'single')');
% 
%     ptCloud = pointCloud(current_file(:,1:3),"Intensity",current_file(:,4));
% 
%     msg_LiDAR = ros2message(pub.LiDAR);
%     msg_LiDAR = rosWriteXYZ(msg_LiDAR,(ptCloud.Location));
%     msg_LiDAR = rosWriteIntensity(msg_LiDAR,(ptCloud.Intensity));
%     send(pub.LiDAR,msg_LiDAR);
% end