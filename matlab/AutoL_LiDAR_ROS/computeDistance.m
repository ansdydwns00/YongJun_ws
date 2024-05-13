function objectInfo = computeDistance(Yolo,ptCloud,cameraParams,CamToLidar,clusterThreshold,player)
    
    % ---------------------------------------------------------------------------
    %                              Yolo sub  
    % ---------------------------------------------------------------------------
    % subscribe image msg
    % image_received = receive(Yolo.imgSub);
    % yolo_img = rosReadImage(image_received);
         
    % subscribe track msg
    yolo_info = receive(Yolo.trackSub);
    

    objectInfo = {struct()};
    bboxes = [];

    % bounding box info
    for idx = 1:length(yolo_info.detections)
        x = yolo_info.detections(idx).bbox.center.position.x;
        y = yolo_info.detections(idx).bbox.center.position.y;
        w = yolo_info.detections(idx).bbox.size.x;
        h = yolo_info.detections(idx).bbox.size.y;
        
        % Bounding box info
        bbox = [x-w/2, y-h/2, w, h];
        bboxes(idx,:) = bbox;
        objectInfo{idx}.Bbox = bbox;
        
        % Tracker id info 
        id = yolo_info.detections(idx).id;
        objectInfo{idx}.Id = id;
    end
    
    
    if bboxes

        bboxesLidar = bboxCameraToLidar(bboxes, ptCloud, cameraParams, CamToLidar, 'ClusterThreshold', clusterThreshold);  

        if ~isempty(bboxesLidar)

            objectInfo = helperComputeDistance(ptCloud, bboxesLidar, player, objectInfo);
            % yolo_img = insertTrackBoxes(yolo_img, bboxes, distance);
            
        end 
    else
        deleteCuboid(player.Axes);
    end
    
end