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

%% Initialize ROS Node

Node = ros2node("/MATLAB");

LidarPub = ros2publisher(Node,"/LiDAR/Avia","sensor_msgs/PointCloud2");
LidarMsg = ros2message(LidarPub);
LidarMsg.header.frame_id = 'map';

%% Visualization using 250*n messages

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
    [xyzCoords,xyzIntensity,isValid] = Avia_parsing(packet,reset_flag);

    if isValid
        
        % Display n message
        xyzPointsBuffer = vertcat(xyzPointsBuffer,xyzCoords);
        xyzIntensityBuffer = vertcat(xyzIntensityBuffer,xyzIntensity);
        
        if mod(frameCount,frame_num) == 0

            ptCloud = pointCloud(xyzPointsBuffer,"Intensity",xyzIntensityBuffer);
            
            % Sending point cloud msg to ROS2 
            LidarMsg = rosWriteXYZ(LidarMsg,(ptCloud.Location));
            LidarMsg = rosWriteIntensity(LidarMsg,(ptCloud.Intensity));
            send(LidarPub,LidarMsg);
            
            xyzPointsBuffer = [];
            xyzIntensityBuffer = [];
        end
        
        % Display Rendering rate 
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