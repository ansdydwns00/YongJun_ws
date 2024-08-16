%% Connect AVIA UDP Communication
clear; clc

% Connect udp data communication
Avia_UDP = udpport("datagram","LocalPort",56001);

%% ROS Node 

global g_id
global g_cls
global g_bboxes

g_id = {};
g_cls = {};
g_bboxes = [];

% Create a node for connection between MATLAB and ROS2
Node = ros2node("/IVL");

% Create Subscribe Node
% sub.Cam = ros2subscriber(Node,'/camera/camera/color/image_raw','sensor_msgs/Image',@helperCallbackImage);
% sub.Yolo_img = ros2subscriber(Node,"/yolo/image","sensor_msgs/Image");
sub.Yolo_track = ros2subscriber(Node,"/yolo/tracking","yolov8_msgs/DetectionArray",@helperCallbackYolo);

% Create Publish Node
pub.LiDAR = ros2publisher(Node,"LiDAR/Avia","sensor_msgs/PointCloud2");
pub.detections = ros2publisher(Node,'/clusters_marker', 'visualization_msgs/MarkerArray');

%% Main 

%-----------------------------------------------------------------------------------%
%-------------------------------Calibration Parameter-------------------------------%
%-----------------------------------------------------------------------------------%

% Load LiDAR-Camera Calibration parameter
load("lcc_params_1920.mat");
% 
% % 라이다 카메라 칼리브레이션 파일
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
ymin = -5;     ymax = 5;
zmin = -2;     zmax = 3;

% pointCloud viewer
player = pcplayer([xmin xmax],[ymin ymax],[zmin zmax],"ColorSource","X","MarkerSize",4);


l_bboxes = [];
l_id = [];
l_cls = [];
%-----------------------------------------------------------------------------------%




%-----------------------------------------------------------------------------------%
%------------------------------Clustering Parameter---------------------------------%
%-----------------------------------------------------------------------------------%
% ROI 설정
roi = [5, 10, -5, 5, -2, 4];     

% Downsample
gridStep = 0.01;

% Cluster distance 
clusterThreshold = 0.3;   

% Set clustered object number
markerIdClusters = 0;
%-----------------------------------------------------------------------------------%



%-----------------------------------------------------------------------------------%
%-----------------------------------UDP Parameter-----------------------------------%
%-----------------------------------------------------------------------------------%
% Set values for frame count 
frameCount = 1;

% Set values for n frames
frame_num = 1;

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
                ptCloud_ps = helperPtCldProcessing(ptCloud,roi,gridStep); 

                msg_LiDAR = ros2message(pub.LiDAR);
                msg_LiDAR.header.frame_id = 'map';
                msg_LiDAR = rosWriteXYZ(msg_LiDAR,(ptCloud.Location));
                msg_LiDAR = rosWriteIntensity(msg_LiDAR,(ptCloud.Intensity));
                send(pub.LiDAR,msg_LiDAR);
            end
            
            % Object detection
            l_bboxes = g_bboxes;
            l_id = g_id;
            l_cls = g_cls;
            [Distances, Model, l_id, l_cls] = helperComputeDistance(l_bboxes, l_id, l_cls, ptCloud_ps, camParams, camToLidar, clusterThreshold); 
            
            % Display detection results
            % view(player,ptCloud)
            % helperDeleteCuboid(player.Axes)
            % helperDrawCuboid(player.Axes, Model,'red', Distances, l_id, l_cls)
            
            % Visualization Rviz2
            % msg_Detections = generate_clusters_marker(Model, 'map', l_id');
            % send(pub.detections, msg_Detections);
            [msg_Detections, markerIdClusters] = generate_clusters_marker(Model, 'map', markerIdClusters, 3);
            send(pub.detections, msg_Detections);

            [msg_Detections, markerIdClusters] = generate_clusters_marker(Model, 'map', markerIdClusters, 0);
            send(pub.detections, msg_Detections);

            xyzPointsBuffer = [];
            xyzIntensityBuffer = [];
        end

       frameCount = frameCount + 1;
       flush(Avia_UDP);
    end    

    reset_flag = single(1);
end


%% Support Functions
% function markerArrayMsg= generate_clusters_marker(cuboids, frameId, markerID)
% 
%     persistent id_prev
%     global flag
% 
%     if isempty(id_prev) || flag == 0
%         id_prev = {};
%     end
% 
%     markerArrayMsg = ros2message('visualization_msgs/MarkerArray');
% 
%     num_cuboid = size(cuboids,1);
%     num_cuboid_prev = size(id_prev,1);
% 
%     if num_cuboid == num_cuboid_prev
%         % 1:1 
%         for i = 1:num_cuboid
%             cuboid = cuboids{i};
%             id = markerID{i};
% 
%             if strcmp(id_prev{i},id)
%                 markerMsg.id = int32(id);
%                 markerMsg.action = int32(1);
%             else
%                 % markerMsg.id = int32(id_prev{i});
%                 % markerMsg.action = int32(3);
%                 markerMsg.id = int32(id);
%                 markerMsg.action = int32(0);
%                 id_prev{i} = id;
%             end
% 
%             % Cuboid [x_ctr, y_ctr, z_ctr, x_len, y_len, z_len, x_rot, y_rot, z_rot]
%             x_ctr = cuboid.Center(1);
%             y_ctr = cuboid.Center(2);
%             z_ctr = cuboid.Center(3);
%             x_len = cuboid.Dimensions(1);
%             y_len = cuboid.Dimensions(2);
%             z_len = cuboid.Dimensions(3);
%             x_rot = cuboid.Orientation(1);
%             y_rot = cuboid.Orientation(2);
%             z_rot = cuboid.Orientation(3);
%             quat = eul2quat([deg2rad(z_rot),deg2rad(y_rot),deg2rad(x_rot)]);
% 
%             markerMsg = ros2message('visualization_msgs/Marker');
%             markerMsg.header.frame_id = frameId;
%             markerMsg.type = int32(1);
% 
%             markerMsg.pose.position.x = double(x_ctr);
%             markerMsg.pose.position.y = double(y_ctr);
%             markerMsg.pose.position.z = double(z_ctr);
% 
%             markerMsg.pose.orientation.w = quat(1);
%             markerMsg.pose.orientation.x = quat(2);
%             markerMsg.pose.orientation.y = quat(3);
%             markerMsg.pose.orientation.z = quat(4);
% 
%             markerMsg.scale.x = double(x_len);
%             markerMsg.scale.y = double(y_len);
%             markerMsg.scale.z = double(z_len);
% 
%             % Set Color
%             markerMsg.color.r = single(1);
%             markerMsg.color.g = single(1);
%             markerMsg.color.b = single(0);
%             markerMsg.color.a = single(0.5);
% 
%             markerArrayMsg.markers(i) = markerMsg;
%         end
% 
%     elseif num_cuboid > num_cuboid_prev
%         for i = num_cuboid_prev+1:num_cuboid
%             cuboid = cuboids{i};
%             id = markerID{i};
% 
%             markerMsg.id = int32(id);
%             markerMsg.action = int32(0);
%             id_prev{i} = id;
% 
%             % Cuboid [x_ctr, y_ctr, z_ctr, x_len, y_len, z_len, x_rot, y_rot, z_rot]
%             x_ctr = cuboid.Center(1);
%             y_ctr = cuboid.Center(2);
%             z_ctr = cuboid.Center(3);
%             x_len = cuboid.Dimensions(1);
%             y_len = cuboid.Dimensions(2);
%             z_len = cuboid.Dimensions(3);
%             x_rot = cuboid.Orientation(1);
%             y_rot = cuboid.Orientation(2);
%             z_rot = cuboid.Orientation(3);
%             quat = eul2quat([deg2rad(z_rot),deg2rad(y_rot),deg2rad(x_rot)]);
% 
%             markerMsg = ros2message('visualization_msgs/Marker');
%             markerMsg.header.frame_id = frameId;
%             markerMsg.type = int32(1);
% 
%             markerMsg.pose.position.x = double(x_ctr);
%             markerMsg.pose.position.y = double(y_ctr);
%             markerMsg.pose.position.z = double(z_ctr);
% 
%             markerMsg.pose.orientation.w = quat(1);
%             markerMsg.pose.orientation.x = quat(2);
%             markerMsg.pose.orientation.y = quat(3);
%             markerMsg.pose.orientation.z = quat(4);
% 
%             markerMsg.scale.x = double(x_len);
%             markerMsg.scale.y = double(y_len);
%             markerMsg.scale.z = double(z_len);
% 
%             % Set Color
%             markerMsg.color.r = single(1);
%             markerMsg.color.g = single(1);
%             markerMsg.color.b = single(0);
%             markerMsg.color.a = single(0.5);
% 
%             markerArrayMsg.markers(i) = markerMsg;
%         end
%     else
%         % 1:1 
%         for i = 1:num_cuboid
%             cuboid = cuboids{i};
%             id = markerID{i};
% 
%             if strcmp(id_prev{i},id)
%                 markerMsg.id = int32(id);
%                 markerMsg.action = int32(1);
%             else
% 
%                 markerMsg.id = int32(id);
%                 markerMsg.action = int32(0);
%                 id_prev{i} = id;
%             end
% 
%             % Cuboid [x_ctr, y_ctr, z_ctr, x_len, y_len, z_len, x_rot, y_rot, z_rot]
%             x_ctr = cuboid.Center(1);
%             y_ctr = cuboid.Center(2);
%             z_ctr = cuboid.Center(3);
%             x_len = cuboid.Dimensions(1);
%             y_len = cuboid.Dimensions(2);
%             z_len = cuboid.Dimensions(3);
%             x_rot = cuboid.Orientation(1);
%             y_rot = cuboid.Orientation(2);
%             z_rot = cuboid.Orientation(3);
%             quat = eul2quat([deg2rad(z_rot),deg2rad(y_rot),deg2rad(x_rot)]);
% 
%             markerMsg = ros2message('visualization_msgs/Marker');
%             markerMsg.header.frame_id = frameId;
%             markerMsg.type = int32(1);
% 
%             markerMsg.pose.position.x = double(x_ctr);
%             markerMsg.pose.position.y = double(y_ctr);
%             markerMsg.pose.position.z = double(z_ctr);
% 
%             markerMsg.pose.orientation.w = quat(1);
%             markerMsg.pose.orientation.x = quat(2);
%             markerMsg.pose.orientation.y = quat(3);
%             markerMsg.pose.orientation.z = quat(4);
% 
%             markerMsg.scale.x = double(x_len);
%             markerMsg.scale.y = double(y_len);
%             markerMsg.scale.z = double(z_len);
% 
%             % Set Color
%             markerMsg.color.r = single(1);
%             markerMsg.color.g = single(1);
%             markerMsg.color.b = single(0);
%             markerMsg.color.a = single(0.5);
% 
%             markerArrayMsg.markers(i) = markerMsg;
%         end
% 
%         for i = num_cuboid+1:num_cuboid_prev
%             removerows(id_prev,i);
%         end
% 
%     end
% 
% 
% end

function [markerArrayMsg, markerID] = generate_clusters_marker(cuboids, frameId, markerID, action)

    markerArrayMsg = ros2message('visualization_msgs/MarkerArray');

    for i = 1:size(cuboids,1)

        cuboid = cuboids{i};
        % id = markerID{i};
        % id = markerID;

        % Cuboid [x_ctr, y_ctr, z_ctr, x_len, y_len, z_len, x_rot, y_rot, z_rot]
        x_ctr = cuboid.Center(1);
        y_ctr = cuboid.Center(2);
        z_ctr = cuboid.Center(3);
        x_len = cuboid.Dimensions(1);
        y_len = cuboid.Dimensions(2);
        z_len = cuboid.Dimensions(3);
        x_rot = cuboid.Orientation(1);
        y_rot = cuboid.Orientation(2);
        z_rot = cuboid.Orientation(3);
        quat = eul2quat([deg2rad(z_rot),deg2rad(y_rot),deg2rad(x_rot)]);


        markerMsg = ros2message('visualization_msgs/Marker');
        markerMsg.header.frame_id = frameId;
        markerMsg.id = int32(markerID); % Cast 'markerID' to int32

        markerID = markerID + 1;  % Increment markerID by 1 for each new marker

        markerMsg.type = int32(1);
        markerMsg.action = int32(action);

        markerMsg.pose.position.x = double(x_ctr);
        markerMsg.pose.position.y = double(y_ctr);
        markerMsg.pose.position.z = double(z_ctr);

        markerMsg.pose.orientation.w = quat(1);
        markerMsg.pose.orientation.x = quat(2);
        markerMsg.pose.orientation.y = quat(3);
        markerMsg.pose.orientation.z = quat(4);

        markerMsg.scale.x = double(x_len);
        markerMsg.scale.y = double(y_len);
        markerMsg.scale.z = double(z_len);

        % Set Color
        markerMsg.color.r = single(1);
        markerMsg.color.g = single(1);
        markerMsg.color.b = single(0);
        markerMsg.color.a = single(0.5);

        markerArrayMsg.markers(i) = markerMsg;
    end
end
