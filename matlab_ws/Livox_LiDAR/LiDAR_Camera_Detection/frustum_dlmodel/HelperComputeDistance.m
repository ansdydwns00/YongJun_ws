function [Model, ModelInfo] = HelperComputeDistance(bboxes, id, cls, ptCld)
    
    
Model = {};
ModelInfo = struct('BoxMean', [], 'BoxCenter', [], 'BoxSize', [], 'BoxOrientation', [], 'Distance', [], 'ID', [], 'Class', []);

    
if isempty(bboxes) || isempty(ptCld.Location)
    return;
end
 
numLidarDetections = size(bboxes, 1);
Distances = nan(numLidarDetections, 1);
BoxMean = zeros(numLidarDetections, 3);
BoxCenter = zeros(numLidarDetections, 3);
BoxSize = zeros(numLidarDetections, 3);
BoxOrientation = zeros(numLidarDetections, 4);

for i = 1:numLidarDetections

    % Create cuboidModel
    model = cuboidModel(bboxes(i,:));
    Model{i} = model;

    % Find points inside cuboid
    ind = findPointsInModel(model, ptCld);
    pts = select(ptCld,ind);

    if ~isempty(pts.Location)

        % ptsLocation = pts.Location;
        % obj_min = min(ptsLocation);

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
ModelInfo(1).ID = id;
ModelInfo(1).Class = cls;

end