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
t.ExecutionMode = 'fixedRate';

start(t)
%%

% Connect udp data communication
AviaUDP = udpport("byte","LocalPort",56001,"ByteOrder","little-endian");

%% 

load("detector.mat");

player = pcplayer([0 10],[-5 5],[-2 5]);

frameCount = 0;
reset_flag = single(0);
xyzPointsBuffer = [];
xyzIntensityBuffer = [];

Distances = []; 


tic
while 1

    % Read 1 packet
    packet = single(read(AviaUDP,1362))';

    [xyzCoords,xyzIntensity,isValid] = Avia_parsing(packet,reset_flag);
    
    if isValid

        xyzPointsBuffer = vertcat(xyzPointsBuffer,xyzCoords);
        xyzIntensityBuffer = vertcat(xyzIntensityBuffer,xyzIntensity);

        if frameCount > 20

            xyzPointsBuffer = xyzPointsBuffer(96*30:end,:);
            xyzIntensityBuffer = xyzIntensityBuffer(96*30:end,:);

            ptCloud = pointCloud(xyzPointsBuffer,"Intensity",xyzIntensityBuffer);
            
            % Object Detection
            [bboxes, ~, ~] = detect(detector,ptCloud,"ExecutionEnvironment","gpu","Threshold",0.2);

            % Compute Object Distance
            Distances = LR_computeDistance(ptCloud,bboxes);

            % Delete 0 distance
            idx = find(Distances);
            Distances = Distances(idx,:);
            bboxes = bboxes(idx,:);

            % match distance & label
            showShape('cuboid',bboxes,'Parent',player.Axes,'Opacity',0.2,'Color','red','LineWidth',0.5,'Label',Distances);

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