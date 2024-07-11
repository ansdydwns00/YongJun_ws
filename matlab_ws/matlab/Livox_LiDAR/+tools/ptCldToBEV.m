function processedData = ptCldToBEV(ptCloud,gridParams)
    
    [processedData,~] = preprocess(ptCloud,gridParams);

end

%% Get the BEV image from point cloud.
function [imageMap,ptCldOut] = preprocess(ptCld,gridParams)

    pcRange = [gridParams{1,1}{1} gridParams{1,1}{2} gridParams{1,1}{3} ...
               gridParams{1,1}{4} gridParams{1,1}{5} gridParams{1,1}{6}]; 

    indices = findPointsInROI(ptCld,pcRange);
    ptCldOut = select(ptCld,indices);
    
    bevHeight = gridParams{1,2}{2};
    bevWidth = gridParams{1,2}{1};
    
    % Find grid resolution.
    gridH = gridParams{1,3}{2};
    gridW = gridParams{1,3}{1};
    
    loc = ptCldOut.Location;
    intensity = ptCldOut.Intensity;
    intensity = normalize(intensity,'range');
    
    % Find the grid each point falls into.
    loc(:,1) = int32(floor(loc(:,1)/gridH)+bevHeight/2) + 1;
    loc(:,2) = int32(floor(loc(:,2)/gridW)) + 1;
    
    % Normalize the height.
    loc(:,3) = loc(:,3) - min(loc(:,3));
    loc(:,3) = loc(:,3)/(pcRange(6) - pcRange(5));
    
    % Sort the points based on height.
    [~,I] = sortrows(loc,[1,2,-3]);
    locMod = loc(I,:);
    intensityMod = intensity(I,:);
    
    % Initialize height and intensity map
    heightMap = zeros(bevHeight,bevWidth);
    intensityMap = zeros(bevHeight,bevWidth);
    
    locMod(:,1) = min(locMod(:,1),bevHeight);
    locMod(:,2) = min(locMod(:,2),bevHeight);
    
    % Find the unique indices having max height.
    mapIndices = sub2ind([bevHeight,bevWidth],locMod(:,1),locMod(:,2));
    [~,idx] = unique(mapIndices,"rows","first");
    
    binc = 1:bevWidth*bevHeight;
    counts = hist(mapIndices,binc);
    
    normalizedCounts = min(1.0, log(counts + 1) / log(64));
    
    for i = 1:size(idx,1)
        heightMap(mapIndices(idx(i))) = locMod(idx(i),3);
        intensityMap(mapIndices(idx(i))) = intensityMod(idx(i),1);
    end
    
    densityMap = reshape(normalizedCounts,[bevHeight,bevWidth]);
    
    imageMap = zeros(bevHeight,bevWidth,3);
    imageMap(:,:,1) = densityMap;       % R channel
    imageMap(:,:,2) = heightMap;        % G channel
    imageMap(:,:,3) = intensityMap;     % B channel
end