%% Connect AVIA UDP Communication
clear; clc

% Connect udp data communication
Avia_UDP = udpport("datagram","LocalPort",56001);

%% ROS Node 


global g_id
global g_cls
global g_bboxes
global g_vx
global g_vy
global g_img

g_id = {};
g_cls = {};
g_bboxes = [];
g_vx = [];
g_vy = [];
g_img = [];


% Create a node for connection between MATLAB and ROS2
Node = ros2node("/IVL");

% Create Subscribe Node
sub.Cam = ros2subscriber(Node,'/camera/camera/color/image_raw','sensor_msgs/Image',@helperCallbackImage);
% sub.Yolo_img = ros2subscriber(Node,"/yolo/image","sensor_msgs/Image");
sub.Yolo_track = ros2subscriber(Node,"/yolo/tracking","yolov8_msgs/DetectionArray",@helperCallbackYolo);

% Create Publish Node
pub.lr_detections = ros2publisher(Node,"/lr_detections","vision_msgs/Detection3DArray");
%% 



%-----------------------------------------------------------------------------------%
%-------------------------------Calibration Parameter-------------------------------%
%-----------------------------------------------------------------------------------%

% Load LiDAR-Camera Calibration parameter
load("lcc_params_640.mat");
% 
% % 라이다 카메라 칼리브레이션 파일
lidarToCam = tform;              
camToLidar = invert(tform);

% 카메라 칼리브레이션 파일
% camparams;
%-----------------------------------------------------------------------------------%





%-----------------------------------------------------------------------------------%
%-----------------------------------Visualization-----------------------------------%
%--------------------------------------------0--------------------------------------%
% Set x,y,z range of pcplayer
xmin = 0;      xmax = 10;
ymin = -5;     ymax = 5;
zmin = -2;     zmax = 3;

% pointCloud viewer
player = pcplayer([xmin xmax],[ymin ymax],[zmin zmax],"ColorSource","X","MarkerSize",4);


% image viewer
vPlayer = vision.DeployableVideoPlayer;


l_bboxes = [];
l_id = [];
l_cls = [];
l_img = [];
l_vx = [];
l_vy = [];
%-----------------------------------------------------------------------------------%




%-----------------------------------------------------------------------------------%
%------------------------------Clustering Parameter---------------------------------%
%-----------------------------------------------------------------------------------%
% ROI 설정
roi = [5, 10, -4, 4, -2, 2];     

% Downsample
gridStep = 0.1;

% Cluster distance 
clusterThreshold = 0.5;   
%-----------------------------------------------------------------------------------%



%-----------------------------------------------------------------------------------%
%-----------------------------------UDP Parameter-----------------------------------%
%-----------------------------------------------------------------------------------%
% Set values for frame count 
frameCount = 1;

% Flag for first Run
reset_flag = single(0);
                      
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
            ptCloud_ps = helperPtCldProcessing(ptCloud,roi,gridStep); 
        end
                    
        % Object detection
        l_bboxes = g_bboxes;
        l_id = g_id;
        l_cls = g_cls;
        l_vx = g_vx;
        l_vy = g_vy;
        

        [Distances, Velocity, Model, l_id, l_cls] = helperComputeDistance_kf(l_bboxes, l_id, l_cls, ptCloud_ps, camParams, camToLidar, clusterThreshold, l_vx, l_vy);          
        
        % Display detection results
        view(player,ptCloud)
        helperDeleteCuboid(player.Axes)
        helperDrawCuboid_kf(player.Axes, Model,'red', Distances, l_id, l_cls, Velocity)
        
        l_img = insertObjectAnnotation(g_img,"rectangle",g_bboxes,strcat({'ID:'},string(g_id)', {', Class:'},string(g_cls)'));
        
        if ~isempty(g_bboxes)
            l_img = insertShape(l_img,"filled-circle",[g_bboxes(:,1)+g_bboxes(:,3)/2, g_bboxes(:,2)+g_bboxes(:,4)/2,repmat(5,size(g_bboxes,1),1)],"ShapeColor","red");
        end

        vPlayer.step(l_img)

       frameCount = frameCount + 1;
       flush(Avia_UDP);
    end    
    
    reset_flag = single(1);
end
