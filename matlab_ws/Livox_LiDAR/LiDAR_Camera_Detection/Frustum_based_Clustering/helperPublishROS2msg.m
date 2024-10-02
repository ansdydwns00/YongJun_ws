function detectionArrayMsg = helperPublishROS2msg(modelInfo,velInfo,orienInfo,vel_flag)
    
    detectionArrayMsg = ros2message("vision_msgs/Detection3DArray");
    detectionArrayMsg.header.frame_id = 'IVL';

    isObjectDetected = ~isempty(modelInfo);

    if isObjectDetected && vel_flag == true 
        numObjDetections = size(modelInfo.Distance,1);
        
        % detectionArrayMsg = ros2message("vision_msgs/Detection3DArray");
       
        for i = 1:numObjDetections
            detectionMsg = ros2message("vision_msgs/Detection3D");
            detectionMsg.header.frame_id = 'IVL';

            detectionMsg.tracking_id = modelInfo.ID{i};
            detectionMsg.results.id = modelInfo.Class{i};
            % detectionMsg.results.score = [];
            detectionMsg.results.pose.pose.position.x = modelInfo.Distance(i);
            
            detectionMsg.results.pose.pose.orientation.x = velInfo(i,1);
            detectionMsg.results.pose.pose.orientation.y = velInfo(i,1);
            detectionMsg.results.pose.pose.orientation.z = orienInfo(i,1);
            detectionMsg.results.pose.pose.orientation.w = orienInfo(i,2);

            detectionMsg.bbox.center.position.x = modelInfo.BoxCenter(i,1);
            detectionMsg.bbox.center.position.y = modelInfo.BoxCenter(i,2);
            detectionMsg.bbox.center.position.z = modelInfo.BoxCenter(i,3);

            detectionMsg.bbox.center.orientation.x = modelInfo.BoxOrientation(i,1);
            detectionMsg.bbox.center.orientation.y = modelInfo.BoxOrientation(i,2);
            detectionMsg.bbox.center.orientation.z = modelInfo.BoxOrientation(i,3);
            detectionMsg.bbox.center.orientation.w = modelInfo.BoxOrientation(i,4);

            detectionMsg.bbox.size.x = modelInfo.BoxSize(i,1);
            detectionMsg.bbox.size.y = modelInfo.BoxSize(i,2);
            detectionMsg.bbox.size.z = modelInfo.BoxSize(i,3);
            
            detectionArrayMsg.detections(i) = detectionMsg;
            detectionArrayMsg.header.frame_id = 'IVL';
        end
    end




end