function sorted_points = pointSort(xyzPoints)

    % 각도 계산
    angles = atan2(xyzPoints(:,2), xyzPoints(:,1));

    % 각도로 정렬
    [~, idx] = sort(angles);
    sorted_points = xyzPoints(idx, :);

    % mxnx3 행렬 생성
    sorted_points = reshape(sorted_points, 32,[],3);

end