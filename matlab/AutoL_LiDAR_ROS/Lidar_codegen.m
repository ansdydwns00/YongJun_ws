function points = Lidar_codegen() %#codegen

    % [x,y,z] 좌표 값 사전 할당(178 packet * 128 points) -> 코드 속도를 위해 사전 할당
    points = zeros(22784,3);
    k = 1;
    packetData = zeros(1,1330);

    for ii = 1:1000
        
        % 패킷 1개 parsing
        % Payload Header와 Payload로 분할(UDP Header는 잘려서 수신 받음)
        payload_header = packetData(:,1:28);   % [1 x 28]
        payload = packetData(:,29:end-6);      % [1 x 1296] ( Timestamp, ProductID 제외)  
        
        %------------------------------------payload_header------------------------------------%
       
        top_bottom_flag = uint8(payload_header(:,5));
    
        dataType = uint32(payload_header(:,6:9));   % A5 = 165, B3 = 179, C2 = 194, 01 = 1, AA(종료) = 170, CC(에러) = 204, 프레임이 종료인지 아닌지는 6번째 열을 확인 



        % 패킷 1개에 해당하는 pointCloud 검출 
        % 하부 프레임
        elevation_angle_down = [-4.84375,-4.21875,-3.59375,-2.96875,-2.34375,-1.71875,-1.09375,-0.46875,0.15625,0.78125,1.40625,2.03125,2.65625,3.28125,3.90625,4.53125];
        
        % 상부 프레임
        elevation_angle_up = [-4.53125,-3.90625,-3.28125,-2.65625,-2.03125,-1.40625,-0.78125,-0.15625,0.46875,1.09375,1.71875,2.34375,2.96875,3.59375,4.21875,4.84375];
        
        % 해당 프레임이 상부 프레임인지 하부 프레임인지 확인
        if top_bottom_flag == 0 
            elevation = elevation_angle_down;
        else
            elevation = elevation_angle_up;
        end
        
        % 정밀 방위각 계산을 위해 방위각 offset을 적용
        precision_azimuth = [-0.038388791, -0.104694693,-0.00523584, -0.071541742];
        
    
        % 방위각에 대한 값, 8개 (3 echo mode)
        azimuth_data = zeros(1,8);
        for i = 0:3:21  
            azimuth = [payload(i*54+3) payload(i*54+4) payload(i*54+5) payload(i*54+6)];
            delta = (2^0)*azimuth(1) + (2^8)*azimuth(2) + (2^16)*azimuth(3) + (2^24)*azimuth(4);
    
            if delta > intmax('int32')
                azimuth = ((2^0)*azimuth(1) + (2^8)*azimuth(2) - 65535)/1000;
            else
                azimuth = ((2^0)*azimuth(1) + (2^8)*azimuth(2) + (2^16)*azimuth(3) + (2^24)*azimuth(4))/1000;
            end
            azimuth_data(i/3+1) = azimuth; 
        end
        
    
        % 방위각에 대한 ToF, 값 [8*16]
        ToF = zeros(1,128);
        for i = 0:7
            for j = 0:3:45
                ToF(i*16+j/3+1) = ((2^0)*payload(i*54*3+7+j) + (2^8)*payload(i*54*3+8+j))/256;
            end
        end
    
        % [16 x 8] 재배열
        ToF = reshape(ToF,16,[]);   
        
        % [x,y,z] 좌표값 구하기
        xyzPoints = zeros(128,3);
        for i = 1:8
            for j = 0:15
                z = ToF(j+1,i) * sin(deg2rad(elevation(j+1)));
                xy = ToF(j+1,i) * cos(deg2rad(elevation(j+1)));
    
                x = xy * cos(deg2rad(azimuth_data(i) + precision_azimuth(floor(j/4)+1)));
                y = xy * sin(deg2rad(azimuth_data(i) + precision_azimuth(floor(j/4)+1)));
                
                xyzPoints((i-1)*16+j+1,:) = [x y z];
            end
        end
        
        
        % 패킷 속 xyz 좌표값 저장
        points((k-1)*128+1:(k-1)*128+128,:) = xyzPoints;
        k = k + 1;
        
        % 1 프레임 종료 확인(하부 프레임 89개 다음 상부 프레임 89개 수신 받으면 180 패킷 == 1 프레임); 
        if (all(top_bottom_flag == 1) && all(dataType(:,1) == 170))
 
           return;
        end   
    end
end