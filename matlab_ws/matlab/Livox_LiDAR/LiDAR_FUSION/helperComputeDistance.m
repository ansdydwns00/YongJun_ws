function [Distances,bboxesLidar,bboxesUsed] = helperComputeDistance(bboxes,ptCld,cameraParams,CamToLidar,clusterThreshold)

    Distances = [];
    bboxesLidar = [];
    bboxesUsed = [];

    if ~isempty(bboxes) && ~isempty(ptCld.Location)

        [bboxesLidar, ~, bboxesUsed] = bboxCameraToLidar(bboxes, ptCld, cameraParams, CamToLidar, 'ClusterThreshold', clusterThreshold);  
        
        % [0 0 0 0 0 0 0 0 0] value remove
        idx_del = all(bboxesLidar == 0, 2);
        bboxesLidar(idx_del,:) = [];

        if ~isempty(bboxesLidar)
    
            numLidarDetections = size(bboxesLidar,1);
      
            for i = 1:numLidarDetections
                bboxCuboid = bboxesLidar(i,:);
        
                % Create cuboidModel
                model = cuboidModel(bboxCuboid);
                
                % Find points inside cuboid
                ind = findPointsInModel(model,ptCld);
                pts = select(ptCld,ind);
        
                % Find the distance of the 2-D rectangle
        
                dist = mean(pts.Location(:,1));
                Distances(i,:) = dist;
            end

        else
            % disp("--------Detection failed with LiDAR !--------") 
        end

    else
        % disp("--------Detection failed with Camera !--------")
    end
end