% original

figure; 
pcshow(ptCloud)

%% 

% frustum

figure; 
ptCloud_frustum = select(ptCloud,frustumIndices{1});
pcshow(ptCloud_frustum)

%% 

% frustum 내에서 euculid 기반 clustering
[labels,numClusters] = pcsegdist(ptCloud_frustum,0.1);
pcshow(ptCloud_frustum.Location,labels)
colormap(hsv(numClusters))

%% 

% clustering 된 값 중 최대 빈도수를 가진 포인트클라우드 데이터만을 plot
values = unique(labels);
counts = histcounts(labels,values);

[~, idx] = max(counts); % 최대 빈도를 가지는 값의 인덱스를 찾음
mostFrequentValue = values(idx); % 가장 빈도가 높은 값

% 논리 배열 생성
logicalArray = labels == mostFrequentValue; % 가장 빈도가 높은 값에 대해서만 1, 나머지는 0

figure;
pcshow(ptCloud_frustum.Location(logicalArray,:,:))

%% 
tmp_location = ptCloud_frustum.Location;
tmp_intensity = ptCloud_frustum.Intensity;
%% 

tmp_location(~logicalArray,:,:) = [];
tmp_intensity(~logicalArray,:) = [];

new_ptCloud = pointCloud(tmp_location,"Intensity",tmp_intensity);

model = pcfitcuboid(new_ptCloud)

