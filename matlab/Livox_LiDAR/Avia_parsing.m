function [xyzCoords,isValid] = Avia_parsing(packet,reset_flag)
    
    % Initialize of persistent parameters
    persistent points
    persistent i

    if isempty(points) || reset_flag == 0
        points = single(zeros(96*50,3));
        i = 1;
    end
    

    xyzPoints = single(zeros(96, 3));
 
    % Cartesian coordinate data is 19:end size"[1x1344]
    xyzPointsPacket = packet(19:end);
    
    % 96 data consists of 14 bytes
    
    % Precompute the indices for faster access
    x_idx = 1:4;
    y_idx = 5:8;
    z_idx = 9:12;
    
    % Extract x, y, z coordinates
    x = zeros(96, 1);
    y = zeros(96, 1);
    z = zeros(96, 1);
    
    for k = 1:96
        x(k) = bytesToDec(xyzPointsPacket(x_idx(1)+(k-1)*14:x_idx(end)+(k-1)*14));
        y(k) = bytesToDec(xyzPointsPacket(y_idx(1)+(k-1)*14:y_idx(end)+(k-1)*14));
        z(k) = bytesToDec(xyzPointsPacket(z_idx(1)+(k-1)*14:z_idx(end)+(k-1)*14));
    end
    
    xyzPoints(:,1) = x;
    xyzPoints(:,2) = y;
    xyzPoints(:,3) = z;

    if i == 50
        xyzCoords = points;
        isValid = true;

        % Reset parameters
        points = single(zeros(96*50,3));
        i = 1;
    else
        points((i-1)*96+1:(i-1)*96+96,:) = xyzPoints;
        i = i + 1; 

        xyzCoords = single([]);
        isValid = false;
    end
        
 
end
    