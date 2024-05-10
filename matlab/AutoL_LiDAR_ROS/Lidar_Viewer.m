%% Lidar Connection

% clear workspace
clear; clc

% Create udp communication object
udpObj = udpport("byte","LocalPort",5001,"ByteOrder","little-endian");

%% Packet Data parsing 

% Create point cloud viewer
player = pcplayer([0 10],[-10 10],[-4 4]);


% Initialize of parameters 
points = single(zeros(22784,3));      % Pre-allocation [x,y,z] coords matrix
i = 1;
frameCount = 0;

% Remove input buffer
flush(udpObj,"input")

tic
while true
  
    % Load 1 packet [1 x 1330]      
    packetData = single(read(udpObj,1330))';
    
    % One packet data parsing
    [payload,top_bottom_flag,dataType] = packet_extract(packetData);
    
    % [x,y,z] coords of one packet 
    xyzPoints = ptCloud_extract(payload,top_bottom_flag);
    
    % Save [x,y,z] coords
    points((i-1)*128+1:(i-1)*128+128,:) = xyzPoints;
    i = i + 1;
    
    % Check end frame  
    if (top_bottom_flag == 1 && dataType(:,1) == 170)
        
        % Create point cloud object
        ptCloud = pointCloud(points);
              
        % Display ptCloud on pcplayer
        view(player,ptCloud) 

        % Initialize of parameters
        i = 1;
        points = single(zeros(22784,3));
        
        % Display Rendering rate 
        frameCount = frameCount + 1;
        elapsedTime = toc;
        frameRate = frameCount / elapsedTime;
        fprintf("Rendering rate: %f hz\n",frameRate);
    end   
end
