function [VelocityInfo, OrientInfo] = HelperComputeVelocity_ABS_KF(ModelInfo, VehiclePose)
 

    VelocityInfo = zeros(0,1);
    OrientInfo = zeros(0,2);
    
    % VehiclePose는 [x, y, z, roll, pitch, yaw] 형식이라고 가정
    
    vehiclePosition = VehiclePose(1:3);  % 차량의 위치 (사용하지 않음)
    vehicleOrientation = VehiclePose(4:6);  % 차량의 자세 (roll, pitch, yaw)
    
    vx_vehicle = 0;  % 차량의 속도 (전역 좌표계)
    vy_vehicle = 0;
    vz_vehicle = 0;


    roll = VehiclePose(4);
    pitch = VehiclePose(5);
    yaw = VehiclePose(6);
    rotationMatrix = eul2rotm([yaw, pitch, roll], 'ZYX');  % 회전 행렬 생성

    for i = 1:size(ModelInfo.Obj_Vel,1)
    
        % 객체의 상대 속도 (차량 좌표계)
        vx_rel = ModelInfo.Obj_Vel(i,1);
        vy_rel = ModelInfo.Obj_Vel(i,2);
        vz_rel = ModelInfo.Obj_Vel(i,3);
        
        % 객체의 상대 속도를 전역 좌표계로 변환
        velocity_rel = [vx_rel; vy_rel; vz_rel];
        velocity_abs = rotationMatrix * velocity_rel;

        % 객체의 절대 속도 계산 (관측자의 속도를 더함)
        vx_abs = velocity_abs(1) + vx_vehicle;
        vy_abs = velocity_abs(2) + vy_vehicle;
        vz_abs = velocity_abs(3) + vz_vehicle;

        % 속도 크기 계산
        vel = round(sqrt(vx_abs^2 + vy_abs^2 + vz_abs^2),2);

        VelocityInfo = [VelocityInfo; vel];
        OrientInfo = [OrientInfo; [vx_abs, vy_abs]];     
    end

end

