function get_ptdata(message)    
    % Declare global variables to store position and orientation
    % Extract position and orientation from the ROS message and assign the
    % data to the global variables.
    pt = pointCloud(rosReadXYZ(message));
    
end