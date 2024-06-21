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

%% Create ROS Node
% clear; clc

Matlab = ros2node("/Matlab");

LidarPub = ros2publisher(Matlab,"/Avia","sensor_msgs/PointCloud2");
LidarMsg = ros2message(LidarPub);

objSub = ros2subscriber(Matlab,"/objDetectionInfo","vision_msgs/Detection3DArray");
%%

% Connect udp data communication
AviaUDP = udpport("byte","LocalPort",56001,"ByteOrder","little-endian");

%% 


player = pcplayer([0 10],[-5 5],[-2 5]);

frameCount = 0;
reset_flag = single(0);

xyzPointsBuffer = [];
xyzIntensityBuffer = [];

numPacket = 30; 

Distances = []; 


tic
while 1

    % Read 1 packet
    packet = single(read(AviaUDP,1362))';

    [xyzCoords,xyzIntensity,isValid] = Avia_parsing_single(packet,reset_flag);
    
    if isValid

        xyzPointsBuffer = vertcat(xyzPointsBuffer,xyzCoords);
        xyzIntensityBuffer = vertcat(xyzIntensityBuffer,xyzIntensity);

        if frameCount > 10

            xyzPointsBuffer = xyzPointsBuffer(96*numPacket+1:end,:);
            xyzIntensityBuffer = xyzIntensityBuffer(96*numPacket+1:end,:);

            ptCloud = pointCloud(xyzPointsBuffer,"Intensity",xyzIntensityBuffer);
            
            LidarMsg = rosWriteXYZ(LidarMsg,ptCloud.Location);
            LidarMsg = rosWriteIntensity(LidarMsg,ptCloud.Intensity);
            
            send(LidarPub,LidarMsg);
            
            receive(objSub);
            
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