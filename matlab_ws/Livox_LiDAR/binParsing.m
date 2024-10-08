%% ptCloud to bin file

fld = fopen("ivl_nds.bin",'w');

xyzi_point = [ptCloud_ps.Location ptCloud_ps.Intensity]';

fwrite(fld,xyzi_point,'single');
fclose(fld);
%% 

a = fopen('ttest.bin');
b = single(fread(a,[4 inf],'single')');

k = pointCloud(b(:,1:3),"Intensity",b(:,4));
pcshow(k)

%% 


% 특정 경로의 파일 목록 가져오기
folder_path = '/home/aiv/YongJun_ws/matlab_ws/Livox_LiDAR/jj';
file_list = dir(fullfile(folder_path, '*.bin'));
player = pcplayer([0 60],[-10 10],[-2 4],"MarkerSize",10);


% 각 bin 파일 처리하기
for i = 1:length(file_list)
    % 현재 파일 경로 구성
    current_dir = fopen(fullfile(folder_path, file_list(i).name));
    
    current_file = single(fread(current_dir,[4 inf],'single')');
    % f = factor(length(current_file));
    ptCloud = pointCloud(current_file(:,1:3),"Intensity",current_file(:,4));
    
    msg_LiDAR = ros2message(pub.LiDAR);
    msg_LiDAR.header.frame_id = 'map';
    msg_LiDAR = rosWriteXYZ(msg_LiDAR,(ptCloud_ps.Location));
    msg_LiDAR = rosWriteIntensity(msg_LiDAR,(ptCloud_ps.Intensity));
    send(pub.LiDAR,msg_LiDAR);

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



