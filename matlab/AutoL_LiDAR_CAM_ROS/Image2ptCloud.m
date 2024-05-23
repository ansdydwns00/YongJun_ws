%% Lidar Connection
clear; clc
udpObj = udpport("byte","LocalPort",5001,"ByteOrder","little-endian");

%% ROS


Matlab = ros2node("/MatlabNode");
ImageSub = ros2subscriber(Matlab,'/camera1/image_raw','sensor_msgs/Image');

% calibration file load
load("Calibration.mat");                % Calibration file 

LidarToCam = tform;                     % Lidar coord -> Cam coord
CamToLidar = invert(tform);             % Cam coord -> Lidar coord
%% Packet Data parsing 

% [x,y,z] 좌표 값 사전 할당(178 packet * 128 points)
points = single(zeros(22784,3));

% fps 확인 위한 parameter
i = 1;
frameCount = 0;

% 입력 buffer 제거
flush(udpObj,"input")

player = pcplayer([0 10],[-3 3],[-2 2]);

% point cloud를 정렬하기 위해서
m = 32; % m 값을 설정

tic
while true
    
    %--------------------------------------------------------------------%
    %--------------------------------LIDAR-------------------------------%
    %--------------------------------------------------------------------%
    % 패킷 1개 불러오기      
    packetData = single(read(udpObj,1330))';
    
    % 패킷 1개 parsing 
    [payload,top_bottom_flag,dataType] = packet_extract(packetData);
    
    % 패킷 1개에 해당하는 pointCloud 검출 
    xyzPoints = ptCloud_extract(payload,top_bottom_flag);
    
    % 패킷 속 xyz 좌표값 저장
    points((i-1)*128+1:(i-1)*128+128,:) = xyzPoints;
    i = i + 1;
    
    
    % 1 프레임 종료 확인(하부 프레임 89개 다음 상부 프레임 89개 수신 받으면 180 패킷 == 1 프레임 == 1 FoV); 
    if (top_bottom_flag == 1 && dataType(:,1) == 170)
        
        % 각도 계산
        angles = atan2(points(:,2), points(:,1));
        
        % 각도로 정렬
        [~, idx] = sort(angles);
        sorted_points = points(idx, :);
        
        % mxnx3 행렬 생성
        reshaped_points = reshape(sorted_points, m,[],3);

        % [x,y,z] -> point cloud 생성
        ptCloud = pointCloud(reshaped_points);

        % image capture
        image_received = receive(ImageSub);
        img = rosReadImage(image_received);
    
        ptCloudOut = fuseCameraToLidar(img,ptCloud,cameraParams,CamToLidar);

        view(player,ptCloudOut);

        % parameter 초기화
        i = 1;
        points = single(zeros(22784,3));

        % Display Rendering rate 
        frameCount = frameCount + 1;
        elapsedTime = toc;
        frameRate = frameCount / elapsedTime;
        fprintf("Rendering rate: %f hz\n",frameRate);

        flush(udpObj)
    end  
end
