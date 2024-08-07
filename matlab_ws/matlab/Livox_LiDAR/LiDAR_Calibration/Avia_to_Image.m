%% Connect AVIA UDP Communication
clear; clc
% Connect udp data communication
Avia_UDP = udpport("datagram","LocalPort",56001);


%% Node 

main = ros2node("/IVL");

% lidarSub = ros2subscriber(Matlab,'/livox/lidar','sensor_msgs/PointCloud2');
imageSub = ros2subscriber(main,'/camera/camera/color/image_raw','sensor_msgs/Image');

%% LiDAR/Camera(640x480) Calibration .mat  

load('lcc_640_0806.mat')

% 라이다 카메라 칼리브레이션 파일
lidarToCam = tform;
camToLidar = invert(tform);

% 카메라 칼리브레이션 파일
camParams = cameraIntrinsics([6.087285448757669e+02 6.218653857175901e+02],[3.282029259014350e+02 2.472197338367030e+02],[480 640],"RadialDistortion",[0.151165056783003 -0.287374015031260]);

%% LiDAR/Camera(1280x720) Calibration .mat

load('lcc_1280_0806.mat')

% 라이다 카메라 칼리브레이션 파일
lidarToCam = tform;
camToLidar = invert(tform);

% 카메라 칼리브레이션 파일
camParams = cameraIntrinsics([910.6805 927.2654],[652.0424 368.1984],[720 1280],"RadialDistortion",[0.1387 -0.2776]);

%% LiDAR/Camera(1920x1080) Calibration .mat

load('lcc_1920_0806.mat')

% 라이다 카메라 칼리브레이션 파일
lidarToCam = tform;              
camToLidar = invert(tform);

% 카메라 칼리브레이션 파일 
camParams = cameraIntrinsics([1.403085770877809e+03 1.402638897100132e+03],[9.652984572253220e+02 5.525375075192622e+02],[1080 1920],"RadialDistortion",[0.114560927009696 -0.206313798776597]);

%%

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
    
            [imPts,idx] = projectLidarPointsOnImage(ptCloud,camParams,lidarToCam);

            imshow(img);
            hold on
            scatter(imPts(:,1), imPts(:,2),4, pointColors(idx), 'filled');
            hold off
    
            xyzPointsBuffer = [];
            xyzIntensityBuffer = [];
        
        end

       frameCount = frameCount + 1;
       flush(Avia_UDP)
    end    
    reset_flag = single(1);
end

