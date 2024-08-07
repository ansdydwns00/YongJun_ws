%% 

% 기존 해상도 (예: 640x480)
originalWidth = 640;
originalHeight = 480;

% 새로운 해상도 (예: 1280x720)
newWidth = 1920;
newHeight = 1080;

% 스케일링 팩터 계산
scaleX = newWidth / originalWidth;
scaleY = newHeight / originalHeight;

% 기존 카메라 매트릭스 (K)
% (fx, fy: 초점 거리, cx, cy: 중심점)
fx = cameraParams.K(1,1);
fy = cameraParams.K(2,2); 
cx = cameraParams.K(1,3);
cy = cameraParams.K(2,3);
K = cameraParams.K;

% 새로운 해상도에 맞게 조정된 카메라 매트릭스 (K')
K_new = [scaleX * fx, 0, scaleX * cx;
         0, scaleY * fy, scaleY * cy;
         0, 0, 1];

focalLength = [K_new(2,2) K_new(1,1)];
principalPoint = [K_new(1,3) K_new(2,3)];
imageSize = [1080 1920];

new_camParams = cameraIntrinsics(focalLength,principalPoint,imageSize,"RadialDistortion",camParams.Intrinsics.RadialDistortion);