function HelperCallbackLiDAR(msg)
    
    global G_point
    
    G_point = [];

    xyzPoints = rosReadXYZ(msg);
    intensity = rosReadField(msg,'intensity');

    G_point = [xyzPoints intensity];
    
end