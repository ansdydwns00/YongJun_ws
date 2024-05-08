%% ROS2 Coneection 

clear; clc

% % ros2 node 
Matlab = ros2node("/MatlabNode");
 
% ros2 subscribe
yoloImageSub = ros2subscriber(Matlab,"/yolo/dbg_image","sensor_msgs/Image");
% yoloBboxSub = ros2subscriber(Matlab,"/yolo/detections","yolov8_msgs/DetectionArray");
yoloTrackSub = ros2subscriber(Matlab,"/yolo/tracking","yolov8_msgs/DetectionArray");

%% Sensor Connection
% ---------------------------------------------------------------------------
%                              LiDAR Connection 
% ---------------------------------------------------------------------------
udpObj = udpport("byte","LocalPort",5001,"ByteOrder","little-endian");

%% Load .mat file
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
m = 32;                                         % 32 channel 정렬 
gridStep = 0.1;                                 % Point Cloud Downsampling
bboxesLidar = [];
roi = [0, 10, -1, 1, -2, 7];                    % ROI 설정
clusterThreshold = 0.2;                         % Cluster distance
cuboidTreshold = 0;                             % Ignore smaller than [value] cuboid
color = 'red';



% Create point cloud viewer
player = pcplayer([0 10],[-3 3],[-2 2]);
% vPlayer = vision.DeployableVideoPlayer;
% display = helperLidarCameraObjectsDisplay;      % Visualization
% initializeDisplay(display)                      % Visualization Init



% Remove input buffer
flush(udpObj,"input")

% Reset persistent variable
reset_flag = 0;


tic
while true
    flush(udpObj,"output")
    bboxes = [];

    % Load 1 packet [1 x 1330]       
    packetData = single(read(udpObj,1330));
    
    % Use mex file to verify generated c code
    [xyzCoords,isValid] = AutoL_parsing_mex(packetData,reset_flag);
    
    % isValid true: 1 frame, isValid false: not 1 frame  
    if isValid
       
        % points 정렬
        % 각도 계산
        % angles = atan2(xyzCoords(:,2), xyzCoords(:,1));

        % 각   도로 정렬
        % [~, idx] = sort(angles);
        % sorted_points = xyzCoords(idx, :);

        % mxnx3 행렬 생성
        % reshaped_points = reshape(sorted_points, m,[],3);


        % [x,y,z] coordinates to point cloud
        ptCloud = pointCloud(xyzCoords);
        
        % ROI 영역 내 pointCloud 추출
        % indices = findPointsInROI(ptCloud, roi);
        % roiPtCloud = select(ptCloud, indices);

        
        % ---------------------------------------------------------------------------
        %                              Image get  
        % ---------------------------------------------------------------------------
        % subscribe image msg
        % image_received = receive(yoloImageSub);
        % yolo_img = rosReadImage(image_received);
              
        yolo_info = receive(yoloTrackSub);
        
        % bounding box info
        for idx = 1:length(yolo_info.detections)
            x = yolo_info.detections(idx).bbox.center.position.x;
            y = yolo_info.detections(idx).bbox.center.position.y;
            w = yolo_info.detections(idx).bbox.size.x;
            h = yolo_info.detections(idx).bbox.size.y;
            
            bbox = [x-w/2, y-h/2, w, h];
            bboxes = [bboxes; bbox];
        end
       
        if bboxes
            [bboxesLidar,~,boxesUsed] = bboxCameraToLidar(bboxes,ptCloud,cameraParams,CamToLidar,'ClusterThreshold',clusterThreshold);
            
            if ~isempty(bboxesLidar) && sum(bboxesLidar(1:6)) ~= 0 

                distance = helperComputeDistance(ptCloud, bboxesLidar);
 
                showShape("cuboid",bboxesLidar,'Parent',player.Axes,"Opacity",0.15,"Color",'red');
                % yolo_img = insertTrackBoxes(yolo_img, bboxes, distance);
                
                % deleteCuboid(player.Axes);
                % cuboidInfo = getCuboidInfo(bboxesLidar);
                % drawCuboid(player.Axes, cuboidInfo, 'red');

                bboxesLidar = [];
            end 
        else
            % deleteCuboid(player.Axes);
        end
        
        view(player,ptCloud);
        % vPlayer.step(yolo_img);
        
        reset_flag = 1;

        % Display Rendering rate 
        frameCount = frameCount + 1;
        elapsedTime = toc;
        frameRate = frameCount / elapsedTime;
        fprintf("Rendering rate: %f hz\n",frameRate);
    end        
end