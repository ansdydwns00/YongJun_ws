function [xyzPoints,Intensity] = ptCloud_extract_vector_Intensity(payload,top_bottom_flag)

    % Lower Frame
    elevation_angle_down = [-4.84375,-4.21875,-3.59375,-2.96875,-2.34375,-1.71875,-1.09375,-0.46875,0.15625,0.78125,1.40625,2.03125,2.65625,3.28125,3.90625,4.53125]';

    % Upper Frame
    elevation_angle_up = [-4.53125,-3.90625,-3.28125,-2.65625,-2.03125,-1.40625,-0.78125,-0.15625,0.46875,1.09375,1.71875,2.34375,2.96875,3.59375,4.21875,4.84375]';

    % To check the Upper(1) or Lower frames(0)
    if top_bottom_flag == 0 
        elevation = elevation_angle_down;
    else
        elevation = elevation_angle_up;
    end

    % Apply azimuth offset to calculate precise azimuth
    precision_azimuth = [-0.038388791, -0.104694693,-0.00523584, -0.071541742]';


    % Values for azimuth (3 echo mode)
    azimuth_data = single(zeros(8,1));
    i = 0:3:21;
    azimuth = [payload(i*54+3) (2^8)*payload(i*54+4) (2^16)*payload(i*54+5) (2^24)*payload(i*54+6)];
    ind = sum(azimuth,2)<=intmax('int32');
    azimuth_data(~ind) = (sum(azimuth(~ind,1:2),2)-65535)/1000;
    azimuth_data(ind) = sum(azimuth(ind,:),2)/1000;


    % ToF for azimuth [24*16]
    ToF = single(zeros(128,1));
    i = 0:127;
    ToF = (payload(7+i*3+(floor(i/16)*114))+(2^8)*payload(8+i*3+(floor(i/16)*114)))/256;
    Intensity = payload(9+i*3+(floor(i/16)*114));

    % Finding coordinates [x,y,z]
    xyzPoints = single(zeros(128,3));
    i = 1:128;
    z = ToF .* sin(deg2rad(elevation(rem(i-1,16)+1)));
    xy = ToF .* cos(deg2rad(elevation(rem(i-1,16)+1)));
    ang = deg2rad(azimuth_data(ceil(i/16)) + precision_azimuth(ceil((rem(i-1,16)+1)/4)));
    x = xy .* cos(ang);
    y = xy .* sin(ang);
    xyzPoints = [x y z];
end