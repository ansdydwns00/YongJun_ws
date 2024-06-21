%%

% Connect udp data communication
AviaUDP = udpport("byte","LocalPort",56001,"ByteOrder","little-endian");

%% 

player = pcplayer([0 10],[-5 5],[-2 5]);

frameCount = 0;
reset_flag = single(0);
xyzPointsBuffer = [];
xyzIntensityBuffer = [];
numPacket = 266; 

tic
while 1

    % Read 1 packet
    packet = single(read(AviaUDP,1278))';

    [xyzCoords,xyzIntensity,isValid] = Avia_parsing_triple(packet,reset_flag);
    
    if isValid

        xyzPointsBuffer = vertcat(xyzPointsBuffer,xyzCoords);
        xyzIntensityBuffer = vertcat(xyzIntensityBuffer,xyzIntensity);

        if frameCount > 6

            xyzPointsBuffer = xyzPointsBuffer(90*numPacket:end,:);
            xyzIntensityBuffer = xyzIntensityBuffer(90*numPacket:end,:);

            ptCloud = pointCloud(xyzPointsBuffer,"Intensity",xyzIntensityBuffer);
            
            % Display ptCloud 
            view(player,ptCloud);
        end

        % Display Rendering rate 
        frameCount = frameCount + 1;
        elapsedTime = toc;
        frameRate = frameCount / elapsedTime;
        fprintf("Rendering rate: %f hz\n",frameRate);

        flush(AviaUDP)
    end

    reset_flag = single(1);
end