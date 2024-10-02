global G_bbox
global G_id
global G_cls
global vehiclePose


% Create a node for connection between MATLAB and ROS2
Pub_Node = ros2node("/IVL_Pub");
Sub_Node = ros2node("/IVL_Sub");


% Create Publish Node
pub.LiDAR = ros2publisher(Pub_Node,"/livox/lidar","sensor_msgs/PointCloud2");

% Create Subscribe Node
sub.lr_detection = ros2subscriber(Sub_Node,"/lr_detections","vision_msgs/Detection3DArray",@HelperCallbackPCDet);




%%


while 1

    % Sending point cloud msg to ROS2 
    msg_LiDAR = ros2message(pub.LiDAR);
    msg_LiDAR.header.frame_id = 'map';
    msg_LiDAR = rosWriteXYZ(msg_LiDAR,(ptCloud.Location));
    msg_LiDAR = rosWriteIntensity(msg_LiDAR,(ptCloud.Intensity));
    send(pub.LiDAR,msg_LiDAR);

end



%% 

vehiclePose = [0 0 0];

% Remove memory cache
clear HelperComputeDistance
clear HelperComputeVelocity
clear HelperDrawCuboid
clear HelperDeleteCuboid

%-----------------------------------------------------------------------------------%
%-----------------------------------Visualization-----------------------------------%
%-----------------------------------------------------------------------------------%
% Set x,y,z range of pcplayer
xmin = 0;      xmax = 70;
ymin = -30;    ymax = 30;
zmin = -2;     zmax = 3;

% pointCloud viewer
player = pcplayer([xmin xmax],[ymin ymax],[zmin zmax],"ColorSource","X","MarkerSize",4);
                      
L_bbox = [];
L_id = [];
L_cls = [];
%-----------------------------------------------------------------------------------%



%-----------------------------------------------------------------------------------%
%----------------------------preprocessing Parameter--------------------------------%
%-----------------------------------------------------------------------------------%
% ROI 설정
roi = [2, 70, -10, 10, -2, 3];     

% Downsample
gridStep = 0.1;
%-----------------------------------------------------------------------------------
%-----------------------------------------------------------------------------------%
folder_path = '/home/aiv/YongJun_ws/matlab_ws/Livox_LiDAR/jj';
file_list = dir(fullfile(folder_path, '*.bin'));
% player = pcplayer([0 60],[-10 10],[-2 4],"MarkerSize",10);

% 각 bin 파일 처리하기
for i = 1:length(file_list)
    % 현재 파일 경로 구성
    current_dir = fopen(fullfile(folder_path, file_list(i).name));
    
    current_file = single(fread(current_dir,[4 inf],'single')');
    % f = factor(length(current_file));
    ptCloud = pointCloud(current_file(:,1:3),"Intensity",current_file(:,4));
    
    msg_LiDAR = ros2message(pub.LiDAR);
    msg_LiDAR.header.frame_id = 'map';
    msg_LiDAR = rosWriteXYZ(msg_LiDAR,(ptCloud.Location));
    msg_LiDAR = rosWriteIntensity(msg_LiDAR,(ptCloud.Intensity));
    % msg_LiDAR = rosWriteIntensity(msg_LiDAR,zeros(size(ptCloud.Location,1),1));
    send(pub.LiDAR,msg_LiDAR);
    
    L_bbox = G_bbox;
    L_id = G_id;
    L_cls = G_cls;
    
    %-----------------------------------------------------------------------------------%
    %-------------------------------Object Detection Info-------------------------------%
    %-----------------------------------------------------------------------------------%
    % Calculate Object Distance
    [Model, ModelInfo] = HelperComputeDistance(L_bbox, L_id, L_cls, ptCloud);

    % Calculate Object Velocity
    [VelocityInfo, OrientInfo, ~] = HelperComputeVelocity(ModelInfo,vehiclePose);


    %-----------------------------------------------------------------------------------%
    %-----------------------------------Visualization-----------------------------------%
    %-----------------------------------------------------------------------------------%
    % Display detection results
    view(player,ptCloud);
    HelperDeleteCuboid(player.Axes)
    HelperDrawCuboid(player.Axes, Model, 'red', ModelInfo, VelocityInfo, OrientInfo);

    % 포인트 클라우드 플롯
    view(player,ptCloud);
    pause(0.01)
end


   



