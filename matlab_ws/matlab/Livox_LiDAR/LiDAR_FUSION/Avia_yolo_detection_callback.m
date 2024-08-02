%% Connect AVIA UDP Communication
clear; clc

% Connect udp data communication
Avia_UDP = udpport("datagram","LocalPort",56001);

%% ROS Node 

global id_tmp
global cls_tmp
global bboxes_tmp

bboxes_tmp = [];
id_tmp = {};
cls_tmp = {};

% Create a node for connection between MATLAB and ROS2
Node = ros2node("/IVL");

% Create Subscribe Node
% sub.LiDAR = ros2subscriber(Node,'/livox/lidar','sensor_msgs/PointCloud2');
% sub.Cam = ros2subscriber(Node,'/camera/camera/color/image_raw','sensor_msgs/Image');
sub.Yolo_img = ros2subscriber(Node,"/yolo/dbg_image","sensor_msgs/Image");
sub.Yolo_track = ros2subscriber(Node,"/yolo/tracking","yolov8_msgs/DetectionArray",@helperCallbackYolo);

% Create Publish Node
pub.LiDAR = ros2publisher(Node,"LiDAR/Avia","sensor_msgs/PointCloud2");
pub.detections = ros2publisher(Node,'/clusters_marker', 'visualization_msgs/MarkerArray');

% Create Publish Message
msg_LiDAR = ros2message(pub.LiDAR);
msg_LiDAR.header.frame_id = 'map';

%% Main 

% Load LiDAR-Camera Calibration parameter
load("Avia_realsense_Calib.mat");

% 라이다 카메라 칼리브레이션 파일
% lidarToCam = tform;              
camToLidar = invert(tform);

% 카메라 칼리브레이션 파일
camParams = cameraParams;  


%===================================================================================%
%-----------------------------------Visualization-----------------------------------%
%===================================================================================%
% Set x,y,z range of pcplayer
xmin = 0;      xmax = 8;
ymin = -4;     ymax = 4;
zmin = -2;      zmax = 4;

player = pcplayer([xmin xmax],[ymin ymax],[zmin zmax],"ColorSource","X","MarkerSize",4);


% ROI 설정
roi = [4, 10, -4, 4, -0.5, 5];     

% Downsample
gridStep = 0.01;

% Cluster distance 
clusterThreshold = 0.09;   

% Set values for frame count 
frameCount = 1;

% Set values for n frames
frame_num = 6;

% Flag for first Run
reset_flag = single(0);


% Parameter for n frame buffer
xyzPointsBuffer = [];
xyzIntensityBuffer = [];
                      

flush(Avia_UDP);
while true
    
    % Read 1 packet
    packet = read(Avia_UDP,1,"uint8");

    if size(packet.Data,2) == 1362 
        [xyzCoords,xyzIntensity,isValid] = Avia_parsing_mex(single((packet.Data)'),reset_flag);
    end
    
    if isValid
        
        % Display n message
        xyzPointsBuffer = vertcat(xyzPointsBuffer,xyzCoords);
        xyzIntensityBuffer = vertcat(xyzIntensityBuffer,xyzIntensity);
        
        if mod(frameCount,frame_num) == 0

            ptCloud = pointCloud(xyzPointsBuffer,"Intensity",xyzIntensityBuffer);
            
            if ~isempty(ptCloud.Location)
                ptCld_ps = helperPtCldProcessing(ptCloud,roi,gridStep); 

                Bbox =bboxes_tmp;
                Id = id_tmp;
                Cls = cls_tmp;
    
                [Distances,bboxesLidar,bboxesUsed] = helperComputeDistance(Bbox,ptCld_ps,camParams,camToLidar,clusterThreshold);
                
                % Display ptCloud 
                view(player,ptCld_ps);
                helperDeleteCuboid(player.Axes)
    
                if ~isempty(bboxesLidar) 
    
                    Id(~bboxesUsed') = [];
                    Cls(~bboxesUsed') = [];           
                    
                    cuboidInfo = helperGetCuboidInfo(bboxesLidar);
                    helperDrawCuboid(player.Axes,cuboidInfo,'red',Distances,Id,Cls)
                   
                end
            end
            xyzPointsBuffer = [];
            xyzIntensityBuffer = [];
        end

       frameCount = frameCount + 1;
       flush(Avia_UDP);
    end    

    reset_flag = single(1);
end

