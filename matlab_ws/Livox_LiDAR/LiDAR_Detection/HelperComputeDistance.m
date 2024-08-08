function Distances = HelperComputeDistance(bboxInfo,ptCld)
    
    Distances = [];

    num_detections = size(bboxInfo,1);

    for i = 1:num_detections
        bboxCuboid = bboxInfo(i,:);

        % Create cuboidModel
        model = cuboidModel(bboxCuboid);
        
        % Find points inside cuboid
        ind = findPointsInModel(model,ptCld);
        pts = select(ptCld,ind);

        % Find the distance of the 2-D rectangle

        dist = mean(pts.Location(:,1));
        Distances(i,:) = dist;
    end

end