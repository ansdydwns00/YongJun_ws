%% Connect AVIA UDP Communication
clear; clc
% Connect udp data communication
Avia_UDP = udpport("byte","LocalPort",56001,"ByteOrder","little-endian");

%% LiDAR/Camera Calibration .mat 


load("Avia_realsense_Calib.mat");

% 라이다 카메라 칼리브레이션 파일
lidarToCam = tform;              
camToLidar = invert(tform);

% 카메라 칼리브레이션 파일
camParams = cameraParams;     

%% Node 

main = ros2node("/IVL");

% lidarSub = ros2subscriber(Matlab,'/livox/lidar','sensor_msgs/PointCloud2');
imageSub = ros2subscriber(main,'/camera/camera/color/image_raw','sensor_msgs/Image');

%% Packet Data parsing 


% Set values for frame count 
frameCount = 1;

% Set values for n frames
frame_num = 6;

% Flag for first Run
reset_flag = single(0);

% Parameter for n frame buffer
xyzPointsBuffer = [];
xyzIntensityBuffer = [];

flush(Avia_UDP,"input")

while true
    
    % Read 1 packet
    packet = single(read(Avia_UDP,1362))';

    % [xyzCoords,xyzIntensity,isValid] = Avia_parsing(packet,reset_flag);
    [xyzCoords,xyzIntensity,isValid] = Avia_parsing_mex(packet,reset_flag);
    
    
    if isValid
        
        % Display n message
        xyzPointsBuffer = vertcat(xyzPointsBuffer,xyzCoords);
        xyzIntensityBuffer = vertcat(xyzIntensityBuffer,xyzIntensity);
        
        if mod(frameCount,frame_num) == 0

            ptCloud = pointCloud(xyzPointsBuffer,"Intensity",xyzIntensityBuffer);
                       
            % Display ptCloud 
            % view(player,ptCloud);
            
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
            imgMsg = receive(imageSub);
            img = rosReadImage(imgMsg);
    
            [imPts,idx] = projectLidarPointsOnImage(ptCloud,cameraParams.Intrinsics,tform);
            imshow(img);
            hold on
            scatter(imPts(:,1), imPts(:,2), 7, pointColors(idx), 'filled');
            hold off
    
            xyzPointsBuffer = [];
            xyzIntensityBuffer = [];
        
        end

       frameCount = frameCount + 1;
       flush(Avia_UDP)
    end    
    reset_flag = single(1);
end

