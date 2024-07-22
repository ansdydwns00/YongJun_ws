function [bboxesLidar,Distances,cls_tmp,id_tmp] = computeDistance(Yolo,ptCloud,cameraParams,CamToLidar,clusterThreshold)
    % [objectInfo,bboxesLidar,Distances,cls_tmp] = computeDistance(Yolo,ptCloud,cameraParams,CamToLidar,clusterThreshold)
    % ---------------------------------------------------------------------------
    %                              Yolo sub  
    % ---------------------------------------------------------------------------
    % subscribe track msg
    yolo_info = receive(Yolo.trackSub);
    
    % objectInfo = {struct()};
    bboxes_tmp = [];
    id_tmp = {};
    cls_tmp = {};
    % dis_tmp = [];

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
        % objectInfo{idx,1}.Bbox = bbox;
        bboxes_tmp(idx,:) = bbox;

        % Tracker id info 
        id = yolo_info.detections(idx).id;
        % objectInfo{idx,1}.Id = id;
        id_tmp{idx} = id;

        % Object info
        cls = yolo_info.detections(idx).class_name;
        % objectInfo{idx,1}.class = cls;
        cls_tmp{idx} = cls;
    end
   
    if bboxes

        [bboxesLidar, ~, bboxesUsed] = bboxCameraToLidar(bboxes, ptCloud, cameraParams, CamToLidar, 'ClusterThreshold', clusterThreshold);  

        if ~isempty(bboxesLidar)

            numLidarDetections = size(bboxesLidar,1);
      
            for i = 1:numLidarDetections
                bboxCuboid = bboxesLidar(i,:);
        
                % Create cuboidModel
                model = cuboidModel(bboxCuboid);
                
                % Find points inside cuboid
                ind = findPointsInModel(model,ptCloud);
                pts = select(ptCloud,ind);
        
                % Find the distance of the 2-D rectangle
        
                dist = mean(pts.Location(:,1));
                Distances(i,:) = dist;
                % dis_tmp(i,:) = dist;
            end
            
            % bboxes_tmp(~bboxesUsed,:) = [];
            id_tmp(~bboxesUsed') = [];
            cls_tmp(~bboxesUsed') = [];
            
            % for j = 1:size(bboxes_tmp,1)
            %     objectInfo{j,1}.Bbox = bboxes_tmp(j,:);
            %     objectInfo{j,1}.Id = id_tmp{j};
            %     objectInfo{j,1}.Class = cls_tmp{j};
            %     objectInfo{j,1}.Dist = dis_tmp(j,1);
            % end


        else
            disp("--------Detection failed with LiDAR !--------") 
        end
    else
        disp("--------Detection failed with Camera !--------")
    end
    
end