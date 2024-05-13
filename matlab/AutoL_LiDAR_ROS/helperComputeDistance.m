function objectInfo = helperComputeDistance(ptCloud, bboxesLidar, player, objectInfo)
    
    numLidarDetections = size(bboxesLidar,1);
    
    deleteCuboid(player.Axes);

    for i = 1:numLidarDetections
        bboxCuboid = bboxesLidar(i,:);

        % Create cuboidModel
        model = cuboidModel(bboxCuboid);
        
        % Find points inside cuboid
        ind = findPointsInsideCuboid(model,ptCloud);
        pts = select(ptCloud,ind);

        % Find the distance of the 2-D rectangle

        dist = min(pts.Location(:,1));

        objectInfo{i,1}.Distance = dist;
        Id = objectInfo{i}.Id;

        drawCuboid(player.Axes, model.Parameters, 'red', dist, Id);
    end
end