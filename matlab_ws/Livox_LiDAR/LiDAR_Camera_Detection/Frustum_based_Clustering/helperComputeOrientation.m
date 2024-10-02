function [dx,dy] = helperComputeOrientation(prev_cuboid,curr_cuboid,Cx,Cy)

    % Extract prev cuboid parameters
    prev_x_ctr = prev_cuboid(1); 
    prev_y_ctr = prev_cuboid(2); 
    prev_z_ctr = prev_cuboid(3);
    
    prev_x_len = prev_cuboid(4); 
    prev_y_len = prev_cuboid(5); 
    prev_z_len = prev_cuboid(6);

    % Extract current cuboid parameters
    curr_x_ctr = curr_cuboid(1); 
    curr_y_ctr = curr_cuboid(2); 
    curr_z_ctr = curr_cuboid(3);

    curr_x_len = curr_cuboid(4); 
    curr_y_len = curr_cuboid(5); 
    curr_z_len = curr_cuboid(6);


    % Calculate the min and max coordinates for both cuboids in each axis
    x1_min = prev_x_ctr - prev_x_len/2; 
    x1_max = prev_x_ctr + prev_x_len/2;

    y1_min = prev_y_ctr - prev_y_len/2; 
    y1_max = prev_y_ctr + prev_y_len/2;

    z1_min = prev_z_ctr - prev_z_len/2; 
    z1_max = prev_z_ctr + prev_z_len/2;
    
    x2_min = curr_x_ctr - curr_x_len/2; 
    x2_max = curr_x_ctr + curr_x_len/2;

    y2_min = curr_y_ctr - curr_y_len/2; 
    y2_max = curr_y_ctr + curr_y_len/2;

    z2_min = curr_z_ctr - curr_z_len/2; 
    z2_max = curr_z_ctr + curr_z_len/2;

    % Find the overlap in each axis
    x_overlap = max(0, min(x1_max, x2_max) - max(x1_min, x2_min));
    y_overlap = max(0, min(y1_max, y2_max) - max(y1_min, y2_min));
    z_overlap = max(0, min(z1_max, z2_max) - max(z1_min, z2_min));

    % Compute the volume of the overlap
    overlap_volume = x_overlap * y_overlap * z_overlap;

    % Compute the volumes of the individual cuboids
    prev_volume = prev_x_len * prev_y_len * prev_z_len;
    curr_volume = curr_x_len * curr_y_len * curr_z_len;
    
    % Compute the total volume of the two cuboids combined (not overlapping)
    total_volume = prev_volume + curr_volume - overlap_volume;

    % Calculate the overlap ratio relative to the total volume
    overlap_ratio = overlap_volume / total_volume;
    
    if overlap_ratio*100 <= 40
        dx = Cx;
        dy = Cy;
    else
        dx = 0;
        dy = 0;
    end

end