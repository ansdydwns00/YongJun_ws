clear; clc

mainNode = ros2node("/mainNode");

ImageSub = ros2subscriber(mainNode,"/camera/camera/color/image_raw","sensor_msgs/Image");

%% 


vPlayer = vision.DeployableVideoPlayer;
runLoop = true;

% Initialize variables for FPS calculation
frameCount = 0;
fps = 0;
startTime = tic;

% Initialize previous time
prevTime = startTime;

while runLoop
    % Receive image from the camera sensor
    image_received = receive(ImageSub);
    img = rosReadImage(image_received);
    img = insertText(img,[1,1],sprintf("FPS %2.2f",fps),"FontSize",24,"BoxColor","white");

    % Display image
    vPlayer.step(img);
    
    % Increment frame count
    frameCount = frameCount + 1;
    
    % Calculate the time difference between frames
    currentTime = toc(startTime);
    timeDiff = currentTime - prevTime;
    
    % Update FPS (only if enough time has passed)
    if timeDiff > 0
        fps = 1 / timeDiff;
    end
    
    % Update previous time
    prevTime = currentTime;
    
    % Check if the video player is still open
    runLoop = isOpen(vPlayer);
end



%% 
% VideoWriter 객체 생성 및 설정

vPlayer = vision.DeployableVideoPlayer;
runLoop = true;
frameCount = 1;

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
