clear; clc
import function.*
load('udp_packet.mat')

matFile = 'pretrainedPointPillarsDetector.mat';
pretrainedDetector = load('pretrainedPointPillarsDetector.mat','detector');
detector = pretrainedDetector.detector;

%% Lidar Connection

% Create udp communication object
udpObj = udpport("byte","LocalPort",5001,"ByteOrder","little-endian");

%% Node Initialization
lidar_node = ros2node('/lidar_node');
lidarPub = ros2publisher(lidar_node,"/lidar","sensor_msgs/PointCloud2");
lidarMsg = ros2message(lidarPub);
lidarMsg.is_bigendian = false;

dt_node = ros2node('/dt_node');
dtSub = ros2subscriber(dt_node,'/lidar',@get_ptdata);        



%% Packet Data parsing 
matFile = 'pretrained.mat';
global pt;
% Create point cloud viewer
player = pcplayer([0 10],[-10 10],[-4 4]);

% Initialize of parameters 
points = single(zeros(22784,3)); % Pre-allocation [x,y,z] coords matrix
% intensity = single(zeros(22784,1));

i = 1;
j = 0;
frameCount = 0;

% % Remove input buffer
% flush(udpObj,"input")

tic

while isOpen(player)
    % Load 1 packet [1 x 1330]
    packetData = single(data(1330*j+1:1330*j+1330))';

    % One packet data parsing
    [payload,top_bottom_flag,dataType] = packet_extract(packetData);

    % [x,y,z] coords of one packet
    % payload = gpuArray(payload);
    
    
    [xyzPoints,inten]= ptCloud_extract(payload,top_bottom_flag);
 

    % Save [x,y,z] coords
    points((i-1)*128+1:(i-1)*128+128,:) = xyzPoints;
    % intensity((i-1)*128+1:(i-1)*128+128,:) = inten;

    i = i+1;
    j = j+1;

    % Check end frame
    if (top_bottom_flag == 1 && dataType == 170)

        % Create point cloud object
        ptCloud = pointCloud(points);
        

        % Display ptCloud on pcplayer
        view(player,ptCloud);
        % [bboxes,~,labels]= pointpillardetect(matFile,ptCloud.Location,ptCloud.Intensity,0.5);

        lidarMsg = rosWriteXYZ(lidarMsg,points(1:22784,:));
        send(lidarPub,lidarMsg)


        % Initialize of parameters
        i = 1;

        % Display Rendering rate
        frameCount = frameCount + 1;
        elapsedTime = toc;
        frameRate = frameCount / elapsedTime;
        fprintf("Rendering rate: %f hz\n",frameRate);
    end
end