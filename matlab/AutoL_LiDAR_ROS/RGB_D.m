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
udpObj = udpport("byte","LocalPort",5001,"ByteOrder","little-endian");

%% Load Calibration .mat file
% ---------------------------------------------------------------------------
%                              Parameter Initialize 
% ---------------------------------------------------------------------------
load("Calibration.mat");                % Calibration file 

LidarToCam = tform;                     % Lidar coord -> Cam coord
CamToLidar = invert(tform);             % Cam coord -> Lidar coord

%% Main

% Initialize of parameters 
frameCount = 0;

distance = []; 
% global bboxes
bboxes = [];
% bboxesLidar = [];

m = 32;                                         % 32 channel 정렬 
gridStep = 0.1;                                 % Point Cloud Downsampling

roi = [5, 10, -2, 2, -2, 2];                    % ROI 설정
clusterThreshold = 0.2;                         % Cluster distance
cuboidTreshold = 0;                             % Ignore smaller than [value] cuboid

color = 'red';



% Create point cloud viewer
player = pcplayer([0 10],[-5 5],[-2 2]);
% vPlayer = vision.DeployableVideoPlayer;

% display = helperLidarCameraObjectsDisplay;      % Visualization
% initializeDisplay(display)                      % Visualization Init



% Remove input buffer
flush(udpObj,"input")

% Reset persistent variable
reset_flag = single(0);

% t = timer;
% t.ExecutionMode = 'fixedRate';
% t.Period = 0.05; 
% t.TimerFcn = @(~,~) timerCallback(Yolo.trackSub);
% start(t);

%% 


tic
while true
    % Load 1 packet [1 x 1330]   
    packetData = single(read(udpObj,1330))';   
    
    % Use mex file to verify generated c code
    [xyzCoords,isValid] = AutoL_parsing(packetData,reset_flag);
    
    % isValid true: 1 frame, isValid false: not 1 frame  
    if isValid  
       
        % points 정렬
        % xyzCoords = pointSort(xyzCoords);

        % [x,y,z] coordinates to point cloud
        ptCloud = pointCloud(xyzCoords);

        % ROI 영역 내 pointCloud 추출
        % indices = findPointsInROI(ptCloud, roi);
        % ptCloud = select(ptCloud, indices);
        
        [distance,bboxesLidar] = computeDistance(Yolo,bboxes,ptCloud,cameraParams,CamToLidar,clusterThreshold,player);
        
        % disp(distance)
        % view(player,ptCloud);

        % Initialize parameters
        bboxes = [];

        % Display Rendering rate 
        frameCount = frameCount + 1; 
        elapsedTime = toc;
        frameRate = frameCount / elapsedTime;
        fprintf("Rendering rate: %f hz\n",frameRate);
    end        
    reset_flag = single(1);
    
end

%% Support functions


function sorted_points = pointSort(xyzPoints)

    % 각도 계산
    angles = atan2(xyzPoints(:,2), xyzPoints(:,1));

    % 각도로 정렬
    [~, idx] = sort(angles);
    sorted_points = xyzPoints(idx, :);

    % mxnx3 행렬 생성
    sorted_points = reshape(sorted_points, m,[],3);

end


function conePosition = extractConePositions(cuboidTreshold, coneBboxesLidar_l, coneBboxesLidar_r)
    % Extract xlen, ylen, zlen from the bounding boxes
    volumes_l = prod(coneBboxesLidar_l(:, 4:6), 2);
    volumes_r = prod(coneBboxesLidar_r(:, 4:6), 2);

    % Find indices where volumes are smaller than cuboidThreshold
    indices_l = volumes_l > cuboidTreshold;
    indices_r = volumes_r > cuboidTreshold;

    % Combine the inner cone positions from left and right into a single array
    conePosition = [coneBboxesLidar_l(indices_l, 1:2);coneBboxesLidar_r(indices_r, 1:2)];
end