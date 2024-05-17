function [xyzCoords,xyzIntensity, isValid] = AutoL_parsing(packetData,reset_flag) %#codegen
    
    % Initialize of persistent parameters
    persistent points
    persistent Intensity
    persistent i

    if isempty(points) || reset_flag == 0
        points = single(zeros(128*300,3));
        Intensity = single(zeros(128*300,1));
        i = 1;
    end
    

    % Extract one packet
    [payload,top_bottom_flag,dataType] = packet_extract(packetData);
    
    % Extract [x,y,z] coordinates for one packet 
    [xyzPoints,intensity] = ptCloud_extract_vector(payload,top_bottom_flag);
    
    
    % Check End frame packet
    if (top_bottom_flag == 1 && dataType == 170)
       
        % Return [x,y,z] coordinates for 1 frame and set the return flag to true
        xyzCoords = points;
        xyzIntensity = Intensity;
        isValid = true;
        
        % Initialize of parameters
        points = single(zeros(128*300,3));
        Intensity = single(zeros(128*300,1));
        i = 1;
    else

        % Save [x,y,z] coordinates in packet unless it's an end frame
        points((i-1)*128+1:(i-1)*128+128,:) = xyzPoints;
        Intensity((i-1)*128+1:(i-1)*128+128,:) = intensity;
        i = i + 1;
        % disp(i)

        % Return empty matrix for 1 frame and set the return flag to false
        xyzCoords = single([]);
        xyzIntensity = single([]);
        isValid = false;
    end   
     
    
end
 