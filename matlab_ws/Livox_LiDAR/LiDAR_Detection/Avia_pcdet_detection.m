%% Connect AVIA UDP Communication
clear; clc

% Connect udp data communication
Avia_UDP = udpport("datagram","LocalPort",56001);

%% ROS Node 

global G_bbox
global G_id
global G_cls

% Create a node for connection between MATLAB and ROS2
Node = ros2node("/IVL");

% Create Subscribe Node
sub.lr_detection = ros2subscriber(Node,"/lr_detections","vision_msgs/Detection3DArray",@HelperCallbackPCDet);

% Create Publish Node
pub.LiDAR = ros2publisher(Node,"/LiDAR/Avia","sensor_msgs/PointCloud2");
% pub.detections = ros2publisher(Node,'/clusters_marker', 'visualization_msgs/MarkerArray');

% Create Publish Message
msg_LiDAR = ros2message(pub.LiDAR);
msg_LiDAR.header.frame_id = 'map';

%% Main 
%===================================================================================%
%-----------------------------------Visualization-----------------------------------%
%===================================================================================%
% Set x,y,z range of pcplayer
xmin = 0;      xmax = 10;
ymin = -5;     ymax = 5;
zmin = -2;      zmax = 4;

player = pcplayer([xmin xmax],[ymin ymax],[zmin zmax],"ColorSource","X","MarkerSize",4);


% ROI 설정
roi = [2, 10, -4, 4, -1, 5];     

% Downsample
gridStep = 0.1;

% Set values for frame count 
frameCount = 3;

% Set values for n frames
frame_num = 3;

% Flag for first Run
reset_flag = single(0);

% Parameter for n frame buffer
xyzPointsBuffer = [];
xyzIntensityBuffer = [];
                      
L_bbox = [];
L_id = [];
L_cls = [];


flush(Avia_UDP);
while true
    
    % Read 1 packet
    packet = read(Avia_UDP,1,"uint8");

    if size(packet.Data,2) == 1362 
        [xyzCoords,xyzIntensity,isValid] = Avia_parsing_mex(single((packet.Data)'),reset_flag);
    end
    
    if isValid
        
        % Store [frame_num] message
        xyzPointsBuffer = vertcat(xyzPointsBuffer,xyzCoords);
        xyzIntensityBuffer = vertcat(xyzIntensityBuffer,xyzIntensity);
        
        if mod(frameCount,frame_num) == 0
            
            % ptCloud = pointCloud(xyzPointsBuffer,"Intensity",xyzIntensityBuffer);
            ptCloud = pointCloud(xyzPointsBuffer,"Intensity",zeros(size(xyzPointsBuffer,1),1));
            
            % Preprocessing point clound (ROI, Downsampling, remove ground)
            if ~isempty(ptCloud.Location)
                ptCloud = HelperPtCldProcessing(ptCloud,roi,gridStep); 

                % Sending point cloud msg to ROS2 
                msg_LiDAR = ros2message(pub.LiDAR);
                msg_LiDAR.header.frame_id = 'map';
                msg_LiDAR = rosWriteXYZ(msg_LiDAR,(ptCloud.Location));
                msg_LiDAR = rosWriteIntensity(msg_LiDAR,(ptCloud.Intensity));
                send(pub.LiDAR,msg_LiDAR);
            end
            
            L_bbox = G_bbox;
            L_id = G_id;
            L_cls = G_cls;

            % Display ptCloud 
            view(player,ptCloud);
            HelperDeleteCuboid(player.Axes)

            if ~isempty(L_bbox) && ~isempty(ptCloud.Location)                 
                
                Distances = HelperComputeDistance(L_bbox,ptCloud);

                HelperDrawCuboid(player.Axes,L_bbox,Distances,L_id,L_cls) 
            end

            xyzPointsBuffer = [];
            xyzIntensityBuffer = [];
        end

       frameCount = frameCount + 1;
       flush(Avia_UDP);
    end    

    reset_flag = single(1);
end

