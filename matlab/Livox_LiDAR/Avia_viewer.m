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

%% Visualization using 1 messages

player = pcplayer([0 10],[-5 5],[-2 5]);

frameCount = 0;
reset_flag = single(0);

tic
while 1

    % Read 1 packet
    packet = single(read(Avia_UDP,1362))';

    [xyzCoords,xyzIntensity,isValid] = Avia_parsing(packet,reset_flag);
    % [xyzCoords,xyzIntensity,isValid] = Avia_parsing_mex(packet,reset_flag);

    if isValid

        ptCloud = pointCloud(xyzCoords,"Intensity",xyzIntensity);
        
        % Display ptCloud 
        view(player,ptCloud);

        % Display Rendering rate 
        frameCount = frameCount + 1;
        elapsedTime = toc;
        frameRate = frameCount / elapsedTime;
        fprintf("Rendering rate: %f hz\n",frameRate);

        flush(Avia_UDP)
    end

    reset_flag = single(1);
end