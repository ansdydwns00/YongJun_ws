%% Connect AVIA UDP Communication
clear; clc

% Connect udp data communication
Avia_UDP = udpport("datagram","LocalPort",56001);

%% ROS Node 


global g_bboxes
global g_img
global vehiclePose

global G_bbox
global G_id
global G_cls

g_bboxes = [];
g_img = [];
vehiclePose = [0 0 0];

% Create a node for connection between MATLAB and ROS2
Node = ros2node("/IVL");
Sub_Node = ros2node("/IVL_Sub");

% Create Subscribe Node
sub.Yolo_track = ros2subscriber(Node,"/yolo/tracking","yolov8_msgs/DetectionArray",@helperCallbackYolo_TF);
sub.lr_detection = ros2subscriber(Sub_Node,"/lr_detections","vision_msgs/Detection3DArray",@HelperCallbackPCDet_TF);

% Create Publish Node
pub.LiDAR = ros2publisher(Node,"/livox/lidar","sensor_msgs/PointCloud2");

%% 

% Remove memory cache
clear HelperComputeDistance_TF
clear HelperComputeVelocity_TF
clear HelperDrawCuboid_TF
clear HelperDeleteCuboid_TF


%-----------------------------------------------------------------------------------%
%-------------------------------Calibration Parameter-------------------------------%
%-----------------------------------------------------------------------------------%

% Load LiDAR-Camera Calibration parameter
load("lcc_params_640.mat");
 
% lcc parameter
lidarToCam = tform;              
camToLidar = invert(tform);
%-----------------------------------------------------------------------------------%





%-----------------------------------------------------------------------------------%
%-----------------------------------Visualization-----------------------------------%
%-----------------------------------------------------------------------------------%
% Set x,y,z range of pcplayer
xmin = 0;      xmax = 60;
ymin = -20;     ymax = 20;
zmin = -2;     zmax = 2;

% pointCloud viewer
player = pcplayer([xmin xmax],[ymin ymax],[zmin zmax],"ColorSource","X","MarkerSize",4);


% image viewer
% vPlayer = vision.DeployableVideoPlayer;

l_bboxes = [];
% l_img = [];
%-----------------------------------------------------------------------------------%




%-----------------------------------------------------------------------------------%
%------------------------------Clustering Parameter---------------------------------%
%-----------------------------------------------------------------------------------%
% ROI setting
roi = [3, 60, -15, 15, -2, 2];     

% Downsampling
gridStep = 0.1;

% Cluster distance 
clusterThreshold = 0.5;   

%-----------------------------------------------------------------------------------%



%-----------------------------------------------------------------------------------%
%-----------------------------------UDP Parameter-----------------------------------%
%-----------------------------------------------------------------------------------%

% Flag for first Run
reset_flag = single(0);

% Remove Buffer
flush(Avia_UDP);
%-----------------------------------------------------------------------------------%




while true
    
    % Read 1 packet datagram
    packet = read(Avia_UDP,1,"uint8");
    
    % LiDAR [x,y,z,I] data parsing
    if size(packet.Data,2) == 1362 
        [xyzCoords,xyzIntensity,isValid] = Avia_parsing_mex(single((packet.Data)'),reset_flag);
    end
    
    if isValid

        ptCloud = pointCloud(xyzCoords,"Intensity",xyzIntensity);
        
        % Preprocessing point clound (ROI, Downsampling, remove ground)
        if ~isempty(ptCloud.Location)
            ptCloud_ps = HelperPtCldProcessing_TF(ptCloud, roi, gridStep); 
        end
        
        % Results from 2D DL model
        l_bboxes = g_bboxes;
     
        if ~isempty(l_bboxes) && ~isempty(ptCloud_ps.Location)
            frustumIndices = HelperBboxCameraToLidar_TF(l_bboxes, ptCloud_ps, camParams, camToLidar,'ClusterThreshold', clusterThreshold, 'MaxDetectionRange', [3,60]);
        
            if ~isempty(frustumIndices{1})

                allValues = vertcat(frustumIndices{:});
                uniqueValues = unique(allValues);
                
                tmpPC = select(ptCloud_ps,uniqueValues);
                msg_LiDAR = ros2message(pub.LiDAR);
                msg_LiDAR.header.frame_id = 'map';
                msg_LiDAR = rosWriteXYZ(msg_LiDAR,(tmpPC.Location));
                msg_LiDAR = rosWriteIntensity(msg_LiDAR,(tmpPC.Intensity));
                send(pub.LiDAR,msg_LiDAR);
            end
        end
        
        % Results from 3D DL model
        L_bbox = G_bbox;
        L_id = G_id;
        L_cls = G_cls;
        
        %-----------------------------------------------------------------------------------%
        %-------------------------------Object Detection Info-------------------------------%
        %-----------------------------------------------------------------------------------%
        % Calculate Object Distance
        [Model, ModelInfo] = HelperComputeDistance_TF(L_bbox, L_id, L_cls, ptCloud_ps);

        % Calculate Object Velocity
        [VelocityInfo, OrientInfo, ~] = HelperComputeVelocity_TF(ModelInfo,vehiclePose);
        

        %-----------------------------------------------------------------------------------%
        %-----------------------------------Visualization-----------------------------------%
        %-----------------------------------------------------------------------------------%
        % Display detection results
        view(player,ptCloud)
        HelperDeleteCuboid_TF(player.Axes)
        HelperDrawCuboid_TF(player.Axes, Model, ModelInfo, VelocityInfo, OrientInfo);


        flush(Avia_UDP);
    end    

    reset_flag = single(1);
end
