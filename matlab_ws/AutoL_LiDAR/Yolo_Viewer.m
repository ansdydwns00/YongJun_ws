clear; clc

% % Custom Ros Msg Build
% msg_path =  '/home/yong/YongJun_ws/src/YOLO/Yolov8';
% ros2genmsg(msg_path)

mainNode = ros2node("/mainNode");

yoloImageSub = ros2subscriber(mainNode,"/yolo/dbg_image","sensor_msgs/Image");
yoloBboxSub = ros2subscriber(mainNode,"/yolo/detections","yolov8_msgs/DetectionArray");
yoloTrackSub = ros2subscriber(mainNode,"/yolo/tracking","yolov8_msgs/DetectionArray");

% ImageSub = ros2subscriber(mainNode,"/camera1/image_raw","sensor_msgs/Image");
%% 

vPlayer = vision.DeployableVideoPlayer;
runLoop = true;

fps = 0;

while runLoop
    tic;

    bboxes = [];

    % Detection img subscribe
    image_received = receive(yoloImageSub);
    yolo_img = rosReadImage(image_received);

    % Detection info subscribe
    % yolo_info = receive(yoloBboxSub);
    yolo_info = receive(yoloTrackSub);

    % bounding box info
    for idx = 1:length(yolo_info.detections)
        x = yolo_info.detections(idx).bbox.center.position.x;
        y = yolo_info.detections(idx).bbox.center.position.y;
        w = yolo_info.detections(idx).bbox.size.x;
        h = yolo_info.detections(idx).bbox.size.y;
        
        bbox = [x-w/2, y-h/2, w, h];
        bboxes = [bboxes; bbox];
    end

    yolo_img = insertText(yolo_img,[1,1],sprintf("FPS %2.2f",fps),"FontSize",24,"BoxColor","white");

    time = toc;
    fps = 0.9 * fps + 0.1 * (1 / time);

    vPlayer.step(yolo_img)
    runLoop = isOpen(vPlayer);
end

%% YOLO Detection TEST

vPlayer = vision.DeployableVideoPlayer;
runLoop = true;
fps = 0;


cls = [];
ids = [];

while runLoop
    tic;

    bbox = [];
    bboxes = [];
    label = [];
    labels = [];

    % raw img subscribe
    image_received = receive(ImageSub);
    yolo_test_img = rosReadImage(image_received);

    % Detection info subscribe
    % yolo_info = receive(yoloBboxSub);
    yolo_tr_info = receive(yoloTrackSub);

    for idx = 1:length(yolo_tr_info.detections)
        % bounding box info
        x = yolo_tr_info.detections(idx).bbox.center.position.x;
        y = yolo_tr_info.detections(idx).bbox.center.position.y;
        w = yolo_tr_info.detections(idx).bbox.size.x;
        h = yolo_tr_info.detections(idx).bbox.size.y;

        bbox = [x-w/2, y-h/2, w, h];
        label = yolo_tr_info.detections(idx).id;
        

        bboxes = [bboxes; bbox];
        labels = [labels str2double(label)];
        
    end
    

    yolo_img = insertText(yolo_test_img,[1,1],sprintf("FPS %2.2f",fps),"FontSize",24,"BoxColor","white");
    yolo_img = insertObjectAnnotation(yolo_img,"rectangle",bboxes,labels);


    time = toc;
    fps = 0.9 * fps + 0.1 * (1 / time);

    vPlayer.step(yolo_img)
    runLoop = isOpen(vPlayer);
end