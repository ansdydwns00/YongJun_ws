function deleteCuboid(ax)
    % Axes 객체에서 모든 선 객체 찾기
    lines = findall(ax, 'Type', 'line');
    
    % 특정 조건을 만족하는 선 삭제
    for i = 1:length(lines)
        if lines(i).Color == [1, 0, 0] % 예: 빨간색 선만 삭제
            delete(lines(i));
        end
    end

end