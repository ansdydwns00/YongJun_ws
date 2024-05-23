function [nearestRect,idx] = findNearestRectangle(imPts,imBbox)

    numBbox = size(imBbox,1);
    ratio = zeros(numBbox,1);

    % Iterate over all the rectangles
    for i = 1:numBbox
        bbox = imBbox(i,:);
        corners = getCornersFromBbox(bbox);

        % Find overlapping ratio of the projected points and the rectangle
        idx = (imPts(:,1) > corners(1,1)) & (imPts(:,1) < corners(2,1)) & ...
            (imPts(:,2) > corners(1,2)) & (imPts(:,2) < corners(3,1));
        ratio(i) = sum(idx);
    end

    % Get nearest rectangle
    [~,idx] = max(ratio);
    nearestRect = imBbox(idx,:);
end