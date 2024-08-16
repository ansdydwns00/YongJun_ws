%% ROS Node 
clear; clc

global g_id
global g_cls
global g_bboxes
% global img

% img = [];
g_bboxes = [];
g_id = {};
g_cls = {};

% Create a node for connection between MATLAB and ROS2
Node = ros2node("/IVL");

% Create Subscribe Node
% sub.LiDAR = ros2subscriber(Node,'/livox/lidar','sensor_msgs/PointCloud2');
sub.Cam = ros2subscriber(Node,'/camera/camera/color/image_raw','sensor_msgs/Image');
sub.Yolo_img = ros2subscriber(Node,"/yolo/image","sensor_msgs/Image");
sub.Yolo_track = ros2subscriber(Node,"/yolo/tracking","yolov8_msgs/DetectionArray",@helperCallbackYolo);

% % Create Publish Node
% pub.LiDAR = ros2publisher(Node,"LiDAR/Avia","sensor_msgs/PointCloud2");
% pub.detections = ros2publisher(Node,'/clusters_marker', 'visualization_msgs/MarkerArray');
% 
% % Create Publish Message
% msg_LiDAR = ros2message(pub.LiDAR);
% msg_LiDAR.header.frame_id = 'map';

%% 


vPlayer = vision.DeployableVideoPlayer;
runLoop = true;
fps = 0;


cls = [];
ids = [];
opticFlow = opticalFlowHS;

while runLoop
    tic;

    bbox = [];
    bboxes = [];
    label = [];
    labels = [];

    % raw img subscribe
    image_received = receive(sub.Cam);
    yolo_test_img = rosReadImage(image_received);
    gray = rgb2gray(yolo_test_img);
    flow = estimateFlow(opticFlow,gray);
    
    l_bboxes = g_bboxes;
    l_id = g_id';

    for idx = 1:size(l_bboxes,1)
        % bounding box info
        x = l_bboxes(idx,1);
        y = l_bboxes(idx,2);
        w = l_bboxes(idx,3);
        h = l_bboxes(idx,4);

        bbox = [x, y, w, h];
        label = l_id(idx,1);
        

        bboxes = [bboxes; bbox];
        labels = [labels; str2double(label)];
    end
    
    yolo_img = insertText(yolo_test_img,[1,1],sprintf("FPS %2.2f",fps),"FontSize",24,"BoxColor","white");
    yolo_img = insertObjectAnnotation(yolo_img,"rectangle",bboxes,labels);    
    if ~isempty(g_bboxes)
        yolo_img = insertShape(yolo_img,"filled-circle",[g_bboxes(:,1)+g_bboxes(:,3)/2, g_bboxes(:,2)+g_bboxes(:,4)/2,repmat(5,size(g_bboxes,1),1)],"ShapeColor","red");
    end
    vPlayer.step(yolo_img)
    % imshow(yolo_img)
    % hold on
    % plot(flow,'DecimationFactor',[5 5],'ScaleFactor',30);
    runLoop = isOpen(vPlayer);

    time = toc;
    fps = 0.9 * fps + 0.1 * (1 / time);
end

