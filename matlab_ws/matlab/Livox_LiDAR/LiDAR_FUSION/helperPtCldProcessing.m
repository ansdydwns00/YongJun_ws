function ptCld = helperPtCldProcessing(pt,roi,gridStep)
    
    % pointCloud ROI 
    indices = findPointsInROI(pt, roi);
    ptCld = select(pt, indices);
    
    % pointCloud Downsampling
    % ptCld = pcdownsample(ptCld,"gridAverage",gridStep);
    
    % Remove ground plane
    groundPtsIndex = segmentGroundSMRF(ptCld,'SlopeThreshold',0.15,'ElevationThreshold',0.1,'ElevationScale',1.25);
    ptCld = select(ptCld,~groundPtsIndex);
    
    % ptCld = pcdenoise(ptCld);
end