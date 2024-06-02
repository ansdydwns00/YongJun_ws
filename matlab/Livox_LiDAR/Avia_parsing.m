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
    
    for idx = 1:size(reshapedData,2)
        currentPart = reshapedData(:, idx);

        x_byte = currentPart(1:4);
        y_byte = currentPart(5:8);
        z_byte = currentPart(9:12); 
        
        x = bytesToDec(x_byte(1), x_byte(2), x_byte(3), x_byte(4));
        y = bytesToDec(y_byte(1), y_byte(2), y_byte(3), y_byte(4));
        z = bytesToDec(z_byte(1), z_byte(2), z_byte(3), z_byte(4));
        
        xyzPoints(idx,:) = [x y z];
    end

    if i == 250
        xyzCoords = points;
        isValid = true;

        % Initialize of parameters
        points = single(zeros(96*250,3));
        i = 1;
    else
        points((i-1)*96+1:(i-1)*96+96,:) = xyzPoints;
        i = i + 1; 

        xyzCoords = single([]);
        isValid = false;
    end
        
    

end
    