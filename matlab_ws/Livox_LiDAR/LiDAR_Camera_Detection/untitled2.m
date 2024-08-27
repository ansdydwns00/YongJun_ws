
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

sub.Cam = ros2subscriber(Node,'/camera/camera/color/image_raw','sensor_msgs/Image',@helperCallbackImage,'Durability','transientlocal');

sub.Yolo = ros2subscriber(Node,"/yolo_detections","vision_msgs/Detection3DArray",@helperCallbackYolocpp,"Reliability",'besteffort');

%% 

vPlayer = vision.DeployableVideoPlayer;



% Object detection
l_bboxes = g_bboxes;
l_id = g_id;
l_cls = g_cls;



while true
    l_img = insertObjectAnnotation(g_img,"rectangle",g_bboxes,strcat({'ID:'},string(g_id)', {', Class:'},string(g_cls)'));
     % l_img = insertObjectAnnotation(g_img,"rectangle",g_bboxes,string(g_id)');
    if ~isempty(g_bboxes)
        l_img = insertShape(l_img,"filled-circle",[g_bboxes(:,1)+g_bboxes(:,3)/2, g_bboxes(:,2)+g_bboxes(:,4)/2,repmat(5,size(g_bboxes,1),1)],"ShapeColor","red");
    end
    
    vPlayer.step(l_img)
    pause(0.01)
end