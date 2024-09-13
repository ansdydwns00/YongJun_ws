%% Connect AVIA UDP Communication
clear; clc

% Connect udp data communication
Avia_UDP = udpport("datagram","LocalPort",56001);

%% ROS Node 


global g_id
global g_cls
global g_bboxes
global g_img
global vehiclePose

global G_bbox
global G_id
global G_cls


g_id = {};
g_cls = {};
g_bboxes = [];
g_img = [];
vehiclePose = [];

% Create a node for connection between MATLAB and ROS2
Node = ros2node("/IVL");
Sub_Node = ros2node("/IVL_Sub");

% Create Subscribe Node
sub.Yolo_track = ros2subscriber(Node,"/yolo/tracking","yolov8_msgs/DetectionArray",@helperCallbackYolo);
sub.lr_detection = ros2subscriber(Sub_Node,"/lr_detections","vision_msgs/Detection3DArray",@HelperCallbackPCDet);

% Create Publish Node
pub.LiDAR = ros2publisher(Node,"/livox/lidar","sensor_msgs/PointCloud2");



%% 
% Remove memory cache
clear helperComputeDistance
clear helperComputeVelocity
clear helperDrawCuboid
clear helperDeleteCuboid


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
xmin = 0;      xmax = 10;
ymin = -4;     ymax = 4;
zmin = -2;     zmax = 3;

% pointCloud viewer
player = pcplayer([xmin xmax],[ymin ymax],[zmin zmax],"ColorSource","X","MarkerSize",4);


% image viewer
% vPlayer = vision.DeployableVideoPlayer;


l_bboxes = [];
l_id = [];
l_cls = [];
% l_img = [];

%-----------------------------------------------------------------------------------%




%-----------------------------------------------------------------------------------%
%------------------------------Clustering Parameter---------------------------------%
%-----------------------------------------------------------------------------------%
% ROI setting
roi = [3, 10, -4, 4, -2, 2];     

% Downsampling
gridStep = 0.1;

% Cluster distance 
clusterThreshold = 0.5;   

%-----------------------------------------------------------------------------------%



%-----------------------------------------------------------------------------------%
%-----------------------------------UDP Parameter-----------------------------------%
%-----------------------------------------------------------------------------------%
% Set values for frame count 
% frameCount = 1;

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
            ptCloud_ps = helperPtCldProcessing(ptCloud, roi, gridStep); 
        end
        
        % Object detection
        l_bboxes = g_bboxes;
        l_id = g_id;
        l_cls = g_cls;
          
        if ~isempty(l_bboxes) && ~isempty(ptCloud_ps.Location)
            frustumIndices = helperBboxCameraToLidar_test(l_bboxes, ptCloud_ps, camParams, camToLidar,'ClusterThreshold', clusterThreshold, 'MaxDetectionRange', [3,70]);
        
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

        L_bbox = G_bbox;
        L_id = G_id;
        L_cls = G_cls;

        %-----------------------------------------------------------------------------------%
        %-------------------------------Object Detection Info-------------------------------%
        %-----------------------------------------------------------------------------------%
        % Calculate Object Distance
        [Model, ModelInfo] = HelperComputeDistance(L_bbox, L_id, L_cls, ptCloud_ps);

        % Calculate Object Velocity
        [VelocityInfo, OrientInfo, ~] = HelperComputeVelocity(ModelInfo);
        
        

        %-----------------------------------------------------------------------------------%
        %-----------------------------------Visualization-----------------------------------%
        %-----------------------------------------------------------------------------------%
        % Display detection results
        view(player,ptCloud)
        HelperDeleteCuboid(player.Axes)
        HelperDrawCuboid(player.Axes, Model, 'red', ModelInfo, VelocityInfo, OrientInfo);
            
        flush(Avia_UDP);
    end    

    reset_flag = single(1);
end
