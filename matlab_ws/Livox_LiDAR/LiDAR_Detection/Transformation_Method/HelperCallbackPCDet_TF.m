function HelperCallbackPCDet_TF(msg)
    
    global G_bbox
    global G_id
    global G_cls

    G_bbox = [];
    G_id = {};
    G_cls = {};
 
    bbox_tmp = [];
    id_tmp = {};
    cls_tmp = {};

    % number of detections 
    num_detection = size(msg.detections,1);
    
    if num_detection == 0
        % disp("No Object Detection")
    end

    for i = 1:num_detection
        x_ctr = msg.detections(i).bbox.center.position.x;
        y_ctr = msg.detections(i).bbox.center.position.y;
        z_ctr = msg.detections(i).bbox.center.position.z;

        x_len = msg.detections(i).bbox.size.x;
        y_len = msg.detections(i).bbox.size.y;
        z_len = msg.detections(i).bbox.size.z; 
        
        % [w x y z] sequence
        quat = [msg.detections(i).bbox.center.orientation.w,msg.detections(i).bbox.center.orientation.x,...
                msg.detections(i).bbox.center.orientation.y,msg.detections(i).bbox.center.orientation.z];
        
        % [z y x] sequence
        euler = quat2eul(quat);

        x_rot = euler(3);
        y_rot = euler(2);
        z_rot = euler(1);


        bbox_tmp(i,:) = [x_ctr, y_ctr, z_ctr,...
                         x_len, y_len, z_len,...
                         x_rot, y_rot, z_rot];
        
        id_tmp{i} = msg.detections(i).tracking_id;
        cls_tmp{i} = msg.detections(i).results.id;
    end

    G_bbox = bbox_tmp;
    G_id = id_tmp';
    G_cls = cls_tmp';
end