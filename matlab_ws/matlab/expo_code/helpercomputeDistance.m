function [Distances,bboxesLidar,bboxesUsed] = helpercomputeDistance(bboxes_tmp,ptCloud,CamToLidar,cameraParams,clusterThreshold)

    Distances = [];
    bboxesLidar = [];
    bboxesUsed = [];

    if bboxes_tmp

        [bboxesLidar, ~, bboxesUsed] = bboxCameraToLidar(bboxes_tmp, ptCloud, cameraParams, CamToLidar, 'ClusterThreshold', clusterThreshold);  
    
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
            end
            

    
        else
            % disp("--------Detection failed with LiDAR !--------") 
        end

    else
        % disp("--------Detection failed with Camera !--------")
    end
end