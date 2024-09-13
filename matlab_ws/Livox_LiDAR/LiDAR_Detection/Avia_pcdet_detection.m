%% Connect AVIA UDP Communication
clear; clc

% Connect udp data communication
Avia_UDP = udpport("datagram","LocalPort",56001);

%% ROS Node 

global G_bbox
global G_id
global G_cls
global vehiclePose


% Create a node for connection between MATLAB and ROS2
Pub_Node = ros2node("/IVL_Pub");
Sub_Node = ros2node("/IVL_Sub");


% Create Publish Node
pub.LiDAR = ros2publisher(Pub_Node,"/livox/lidar","sensor_msgs/PointCloud2");

% Create Subscribe Node
sub.lr_detection = ros2subscriber(Sub_Node,"/lr_detections","vision_msgs/Detection3DArray",@HelperCallbackPCDet);

%% Main 
vehiclePose = [0 0 0];

% Remove memory cache
clear HelperComputeDistance
clear HelperComputeVelocity
clear HelperDrawCuboid
clear HelperDeleteCuboid

%-----------------------------------------------------------------------------------%
%-----------------------------------Visualization-----------------------------------%
%-----------------------------------------------------------------------------------%
% Set x,y,z range of pcplayer
xmin = 0;      xmax = 70;
ymin = -10;    ymax = 10;
zmin = -2;     zmax = 3;

% pointCloud viewer
player = pcplayer([xmin xmax],[ymin ymax],[zmin zmax],"ColorSource","X","MarkerSize",4);
                      
L_bbox = [];
L_id = [];
L_cls = [];
%-----------------------------------------------------------------------------------%



%-----------------------------------------------------------------------------------%
%----------------------------preprocessing Parameter--------------------------------%
%-----------------------------------------------------------------------------------%
% ROI 설정
roi = [2, 70, -10, 10, -2, 3];     

% Downsample
gridStep = 0.1;
%-----------------------------------------------------------------------------------%




%-----------------------------------------------------------------------------------%
%-----------------------------------UDP Parameter-----------------------------------%
%-----------------------------------------------------------------------------------%
% Set values for frame count 
frameCount = 1;

% Flag for first Run
reset_flag = single(0);

% Remove Buffer
flush(Avia_UDP);
%-----------------------------------------------------------------------------------%


while true
    
    % Read 1 packet
    packet = read(Avia_UDP,1,"uint8");

    if size(packet.Data,2) == 1362 
        [xyzCoords,xyzIntensity,isValid] = Avia_parsing_mex(single((packet.Data)'),reset_flag);
    end
    
    if isValid     

        % ptCloud = pointCloud(xyzCoords,"Intensity",xyzIntensity);
        ptCloud = pointCloud(xyzCoords,"Intensity",zeros(size(xyzIntensity,1),1));
        
        % Preprocessing point clound (ROI, Downsampling, remove ground)
        if ~isempty(ptCloud.Location)

            ptCloud_ps = HelperPtCldProcessing(ptCloud,roi,gridStep); 
            
            % Sending point cloud msg to ROS2 
            msg_LiDAR = ros2message(pub.LiDAR);
            msg_LiDAR.header.frame_id = 'map';
            msg_LiDAR = rosWriteXYZ(msg_LiDAR,(ptCloud_ps.Location));
            msg_LiDAR = rosWriteIntensity(msg_LiDAR,(ptCloud_ps.Intensity));
            send(pub.LiDAR,msg_LiDAR);
        end
        
        L_bbox = G_bbox;
        L_id = G_id;
        L_cls = G_cls;
        
        %-----------------------------------------------------------------------------------%
        %-------------------------------Object Detection Info-------------------------------%
        %-----------------------------------------------------------------------------------%
        % Calculate Object Distance
        [Model, ModelInfo] = HelperComputeDistance(L_bbox, L_id, L_cls, ptCloud);

        % Calculate Object Velocity
        [VelocityInfo, OrientInfo, ~] = HelperComputeVelocity(ModelInfo,vehiclePose);


        %-----------------------------------------------------------------------------------%
        %-----------------------------------Visualization-----------------------------------%
        %-----------------------------------------------------------------------------------%
        % Display detection results
        view(player,ptCloud);
        HelperDeleteCuboid(player.Axes)
        HelperDrawCuboid(player.Axes, Model, 'red', ModelInfo, VelocityInfo, OrientInfo);


        flush(Avia_UDP);
    end    

    reset_flag = single(1);
end

