function [xyzCoords,xyzIntensity,isValid] = Avia_parsing_triple(packet,reset_flag)
    
    % Initialize of persistent parameters
    persistent points
    persistent i
    persistent Intensity
    
    numPacket = 266; 
    %50
    if isempty(points) || reset_flag == 0
        points = single(zeros(90*numPacket,3));
        Intensity = single(zeros(90*numPacket,1));
        i = 1;
    end
    

    xyzPoints = single(zeros(90, 3));
    xyzReflect = single(zeros(90,1));

    % Cartesian coordinate data is 19:end size"[1x1344]
    xyzPointsPacket = packet(19:end);
    
    % Precompute the indices for faster access
    x_idx = 1:4;
    y_idx = 5:8;
    z_idx = 9:12;
    I_idx = 13;

    % Extract x, y, z coordinates
    x = zeros(90, 1);
    y = zeros(90, 1);
    z = zeros(90, 1);
    I = zeros(90, 1);

    for k = 1:90
        x(k) = bytesToDec(xyzPointsPacket(x_idx(1)+(k-1)*14:x_idx(end)+(k-1)*14));
        y(k) = bytesToDec(xyzPointsPacket(y_idx(1)+(k-1)*14:y_idx(end)+(k-1)*14));
        z(k) = bytesToDec(xyzPointsPacket(z_idx(1)+(k-1)*14:z_idx(end)+(k-1)*14));
        I(k) = xyzPointsPacket(I_idx+(k-1)*14);
    end
    
    xyzPoints(:,1) = x;
    xyzPoints(:,2) = y;
    xyzPoints(:,3) = z;
    xyzReflect(:,1) = I;

    if i == numPacket
        xyzCoords = points;
        isValid = true;
        xyzIntensity = Intensity;

        % Reset parameters
        points = single(zeros(90*numPacket,3));
        Intensity = single(zeros(90*numPacket,1));
        i = 1;
    else
        points((i-1)*90+1:(i-1)*90+90,:) = xyzPoints;
        Intensity((i-1)*90+1:(i-1)*90+90,:) = xyzReflect;
        i = i + 1; 

        xyzCoords = single([]);
        xyzIntensity = single([]);
        isValid = false;
    end
        
end
    