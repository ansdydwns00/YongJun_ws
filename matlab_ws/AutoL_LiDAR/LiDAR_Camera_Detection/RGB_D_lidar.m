%% ROS2 Coneection 

% Clear workspace
clear; clc

% ---------------------------------------------------------------------------
%                              ROS2 Initialize
% ---------------------------------------------------------------------------
% Ros Node 
Matlab = ros2node("/MatlabNode");
 
% Ros sub
Yolo.imgSub = ros2subscriber(Matlab,"/yolo/dbg_image","sensor_msgs/Image");
Yolo.trackSub = ros2subscriber(Matlab,"/yolo/tracking","yolov8_msgs/DetectionArray");
% Yolo.bboxSub = ros2subscriber(Matlab,"/yolo/detections","yolov8_msgs/DetectionArray");

% Ros pub

%% Sensor Connection
% ---------------------------------------------------------------------------
%                              LiDAR Connection 
% ---------------------------------------------------------------------------
% clear workspace
clear; clc

% Create udp communication object
AutoL_UDP = udpport("byte","LocalPort",5001,"ByteOrder","little-endian");

%% Load Calibration .mat file

load("Calibration.mat");                % Calibration file 

LidarToCam = tform;                     % Lidar coord -> Cam coord
CamToLidar = invert(tform);             % Cam coord -> Lidar coord

%% Initialize parameters
% ---------------------------------------------------------------------------
%                              Create point cloud viewer 
% ---------------------------------------------------------------------------
% Setting point cloud viewer parameter
xmin = 0;  xmax = 10;
ymin = -5; ymax = 5;
zmin = -2; zmax = 5;

player = pcplayer([xmin xmax],[ymin ymax],[zmin zmax],"ColorSource","Z","MarkerSize",6);


% Set values for frame count 
frameCount = 1;

% Flag for first Run
reset_flag = single(0);


% ---------------------------------------------------------------------------
%                              Parameter Initialize 
% ---------------------------------------------------------------------------
% gridStep = 0.1;                                 % Point Cloud Downsampling
% cuboidTreshold = 0;                             % Ignore smaller than [value] cuboid

% ROI 설정
roi = [6, 10, -2, 2, -2, 2];

% Cluster distance
clusterThreshold = 0.1;                       

distance = [];   


% Remove input buffer
flush(AutoL_UDP)

tic
while true

    % Load 1 packet [1 x 1330]   
    packetData = single(read(AutoL_UDP,1330))';   
    
    % Use mex file to verify generated c code
    [xyzCoords,xyzIntensity,isValid] = AutoL_parsing_Intensity_mex(packetData,reset_flag);
    
    % isValid true: 1 frame, isValid false: not 1 frame  
    if isValid  
       
        % [x,y,z] coordinates to point cloud
        ptCloud = pointCloud(xyzCoords,"Intensity",xyzIntensity);

        % ROI 영역 내 pointCloud 추출
        % indices = findPointsInROI(ptCloud, roi);
        % roiPtCloud = select(ptCloud, indices);
        
        [objectInfo,bboxesLidar,Distances] = computeDistance(Yolo,ptCloud,cameraParams,CamToLidar,clusterThreshold);
        
        showShape('cuboid',bboxesLidar,'Parent',player.Axes,'Opacity',0.2,'Color','red','LineWidth',0.5,'Label',Distances);
        
        view(player,ptCloud); 

        % Display Rendering rate 
        frameCount = frameCount + 1; 
        elapsedTime = toc;
        frameRate = frameCount / elapsedTime;
        fprintf("Rendering rate: %f hz\n",frameRate);

        % Remove buffer
        flush(AutoL_UDP)
    end  
    reset_flag = single(1);
end