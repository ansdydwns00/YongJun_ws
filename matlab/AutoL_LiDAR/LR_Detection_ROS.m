%% Lidar Connection

% clear workspace
clear; clc

% Create udp communication object
udpObj = udpport("byte","LocalPort",5001,"ByteOrder","little-endian");

%% Create ROS Node

Matlab = ros2node("/Matlab");

LidarPub = ros2publisher(Matlab,"/AutoL","sensor_msgs/PointCloud2");
LidarMsg = ros2message(LidarPub);

objSub = ros2subscriber(Matlab,"/objDetectionInfo","vision_msgs/Detection3DArray");
%% Initialize parameters

% ---------------------------------------------------------------------------
%                              Parameter Initialize 
% ---------------------------------------------------------------------------

frameCount = 0;
distance = [];                                    

roi = [5, 10, -2, 2, -2, 2];                    % ROI 설정
clusterThreshold = 0.4;                         % Cluster distance


reset_flag = single(0);                         % Reset persistent variable


% ---------------------------------------------------------------------------
%                              Create point cloud viewer 
% ---------------------------------------------------------------------------
player = pcplayer([4 10],[-5 5],[-2 2]);



% Remove input buffer
flush(udpObj,"input")

tic
while true
    
    % Load 1 packet [1 x 1330]   
    packetData = single(read(udpObj,1330))';   
    
    % Use mex file to verify generated c code
    [xyzCoords,xyzIntensity,isValid] = AutoL_parsing_Intensity_mex(packetData,reset_flag);
    
    % Check end frame  
    if isValid
        
        % Create point cloud object
        ptCloud = pointCloud(xyzCoords,"Intensity",xyzIntensity);
        
        LidarMsg = rosWriteXYZ(LidarMsg,ptCloud.Location);
        LidarMsg = rosWriteIntensity(LidarMsg,ptCloud.Intensity);
        
        send(LidarPub,LidarMsg)
        
        % Display ptCloud on pcplayer
        view(player,ptCloud) 
        
        % tic
        receive(objSub);
        % toc
        

        % Display Rendering rate 
        frameCount = frameCount + 1;
        elapsedTime = toc;
        frameRate = frameCount / elapsedTime;
        fprintf("Rendering rate: %f hz\n",frameRate);

        flush(udpObj)
    end  
    reset_flag = single(1);
end


