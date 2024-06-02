% Stop timer 
% stop(t)

% Initialize workspace
clear; clc;

% Connect udp handshake communication
udpObj = udpport("datagram","LocalPort",55501);

% Start timer
t = timer;
t.Period = 1;
t.TimerFcn = {@InitProtocol,udpObj};
t.ExecutionMode = 'fixedDelay';

start(t)
%%

% Connect udp data communication
udpObj2 = udpport("byte","LocalPort",56001,"ByteOrder","little-endian");

%% 

player = pcplayer([0 10],[-5 5],[-2 5]);

frameCount = 0;
reset_flag = single(0);

% tic
while 1
    % Read 1 packet
    packet = single(read(udpObj2,1362))';

    dataType = packet(10);
    
    if dataType ~= 2
       flush(udpObj2);
       continue;
    else
        [xyzCoords,isValid] = Avia_parsing_mex(packet,reset_flag);
  
        if isValid
            ptCloud = pointCloud(xyzCoords);
            
            % Display ptCloud on pcplayer
            view(player,ptCloud) 
    
            % Display Rendering rate 
            % frameCount = frameCount + 1;
            % elapsedTime = toc;
            % frameRate = frameCount / elapsedTime;
            % fprintf("Rendering rate: %f hz\n",frameRate);
            % flush(udpObj2)
        end
    end

    reset_flag = single(1);
end

