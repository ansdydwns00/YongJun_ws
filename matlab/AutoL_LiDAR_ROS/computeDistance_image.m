function objectInfo = computeDistance_image(Yolo,ptCloud,cameraParams,CamToLidar,clusterThreshold,vPlayer,fps)
    
    % ---------------------------------------------------------------------------
    %                              Yolo sub  
    % ---------------------------------------------------------------------------
    % Subscribe image msg
    image_received = receive(Yolo.rawImgSub);
    yolo_img = rosReadImage(image_received);
         
    % Subscribe track msg
    yolo_info = receive(Yolo.trackSub);
    
    % Initiailize parameters
    objectInfo = {struct()};
    bboxes = [];
    labels = {};
    bboxesLidar = [];
    

    % Extract Bbox & Label Info
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
        labels = [labels; str2double(id)];
    end
    
    
    if bboxes

        bboxesLidar = bboxCameraToLidar(bboxes, ptCloud, cameraParams, CamToLidar, 'ClusterThreshold', clusterThreshold);  

        if ~isempty(bboxesLidar)

            [objectInfo,labels] = helperComputeDistance_image(ptCloud, bboxesLidar, labels, objectInfo);
            
            yolo_img = insertObjectAnnotation(yolo_img,"rectangle",bboxes,labels,"TextBoxOpacity",0.3);

        end 
    end

    yolo_img = insertText(yolo_img,[1,1],sprintf("FPS %2.2f",fps),"FontSize",24,"BoxColor","white");
    vPlayer.step(yolo_img);
    
end