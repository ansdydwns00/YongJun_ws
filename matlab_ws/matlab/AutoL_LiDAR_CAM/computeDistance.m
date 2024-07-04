function [objectInfo,bboxesLidar,Distances] = computeDistance(Yolo,ptCloud,cameraParams,CamToLidar,clusterThreshold)
    
    % ---------------------------------------------------------------------------
    %                              Yolo sub  
    % ---------------------------------------------------------------------------
    % subscribe track msg
    yolo_info = receive(Yolo.trackSub);
    
    objectInfo = {struct()};
    bboxes = [];
    Distances = [];
    bboxesLidar = [];
    
    % bounding box info
    for idx = 1:length(yolo_info.detections)
        x = yolo_info.detections(idx).bbox.center.position.x;
        y = yolo_info.detections(idx).bbox.center.position.y;
        w = yolo_info.detections(idx).bbox.size.x;
        h = yolo_info.detections(idx).bbox.size.y;
        
        % Bounding box info
        bbox = [x-w/2, y-h/2, w, h];
        bboxes(idx,:) = bbox;
        objectInfo{idx,1}.Bbox = bbox;

        % Tracker id info 
        id = yolo_info.detections(idx).id;
        objectInfo{idx,1}.Id = id;
    end
   
    if bboxes

        bboxesLidar = bboxCameraToLidar(bboxes, ptCloud, cameraParams, CamToLidar, 'ClusterThreshold', clusterThreshold);  
        
        if ~isempty(bboxesLidar)

            numLidarDetections = size(bboxesLidar,1);
      
            for i = 1:numLidarDetections
                bboxCuboid = bboxesLidar(i,:);
        
                % Create cuboidModel
                model = cuboidModel(bboxCuboid);
                
                % Find points inside cuboid
                ind = findPointsInsideCuboid(model,ptCloud);
                pts = select(ptCloud,ind);
        
                % Find the distance of the 2-D rectangle
        
                dist = min(pts.Location(:,1));
                Distances(i,:) = dist;
            end
                
        end
    end
    
end