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
Avia_UDP = udpport("byte","LocalPort",56001,"ByteOrder","little-endian");

%% Visualization using N messages

player = pcplayer([0 10],[-5 5],[-2 5]);

frameCount = 0;
reset_flag = single(0);

xyzPointsBuffer = [];
xyzIntensityBuffer = [];

numPacket = 30; 

tic
while 1

    % Read 1 packet
    packet = single(read(Avia_UDP,1362))';

    [xyzCoords,xyzIntensity,isValid] = Avia_parsing_single(packet,reset_flag);
    
    if isValid

        xyzPointsBuffer = vertcat(xyzPointsBuffer,xyzCoords);
        xyzIntensityBuffer = vertcat(xyzIntensityBuffer,xyzIntensity);

        if frameCount > 20

            xyzPointsBuffer = xyzPointsBuffer(96*numPacket+1:end,:);
            xyzIntensityBuffer = xyzIntensityBuffer(96*numPacket+1:end,:);

            ptCloud = pointCloud(xyzPointsBuffer,"Intensity",xyzIntensityBuffer);
            
            % Display ptCloud 
            view(player,ptCloud);
        end

        % Display Rendering rate 
        frameCount = frameCount + 1;
        elapsedTime = toc;
        frameRate = frameCount / elapsedTime;
        fprintf("Rendering rate: %f hz\n",frameRate);

        flush(Avia_UDP)
    end

    reset_flag = single(1);
end

