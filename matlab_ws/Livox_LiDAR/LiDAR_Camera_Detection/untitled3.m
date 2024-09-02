%% ROS Node 
clear; clc

global g_id
global g_cls
global g_bboxes
global g_img

g_id = {};
g_cls = {};
g_bboxes = [];
g_img = [];


% Create a node for connection between MATLAB and ROS2
Node = ros2node("/IVL");

% Create Subscribe Node

sub.Cam = ros2subscriber(Node,'/camera/camera/color/image_raw','sensor_msgs/Image',@helperCallbackImage);
% sub.Yolo_img = ros2subscriber(Node,"/yolo/image","sensor_msgs/Image");
sub.Yolo_track = ros2subscriber(Node,"/yolo/tracking","yolov8_msgs/DetectionArray",@helperCallbackYolo);



%%
kalmanFilter = []; 
isTrackInitialized = false;

isobjectDetected = size(g_bboxes,1) > 0;



while 1
if ~ isTrackInitialized
    if isobjectDetected
        kalmanFilter = configureKalmanFilter("ConstantVelocity",[x_ctr,y_ctr],[1 1]*1e5,[25, 10],25);
        isTrackInitialized = true;
    end
    label = '';
    circle = zeros(0,3);
else
    if isobjectDetected
        predict(kalmanFilter);
        trackedLocation = correct(kalmanFilter,[x_ctr,y_ctr]);
        label = 'Corrected';
    else
        trackedLocation = predict(kalmanFilter);
        label = 'Predicted';
    end
    circle = [trackedLocation,5];
end
end

