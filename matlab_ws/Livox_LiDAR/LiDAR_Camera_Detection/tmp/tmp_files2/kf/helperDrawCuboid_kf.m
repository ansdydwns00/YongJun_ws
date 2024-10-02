function helperDrawCuboid_kf(ax, cuboids, color, dists, Ids, Cls, varargin)

    if nargin == 7
        if length(cuboids) == length(dists)
            % 각 cuboid에 대해 반복
            for i = 1:size(cuboids, 1)
        
                cuboid = cuboids{i};
                dist = dists(i);
                id = Ids{i};
                class = Cls{i};
                vel = varargin{1}(i);
        
                % Cuboid [x_ctr, y_ctr, z_ctr, x_len, y_len, z_len, x_rot, y_rot, z_rot]
                x_ctr = cuboid.Center(1);
                y_ctr = cuboid.Center(2);
                z_ctr = cuboid.Center(3);
                x_len = cuboid.Dimensions(1);
                y_len = cuboid.Dimensions(2);
                z_len = cuboid.Dimensions(3);
                x_rot = cuboid.Orientation(1);
                y_rot = cuboid.Orientation(2);
                z_rot = cuboid.Orientation(3);
        
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
                vertices = [x_ctr+x_len/2, y_ctr-y_len/2, z_ctr+z_len/2;                % front left up 
                            x_ctr+x_len/2, y_ctr+y_len/2, z_ctr+z_len/2;                % front right up 
                            x_ctr-x_len/2, y_ctr+y_len/2, z_ctr+z_len/2;                % back right up  
                            x_ctr-x_len/2, y_ctr-y_len/2, z_ctr+z_len/2;                % back left up   
                            x_ctr+x_len/2, y_ctr-y_len/2, z_ctr-z_len/2;                % front left down
                            x_ctr+x_len/2, y_ctr+y_len/2, z_ctr-z_len/2;                % front right down
                            x_ctr-x_len/2, y_ctr+y_len/2, z_ctr-z_len/2;                % back right down
                            x_ctr-x_len/2, y_ctr-y_len/2, z_ctr-z_len/2];               % back left down
                
        
                % Translate vertices to the origin
                vertices = vertices - [x_ctr, y_ctr, z_ctr];
        
                % Create rotation matrices
                Rx = [1 0 0; 0 cosd(x_rot) -sind(x_rot); 0 sind(x_rot) cosd(x_rot)];
                Ry = [cosd(y_rot) 0 sind(y_rot); 0 1 0; -sind(y_rot) 0 cosd(y_rot)];
                Rz = [cosd(z_rot) -sind(z_rot) 0; sind(z_rot) cosd(z_rot) 0; 0 0 1];
        
                % Combine rotation matrices
                R = Rz * Ry * Rx;
        
                % Apply rotation to vertices
                for j = 1:size(vertices, 1)
                    vertices(j, :) = (R * vertices(j, :)')';
                end
        
                % Translate vertices back to the original location
                vertices = vertices + [x_ctr, y_ctr, z_ctr];
                
        
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
                text(ax,[topCenter(1), topCenter(1), topCenter(1) topCenter(1)],...
                        [topCenter(2), topCenter(2), topCenter(2) topCenter(2)],...
                        [topCenter(3)+0.6, topCenter(3)+0.4, topCenter(3)+0.2 topCenter(3)],...
                        {"ID: "+id, "Cls: "+class, "Dist: "+num2str(round(dist,2))+"m","Vel: "+num2str(vel)+"m/s"},...
                         'HorizontalAlignment', 'center',...
                         'VerticalAlignment', 'bottom', ...
                         'Color', 'white',...
                         'FontSize', 6,...
                         'FontWeight', 'bold');
            end
        end
    else
        if length(cuboids) == length(dists)
            % 각 cuboid에 대해 반복
            for i = 1:size(cuboids, 1)
        
                cuboid = cuboids{i};
                dist = dists(i);
                id = Ids{i};
                class = Cls{i};
                
        
                % Cuboid [x_ctr, y_ctr, z_ctr, x_len, y_len, z_len, x_rot, y_rot, z_rot]
                x_ctr = cuboid.Center(1);
                y_ctr = cuboid.Center(2);
                z_ctr = cuboid.Center(3);
                x_len = cuboid.Dimensions(1);
                y_len = cuboid.Dimensions(2);
                z_len = cuboid.Dimensions(3);
                x_rot = cuboid.Orientation(1);
                y_rot = cuboid.Orientation(2);
                z_rot = cuboid.Orientation(3);
        
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
                vertices = [x_ctr+x_len/2, y_ctr-y_len/2, z_ctr+z_len/2;                % front left up 
                            x_ctr+x_len/2, y_ctr+y_len/2, z_ctr+z_len/2;                % front right up 
                            x_ctr-x_len/2, y_ctr+y_len/2, z_ctr+z_len/2;                % back right up  
                            x_ctr-x_len/2, y_ctr-y_len/2, z_ctr+z_len/2;                % back left up   
                            x_ctr+x_len/2, y_ctr-y_len/2, z_ctr-z_len/2;                % front left down
                            x_ctr+x_len/2, y_ctr+y_len/2, z_ctr-z_len/2;                % front right down
                            x_ctr-x_len/2, y_ctr+y_len/2, z_ctr-z_len/2;                % back right down
                            x_ctr-x_len/2, y_ctr-y_len/2, z_ctr-z_len/2];               % back left down
                
        
                % Translate vertices to the origin
                vertices = vertices - [x_ctr, y_ctr, z_ctr];
        
                % Create rotation matrices
                Rx = [1 0 0; 0 cosd(x_rot) -sind(x_rot); 0 sind(x_rot) cosd(x_rot)];
                Ry = [cosd(y_rot) 0 sind(y_rot); 0 1 0; -sind(y_rot) 0 cosd(y_rot)];
                Rz = [cosd(z_rot) -sind(z_rot) 0; sind(z_rot) cosd(z_rot) 0; 0 0 1];
        
                % Combine rotation matrices
                R = Rz * Ry * Rx;
        
                % Apply rotation to vertices
                for j = 1:size(vertices, 1)
                    vertices(j, :) = (R * vertices(j, :)')';
                end
        
                % Translate vertices back to the original location
                vertices = vertices + [x_ctr, y_ctr, z_ctr];
                
        
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
                        [topCenter(3)+0.6, topCenter(3)+0.4, topCenter(3)+0.2],...
                        {"ID: "+id, "Cls: "+class, "Dist: "+num2str(round(dist,2))+"m"},...
                         'HorizontalAlignment', 'center',...
                         'VerticalAlignment', 'bottom', ...
                         'Color', 'white',...
                         'FontSize', 6,...
                         'FontWeight', 'bold');
            end
        end
    end
end
