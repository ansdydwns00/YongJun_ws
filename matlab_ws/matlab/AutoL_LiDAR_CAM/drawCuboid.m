function drawCuboid(ax, cuboid, color, dist, Id)

    % Cuboid  [x, y, z, length, width, height]
    x = cuboid(1);
    y = cuboid(2);
    z = cuboid(3);
    % l = cuboid(4);
    % w = cuboid(5);
    % h = cuboid(6);
    l = 0.5;    % fix length
    w = 0.5;    % fix width    
    h = 1;      % fix height

    % Compute vertices
    vertices = [x+l/2, y-w/2, z+h/2;                % front left up 
                x+l/2, y+w/2, z+h/2;                % front right up 
                x-l/2, y+w/2, z+h/2;                % back right up  
                x-l/2, y-w/2, z+h/2;                % back left up   
                x+l/2, y-w/2, z-h/2;                % front left down
                x+l/2, y+w/2, z-h/2;                % front right down
                x-l/2, y+w/2, z-h/2;                % back right down
                x-l/2, y-w/2, z-h/2];               % back left down

    % Index of the line connecting the vertices
    edges = [1,2; 2,3; 3,4; 4,1;    % up side
             5,6; 6,7; 7,8; 8,5;    % down side
             1,5; 2,6; 3,7; 4,8];   % col

    % Draw cuboid model using line
    for i = 1:size(edges,1)
        line(ax, 'XData', vertices(edges(i,:),1), ...
                 'YData', vertices(edges(i,:),2), ...
                 'ZData', vertices(edges(i,:),3),'Color', color);
    end
    
    % Notation distance
    topCenter = [mean(vertices(1:4,1)), mean(vertices(1:4,2)), max(vertices(1:4,3))];
    text(ax, topCenter(1), topCenter(2), topCenter(3), ['ID:' Id ' ' num2str(dist)], ...
         'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', ...
         'Color','white','FontSize',12,'FontWeight','bold');
end