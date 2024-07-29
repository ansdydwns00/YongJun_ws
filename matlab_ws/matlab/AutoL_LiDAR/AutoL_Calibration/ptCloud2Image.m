%% Lidar Connection

% clear workspace
clear; clc

% Create udp communication object
AutoL_UDP = udpport("byte","LocalPort",5001,"ByteOrder","little-endian");

%% ROS Connection

Matlab = ros2node("/MatlabNode");
ImageSub = ros2subscriber(Matlab,'/camera1/image_raw','sensor_msgs/Image');

% calibration file load
load("Calibration.mat");                % Calibration file 

LidarToCam = tform;                     % Lidar coord -> Cam coord
CamToLidar = invert(tform);             % Cam coord -> Lidar coord

%% Packet Data parsing 


% Set values for frame count 
frameCount = 1;

% Flag for first Run
reset_flag = single(0);

% Remove input buffer
flush(AutoL_UDP)

figure
while true
    
   % Load 1 packet [1 x 1330]   
    packetData = single(read(AutoL_UDP,1330))';   
    
    % Use mex file to verify generated c code
    [xyzCoords,xyzIntensity,isValid] = AutoL_parsing_Intensity_mex(packetData,reset_flag);
    
    
    % 1 프레임 종료 확인(하부 프레임 89개 다음 상부 프레임 89개 수신 받으면 178 패킷 == 1 프레임); 
    if isValid
        
        % [x,y,z] coordinates to point cloud
        ptCloud = pointCloud(xyzCoords,"Intensity",xyzIntensity);
        
        % Create Colormap of Pointcloud
        heights = ptCloud.Location(:,1);
        colormap jet;
        colorRange = jet(256);
        
        minHeight = min(heights); % 최소 높이 값
        maxHeight = max(heights); % 최대 높이 값
        normalizedHeights = (heights - minHeight) / (maxHeight - minHeight); % 높이 값을 0과 1 사이로 정규화
        colorIndices = ceil(normalizedHeights * 255) + 1;
        colorIndices(colorIndices > 256) = 256;
        colorIndices(colorIndices < 1) = 1;
        pointColors = colorRange(colorIndices, :);
       
        % subscribe image msg
        imgMsg = receive(ImageSub);
        img = rosReadImage(imgMsg);

        [imPts,idx] = projectLidarPointsOnImage(ptCloud,cameraParams.Intrinsics,LidarToCam);
        imshow(img);
        hold on
        scatter(imPts(:,1), imPts(:,2), 2, pointColors(idx), 'filled');
        hold off
        
        frameCount = frameCount + 1;
        flush(AutoL_UDP)
    end    
    reset_flag = single(1);  
end
