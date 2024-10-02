function [Model, ModelInfo] = HelperComputeDistance_KF(bboxes, id, cls, vel, isTracking, ptCld)
    
    
Model = {};
ModelInfo = struct('BoxCenter', [], 'BoxSize', [], 'BoxOrientation', [],...
                   'Distance', [], 'ID', [], 'Class', [],...
                   'Obj_isTracking',[],'Obj_Vel',[],'Obj_Ori',[]);

    
if isempty(bboxes) || isempty(ptCld.Location)
    return;
end
 
numLidarDetections = size(bboxes, 1);

BoxCenter = zeros(numLidarDetections, 3);
BoxSize = zeros(numLidarDetections, 3);
BoxOrientation = zeros(numLidarDetections, 4);

Distances = nan(numLidarDetections, 1);

for i = 1:numLidarDetections

    % Create cuboidModel
    model = cuboidModel(bboxes(i,:));
    Model{i} = model;

    % Find points inside cuboid
    ind = findPointsInModel(model, ptCld);
    pts = select(ptCld,ind);

    if ~isempty(pts.Location)
        Distances(i) = norm([mean(pts.Location(:,1)),mean(pts.Location(:,2)),mean(pts.Location(:,3))]);
        
        BoxCenter(i, :) = model.Center;
        BoxSize(i, :) = model.Dimensions;
        
        quat = eul2quat(model.Orientation([3, 2, 1]));
        BoxOrientation(i, :) = quat([2, 3, 4, 1]);
    end    
end

Model = Model';

ModelInfo(1).BoxCenter = BoxCenter;
ModelInfo(1).BoxSize = BoxSize;
ModelInfo(1).BoxOrientation = BoxOrientation;

ModelInfo(1).ID = id;
ModelInfo(1).Class = cls;
ModelInfo(1).Distance = Distances;

ModelInfo(1).Obj_isTracking = isTracking;
ModelInfo(1).Obj_Vel = vel;
ModelInfo(1).Obj_Ori = vel;

end