%% Connect AVIA UDP Communication
clear; clc
% Connect udp data communication
Avia_UDP = udpport("datagram","LocalPort",56001);

%% LiDAR/Camera Calibration .mat 


load('lidarcal_1920.mat')

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

% % 기존 해상도 (예: 640x480)
% originalWidth = 640;
% originalHeight = 480;
% 
% % 새로운 해상도 (예: 1280x720)
% newWidth = 1280;
% newHeight = 480;
% 
% % 스케일링 팩터 계산
% scaleX = newWidth / originalWidth;
% scaleY = newHeight / originalHeight;
% 
% % 기존 카메라 매트릭스 (K)
% % (fx, fy: 초점 거리, cx, cy: 중심점)
% fx = cameraParams.K(1,1);
% fy = cameraParams.K(2,2); 
% cx = cameraParams.K(1,3);
% cy = cameraParams.K(2,3);
% K = cameraParams.K;
% 
% % 새로운 해상도에 맞게 조정된 카메라 매트릭스 (K')
% K_new = [scaleX * fx, 0, scaleX * cx;
%          0, scaleY * fy, scaleY * cy;
%          0, 0, 1];
% 
% focalLength = [K_new(1,1) K_new(2,2)];
% principalPoint = [K_new(1,3) K_new(2,3)];
% imageSize = [1280 720];
% 
% new_camParams = cameraIntrinsics(focalLength,principalPoint,imageSize,"RadialDistortion",camParams.Intrinsics.RadialDistortion);


% Set values for frame count 
frameCount = 1;

% Set values for n frames
frame_num = 6;

% Flag for first Run
reset_flag = single(0);

% Parameter for n frame buffer
xyzPointsBuffer = [];
xyzIntensityBuffer = [];

% ROI 설정
roi = [0, 10, -4, 4, -1, 5];     

% Downsample
gridStep = 0.1;


flush(Avia_UDP,"input")

while true
    
    % Read 1 packet
    packet = read(Avia_UDP,1,"uint8");

    if size(packet.Data,2) == 1362 
        [xyzCoords,xyzIntensity,isValid] = Avia_parsing_mex(single((packet.Data)'),reset_flag);
    end
    
    
    if isValid
        
        % Display n message
        xyzPointsBuffer = vertcat(xyzPointsBuffer,xyzCoords);
        xyzIntensityBuffer = vertcat(xyzIntensityBuffer,xyzIntensity);
        
        if mod(frameCount,frame_num) == 0

            ptCloud = pointCloud(xyzPointsBuffer,"Intensity",xyzIntensityBuffer);

            % ptCld_ps = helperPtCldProcessing(ptCloud,roi,gridStep);   

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
    
            [imPts,idx] = projectLidarPointsOnImage(ptCloud,camParams.Intrinsics,tform);
            imshow(img);
            hold on
            scatter(imPts(:,1), imPts(:,2),3, pointColors(idx), 'filled');
            hold off
    
            xyzPointsBuffer = [];
            xyzIntensityBuffer = [];
        
        end

       frameCount = frameCount + 1;
       flush(Avia_UDP)
    end    
    reset_flag = single(1);
end

