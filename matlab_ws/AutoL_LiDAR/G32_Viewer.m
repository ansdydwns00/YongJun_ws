%% Lidar Connection

% clear workspace
clear; clc

% Create udp communication object
AutoL_UDP = udpport("byte","LocalPort",5001,"ByteOrder","little-endian");

%% Packet Data parsing 

% Setting point cloud viewer parameter
xmin = 0;  xmax = 10;
ymin = -5; ymax = 5;
zmin = -2; zmax = 5;

player = pcplayer([xmin xmax],[ymin ymax],[zmin zmax],"ColorSource","Z","MarkerSize",6);


% Set values for frame count 
frameCount = 1;

% Flag for first Run
reset_flag = single(0);

% Remove input buffer
flush(AutoL_UDP)

% tic
% start_time = toc;
% last_framecount = 0;
while true

    % Load 1 packet [1 x 1330]   
    packetData = single(read(AutoL_UDP,1330))';   
    
    % Use mex file to verify generated c code
    [xyzCoords,xyzIntensity,isValid] = G32_parsing_mex(packetData,reset_flag);

    % Check end frame  
    if isValid
        
        % [x,y,z] coordinates to point cloud
        ptCloud = pointCloud(xyzCoords,"Intensity",xyzIntensity);
    
        % Display ptCloud on pcplayer
        view(player,ptCloud) 
        
        % Display Rendering rate 
        % current_time = toc;
        % if current_time - start_time >= 1
        %     frame_count_diff = frameCount - last_framecount - 1;
        %     fprintf("Create %d ptCloud image in 1 second\n", frame_count_diff);
        %     last_framecount = frameCount;
        %     start_time = current_time;
        % end
        % 
        % frameCount = frameCount + 1;
        flush(AutoL_UDP);
    end  
    reset_flag = single(1);      
end
