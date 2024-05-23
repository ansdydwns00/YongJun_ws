function Distances = LR_computeDistance(ptCloud,bboxes)
    
    numObjectDetections = size(bboxes,1);
    Distances = [];
    
    for i = 1:numObjectDetections
        bboxCuboid = bboxes(i,:);
        
        % Create cuboidModel
        model = cuboidModel(bboxCuboid);
        
        % Find points inside cuboid
        ind = findPointsInModel(model,ptCloud);
        pts = select(ptCloud,ind);

        % Find the distance of the 2-D rectangle
        dist = min(pts.Location(:,1));

        Distances(i,1) = dist;
    end

end
