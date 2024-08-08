function detections = detectObjects(detector,frame,frameCount)
    
    [bboxes,scores] = detect(detector,frame);
    
    bboxes(scores < 40,:) = [];
 

    L = 650;
    measurementNoise = [L  0  0  0;...
                        0  L  0  0;...
                        0  0 L/2 0;...
                        0  0  0 L/2];

    numDetections = size(bboxes,1);
    detections = cell(numDetections,1);
    for i = 1:numDetections
        detections{i} = objectDetection(frameCount,bboxes(i,:),"MeasurementNoise",measurementNoise);
    end
end