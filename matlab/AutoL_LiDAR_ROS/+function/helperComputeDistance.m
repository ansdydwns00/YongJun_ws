function distance = helperComputeDistance(roiPtCloud, bboxesLidar)
    
    numLidarDetections = size(bboxesLidar,1);
    
    distance = zeros(1,numLidarDetections);

    for i = 1:numLidarDetections
        bboxCuboid = bboxesLidar(i,:);

        % Create cuboidModel
        model = cuboidModel(bboxCuboid);
        
        % Find points inside cuboid
        ind = findPointsInsideCuboid(model,roiPtCloud);
        pts = select(roiPtCloud,ind);

        % Find the distance of the 2-D rectangle
        distance(i) = min(pts.Location(:,1));
    end
end