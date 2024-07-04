%% Timer for Handshake protocol
% Initialize workspace
clear; clc;

% Connect udp handshake communication
udpObj = udpport("datagram","LocalPort",55501);

% Start timer
t = timer;
t.Period = 1;
t.TimerFcn = {@InitProtocol,udpObj};
t.ExecutionMode = 'fixedRate';

start(t)

%% Initialize ROS2 Node

Node = ros2node("/MATLAB");

LidarPub = ros2publisher(Node,"/Avia","sensor_msgs/PointCloud2");
LidarMsg = ros2message(LidarPub);
LidarMsg.header.frame_id = 'map';

%% Connect AVIA UDP Communication

% Connect udp data communication
Avia_UDP = udpport("byte","LocalPort",56001,"ByteOrder","little-endian");

%% Load complex-yolo model

load complexYoloModel.mat detector

xMin = -30.0;     
xMax = 30.0;      
yMin = 0.0;      
yMax = 60.0;      
zMin = -2.0;     
zMax = 15.0;  
% 
% xMin = -10.0;     
% xMax = 10.0;      
% yMin = 0.0;      
% yMax = 10.0;      
% zMin = -2.0;     
% zMax = 2.0;

bevHeight = 608;
bevWidth = 608;

gridW = (yMax - yMin)/bevWidth;
gridH = (xMax - xMin)/bevHeight;

gridParams = {{xMin,xMax,yMin,yMax,zMin,zMax},{bevWidth,bevHeight},{gridW,gridH}};

%% Visualization using N messages

% Setting point cloud viewer parameter
xmin = 0;  xmax = 40;
ymin = -30; ymax = 30;
zmin = -2; zmax = 10;

player = pcplayer([xmin xmax],[ymin ymax],[zmin zmax],"MarkerSize",10,"ColorSource","X");

% Set values for frame count 
frameCount = 1;

% Set values for n frames
frame_num = 10;

% Parameter for n frame buffer
xyzPointsBuffer = [];
xyzIntensityBuffer = [];

% Flag for first Run
reset_flag = single(0);


flush(Avia_UDP)
while 1
    
    % Read 1 packet
    packet = single(read(Avia_UDP,1362))';

    [xyzCoords,xyzIntensity,isValid] = Avia_parsing_mex(packet,reset_flag);

    if isValid
        
        % Display n message
        xyzPointsBuffer = vertcat(xyzPointsBuffer,xyzCoords);
        xyzIntensityBuffer = vertcat(xyzIntensityBuffer,xyzIntensity);

        if mod(frameCount,frame_num) == 0

            reshape_xyzPointsBuffer = reshape(xyzPointsBuffer, 32, [], 3);
            reshape_xyzIntensityBuffer = reshape(xyzIntensityBuffer, 32, [], 1);
    
            ptCloud = pointCloud(reshape_xyzPointsBuffer,"Intensity",reshape_xyzIntensityBuffer);
            
            % Convert point cloud to Bird-Eye-View Image
            I = ptCldToBEV(ptCloud,gridParams);
            
            % Object Detection
            [bboxes, scores, labels] = detect(detector,I,"Threshold",0.1);
    
            % Transfer bboxes to cuboid bboxes
            bboxCuboid = transferBboxToCuboidBbox(bboxes,gridParams,ptCloud); 
        
            % Compute Object Distance
            [Distances,Ids] = LR_computeDistance(ptCloud,bboxCuboid);
    
            % Delete 0 distance
            idx = find(Distances);
            
            Distances = Distances(idx,:);
            Ids = Ids(idx,:);
            bboxCuboid = bboxCuboid(idx,:);
            scores = scores(idx,:);
            labels = string(labels(idx,:));
            
            % Match Distances & Labels
            showShape('cuboid',bboxCuboid,'Parent',player.Axes,'Opacity',0.2,'Color','red','LineWidth',0.5,...
                      'Label',"ID:" + Ids + "," + labels + "," + Distances + "m",...
                      'LabelOpacity',0.8);
    
            % showShape('cuboid',bboxCuboid,'Parent',player.Axes,'Opacity',0.2,'Color','red','LineWidth',0.5);
            
            % Display ptCloud 
            view(player,ptCloud);
            
            xyzPointsBuffer = [];
            xyzIntensityBuffer = [];
        end

        frameCount = frameCount + 1;
        
        % flush(Avia_UDP)
    end
   
    reset_flag = single(1);
end
