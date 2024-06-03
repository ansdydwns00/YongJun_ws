clear; clc

matlab = ros2node("/Matlab");

sub = ros2subscriber(matlab,"/livox/lidar","sensor_msgs/PointCloud2");


%% 


player = pcplayer([0 11],[-10 10],[-3 5]);
frameCount = 0;
xyzPointsBuffer = [];

tic
while 1

    xyzPointsMsg = receive(sub);

    xyzpoints = rosReadXYZ(xyzPointsMsg);
    
    xyzPointsBuffer = [xyzPointsBuffer; xyzpoints];
    
    if size(xyzPointsBuffer,1) >= 46000
        ptCloud = pointCloud(xyzpoints);
        toc
        Display ptCloud on pcplayer
        view(player,ptCloud) 
    
        Display Rendering rate 
        frameCount = frameCount + 1;
        elapsedTime = toc;
        frameRate = frameCount / elapsedTime;
        fprintf("Rendering rate: %f hz\n",frameRate);

        xyzPointsBuffer = [];
    end
end

