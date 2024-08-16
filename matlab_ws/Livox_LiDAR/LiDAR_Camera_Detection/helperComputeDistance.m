function [Distances, Model, l_id, l_cls] = helperComputeDistance(bboxes, l_id, l_cls, ptCld,cameraParams,CamToLidar,clusterThreshold)

    Distances = [];
    Model = {};
    
    if ~isempty(bboxes) && ~isempty(ptCld.Location)

        [bboxesLidar, indicies, bboxesUsed] = bboxCameraToLidar(bboxes, ptCld, cameraParams, CamToLidar, 'ClusterThreshold', clusterThreshold,'MaxDetectionRange',[2,60]);  
        
        % [0 0 0 0 0 0 0 0 0] value remove
        idx_del = all(bboxesLidar == 0, 2);
        bboxesLidar(idx_del,:) = [];

        indicies(~bboxesUsed,:) = [];
        l_id(~bboxesUsed') = [];
        l_cls(~bboxesUsed') = [];

        if ~isempty(bboxesLidar)
    
            numLidarDetections = size(bboxesLidar,1);
      
            for i = 1:numLidarDetections

                % Create cuboidModel
                model = pcfitcuboid(ptCld,indicies{i});
                Model{i} = model;

                % Find points inside cuboid
                ind = findPointsInModel(model,ptCld);
                pts = select(ptCld,ind);
        
                % Calculatae the distance of the 3-D rectangle
                obj_x = min(pts.Location(:,1));
                obj_y = min(pts.Location(:,2));
                dist = sqrt(obj_x^2+obj_y^2);
                Distances(i,:) = dist;
            end

            Model = Model';
        end
    end
end