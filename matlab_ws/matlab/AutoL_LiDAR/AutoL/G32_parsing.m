function [xyzCoords,xyzIntensity, isValid] = G32_parsing(packetData,reset_flag) %#codegen
    
    % Use persistent variables to store point cloud values ​​for one frame
    
    % Initialize of persistent parameters
    persistent points
    persistent Intensity
    persistent i
    
    % 1 frame = 178 packets
    % First starting(isempty(points)) and Restarting(reset_flag == 0)
    if isempty(points) || reset_flag == 0
        points = single(zeros(128*178,3));
        Intensity = single(zeros(128*178,1));
        i = 1;
    end
    

    % Extract one packet
    [payload, top_bottom_flag, dataType] = G32_packet_extract(packetData);
    
    % Extract [x,y,z] coordinates for one packet 
    [xyzPoints,intensity] = G32_ptCloud_extract(payload,top_bottom_flag);
    
    
    % Check End frame packet
    if (top_bottom_flag == 1 && dataType == 170)
       
        % Return [x,y,z] coordinates for 1 frame and set the return flag to true
        xyzCoords = points;
        xyzIntensity = Intensity;
        isValid = true;
        
        % Initialize of parameters
        points = single(zeros(128*178,3));
        Intensity = single(zeros(128*178,1));
        i = 1;
    else

        % Save [x,y,z] coordinates in packet unless it's an end frame
        points((i-1)*128+1:(i-1)*128+128,:) = xyzPoints;
        Intensity((i-1)*128+1:(i-1)*128+128,:) = intensity;
        i = i + 1;
        
        % Return empty matrix for 1 frame and set the return flag to false
        xyzCoords = single([]);
        xyzIntensity = single([]);
        isValid = false;
    end   
     
    
end
 