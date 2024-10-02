function [Model, ModelInfo] = helperComputeDistance(bboxes, l_id, l_cls, ptCld, cameraParams, CamToLidar, clusterThreshold)
    
    Model = {};
    ModelInfo = struct('BoxMean', [], 'BoxCenter', [], 'BoxSize', [], 'BoxOrientation', [], 'Distance', [], 'ID', [], 'Class', []);
    
    if isempty(bboxes) || isempty(ptCld.Location)
        return;
    end
    
    
    Model = helperBboxCameraToLidar(bboxes, ptCld, cameraParams, CamToLidar, ...
                                                            'ClusterThreshold', clusterThreshold, 'MaxDetectionRange', [3,70]);
    if isempty(Model)
        return;
    end

    numLidarDetections = size(Model, 2);
    Distances = nan(numLidarDetections, 1);
    BoxMean = zeros(numLidarDetections, 3);
    BoxCenter = zeros(numLidarDetections, 3);
    BoxSize = zeros(numLidarDetections, 3);
    BoxOrientation = zeros(numLidarDetections, 4);
    
    % Cuboid fitting & distance calculation
    for i = 1:numLidarDetections
        
        model = Model{i};
        pts = select(ptCld, findPointsInModel(model, ptCld));

        if ~isempty(pts.Location)

            ptsLocation = pts.Location;

            obj_min = min(ptsLocation);
            
            % Distances(i) = norm(obj_min);

            Distances(i) = norm([mean(pts.Location(:,1)),mean(pts.Location(:,2)),mean(pts.Location(:,3))]);
            

            BoxMean(i, :) = [mean(pts.Location(:,1)),mean(pts.Location(:,2)),mean(pts.Location(:,3))];
            BoxCenter(i, :) = model.Center;
            BoxSize(i, :) = model.Dimensions;
            
            quat = eul2quat(model.Orientation([3, 2, 1]));
            BoxOrientation(i, :) = quat([2, 3, 4, 1]); 
        end
    end
    
    Model = Model';
    ModelInfo(1).BoxMean = BoxMean;
    ModelInfo(1).BoxCenter = BoxCenter;
    ModelInfo(1).BoxSize = BoxSize;
    ModelInfo(1).BoxOrientation = BoxOrientation;
    ModelInfo(1).Distance = Distances;
    ModelInfo(1).ID = l_id;
    ModelInfo(1).Class = l_cls;
end
