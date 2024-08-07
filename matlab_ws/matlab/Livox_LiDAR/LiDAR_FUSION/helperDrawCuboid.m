function helperDrawCuboid(ax, cuboids, color, dists, Ids, Cls)

    % 각 cuboid에 대해 반복
    for i = 1:size(cuboids, 1)

        cuboid = cuboids(i, :);
        dist = dists(i);
        id = Ids{i};
        class = Cls{i};

        % Cuboid [x, y, z, length, width, height]
        x = cuboid(1);
        y = cuboid(2);
        z = cuboid(3);
        l = cuboid(4);
        w = cuboid(5);
        h = cuboid(6);
        xr = cuboid(7);
        yr = cuboid(8);
        zr = cuboid(9);


   % 
   %         v(4)        v(3)
   %         /-----------/                            z
   %        /|    v(2)  /|                            |
   %  (v1) /-----------/ |                            |
   %       | |        |  |                            |
   %       | | (v8)   |  |                           / -------y
   %       |/ --------|-/ (v7)                      /  
   %  (v5) |----------|/ (v6)                      x 
   % 

        % Compute vertices
        vertices = [x+l/2, y-w/2, z+h/2;                % front left up 
                    x+l/2, y+w/2, z+h/2;                % front right up 
                    x-l/2, y+w/2, z+h/2;                % back right up  
                    x-l/2, y-w/2, z+h/2;                % back left up   
                    x+l/2, y-w/2, z-h/2;                % front left down
                    x+l/2, y+w/2, z-h/2;                % front right down
                    x-l/2, y+w/2, z-h/2;                % back right down
                    x-l/2, y-w/2, z-h/2];               % back left down
        

        % Translate vertices to the origin
        vertices = vertices - [x, y, z];

        % Create rotation matrices
        Rx = [1 0 0; 0 cosd(xr) -sind(xr); 0 sind(xr) cosd(xr)];
        Ry = [cosd(yr) 0 sind(yr); 0 1 0; -sind(yr) 0 cosd(yr)];
        Rz = [cosd(zr) -sind(zr) 0; sind(zr) cosd(zr) 0; 0 0 1];

        % Combine rotation matrices
        R = Rz * Ry * Rx;

        % Apply rotation to vertices
        for j = 1:size(vertices, 1)
            vertices(j, :) = (R * vertices(j, :)')';
        end

        % Translate vertices back to the original location
        vertices = vertices + [x, y, z];
        

        % Index of the line connecting the vertices
        edges = [1,2; 2,3; 3,4; 4,1;    % up side
                 5,6; 6,7; 7,8; 8,5;    % down side
                 1,5; 2,6; 3,7; 4,8];   % col
        
       
        % Draw cuboid model using line
        for j = 1:size(edges,1)
            line(ax, 'XData', vertices(edges(j,:),1), ...
                     'YData', vertices(edges(j,:),2), ...
                     'ZData', vertices(edges(j,:),3), 'Color', color,'Linewidth',1);
        end

        % Notation distance
        topCenter = [mean(vertices(1:4,1)), mean(vertices(1:4,2)), max(vertices(1:4,3))];
        text(ax,[topCenter(1), topCenter(1), topCenter(1)],...
                [topCenter(2), topCenter(2), topCenter(2)],...
                [topCenter(3)+0.6, topCenter(3)+0.3, topCenter(3)],...
                {"ID: "+id, "Cls: "+class, num2str(round(dist,2))+"m"},...
                 'HorizontalAlignment', 'center',...
                 'VerticalAlignment', 'bottom', ...
                 'Color', 'white',...
                 'FontSize', 8,...
                 'FontWeight', 'bold');
    end


end
