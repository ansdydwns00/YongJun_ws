%%

% Connect udp data communication
AviaUDP = udpport("byte","LocalPort",56001,"ByteOrder","little-endian");

%% Visualization using packet messages

% Setting point cloud viewer parameter
xmin = 0;  xmax = 10;
ymin = -5; ymax = 5;
zmin = -2; zmax = 5;

player = pcplayer([xmin xmax],[ymin ymax],[zmin zmax]);

% Set values for frame count 
frameCount = 1;

% Set values for n frames
frame_num = 10;

% Flag for first Run
reset_flag = single(0);

% Parameter for n frame buffer
xyzPointsBuffer = [];
xyzIntensityBuffer = [];



tic
while 1

    % Read 1 packet
    packet = single(read(AviaUDP,1278))';

    [xyzCoords,xyzIntensity,isValid] = Avia_parsing_triple(packet,reset_flag);
    
    if isValid

        xyzPointsBuffer = vertcat(xyzPointsBuffer,xyzCoords);
        xyzIntensityBuffer = vertcat(xyzIntensityBuffer,xyzIntensity);

        if mod(frameCount,frame_num) == 0


            ptCloud = pointCloud(xyzPointsBuffer,"Intensity",xyzIntensityBuffer);
            
            % Display ptCloud 
            view(player,ptCloud);

            xyzPointsBuffer = [];
            xyzIntensityBuffer = [];
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