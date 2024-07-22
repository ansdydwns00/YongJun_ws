%% Timer for Handshake protocol

% Initialize workspace
clear; clc;

% Connect udp handshake communication
udpInit = udpport("datagram","LocalPort",55501);

% Start timer
t = timer;
t.Period = 1;
t.TimerFcn = {@InitProtocol,udpInit};
t.ExecutionMode = 'fixedRate';

start(t)
%%
% Connect AVIA UDP Communication

% clear; clc
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

% 실행시키면 Command Window 창에 값이 출력될텐데 callback 데이터 받는 출력값이니 신경 안쓰셔도 됩니다.
global id_tmp
global cls_tmp
global bboxes_tmp

bboxes_tmp = [];
id_tmp = {};
cls_tmp = {};

main = ros2node("/IVL");

% lidarSub = ros2subscriber(Matlab,'/livox/lidar','sensor_msgs/PointCloud2');
imageSub = ros2subscriber(main,'/camera/camera/color/image_raw','sensor_msgs/Image','History','keeplast','Depth',5);

Yolo.imgSub = ros2subscriber(main,"/yolo/dbg_image","sensor_msgs/Image");
Yolo.trackSub = ros2subscriber(main,"/yolo/tracking","yolov8_msgs/DetectionArray",@helperCallbackYolo);


LidarPub = ros2publisher(main,"/Avia","sensor_msgs/PointCloud2");
LidarMsg = ros2message(LidarPub);
LidarMsg.header.frame_id = 'map';


%% Packet Data parsing 


% Setting point cloud viewer parameter
xmin = 0;  xmax = 5;
ymin = -5; ymax = 5;
zmin = -2; zmax = 2;

player = pcplayer([xmin xmax],[ymin ymax],[zmin zmax],"ColorSource","Z","MarkerSize",4);

% Set values for frame count 
frameCount = 1;

% Set values for n frames
frame_num = 6;

% Flag for first Run
reset_flag = single(0);

% Parameter for n frame buffer
xyzPointsBuffer = [];
xyzIntensityBuffer = [];
bboxesLidar = []; 

% ROI 설정
roi = [5, 10, -5, 5, -1, 5];     

% Cluster distance 
clusterThreshold = 0.1;                         


flush(Avia_UDP)

while true
    
    % Read 1 packet
    packet = single(read(Avia_UDP,1362))';

    [xyzCoords,xyzIntensity,isValid] = Avia_parsing_mex(packet,reset_flag);
    
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

            Bbox =bboxes_tmp;
            Id = id_tmp;
            Cls = cls_tmp;

            % ROI 영역 내 pointCloud 추출
            % indices = findPointsInROI(ptCloud, roi);
            % roiPtCloud = select(ptCloud, indices);
            
            [Distances,bboxesLidar,bboxesUsed] = helpercomputeDistance(Bbox,ptCloud,camToLidar,camParams,clusterThreshold);
            
            
            xyzPointsBuffer = [];
            xyzIntensityBuffer = [];

            % Display ptCloud                     
            view(player,ptCloud);
            helperDeleteCuboid(player.Axes);

            if ~isempty(bboxesLidar) 
                Id(~bboxesUsed') = [];
                Cls(~bboxesUsed') = [];
                % cuboidInfo = helperGetCuboidInfo(bboxesLidar);
                % helperDrawCuboid(player.Axes, cuboidInfo, 'red', Distances, cell2mat(Id));
                showShape('cuboid',bboxesLidar,'Parent',player.Axes,'Opacity',0.2,'Color','red','LineWidth',0.5,'Label',"ID:" + num2str(cell2mat(Id)') + " "+round(Distances,2)+"m",'LabelFontSize',6);
            end
            
        end
       bboxesLidar = []; 
       frameCount = frameCount + 1;
       flush(Avia_UDP)
    end    
    reset_flag = single(1);
end

