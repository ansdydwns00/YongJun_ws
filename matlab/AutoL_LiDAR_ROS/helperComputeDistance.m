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
        objectInfo{i}.Distance = dist;
        
        drawCuboid(player.Axes, model.Parameters, 'red', dist);
    end
end