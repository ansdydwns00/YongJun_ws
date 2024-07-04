%% ROS2 Coneection 

clear; clc

% % ros2 node 
Matlab = ros2node("/MatlabNode");
 
% ros2 subscribe
imageSub = ros2subscriber(Matlab,'/camera1/image_raw','sensor_msgs/Image');
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

i = 1; 
points = single(zeros(22784,3));              % [x,y,z] 좌표 값 사전 할당(178 packet * 128 points), 코드 속도를 위해 사전 할당  
m = 32;                                       % 32 channel 정렬 
gridStep = 0.1;                               % Point Cloud Downsampling
bboxesLidar = [];


color = 'red';
distance = []; 
currentStep = 0;
frameCount = 0;
fps = 0;
reset_flag = single(0);

roi = [0, 10, -1, 1, -2, 7];                    % ROI 설정
clusterThreshold = 0.2;                         % Cluster distance
cuboidTreshold = 0;                             % Ignore smaller than [value] cuboid


detector = peopleDetectorACF();                 % Detector 선언
[tracker,positionSelector] = setupTracker();    % Tracker 선언



vPlayer = vision.DeployableVideoPlayer;
player = pcplayer([0 10],[-3 3],[-2 2]);
% display = helperLidarCameraObjectsDisplay;      % Visualization
% initializeDisplay(display)                      % Visualization Init



% 입력 buffer 제거
flush(udpObj,"input")

tic
while true
    % ---------------------------------------------------------------------------
    %                         One Packet get  
    % ---------------------------------------------------------------------------
    
    % Load 1 packet [1 x 1330]      
    packetData = single(read(udpObj,1330))';
    
    % One packet data parsing
    [payload,top_bottom_flag,dataType] = packet_extract(packetData);
    
    % [x,y,z] coords of one packet 
    xyzPoints = ptCloud_extract(payload,top_bottom_flag);
    
    % Save [x,y,z] coords
    points((i-1)*128+1:(i-1)*128+128,:) = xyzPoints;
    i = i + 1;
    
    % ---------------------------------------------------------------------------
    %                         One Frame get  
    % ---------------------------------------------------------------------------
    
    % 1 프레임 종료 확인(하부 프레임 89개 다음 상부 프레임 89개 수신 받으면 178 패킷 == 1 프레임); 
    if (top_bottom_flag == 1 && dataType(:,1) == 170)

        % % points 정렬
        % 각도 계산
        % angles = atan2(points(:,2), points(:,1));

        % % 각   도로 정렬
        % [~, idx] = sort(angles);
        % sorted_points = points(idx, :);

        % % mxnx3 행렬 생성
        % reshaped_points = reshape(sorted_points, m,[],3);

        % % [x,y,z] -> pointCloud 생성
        ptCloud = pointCloud(points);

        % % ROI 영역 내 pointCloud 추출
        % indices = findPointsInROI(ptCloud, roi);
        % roiPtCloud = select(ptCloud, indices);
        
        % ---------------------------------------------------------------------------
        %                              Image get  
        % ---------------------------------------------------------------------------
        % subscribe image msg
        imgMsg = receive(imageSub);
        img = rosReadImage(imgMsg);

        % ---------------------------------------------------------------------------
        %                              Object Detection   
        % ---------------------------------------------------------------------------     
        currentStep = currentStep + 1;
        detections = detectObjects(detector,img,currentStep);

        % ---------------------------------------------------------------------------
        %                              Object Tracker  
        % ---------------------------------------------------------------------------     
        confirmedTracks = updateTracks(tracker,detections,currentStep);
        confirmedTracks = removeNoisyTracks(confirmedTracks,positionSelector,cameraParams.ImageSize);
        bboxes = getTrackBoxes(confirmedTracks,positionSelector);
        
        if bboxes
            [bboxesLidar,~,boxesUsed] = bboxCameraToLidar(bboxes,ptCloud,cameraParams,CamToLidar,'ClusterThreshold',clusterThreshold);
            
            if ~isempty(bboxesLidar) && sum(bboxesLidar(1:6)) ~= 0 

                distance = helperComputeDistance(ptCloud, bboxesLidar);
 
                deleteCuboid(player.Axes);
                cuboidInfo = getCuboidInfo(bboxesLidar);
                drawCuboid(player.Axes, cuboidInfo, 'red');
                % showShape("cuboid",bboxesLidar,'Parent',player.Axes,"Opacity",0.15,"Color",'red');
                img = insertTrackBoxes(img, bboxes, distance);
    
                bboxesLidar = [];
            end 
        else
            deleteCuboid(player.Axes);
        end
        
        % view(player,ptCloud);
        vPlayer.step(img);
        
        bboxes = [];

        % Display Rendering rate 
        frameCount = frameCount + 1;
        elapsedTime = toc;
        frameRate = frameCount / elapsedTime;
        fprintf("Rendering rate: %f hz\n",frameRate);

        flush(udpObj)
    end   
    reset_flag = single(1);
end