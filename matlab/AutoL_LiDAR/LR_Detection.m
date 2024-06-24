%% Lidar Connection

% clear workspace
clear; clc

% Create udp communication object
udpObj = udpport("byte","LocalPort",5001,"ByteOrder","little-endian");

% Load pointPillar Model
load("detector.mat");
%% Initialize parameters

% ---------------------------------------------------------------------------
%                              Parameter Initialize 
% ---------------------------------------------------------------------------

frameCount = 0;
Distances = [];                                    

roi = [5, 10, -2, 2, -2, 2];                    % ROI 설정
clusterThreshold = 0.4;                         % Cluster distance


reset_flag = single(0);                         % Reset persistent variable



% ---------------------------------------------------------------------------
%                              Create point cloud viewer 
% ---------------------------------------------------------------------------
player = pcplayer([0 10],[-5 5],[-2 2]);


% Remove input buffer
flush(udpObj,"input")

% detectTime = tic;

tic
while true

    % Load 1 packet [1 x 1330]   
    packetData = single(read(udpObj,1330))';   
    
    % Use mex file to verify generated c code
    [xyzCoords,xyzIntensity,isValid] = AutoL_parsing_Intensity_mex(packetData,reset_flag);
    
    % Check end frame  
    if isValid

        % Create point cloud object
        ptCloud = pointCloud(xyzCoords,"Intensity",xyzIntensity);
        
        % if toc(detectTime) >= 1
        %     hold(player.Axes,'off');
        %     [bboxes, score, labels] = detect(detector,ptCloud,"ExecutionEnvironment","gpu","Threshold",0.2);
        %     detectTime = tic; % Reset the timer
        %     showShape('cuboid',bboxes,'Parent',player.Axes,'Opacity',0.2,'Color','red','LineWidth',0.5);
        % end
 
        % Object Detection
        [bboxes, ~, ~] = detect(detector,ptCloud,"ExecutionEnvironment","gpu","Threshold",0.2);

        % Compute Object Distance
        Distances = LR_computeDistance(ptCloud,bboxes);

        % Delete 0 distance
        idx = find(Distances);
        Distances = Distances(idx,:);
        bboxes = bboxes(idx,:);

        % match distance & label
        showShape('cuboid',bboxes,'Parent',player.Axes,'Opacity',0.2,'Color','red','LineWidth',0.5,'Label',Distances);

        % Display ptCloud on pcplayer
        view(player,ptCloud) 
        
        % Display Rendering rate 
        frameCount = frameCount + 1;
        elapsedTime = toc;
        frameRate = frameCount / elapsedTime;
        fprintf("Rendering rate: %f hz\n",frameRate);

        % Remove buffer 
        flush(udpObj)
    end  
    reset_flag = single(1);
end


