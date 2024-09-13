%% ptCloud to bin file

fld = fopen("ivl_nds.bin",'w');

xyzi_point = [ptCloud_ps.Location ptCloud_ps.Intensity]';

fwrite(fld,xyzi_point,'single');
fclose(fld);
%% 

a = fopen('a.bin');
b = single(fread(a,[4 inf],'single')');

k = pointCloud(b(:,1:3),"Intensity",b(:,4));
pcshow(k)

%% 


% 특정 경로의 파일 목록 가져오기
folder_path = '/home/aiv/YongJun_ws/matlab_ws/Livox_LiDAR/dd';
file_list = dir(fullfile(folder_path, '*.bin'));
player = pcplayer([0 60],[-10 10],[-2 4],"MarkerSize",10);


% 각 bin 파일 처리하기
for i = 1:length(file_list)
    % 현재 파일 경로 구성
    current_dir = fopen(fullfile(folder_path, file_list(i).name));
    
    current_file = single(fread(current_dir,[4 inf],'single')');
    % f = factor(length(current_file));
    ptCloud = pointCloud(current_file(:,1:3),"Intensity",current_file(:,4));
    
    % groundIdx = segmentGroundFromLidarData(ptCloud);
    % ptCloud = select(ptCloud,~groundIdx);

    % % ptCloud to bin file
    % filename = sprintf('%06d.bin',i);
    % 
    % fileID = fopen(filename,'w');
    % 
    % xyzi_point = [ptCloud.Location normalize(ptCloud.Intensity)]';
    % 
    % fwrite(fileID,xyzi_point,'single');
    % fclose(fileID);

    % 포인트 클라우드 플롯
    view(player,ptCloud);
    pause(0.1)
end

%% Load complex-yolo model

load complexYoloModel.mat detector

% xMin = -30.0;     
% xMax = 30.0;      
% yMin = 0.0;      
% yMax = 60.0;      
% zMin = -2.0;     
% zMax = 15.0;  
% 
xMin = 0.0;     
xMax = 100.0;      
yMin = 0.0;      
yMax = 100.0;      
zMin = -50.0;     
zMax = 100.0;

bevHeight = 608;
bevWidth = 608;

gridW = (yMax - yMin)/bevWidth;
gridH = (xMax - xMin)/bevHeight;

gridParams = {{xMin,xMax,yMin,yMax,zMin,zMax},{bevWidth,bevHeight},{gridW,gridH}};
%%
% 특정 경로의 파일 목록 가져오기

% folder_path = '/home/aiv/YongJun_py_ws/rawData/kitti/testing/velodyne_reduced';
folder_path = '/home/aiv/YongJun_ws/matlab/Livox_LiDAR/binFile/avia_low_parking_tower';
file_list = dir(fullfile(folder_path, '*.bin'));

player = pcplayer([0 60],[-15 15],[-2 10],"MarkerSize",10,"ColorSource","Z");
% vPlayer = vision.DeployableVideoPlayer;

% 각 bin 파일 처리하기
for i = 1:length(file_list)
    % 현재 파일 경로 구성
    current_dir = fopen(fullfile(folder_path, file_list(i).name));
    
    current_file = single(fread(current_dir,[4 inf],'single')');
    
    % f = factor(length(current_file));

    ptCloud = pointCloud(reshape(current_file(:,1:3),32,[],3),"Intensity",reshape(current_file(:,4),32,[],1));
    
    % groundIdx = segmentGroundFromLidarData(ptCloud);
    % ptCloud = select(ptCloud,~groundIdx);
    % Object Detection
    % [bboxes, scores, labels] = detect(detector,ptCloud,"ExecutionEnvironment","gpu","Threshold",0.15);
    % 
    % 
    % % Compute Object Distance
    % [Distances,Ids] = LR_computeDistance(ptCloud,bboxes);
    % 
    % % Delete 0 distance
    % idx = find(Distances);
    % 
    % Distances = Distances(idx,:);
    % Ids = Ids(idx,:);
    % bboxes = bboxes(idx,:);
    % scores = scores(idx,:);
    % labels = string(labels(idx,:));
    % 
    % bboxes(:,3) = bboxes(:,3) + 1.2;
    % 
    % 
    % % Match Distances & Labels
    % % showShape('cuboid',bboxes,'Parent',player.Axes,'Opacity',0.2,'Color','red','LineWidth',0.5,...
    % %           'Label',"ID:" + Ids + "," + round(scores,2) + "," + Distances + "m",...
    % %           'LabelOpacity',0.8);
    % showShape('cuboid',bboxes,'Parent',player.Axes,'Opacity',0.2,'Color','red','LineWidth',0.5,...
    %           'Label',"ID:" + Ids + "," + Distances + "m",...
    %           'LabelOpacity',0.8);


    % % Convert point cloud to Bird-Eye-View Image
    % I = ptCldToBEV(ptCloud,gridParams);
    % 
    % % Object Detection
    % [bboxes, scores, labels] = detect(detector,I,"Threshold",0.1);
    % 
    % % Transfer bboxes to cuboid bboxes
    % bboxCuboid = transferBboxToCuboidBbox(bboxes,gridParams,ptCloud); 
    % 
    % % Compute Object Distance
    % [Distances,Ids] = LR_computeDistance(ptCloud,bboxCuboid);
    % 
    % % Delete 0 distance
    % idx = find(Distances);
    % 
    % Distances = Distances(idx,:);
    % Ids = Ids(idx,:);
    % bboxCuboid = bboxCuboid(idx,:);
    % scores = scores(idx,:);
    % labels = string(labels(idx,:));
    % 
    % % Match Distances & Labels
    % showShape('cuboid',bboxCuboid,'Parent',player.Axes,'Opacity',0.2,'Color','red','LineWidth',0.5,...
    %           'Label',"ID:" + Ids + "," + labels + "," + Distances + "m",...
    %           'LabelOpacity',0.8);


   
    view(player,ptCloud);
    % vPlayer.step(I)
    disp(i)
    % pause(0.3)
end
%% 

v1 = fopen('test2.bin');
v2 = fopen("000008.bin");

u1 = single(fread(v1,[4 inf],'single')');
u2 = single(fread(v2,[4 inf],'single')');
