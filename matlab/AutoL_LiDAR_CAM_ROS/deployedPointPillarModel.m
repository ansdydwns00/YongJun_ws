function deployedPointPillarModel
    
    % load the pre-trained deep learning network from the "pointPillarDetector.mat" file
    detector = coder.loadDeepLearningNetwork("detector.mat");
    
    Matlab = ros2node("/MatlabNode");

    % create subscribers and publishers
    pcsub = ros2subscriber(Matlab,"/scan","sensor_msgs/PointCloud2");
    boxOb = ros2publisher(Matlab,"/nodeboxData","std_msgs/Float64MultiArray");
    LabelsOb = ros2publisher(Matlab,"/nodeLabelsData","std_msgs/String");

    
    % create ros message object
    msg = ros2message(boxOb);
    msg_1 = ros2message(LabelsOb);

    r = ros2rate(Matlab,1);

    while (1)
        fprintf("Waiting for input\n");
        [receivedpcdata,status] = receive(pcsub);

        fprintf("Point Cloud received\n");
        % Extract XYZ coordinates from ROS point cloud message structure
        pts = rosReadXYZ(receivedpcdata);

        % Read point cloud data from ROS message structure based on field name
        intensity = rosReadField(receivedpcdata,'intensity');
        
        % Create a 3-D point cloud object
        ptCloud = pointCloud(pts,Intensity=intensity);

        [boxDetails,~,labelOutput] = detect(detector,ptCloud,"Threshold",0.3);
        
        % processing the output of the dectector, before publishing it on the rostopic
        boxDetails = boxDetails(:);
        labelOutput = cellstr(labelOutput);
        appendedString = strjoin(labelOutput,'_');
        
        % publishing the coordinates and lables of detected objects
        fprintf("Publishing the coordinates and labels of detected objects \n");
        msg.Data = boxDetails;
        msg_1.Data = appendedString;
        send(boxOb,msg);
        send(LabelsOb,msg_1);
        fprintf("Details published \n\n");
        waitfor(r);
    end
end