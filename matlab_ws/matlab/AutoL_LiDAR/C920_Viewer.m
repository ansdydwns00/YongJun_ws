clear; clc

mainNode = ros2node("/mainNode");

ImageSub = ros2subscriber(mainNode,"/camera1/image_raw","sensor_msgs/Image");

%% 
% VideoWriter 객체 생성 및 설정

vPlayer = vision.DeployableVideoPlayer;
runLoop = true;

fps = 0;

while runLoop
    tic;

    image_received = receive(ImageSub);

    img = rosReadImage(image_received);
    img = insertText(img,[1,1],sprintf("FPS %2.2f",fps),"FontSize",24,"BoxColor","white");

    time = toc;
    fps = 0.9 * fps + 0.1 * (1 / time);
    
    vPlayer.step(img)
    runLoop = isOpen(vPlayer);
end
