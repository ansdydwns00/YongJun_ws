function ptCld_ps = helperPtCldProcessing(ptCld,roi,gridStep)
    
    % pointCloud ROI 
    indices = findPointsInROI(ptCld, roi);
    ptCld_roi = select(ptCld, indices);
    % ptCld_ps = ptCld_roi;
    
    % pointCloud Downsampling
    ptCld_ps = pcdownsample(ptCld_roi,"gridAverage",gridStep);
    
    % ptCld_ps = pcdenoise(ptCld_ds);
end