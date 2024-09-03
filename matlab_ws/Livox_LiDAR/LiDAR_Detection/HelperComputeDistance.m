function [Model, ModelInfo] = HelperComputeDistance(bboxes, id, cls, ptCld)
    
    
    Model = {};
    ModelInfo = struct([]);
    Distances = [];
    
    BoxCenter = [];
    BoxSize = [];
    BoxOrientation = [];


    if ~isempty(bboxes) && ~isempty(ptCld.Location)
        
        numObjDetections = size(bboxes,1);
    
        for i = 1:numObjDetections

            % Create cuboidModel
            model = cuboidModel(bboxes(i,:));
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
                BoxOrientation(i,:) = [quat(1),quat(2),quat(3),quat(4)];
            else
                Distances(i,:) = nan;
            end    
        end
        
        Model = Model';
        ModelInfo(1).BoxCenter = BoxCenter;
        ModelInfo(1).BoxSize = BoxSize;
        ModelInfo(1).BoxOrientation = BoxOrientation;
        ModelInfo(1).Distance = Distances;
        ModelInfo(1).ID = id;
        ModelInfo(1).Class = cls;

    end

end