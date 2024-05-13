function [objectInfo,labels] = helperComputeDistance_image(ptCloud, bboxesLidar, labels, objectInfo)
    
    numLidarDetections = size(bboxesLidar,1);
    numBbox = size(labels,1);
    
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

        labels{i} = ['ID:' num2str(labels{i}) ' Dist:' num2str(dist,'%0.2f') ' m'];
    end

    if numLidarDetections ~= numBbox
        for i = numLidarDetections+1:numBbox
            labels{i} = ['ID:' num2str(labels{i})];
        end
    end
end