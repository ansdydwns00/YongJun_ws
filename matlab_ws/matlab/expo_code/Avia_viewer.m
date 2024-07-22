%% UDP Connection
% addpath('/home/aiv/YongJun_ws/matlab_ws/matlab/Livox_LiDAR');

% run("Initialize_UDP_Protocol.m")

%% Connect AVIA UDP Communication

% Connect udp data communication
Avia_UDP = udpport("byte","LocalPort",56001,"ByteOrder","little-endian");

%% Visualization using 250*n messages

% Setting point cloud viewer parameter
xmin = 0;  xmax = 20;
ymin = -5; ymax = 5;
zmin = -2; zmax = 8;

player = pcplayer([xmin xmax],[ymin ymax],[zmin zmax],"ColorSource","X","MarkerSize",10);


% Set values for frame count 
frameCount = 1;

% Set values for n frames
frame_num = 6;

% Flag for first Run
reset_flag = single(0);

% Parameter for n frame buffer
xyzPointsBuffer = [];
xyzIntensityBuffer = [];

flush(Avia_UDP)

% tic
% start_time = toc;
% last_framecount = 0;
while 1

    % Read 1 packet
    packet = single(read(Avia_UDP,1362))';

    % [xyzCoords,xyzIntensity,isValid] = Avia_parsing(packet,reset_flag);
    [xyzCoords,xyzIntensity,isValid] = Avia_parsing_mex(packet,reset_flag);

    if isValid
        
        % Display n message
        xyzPointsBuffer = vertcat(xyzPointsBuffer,xyzCoords);
        xyzIntensityBuffer = vertcat(xyzIntensityBuffer,xyzIntensity);
        
        if mod(frameCount,frame_num) == 0

            ptCloud = pointCloud(xyzPointsBuffer,"Intensity",xyzIntensityBuffer);
                       
            % Display ptCloud 
            view(player,ptCloud);
            
            xyzPointsBuffer = [];
            xyzIntensityBuffer = [];
        end
        
        % % Display Rendering rate 
        % current_time = toc;
        % if current_time - start_time >= 1
        %     frame_count_diff = frameCount - last_framecount - 1;
        %     fprintf("Create %d ptCloud image in 1 second\n", frame_count_diff);
        %     last_framecount = frameCount;
        %     start_time = current_time;
        % end
        
        frameCount = frameCount + 1;
        flush(Avia_UDP)
    end
    
    reset_flag = single(1);
end