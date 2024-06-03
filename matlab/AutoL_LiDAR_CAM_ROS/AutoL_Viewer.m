%% Lidar Connection

% clear workspace
clear; clc

% Create udp communication object
udpObj = udpport("byte","LocalPort",5001,"ByteOrder","little-endian");

%% Packet Data parsing 

% Create point cloud viewer
player = pcplayer([0 10],[-10 10],[-4 4]);


% Initialize of parameters 

frameCount = 0;
reset_flag = single(0);                         % Reset persistent variable


% Remove input buffer
flush(udpObj,"input")

% tic
while true
    
    % Load 1 packet [1 x 1330]   
    packetData = single(read(udpObj,1330))';   
    
    % Use mex file to verify generated c code
    [xyzCoords,isValid] = AutoL_parsing_vector_mex(packetData,reset_flag);
    

    % Check end frame  
    if isValid
        
        % [x,y,z] coordinates to point cloud
        ptCloud = pointCloud(xyzCoords);
    
        % Display ptCloud on pcplayer
        view(player,ptCloud) 
        
        % Display Rendering rate 
        % frameCount = frameCount + 1;
        % elapsedTime = toc;
        % frameRate = frameCount / elapsedTime;
        % fprintf("Rendering rate: %f hz\n",frameRate);

        flush(udpObj);
    end  
    reset_flag = single(1);      
end
