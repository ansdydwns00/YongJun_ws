function [bboxes,scores,labels] = pointpillardetect(matFile,dataLoc,dataInt,threshold)
% Predict the output of network and extract the confidence, x, y,
% width, height, and class.

% load the deep learning network for prediction
persistent pointPillarObj;

if isempty(pointPillarObj)
    pointPillarObj = coder.loadDeepLearningNetwork(matFile);
end

ptCloud = pointCloud(dataLoc,'Intensity',dataInt);

[bboxes,scores,labels] = pointPillarObj.detect(ptCloud,'Threshold',threshold);
end

