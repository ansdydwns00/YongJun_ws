function xyzPoints = ptCloud_extract(payload,top_bottom_flag)
    
    % Lower Frame
    elevation_angle_down = [-4.84375,-4.21875,-3.59375,-2.96875,-2.34375,-1.71875,-1.09375,-0.46875,0.15625,0.78125,1.40625,2.03125,2.65625,3.28125,3.90625,4.53125];

    % Upper Frame
    elevation_angle_up = [-4.53125,-3.90625,-3.28125,-2.65625,-2.03125,-1.40625,-0.78125,-0.15625,0.46875,1.09375,1.71875,2.34375,2.96875,3.59375,4.21875,4.84375];

    % To check the Upper(1) or Lower frames(0)
    if top_bottom_flag == 0 
        elevation = elevation_angle_down;
    else
        elevation = elevation_angle_up;
    end

    % Apply azimuth offset to calculate precise azimuth
    precision_azimuth = [-0.038388791, -0.104694693,-0.00523584, -0.071541742];


    % Values for azimuth (3 echo mode)
    azimuth_data = single(zeros(1,8));
    for i = 0:3:21  
        azimuth = [payload(i*54+3) payload(i*54+4) payload(i*54+5) payload(i*54+6)];
        delta = (2^0)*azimuth(1) + (2^8)*azimuth(2) + (2^16)*azimuth(3) + (2^24)*azimuth(4);

        if delta > intmax('int32')
            azimuth = ((2^0)*azimuth(1) + (2^8)*azimuth(2) - 65535)/1000;
        else
            azimuth = ((2^0)*azimuth(1) + (2^8)*azimuth(2) + (2^16)*azimuth(3) + (2^24)*azimuth(4))/1000;
        end
        azimuth_data(i/3+1) = azimuth; 
    end


    % ToF for azimuth [8*16]
    ToF = single(zeros(1,128));
    for i = 0:7
        for j = 0:3:45
            ToF(i*16+j/3+1) = ((2^0)*payload(i*54*3+7+j) + (2^8)*payload(i*54*3+8+j))/256;
        end
    end

    % i = 0:127;
    % % Intensity 
    % Intensity = single(zeros(128,1));
    % Intensity = payload(9+i*3+(floor(i/16)*114));

    % Rearrangement ToF [16 x 8] 
    ToF = reshape(ToF,16,[]);   

    % Finding coordinates [x,y,z]
    xyzPoints = single(zeros(128,3));
    for i = 1:8
        for j = 0:15
            z = ToF(j+1,i) * sin(deg2rad(elevation(j+1)));
            xy = ToF(j+1,i) * cos(deg2rad(elevation(j+1)));

            x = xy * cos(deg2rad(azimuth_data(i) + precision_azimuth(floor(j/4)+1)));
            y = xy * sin(deg2rad(azimuth_data(i) + precision_azimuth(floor(j/4)+1)));

            xyzPoints((i-1)*16+j+1,:) = [single(x) single(y) single(z)];
        end
    end
    
end
