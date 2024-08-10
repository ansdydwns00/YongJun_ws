%% Timer for Handshake protocol

% Initialize workspace
% clear; clc;

% Connect udp handshake communication
udpObj = udpport("datagram","LocalPort",55000);

% Start timer
t = timer;
t.Period = 1;
t.TimerFcn = {@InitProtocol,udpObj};
t.ExecutionMode = 'fixedRate';

start(t)

%% Connect AVIA UDP Communication
clear; clc

% Connect udp data communication
% Avia_UDP = udpport("byte","LocalPort",56002,"ByteOrder","little-endian");

% prev avia
Avia_UDP = udpport("datagram","LocalPort",56001);
%% Visualization

% Setting point cloud viewer parameter
xmin = 0;  xmax = 60;
ymin = -5; ymax = 5;
zmin = -2; zmax = 4;

player = pcplayer([xmin xmax],[ymin ymax],[zmin zmax],"ColorSource","X");


% Set values for frame count 
frameCount = 1;

% Set values for n frames
frame_num = 6;

% Flag for first Run
reset_flag = single(0);

% Parameter for n frame buffer
xyzPointsBuffer = [];
xyzIntensityBuffer = [];

% ROI 설정
roi = [5, 60, -4, 4, -1, 5];  

% Downsample
gridStep = 0.1;

i = 0;

flush(Avia_UDP)

% tic
% start_time = toc;
% last_framecount = 0;
while true

    % Read 1 packet
    packet = read(Avia_UDP,1,"uint8");
    
    if size(packet.Data,2) == 1362 
        [xyzCoords,xyzIntensity,isValid] = Avia_parsing_mex(single((packet.Data)'),reset_flag);
    end

    if isValid
        % Display n message
        xyzPointsBuffer = vertcat(xyzPointsBuffer,xyzCoords);
        xyzIntensityBuffer = vertcat(xyzIntensityBuffer,xyzIntensity);
        
        if mod(frameCount,frame_num) == 0

            ptCloud = pointCloud(xyzPointsBuffer,"Intensity",xyzIntensityBuffer);
            % ptCloud = helperPtCldProcessing(ptCloud, roi, gridStep);
            
            % % ptCloud to bin file
            filename = sprintf('%06d.bin',i);
            fileID = fopen(filename,'w');
            xyzi_point = [ptCloud.Location ptCloud.Intensity]';
            % xyzi_point = [ptCloud.Location normalize(ptCloud.Intensity)]';
            % xyzi_point = [ptCloud.Location zeros(size(ptCloud.Location,1),1)]';
            i = i + 1;
            fwrite(fileID,xyzi_point,'single');
            fclose(fileID);

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