function [xyzCoords,isValid] = Avia_parsing(packet,reset_flag)
    
    % Initialize of persistent parameters
    persistent points
    persistent i

    if isempty(points) || reset_flag == 0
        points = single(zeros(96*250,3));
        i = 1;
    end

    xyzPoints = single(zeros(96, 3));
 
    % Cartesian coordinate data is 19:end 
    xyzPointsPacket = packet(19:end);
    
    % 96 data consists of 14 bytes
    reshapedData = reshape(xyzPointsPacket, 14, []);
    
    % Precompute the indices for faster access
    x_idx = 1:4;
    y_idx = 5:8;
    z_idx = 9:12;
    
    for idx = 1:size(reshapedData,2)

        currentPart = reshapedData(:, idx);
        
        x = bytesToDec(currentPart(x_idx));
        y = bytesToDec(currentPart(y_idx));
        z = bytesToDec(currentPart(z_idx));
        
        xyzPoints(idx,:) = [x y z];
    end

    if i == 250
        xyzCoords = points;
        isValid = true;

        % Reset parameters
        points = single(zeros(96*250,3));
        i = 1;
    else
        points((i-1)*96+1:(i-1)*96+96,:) = xyzPoints;
        i = i + 1; 

        xyzCoords = single([]);
        isValid = false;
    end
        
    

end
    