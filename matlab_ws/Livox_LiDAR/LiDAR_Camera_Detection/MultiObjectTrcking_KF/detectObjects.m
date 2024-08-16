function [detections,bbox] = detectObjects(acfDetector,frame,frameCount)
    
    [bboxes,~] = detect(acfDetector,frame);
    
%     bboxes(scores<0.6) = [];

    L = 650;  % 650
    measurementNoise = [L  0  0  0;...
                        0  L  0  0;...
                        0  0 L/2 0;...
                        0  0  0 L/2];

    numDetections = size(bboxes,1);
    detections = cell(numDetections,1);
    bbox = bboxes;
    for i = 1:numDetections
        detections{i} = objectDetection(frameCount,bboxes(i,:),...
            "MeasurementNoise",measurementNoise);
    end
end