%% Connect AVIA UDP Communication
clear; clc

% Connect udp data communication
Avia_UDP = udpport("datagram","LocalPort",56001);

%% ROS Node 

global g_id
global g_cls
global g_bboxes

g_bboxes = [];
g_id = {};
g_cls = {};

% Create a node for connection between MATLAB and ROS2
Node = ros2node("/IVL");

% Create Subscribe Node
% sub.LiDAR = ros2subscriber(Node,'/livox/lidar','sensor_msgs/PointCloud2');
% sub.Cam = ros2subscriber(Node,'/camera/camera/color/image_raw','sensor_msgs/Image');
sub.Yolo_img = ros2subscriber(Node,"/yolo/image","sensor_msgs/Image");
sub.Yolo_track = ros2subscriber(Node,"/yolo/tracking","yolov8_msgs/DetectionArray",@helperCallbackYolo);

% Create Publish Node
pub.LiDAR = ros2publisher(Node,"LiDAR/Avia","sensor_msgs/PointCloud2");
pub.detections = ros2publisher(Node,'/clusters_marker', 'visualization_msgs/MarkerArray');

% Create Publish Message
msg_LiDAR = ros2message(pub.LiDAR);
msg_LiDAR.header.frame_id = 'map';

%% Main 

%-----------------------------------------------------------------------------------%
%-------------------------------Calibration Parameter-------------------------------%
%-----------------------------------------------------------------------------------%

% Load LiDAR-Camera Calibration parameter
load("lcc_params_640.mat");

% 라이다 카메라 칼리브레이션 파일
lidarToCam = tform;              
camToLidar = invert(tform);

% 카메라 칼리브레이션 파일
% camparams;
%-----------------------------------------------------------------------------------%



%-----------------------------------------------------------------------------------%
%-----------------------------------Visualization-----------------------------------%
%-----------------------------------------------------------------------------------%
% Set x,y,z range of pcplayer
xmin = 0;      xmax = 10;
ymin = -10;     ymax = 10;
zmin = -2;     zmax = 4;

player = pcplayer([xmin xmax],[ymin ymax],[zmin zmax],"ColorSource","X","MarkerSize",4);
%-----------------------------------------------------------------------------------%




%-----------------------------------------------------------------------------------%
%------------------------------Clustering Parameter---------------------------------%
%-----------------------------------------------------------------------------------%
% ROI 설정
roi = [0, 10, -5, 5, -2, 2];     

% Downsample
gridStep = 0.01;

% Cluster distance 
clusterThreshold = 0.1;   

% Set clustered object number
markerIdClusters = 0;
%-----------------------------------------------------------------------------------%



%-----------------------------------------------------------------------------------%
%-----------------------------------UDP Parameter-----------------------------------%
%-----------------------------------------------------------------------------------%
% Set values for frame count 
frameCount = 1;

% Set values for n frames
frame_num = 3;

% Flag for first Run
reset_flag = single(0);

% Parameter for n frame buffer
xyzPointsBuffer = [];
xyzIntensityBuffer = [];
%-----------------------------------------------------------------------------------%



                      

flush(Avia_UDP);
while true
    
    % Read 1 packet datagram
    packet = read(Avia_UDP,1,"uint8");
    
    % LiDAR [x,y,z,I] data parsing
    if size(packet.Data,2) == 1362 
        [xyzCoords,xyzIntensity,isValid] = Avia_parsing_mex(single((packet.Data)'),reset_flag);
    end
    
   
    if isValid
        
        % Store [frame_num] message
        xyzPointsBuffer = vertcat(xyzPointsBuffer,xyzCoords);
        xyzIntensityBuffer = vertcat(xyzIntensityBuffer,xyzIntensity);
        
        if mod(frameCount,frame_num) == 0

            ptCloud = pointCloud(xyzPointsBuffer,"Intensity",xyzIntensityBuffer);
            
            % Preprocessing point clound (ROI, Downsampling, remove ground) & Sending point cloud msg to ROS2 
            if ~isempty(ptCloud.Location)
                ptCloud = helperPtCldProcessing(ptCloud,roi,gridStep); 

                msg_LiDAR = ros2message(pub.LiDAR);
                msg_LiDAR.header.frame_id = 'map';
                msg_LiDAR = rosWriteXYZ(msg_LiDAR,(ptCloud.Location));
                msg_LiDAR = rosWriteIntensity(msg_LiDAR,(ptCloud.Intensity));
                send(pub.LiDAR,msg_LiDAR);
            end
            
            l_bboxes = g_bboxes;
            l_id = g_id;
            l_cls = g_cls;

            % Object detection
            [Distances,bboxesLidar,bboxesUsed] = helperComputeDistance(l_bboxes,ptCloud,camParams,camToLidar,clusterThreshold);
            
            % Display ptCloud
            view(player,ptCloud);
            helperDeleteCuboid(player.Axes)
            

            [msg_Detections, markerIdClusters] = generate_clusters_marker(bboxesLidar, 'map', markerIdClusters,3);
            send(pub.detections, msg_Detections);

            if ~isempty(bboxesLidar) 

                l_id(~bboxesUsed') = [];
                l_cls(~bboxesUsed') = [];         
                
                cuboidInfo = helperGetCuboidInfo(bboxesLidar);
                helperDrawCuboid(player.Axes,cuboidInfo,'red',Distances,l_id,l_cls)
                
                [msg_Detections, markerIdClusters] = generate_clusters_marker(bboxesLidar, 'map', markerIdClusters,0);
                send(pub.detections, msg_Detections);
            end

            xyzPointsBuffer = [];
            xyzIntensityBuffer = [];
        end

       frameCount = frameCount + 1;
       flush(Avia_UDP);
    end    

    reset_flag = single(1);
end


%% Support Functions
                
function [markerArrayMsg, markerID] = generate_clusters_marker(bboxesLidar, frameId, markerID, action)

    markerArrayMsg = ros2message('visualization_msgs/MarkerArray');

    for i = 1:size(bboxesLidar,1)

        markerMsg = ros2message('visualization_msgs/Marker');
        markerMsg.header.frame_id = frameId;
        markerMsg.id = int32(markerID); % Cast 'markerID' to int32

        markerID = markerID + 1;  % Increment markerID by 1 for each new marker

        markerMsg.type = int32(1);
        markerMsg.action = int32(action);

        markerMsg.pose.position.x = double(bboxesLidar(i,1));
        markerMsg.pose.position.y = double(bboxesLidar(i,2));
        markerMsg.pose.position.z = double(bboxesLidar(i,3));

        quat = eul2quat([bboxesLidar(i,9),bboxesLidar(i,8),bboxesLidar(i,7)]);

        markerMsg.pose.orientation.w = quat(1);
        markerMsg.pose.orientation.x = quat(2);
        markerMsg.pose.orientation.y = quat(3);
        markerMsg.pose.orientation.z = quat(4);

        markerMsg.scale.x = double(bboxesLidar(i,4));
        markerMsg.scale.y = double(bboxesLidar(i,5));
        markerMsg.scale.z = double(bboxesLidar(i,6));

        % Set Color
        markerMsg.color.r = single(0);
        markerMsg.color.g = single(0);
        markerMsg.color.b = single(1);
        markerMsg.color.a = single(0.8);

        markerArrayMsg.markers(i) = markerMsg;
    end
end
