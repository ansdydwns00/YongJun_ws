function vertices = helperDrawCuboid(ax, cuboids, color,modelInfo,velInfo,orientInfo)
    
    

    if isempty(orientInfo) || isempty(modelInfo) || (length(cuboids) ~= length(modelInfo.Distance))
        return;
    end
    
    % VelInfo flag and Rotation matrix cache 
    hasVelInfo = ~isempty(velInfo) && (size(velInfo, 1) == size(cuboids, 1));
    RxCache = zeros(3, 3, size(cuboids, 1));
    RyCache = zeros(3, 3, size(cuboids, 1));
    RzCache = zeros(3, 3, size(cuboids, 1));
    
    % Calculation Rotation matrix
    for i = 1:size(cuboids, 1)
        x_rot = cuboids{i}.Orientation(1);
        y_rot = cuboids{i}.Orientation(2);
        z_rot = cuboids{i}.Orientation(3);

        RxCache(:, :, i) = [1 0 0; 0 cosd(x_rot) -sind(x_rot); 0 sind(x_rot) cosd(x_rot)];
        RyCache(:, :, i) = [cosd(y_rot) 0 sind(y_rot); 0 1 0; -sind(y_rot) 0 cosd(y_rot)];
        RzCache(:, :, i) = [cosd(z_rot) -sind(z_rot) 0; sind(z_rot) cosd(z_rot) 0; 0 0 1];
    end

    for i = 1:size(cuboids, 1)
        cuboid = cuboids{i};
        dist = modelInfo.Distance(i);
        id = modelInfo.ID{i};
        class = modelInfo.Class{i};

        % Cuboid center and length
        x_ctr = cuboid.Center(1);
        y_ctr = cuboid.Center(2);
        z_ctr = cuboid.Center(3);
        x_len = cuboid.Dimensions(1);
        y_len = cuboid.Dimensions(2);
        z_len = cuboid.Dimensions(3);

        % Vertex calculation
        vertices = [x_len/2, -y_len/2, z_len/2;
                    x_len/2, y_len/2, z_len/2;
                    -x_len/2, y_len/2, z_len/2;
                    -x_len/2, -y_len/2, z_len/2;
                    x_len/2, -y_len/2, -z_len/2;
                    x_len/2, y_len/2, -z_len/2;
                    -x_len/2, y_len/2, -z_len/2;
                    -x_len/2, -y_len/2, -z_len/2];

        % Apply rotation matrix
        R = RzCache(:, :, i) * RyCache(:, :, i) * RxCache(:, :, i);
        vertices = (R * vertices')';

        % Translation to original location
        vertices = vertices + [x_ctr, y_ctr, z_ctr];
        
        % Index of the line connecting the vertices
        edges = [1,2; 2,3; 3,4; 4,1;    % up side
                 5,6; 6,7; 7,8; 8,5;    % down side
                 1,5; 2,6; 3,7; 4,8];   % col

        % Draw cuboid model using line
        for j = 1:size(edges, 1)
            line(ax, 'XData', vertices(edges(j,:), 1), ...
                     'YData', vertices(edges(j,:), 2), ...
                     'ZData', vertices(edges(j,:), 3), 'Color', color, 'Linewidth', 1);
        end
        
        % Notation distance and velocity
        topCenter = [mean(vertices(1:4, 1)), mean(vertices(1:4, 2)), max(vertices(1:4, 3))];
        textData = {"ID: " + id, "Cls: " + class, "Dist: " + num2str(round(dist, 2)) + "m"};
        

        line(ax, 'XData', [0, 0.2],'YData', [0, 0],'Color', 'r', 'LineWidth', 1);
    
        line(ax, 'XData', [0, 0],'YData', [0, 0.2],'Color', 'g', 'LineWidth', 1);
    
        line(ax, 'XData', [0, 0],'YData', [0 0],'ZData', [0.2, 0], 'Color', 'b', 'LineWidth', 1);
        
        
        if hasVelInfo
            vx = velInfo(i, 1);
            vy = velInfo(i, 2);
            vel = floor(sqrt(vx^2 + vy^2) * 10) / 10;
            textData{end+1} = "Vel: " + vel + "m/s";

            text(ax,[topCenter(1),      topCenter(1),       topCenter(1),                           topCenter(1)],...
                    [topCenter(2),      topCenter(2),       topCenter(2),                           topCenter(2)],...
                    [topCenter(3)+0.6,  topCenter(3)+0.4,   topCenter(3)+0.2,                       topCenter(3)],...
                     textData,...
                     'HorizontalAlignment', 'center',...
                     'VerticalAlignment', 'bottom', ...
                     'Color', 'white',...
                     'FontSize', 6,...
                     'FontWeight', 'bold');

            theta = atan2(orientInfo(i, 2), orientInfo(i, 1));
            if theta ~= 0
                arrowLength = 0.8;
                arrowHeadLength = 0.1;

                x_end = x_ctr + arrowLength * cos(theta);
                y_end = y_ctr + arrowLength * sin(theta);

                theta_r = theta + pi/4;
                theta_l = theta - pi/4;

                x_end_r = x_end - arrowHeadLength * cos(theta_r);
                y_end_r = y_end - arrowHeadLength * sin(theta_r);

                x_end_l = x_end - arrowHeadLength * cos(theta_l);
                y_end_l = y_end - arrowHeadLength * sin(theta_l);

                line(ax, 'XData', [x_ctr, x_end], ...
                         'YData', [y_ctr, y_end], ...
                         'ZData', [z_ctr, z_ctr], ...
                         'Color', 'r', 'LineWidth', 1, 'LineStyle', ':');

                line(ax, 'XData', [x_end, x_end_r], ...
                         'YData', [y_end, y_end_r], ...
                         'ZData', [z_ctr, z_ctr], ...
                         'Color', 'r', 'LineWidth', 1, 'LineStyle', ':');

                line(ax, 'XData', [x_end, x_end_l], ...
                         'YData', [y_end, y_end_l], ...
                         'ZData', [z_ctr, z_ctr], ...
                         'Color', 'r', 'LineWidth', 1, 'LineStyle', ':');
            end

        else
            text(ax,[topCenter(1),       topCenter(1),       topCenter(1)],...
                    [topCenter(2),       topCenter(2),       topCenter(2)],...
                    [topCenter(3)+0.4,   topCenter(3)+0.2,   topCenter(3)],...
                     textData,...
                     'HorizontalAlignment', 'center',...
                     'VerticalAlignment', 'bottom', ...
                     'Color', 'white',...
                     'FontSize', 6,...
                     'FontWeight', 'bold');
        end
       
    end
end
%% 

% 
% % % % 
% figure; pcshow(ptCloud);
% hold on
% for j = 1:size(edges, 1)
%             line('XData', vertices(edges(j,:), 1), ...
%                      'YData', vertices(edges(j,:), 2), ...
%                      'ZData', vertices(edges(j,:), 3), 'Color', color, 'Linewidth', 1);
% end
% 
% 
%         line( 'XData', [0, 0.2], ...
%                          'YData', [0, 0], ...
%                          'Color', 'r', 'LineWidth', 1);
% 
%         line('XData', [0, 0], ...
%                          'YData', [0, 0.2], ...
%                          'Color', 'r', 'LineWidth', 1);
% textData = {"Dist: " + num2str(round(dist, 2)) + "m"};
% text([topCenter(1)],...
%         [topCenter(2)],...
%         [topCenter(3)],...
%                      textData,...
%                      'HorizontalAlignment', 'center',...
%                      'VerticalAlignment', 'bottom', ...
%                      'Color', 'white',...
%                      'FontSize', 7,...
%                      'FontWeight', 'bold');
% scatter3(a(1),a(2),a(3),'filled','o','MarkerFaceColor','y')