function bboxesPosition = extractBboxesPositions(cuboidTreshold,bboxesLidar)
    % Extract xlen, ylen, zlen from the bounding boxes
    volumes = prod(bboxesLidar(:, 4:6), 2);

    % Find indices where volumes are smaller than cuboidThreshold
    indices = volumes > cuboidTreshold;

    bboxesPosition = bboxesLidar(indices, 1:2);
   
end