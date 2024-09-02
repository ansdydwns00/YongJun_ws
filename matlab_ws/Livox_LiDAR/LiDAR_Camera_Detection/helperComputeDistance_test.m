function [Model, ModelInfo] = helperComputeDistance_test(bboxes, l_id, l_cls, ptCld, cameraParams, CamToLidar, clusterThreshold)
    
    Model = {};
    ModelInfo = struct([]);
    Distances = [];
    BoxCenter = [];
    BoxSize = [];
    BoxOrientation = [];

    if ~isempty(bboxes) && ~isempty(ptCld.Location)
         
        [bboxesLidar, indicies, bboxesUsed] = bboxCameraToLidar(bboxes, ptCld, cameraParams, CamToLidar, 'ClusterThreshold', clusterThreshold,'MaxDetectionRange',[3,70]);  
        
        % Remove error value
        % [0 0 0 0 0 0 0 0 0] value remove
        idx_del = all(bboxesLidar == 0, 2);
        bboxesLidar(idx_del,:) = [];

        indicies(~bboxesUsed,:) = [];
        l_id(~bboxesUsed') = [];
        l_cls(~bboxesUsed') = [];
        

        % Calculate the object Distance & Velocity
        if ~isempty(bboxesLidar) && (size(bboxesLidar,1) == size(indicies,1))
            
            numLidarDetections = size(bboxesLidar,1);
      
            for i = 1:numLidarDetections
                
                % Create cuboidModel
                model = pcfitcuboid(ptCld,indicies{i});
                Model{i} = model;

                % Find points inside cuboid
                ind = findPointsInModel(model, ptCld);
                pts = select(ptCld,ind);
        
                if ~isempty(pts)
                    
                    obj_x = min(pts.Location(:,1));
                    obj_y = min(pts.Location(:,2));
                    obj_z = min(pts.Location(:,3));

                    dist = sqrt(obj_x.^2+obj_y.^2+obj_z.^2);
                    Distances(i,:) = dist;
                    
                    BoxCenter(i,:) = [min(pts.Location(:,1)),min(pts.Location(:,2)),min(pts.Location(:,3))];
                    BoxSize(i,:) = [model.Dimensions(1),model.Dimensions(2),model.Dimensions(3)];
                    quat = eul2quat([model.Orientation(3),model.Orientation(2),model.Orientation(1)]);
                    BoxOrientation(i,:) = [quat(2),quat(3),quat(4),quat(1)];
                else
                    Distances(i,:) = nan;
                end     
            end

            Model = Model';
            ModelInfo(1).BoxCenter = BoxCenter;
            ModelInfo(1).BoxSize = BoxSize;
            ModelInfo(1).BoxOrientation = BoxOrientation;
            ModelInfo(1).Distance = Distances;
            ModelInfo(1).ID = l_id;
            ModelInfo(1).Class = l_cls;
        end
    end
   
end