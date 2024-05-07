%% Lidar Connection
clear; clc
udpObj = udpport("byte","LocalPort",5001,"ByteOrder","little-endian");


%% Packet Data parsing 

% point cloud viewer 생성
player = pcplayer([0 10],[-10 10],[-4 4]);

% [x,y,z] 좌표 값 사전 할당(178 packet * 128 points) -> 코드 속도를 위해 사전 할당
points = zeros(22784,3);

% fps 확인 위한 parameter
i = 1;
frameCount = 0;

% 입력 buffer 제거
flush(udpObj,"input")

tic
while true
    % tic
    %--------------------------------------------------------------------%
    %--------------------------------LIDAR-------------------------------%
    %--------------------------------------------------------------------%
    % 패킷 1개 불러오기      
    packetData = read(udpObj,1330);
    
    % 패킷 1개 parsing
    [payload,top_bottom_flag,dataType] = packet_extract(packetData);
    
    % 패킷 1개에 해당하는 pointCloud 검출 
    xyzPoints = ptCloud_extract(payload,top_bottom_flag);
    
    
    % 패킷 속 xyz 좌표값 저장
    points((i-1)*128+1:(i-1)*128+128,:) = xyzPoints;
    i = i + 1;
    
    % 1 프레임 종료 확인(하부 프레임 89개 다음 상부 프레임 89개 수신 받으면 180 패킷 == 1 프레임 == 1 FoV); 
    if (top_bottom_flag == 1 && dataType(:,1) == 170)
        
        % [x,y,z] -> point cloud 생성
        ptCloud = pointCloud(points);
              
        % pcplayer에 ptcloud disp
        view(player,ptCloud) 

        % parameter 초기화
        i = 1;
        points = zeros(22784,3);
        
        % fps disp 
        frameCount = frameCount + 1;
        elapsedTime = toc;
        frameRate = frameCount / elapsedTime;
        fprintf("Rendering rate: %f hz\n",frameRate);
        % toc
    end   
end
