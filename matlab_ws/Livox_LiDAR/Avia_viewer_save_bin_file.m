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

%% Connect AVIA UDP Communication

% Connect udp data communication
Avia_UDP = udpport("datagram","LocalPort",56001);

%% Visualization using 250*n messages

% Setting point cloud viewer parameter
xmin = 0;      xmax = 50;
ymin = -10;     ymax = 10;
zmin = -2;     zmax = 3;

player = pcplayer([xmin xmax],[ymin ymax],[zmin zmax],"MarkerSize",10,"ColorSource","X");


% Set values for frame count 
frameCount = 1;

% Set values for n frames
frame_num = 1;

%
frameBin = 1;

% Flag for first Run
reset_flag = single(0);

% Parameter for n frame buffer
xyzPointsBuffer = [];
xyzIntensityBuffer = [];

flush(Avia_UDP)

while 1

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
                       
            % Display ptCloud 
            view(player,ptCloud);
            
            xyzPointsBuffer = [];
            xyzIntensityBuffer = [];

            % ptCloud to bin file
            filename = sprintf('%06d.bin',frameBin);
            frameBin = frameBin + 1;
            
            fileID = fopen(filename,'w');

            xyzi_point = [ptCloud.Location normalize(ptCloud.Intensity)]';
            
            fwrite(fileID,xyzi_point,'single');
            fclose(fileID);

        end
                
        frameCount = frameCount + 1;
        flush(Avia_UDP)
    end
    
    reset_flag = single(1);
end