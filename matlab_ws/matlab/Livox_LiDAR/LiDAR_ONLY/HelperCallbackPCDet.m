function GbboxInfo = HelperCallbackPCDet(msg)
    % number of detections 
    num_detection = size(msg.detections,1);
    
    global G_bbox
    global G_id
    global G_cls

    G_bbox = [];
    G_id = {};
    G_cls = {};

    bbox_tmp = [];
    id_tmp = {};
    cls_tmp = {};


    for i = 1:num_detection
        x_ctr = msg.detections(i).bbox.center.position.x;
        y_ctr = msg.detections(i).bbox.center.position.y;
        z_ctr = msg.detections(i).bbox.center.position.z;

        x_len = msg.detections(i).bbox.size.position.x;
        y_len = msg.detections(i).bbox.size.position.y;
        z_len = msg.detections(i).bbox.size.position.z; 
    
        quat = [msg.detections(i).bbox.center.orientation.w,msg.detections(i).bbox.center.orientation.x,...
                msg.detections(i).bbox.center.orientation.y,msg.detections(i).bbox.center.orientation.z];
        
        euler = quat2eul(quat,"XYZ");

        x_rot = euler(1);
        y_rot = euler(2);
        z_rot = euler(3);

        bbox_tmp(i,:) = [x_ctr,y_ctr,z_ctr,x_len,y_len,z_len,x_rot,y_rot,z_rot];
        id_tmp{i} = msg.detections(i).id;
        cls_tmp{i} = msg.detections(i).results.hypothesis.class_id;
    end
    
    G_bbox = bbox_tmp;
    G_id = id_tmp';
    G_cls = cls_tmp';
end