function drawCuboid(ax, cuboid, color)
    % cuboid는 [x, y, z, length, width, height] 형태의 벡터
    x = cuboid(1);
    y = cuboid(2);
    z = cuboid(3);
    l = cuboid(4);
    w = cuboid(5);
    h = cuboid(6);

    % 꼭짓점 계산
    vertices = [x+l/2, y-w/2, z+h/2;                % front left up 
                x+l/2, y+w/2, z+h/2;                % front right up 
                x-l/2, y+w/2, z+h/2;                % back right up  
                x-l/2, y-w/2, z+h/2;                % back left up   
                x+l/2, y-w/2, z-h/2;                % front left down
                x+l/2, y+w/2, z-h/2;                % front right down
                x-l/2, y+w/2, z-h/2;                % back right down
                x-l/2, y-w/2, z-h/2];               % back left down

    % 꼭짓점을 연결하는 선의 인덱스
    edges = [1,2; 2,3; 3,4; 4,1;    % up side
             5,6; 6,7; 7,8; 8,5;    % down side
             1,5; 2,6; 3,7; 4,8];   % col

    % 선 그리기
    for i = 1:size(edges,1)
        line(ax, 'XData', vertices(edges(i,:),1), ...
                 'YData', vertices(edges(i,:),2), ...
                 'ZData', vertices(edges(i,:),3),'Color', color);
    end
end