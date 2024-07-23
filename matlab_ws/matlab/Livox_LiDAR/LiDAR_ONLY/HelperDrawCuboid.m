function HelperDrawCuboid(varargin)
% varargin{1} : player.Axes
% varargin{2} : bboxes
% varargin{3} : distance
% varargin{4} : id
% varargin{5} : class

    % not include class,id
    if nargin < 4

        % 각 cuboid에 대해 반복
        for i = 1:size(varargin{2}, 1)
    
            cuboid = varargin{2}(i, :);
            dist = varargin{3}(i);

            % Cuboid [x, y, z, length, width, height]
            x_c = cuboid(1);
            y_c = cuboid(2);
            z_c = cuboid(3);
            x_l = cuboid(4);
            y_l = cuboid(5);
            z_l = cuboid(6);
    
            % Compute vertices
            vertices = [x_c+x_l/2, y_c-y_l/2, z_c+z_l/2;                % front left up 
                        x_c+x_l/2, y_c+y_l/2, z_c+z_l/2;                % front right up 
                        x_c-x_l/2, y_c+y_l/2, z_c+z_l/2;                % back right up  
                        x_c-x_l/2, y_c-y_l/2, z_c+z_l/2;                % back left up   
                        x_c+x_l/2, y_c-y_l/2, z_c-z_l/2;                % front left down
                        x_c+x_l/2, y_c+y_l/2, z_c-z_l/2;                % front right down
                        x_c-x_l/2, y_c+y_l/2, z_c-z_l/2;                % back right down
                        x_c-x_l/2, y_c-y_l/2, z_c-z_l/2];               % back left down
    
            % Index of the line connecting the vertices
            edges = [1,2; 2,3; 3,4; 4,1;    % up side
                     5,6; 6,7; 7,8; 8,5;    % down side
                     1,5; 2,6; 3,7; 4,8];   % col
    
            % Draw cuboid model using line
            for j = 1:size(edges,1)
                line(ax, 'XData', vertices(edges(j,:),1), ...
                         'YData', vertices(edges(j,:),2), ...
                         'ZData', vertices(edges(j,:),3), 'Color', 'red','Linewidth',1);
            end
    
            % Notation distance
            topCenter = [mean(vertices(1:4,1)), mean(vertices(1:4,2)), max(vertices(1:4,3))];
            text(ax,[topCenter(1), topCenter(1), topCenter(1)],{num2str(round(dist,2))+"m"},...
                     'HorizontalAlignment', 'center',...
                     'VerticalAlignment', 'bottom', ...
                     'Color', 'white',...
                     'FontSize', 8,...
                     'FontWeight', 'bold');
        end

    % include class, id
    else
         % 각 cuboid에 대해 반복
        for i = 1:size(varargin{2}, 1)

            cuboid = varargin{2}(i, :);
            dist = varargin{3}(i);
            id = varargin{4}(i);
            class = varargin{5}(i);

            % Cuboid [x, y, z, length, width, height]
            x_c = cuboid(1);
            y_c = cuboid(2);
            z_c = cuboid(3);
            x_l = cuboid(4);
            y_l = cuboid(5);
            z_l = cuboid(6);

            % Compute vertices
            vertices = [x_c+x_l/2, y_c-y_l/2, z_c+z_l/2;                % front left up 
                        x_c+x_l/2, y_c+y_l/2, z_c+z_l/2;                % front right up 
                        x_c-x_l/2, y_c+y_l/2, z_c+z_l/2;                % back right up  
                        x_c-x_l/2, y_c-y_l/2, z_c+z_l/2;                % back left up   
                        x_c+x_l/2, y_c-y_l/2, z_c-z_l/2;                % front left down
                        x_c+x_l/2, y_c+y_l/2, z_c-z_l/2;                % front right down
                        x_c-x_l/2, y_c+y_l/2, z_c-z_l/2;                % back right down
                        x_c-x_l/2, y_c-y_l/2, z_c-z_l/2];               % back left down

            % Index of the line connecting the vertices
            edges = [1,2; 2,3; 3,4; 4,1;    % up side
                     5,6; 6,7; 7,8; 8,5;    % down side
                     1,5; 2,6; 3,7; 4,8];   % col

            % Draw cuboid model using line
            for j = 1:size(edges,1)
                line(ax, 'XData', vertices(edges(j,:),1), ...
                         'YData', vertices(edges(j,:),2), ...
                         'ZData', vertices(edges(j,:),3), 'Color', 'red','Linewidth',1);
            end

            % Notation distance
            topCenter = [mean(vertices(1:4,1)), mean(vertices(1:4,2)), max(vertices(1:4,3))];
            text(ax,[topCenter(1), topCenter(1), topCenter(1)],...
                    [topCenter(2), topCenter(2), topCenter(2)],...
                    [topCenter(3)+0.6, topCenter(3)+0.3, topCenter(3)],...
                    {"ID: " + id, "Cls: " + class, num2str(round(dist,2)) + "m"},...
                     'HorizontalAlignment', 'center',...
                     'VerticalAlignment', 'bottom', ...
                     'Color', 'white',...
                     'FontSize', 8,...
                     'FontWeight', 'bold');
        end

    end
end
