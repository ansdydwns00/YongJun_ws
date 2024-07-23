function ptCld_ps = HelperPtCldProcessing(ptCld,gridStep,roi)

    % pointCloud ROI 
    % indices = findPointsInROI(ptCld, roi);
    % ptCld_roi = select(ptCld, indices);

    % pointCloud Downsampling
    ptCld_ps = pcdownsample(ptCld,"gridAverage",gridStep);
    


end