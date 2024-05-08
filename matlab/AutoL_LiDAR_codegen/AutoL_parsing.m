function [xyzCoords, isValid] = AutoL_parsing(packetData,reset_flag) %#codegen
    
    % Initialize of persistent parameters
    persistent points
    persistent i

    if isempty(points) || reset_flag == 0
        points = single(zeros(22784,3));
        i = 1;
    end
    

    % Extract one packet
    [payload,top_bottom_flag,dataType] = packet_extract(packetData);
    
    % Extract [x,y,z] coordinates for one packet 
    xyzPoints = ptCloud_extract(payload,top_bottom_flag);
    
    
    % Check End frame packet
    if (top_bottom_flag == 1 && dataType == 170)
        
        % Return [x,y,z] coordinates for 1 frame and set the return flag to true
        xyzCoords = points;
        isValid = true;
        
        % Initialize of parameters
        i = 1;
        points = single(zeros(22784,3));
    else

        % Save [x,y,z] coordinates in packet unless it's an end frame
        points((i-1)*128+1:(i-1)*128+128,:) = xyzPoints;
        i = i + 1;
        
        % Return empty matrix for 1 frame and set the return flag to false
        xyzCoords = single([]);
        isValid = false;
    end   
     
    
end
 