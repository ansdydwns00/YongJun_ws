%% Connect AVIA UDP Communication
clear; clc
% Connect udp data communication
Avia_UDP = udpport("byte","LocalPort",56001,"ByteOrder","little-endian");

%% LiDAR/Camera Calibration .mat 


load("Avia_realsense_Calib.mat");

% 라이다 카메라 칼리브레이션 파일
lidarToCam = tform;              
camToLidar = invert(tform);

% 카메라 칼리브레이션 파일
camParams = cameraParams;     

%% Node 

main = ros2node("/IVL");

% lidarSub = ros2subscriber(Matlab,'/livox/lidar','sensor_msgs/PointCloud2');
imageSub = ros2subscriber(main,'/camera/camera/color/image_raw','sensor_msgs/Image');

Yolo.imgSub = ros2subscriber(main,"/yolo/dbg_image","sensor_msgs/Image");
Yolo.trackSub = ros2subscriber(main,"/yolo/tracking","yolov8_msgs/DetectionArray");

%% Packet Data parsing 
  
% Setting point cloud viewer parameter
xmin = 0;  xmax = 20;
ymin = -6; ymax = 6;
zmin = -2; zmax = 10;

player = pcplayer([xmin xmax],[ymin ymax],[zmin zmax],"ColorSource","X","MarkerSize",10);

% Set values for frame count 
frameCount = 1;

% Set values for n frames
frame_num = 6;

% Flag for first Run
reset_flag = single(0);

% Parameter for n frame buffer
xyzPointsBuffer = [];
xyzIntensityBuffer = [];

% ROI 설정
roi = [2, 10, -5, 5, -2, 5];     

distance = [];

% Cluster distance
clusterThreshold = 0.1;                         


flush(Avia_UDP)

while true
    
    % Read 1 packet
    packet = single(read(Avia_UDP,1362))';

    % [xyzCoords,xyzIntensity,isValid] = Avia_parsing(packet,reset_flag);
    [xyzCoords,xyzIntensity,isValid] = Avia_parsing_mex(packet,reset_flag);
    
    
    if isValid
        
        % Display n message
        xyzPointsBuffer = vertcat(xyzPointsBuffer,xyzCoords);
        xyzIntensityBuffer = vertcat(xyzIntensityBuffer,xyzIntensity);
        
        if mod(frameCount,frame_num) == 0

            ptCloud = pointCloud(xyzPointsBuffer,"Intensity",xyzIntensityBuffer);
                       
            % ROI 영역 내 pointCloud 추출
            % indices = findPointsInROI(ptCloud, roi);
            % roiPtCloud = select(ptCloud, indices);
            
            [objectInfo, bboxesLidar, Distances, labels] = computeDistance(Yolo,ptCloud,camParams,camToLidar,clusterThreshold);
            
            
            labelsPedes = bboxesLidar(strcmp(labels,'person')',:);
            labelsRefri = bboxesLidar(strcmp(labels,'refrigerator')',:);
            
            % Display ptCloud 
            view(player,ptCloud);
            
            showShape('cuboid',labelsRefri,'Parent',player.Axes,'Opacity',0.2,'Color','green','LineWidth',0.5,'Label',round(Distances(strcmp(labels,'refrigerator')',:),2) + "m");
            hold(player.Axes,"on")
            showShape('cuboid',labelsPedes,'Parent',player.Axes,'Opacity',0.2,'Color','red','LineWidth',0.5,'Label',round(Distances(strcmp(labels,'person')',:),2) + "m");
            hold(player.Axes,"off")
            

            % showShape('cuboid',bboxesLidar,'Parent',player.Axes,'Opacity',0.2,'Color','red','LineWidth',0.5,'Label',Distances);
            

            xyzPointsBuffer = [];
            xyzIntensityBuffer = [];
        end

       frameCount = frameCount + 1;
    end    
    reset_flag = single(1);
end

