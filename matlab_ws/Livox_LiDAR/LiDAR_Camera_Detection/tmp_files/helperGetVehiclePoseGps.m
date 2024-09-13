function vehiclePose = helperGetVehiclePoseGps(sub)
    
    gpsMsg = receive(sub.Gps);
    imuMsg = receive(sub.Imu);
    
    quat = [imuMsg.orientation.w,imuMsg.orientation.x,imuMsg.orientation.y,imuMsg.orientation.z];
    euler = quat2eul(quat);
    
    % UTM 좌표계로 변환 (Korea: 32652)
    [x_utm, y_utm] = projfwd(projcrs(32652), gpsMsg.latitude, gpsMsg.longitude);

    vehiclePose = [x_utm, y_utm, euler(1)];
end