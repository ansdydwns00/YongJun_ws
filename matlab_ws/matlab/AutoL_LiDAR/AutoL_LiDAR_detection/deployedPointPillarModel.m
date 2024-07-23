function deployedPointPillarModel
    
    % load the pre-trained deep learning network from the "pointPillarDetector.mat" file
    detector = coder.loadDeepLearningNetwork("detector.mat");
    
    nd = ros2node("/DetectionNode");

    % create subscribers and publishers
    pcsub = ros2subscriber(nd,"/Avia","sensor_msgs/PointCloud2");
    objDetectPub = ros2publisher(nd,'/objDetectionInfo','vision_msgs/Detection3DArray');
    
    % create ros message object
    objMsg = ros2message(objDetectPub);


    r = ros2rate(nd,20);
    while true
        fprintf("Waiting for input\n");
        receivedpcdata = receive(pcsub);

        fprintf("Point Cloud received\n");

        % Extract XYZ coordinates from ROS point cloud message structure
        pts = rosReadXYZ(receivedpcdata);

        % Read point cloud data from ROS message structure based on field name
        intensity = rosReadField(receivedpcdata,'intensity');
        
        % Create a 3-D point cloud object
        ptCloud = pointCloud(pts,"Intensity",intensity);

        [bboxes,~,labels] = detect(detector,ptCloud,"Threshold",0.3);
        
        % processing the output of the dectector, before publishing it on the rostopic
        labels = cellstr(labels);
         
        % publishing the coordinates and lables of detected objects
        fprintf("Publishing the coordinates and labels of detected objects \n");
        for i = 1:length(bboxes)
            objMsg.detections(i).bbox.center.position.x = bboxes(i,1);
            objMsg.detections(i).bbox.center.position.y = bboxes(i,2);
            objMsg.detections(i).bbox.center.position.z = bboxes(i,3);
            objMsg.detections(i).bbox.size.x = bboxes(i,4);
            objMsg.detections(i).bbox.size.y = bboxes(i,5);
            objMsg.detections(i).bbox.size.z = bboxes(i,6);
            
            % objMsg.detections(i).results.hypothesis.class_id = labels{i,1}; 
        end

        send(objDetectPub,objMsg);
        fprintf("Details published \n\n");
        waitfor(r);
    end
end