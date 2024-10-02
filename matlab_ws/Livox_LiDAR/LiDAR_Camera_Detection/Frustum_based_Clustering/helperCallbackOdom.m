function helperCallbackOdom(msg)
    
    global vehiclePose

    vehiclePose = [];
    
    % 위치 정보 추출
    x = msg.pose.pose.position.x;
    y = msg.pose.pose.position.y;

    % 방향(오리엔테이션) 정보 추출 및 Yaw 각도 계산
    quat = [msg.pose.pose.orientation.w, msg.pose.pose.orientation.x, ...
            msg.pose.pose.orientation.y, msg.pose.pose.orientation.z];
    eul = quat2eul(quat);

    vehiclePose = [x,y,eul(1)];
end