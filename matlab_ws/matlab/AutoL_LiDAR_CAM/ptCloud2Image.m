%% Lidar Connection
clear; clc
udpObj = udpport("byte","LocalPort",5001,"ByteOrder","little-endian");

%% Camera Connection

load("results_Final.mat");            % 라이다 카메라 칼리브레이션 파일
load("cameraParams_Final.mat");       % 카메라 칼리브레이션 파일

%% Node 

% AutoL_lidar = ros2node("/AutoL_lidar");
% 
% lidarPub = ros2publisher(AutoL_lidar,'/scan','sensor_msgs/PointCloud2');
% lidarPubMsg = ros2message('sensor_msgs/PointCloud2');
% lidarPubMsg.header.frame_id = 'lidar_frame';


Matlab = ros2node("/MatlabNode");

% lidarSub = ros2subscriber(Matlab,'/scan','sensor_msgs/PointCloud2');
imageSub = ros2subscriber(Matlab,'/camera1/image_raw','sensor_msgs/Image');

%% Packet Data parsing 

% point cloud viewer 생성
% player = pcplayer([0 15],[-10 10],[-4 20]);

% [x,y,z] 좌표 값 사전 할당(178 packet * 128 points), 코드 속도를 위해 사전 할당 
points = single(zeros(22784,3));
frameCount = 0;
i = 1;

% 입력 buffer 제거
flush(udpObj,"input")

figure
tic
while true
    
    % 패킷 1개 불러오기      
    packetData = single(read(udpObj,1330))';
    
    % 패킷 1개 parsing 
    [payload,top_bottom_flag,dataType] = packet_extract(packetData);
    
    % 패킷 1개에 해당하는 pointCloud 검출 
    xyzPoints = ptCloud_extract(payload,top_bottom_flag);
    
    % 패킷 속 xyz 좌표값 저장
    points((i-1)*128+1:(i-1)*128+128,:) = xyzPoints;
    i = i + 1;
    
    
    % 1 프레임 종료 확인(하부 프레임 89개 다음 상부 프레임 89개 수신 받으면 178 패킷 == 1 프레임); 
    if (top_bottom_flag == 1 && dataType(:,1) == 170)
        
        % [x,y,z] -> point cloud 생성
        ptCloud = pointCloud(points);
        
        % Create Colormap of Pointcloud
        heights = ptCloud.Location(:,1);
        colormap jet;
        colorRange = jet(256);
        
        minHeight = min(heights); % 최소 높이 값
        maxHeight = max(heights); % 최대 높이 값
        normalizedHeights = (heights - minHeight) / (maxHeight - minHeight); % 높이 값을 0과 1 사이로 정규화
        colorIndices = ceil(normalizedHeights * 255) + 1;
        colorIndices(colorIndices > 256) = 256;
        colorIndices(colorIndices < 1) = 1;
        pointColors = colorRange(colorIndices, :);
       
        % subscribe image msg
        imgMsg = receive(imageSub);
        img = rosReadImage(imgMsg);

        [imPts,idx] = projectLidarPointsOnImage(ptCloud,cameraParams.Intrinsics,tform);
        imshow(img);
        hold on
        scatter(imPts(:,1), imPts(:,2), 2, pointColors(idx), 'filled');
        hold off
        
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
