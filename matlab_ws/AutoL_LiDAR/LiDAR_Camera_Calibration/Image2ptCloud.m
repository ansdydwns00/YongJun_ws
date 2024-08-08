%% Lidar Connection

% clear workspace
clear; clc

% Create udp communication object
AutoL_UDP = udpport("byte","LocalPort",5001,"ByteOrder","little-endian");

%% ROS

Matlab = ros2node("/MatlabNode");
ImageSub = ros2subscriber(Matlab,'/camera1/image_raw','sensor_msgs/Image');

% calibration file load
load("Calibration.mat");                % Calibration file 

LidarToCam = tform;                     % Lidar coord -> Cam coord
CamToLidar = invert(tform);             % Cam coord -> Lidar coord
%% Packet Data parsing 

% Setting point cloud viewer parameter
xmin = 0;  xmax = 10;
ymin = -5; ymax = 5;
zmin = -2; zmax = 5;

player = pcplayer([xmin xmax],[ymin ymax],[zmin zmax],"ColorSource","Z","MarkerSize",10);


% Set values for frame count 
frameCount = 1;

% Flag for first Run
reset_flag = single(0);

% point cloud를 정렬하기 위해서
m = 32; % m 값을 설정


% 입력 buffer 제거
flush(AutoL_UDP)

tic
while true
    
    %--------------------------------------------------------------------%
    %--------------------------------LIDAR-------------------------------%
    %--------------------------------------------------------------------%
    % 패킷 1개 불러오기      
    packetData = single(read(AutoL_UDP,1330))';
    
    % Use mex file to verify generated c code
    [xyzCoords,xyzIntensity,isValid] = AutoL_parsing_Intensity_mex(packetData,reset_flag);
    
    
    if isValid
        
        % 각도 계산
        angles = atan2(xyzCoords(:,2), xyzCoords(:,1));
        
        % 각도로 정렬
        [~, idx] = sort(angles);
        sorted_points = xyzCoords(idx, :);
        sorted_intensity = xyzIntensity(idx,:);

        % mxnx3 행렬 생성
        reshaped_points = reshape(sorted_points, m,[],3);
        reshaped_intensity = reshape(sorted_intensity,32,[],1);

        % [x,y,z] -> point cloud 생성
        ptCloud = pointCloud(reshaped_points,"Intensity",reshaped_intensity);

        % image capture
        image_received = receive(ImageSub);
        img = rosReadImage(image_received);
    
        ptCloudOut = fuseCameraToLidar(img,ptCloud,cameraParams,CamToLidar);


        view(player,ptCloudOut);


        frameCount = frameCount + 1;
        flush(AutoL_UDP)
    end  
    reset_flag = single(1);      
end
