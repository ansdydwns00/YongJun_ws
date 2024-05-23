function cornersCamera = getCornersFromBbox(bbox)
    cornersCamera = zeros(4,2);
    cornersCamera(1,1:2) = bbox(1:2);
    cornersCamera(2,1:2) = bbox(1:2) + [bbox(3),0];
    cornersCamera(3,1:2) = bbox(1:2) + bbox(3:4);
    cornersCamera(4,1:2) = bbox(1:2) + [0,bbox(4)];
end