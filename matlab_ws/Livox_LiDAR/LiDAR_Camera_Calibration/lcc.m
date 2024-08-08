clear; clc

% rosbag 객체 생성
calib_bag = ros2bagreader("/home/aiv/lcc_640");

%ros lidar, camera 데이터 읽기
image_bag = select(calib_bag,"Topic","/camera/camera/color/image_raw/compressed");
ptCld_bag = select(calib_bag,"Topic","/livox/lidar");


image_msg = readMessages(image_bag);
ptCld_msg = readMessages(ptCld_bag);


ts1 = timetable(image_bag);
ts2 = timetable(ptCld_bag);
t1 = (ts1.Time)*50;
t2 = (ts2.Time)*50;

%% 

k = 1;
if size(t2,1) > size(t1,1)
    for i = 1:size(t1,1)
        [val,indx] = min(abs(t1(i) - t2));
        if val <= 0.1
            idx(k,:) = [i indx];
            k = k + 1;
        end
    end
else
    for i = 1:size(t2,1)
        [val,indx] = min(abs(t2(i) - t1));
        if val <= 0.1
    
            idx(k,:) = [indx i];
            k = k + 1;
        end
    end
end

pcFilesPath = fullfile(tempdir,'ptCld_640x480');
imageFilesPath = fullfile(tempdir,'img_640x480');

if ~exist(imageFilesPath,'dir')
    mkdir(imageFilesPath);
end

if ~exist(pcFilesPath,'dir')
    mkdir(pcFilesPath);
end

%% 

for i = 1:10:length(idx)

    I = rosReadImage(image_msg{idx(i,1)});
    pc = pointCloud(rosReadXYZ(ptCld_msg{idx(i,2)}),"Intensity",rosReadField(ptCld_msg{idx(i,2)},'intensity'));
    
    n_strPadded = sprintf('%06d',i);
    
    pcFileName = strcat(pcFilesPath,'/',n_strPadded,'.pcd');
    imageFileName = strcat(imageFilesPath,'/',n_strPadded,'.png');
    
    imwrite(I, imageFileName);
    pcwrite(pc, pcFileName);
end

%% 

checkerSize=92; % 체크박스의 전체 사이즈 / 체크무늬 패턴의 수 , 1000(1m) / 8, 체크박스 1개 파라미터, mm단위로 입력한다.
padding=[0 0 0 0];

lidarCameraCalibrator(imageFilesPath, pcFilesPath, checkerSize, padding)
%% 
cameraCalibrator(imageFilesPath,92,"millimeters")


