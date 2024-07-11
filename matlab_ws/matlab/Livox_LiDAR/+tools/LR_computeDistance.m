function [Distances,Ids] = LR_computeDistance(ptCloud,bboxes)
    
    numObjectDetections = size(bboxes,1);
    Distances = [];
    Ids = [];

    for i = 1:numObjectDetections
        
        % Load object Info 
        bboxCuboid = bboxes(i,:);
        
        % Create cuboidModel
        model = cuboidModel(bboxCuboid);
        
        % Find points inside cuboid
        ind = findPointsInModel(model,ptCloud);
        pts = select(ptCloud,ind);

        % Find the distance of the 2-D rectangle
        dist = min(pts.Location(:,1));
        
        if ~isempty(dist)
            Distances(i,1) = round(dist,2); 
            Ids(i,1) = i;
        else
            continue;
        end
        

    end

end
