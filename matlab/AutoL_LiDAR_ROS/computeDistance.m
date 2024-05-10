function [distance,bboxesLidar] = computeDistance(Yolo,bboxes,ptCloud,cameraParams,CamToLidar,clusterThreshold,player)
    
    % ---------------------------------------------------------------------------
    %                              Image sub  
    % ---------------------------------------------------------------------------
    % subscribe image msg
    % image_received = receive(Yolo.imgSub);
    % yolo_img = rosReadImage(image_received);
         
    % subscribe track msg
    yolo_info = receive(Yolo.trackSub);

    % bounding box info
    for idx = 1:length(yolo_info.detections)
        x = yolo_info.detections(idx).bbox.center.position.x;
        y = yolo_info.detections(idx).bbox.center.position.y;
        w = yolo_info.detections(idx).bbox.size.x;
        h = yolo_info.detections(idx).bbox.size.y;

        bbox = [x-w/2, y-h/2, w, h];
        bboxes = [bboxes; bbox];
    end
    
    
    if bboxes
        [bboxesLidar,~,~] = bboxCameraToLidar(bboxes,ptCloud,cameraParams,CamToLidar,'ClusterThreshold',clusterThreshold);

        if ~isempty(bboxesLidar)
            % sum(bboxesLidar(1:6)) ~= 0 
            distance = helperComputeDistance(ptCloud, bboxesLidar);

            % showShape("cuboid",bboxesLidar,'Parent',player.Axes,"Opacity",0.15,"Color",'red');
            % yolo_img = insertTrackBoxes(yolo_img, bboxes, distance);

            deleteCuboid(player.Axes);
            cuboidInfo = getCuboidInfo(bboxesLidar);
            drawCuboid(player.Axes, cuboidInfo, 'red');
        end 
    else
        deleteCuboid(player.Axes);
        distance = [];
        bboxesLidar = [];
    end
  
end