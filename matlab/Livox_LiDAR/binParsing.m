%% ptCloud to bin file

fld = fopen("test2.bin",'w');

xyzi_point = [ptCloud.Location normalize(ptCloud.Intensity)]';

fwrite(fld,xyzi_point,'single');
fclose(fld);

a = fopen('test2.bin');
b = single(fread(a,[4 inf],'single')');

k = pointCloud(b(:,1:3),"Intensity",b(:,4));
pcshow(k)

%% 


% 특정 경로의 파일 목록 가져오기
folder_path = '/home/aiv/YongJun_py_ws/rawData/kitti/testing/velodyne';
file_list = dir(fullfile(folder_path, '*.bin'));

player = pcplayer([-100 100],[-100 100],[-50 50]);

% 각 bin 파일 처리하기
for i = 2:length(file_list)
    % 현재 파일 경로 구성
    current_dir = fopen(fullfile(folder_path, file_list(i).name));
    
    current_file = single(fread(current_dir,[4 inf],'single')');
    
    ptCloud = pointCloud(current_file(:,1:3),"Intensity",current_file(:,4));
    
    % 포인트 클라우드 플롯
    view(player,ptCloud);
end

%% 

v1 = fopen('test2.bin');
v2 = fopen("000008.bin");

u1 = single(fread(v1,[4 inf],'single')');
u2 = single(fread(v2,[4 inf],'single')');
