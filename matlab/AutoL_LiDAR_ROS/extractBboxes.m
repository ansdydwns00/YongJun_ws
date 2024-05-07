function bboxes = extractBboxes(bboxData)
   
    % Detections의 길이로 메모리 공간을 미리 할당
    numBboxes = numel(bboxData);

    % 임시 저장 공간
    tmp_bboxs = zeros(numBboxes, 4);
    count = 0;

    for i = 1:numBboxes
        currentBbox = bboxData{i,1}.Measurement;
       
        x = currentBbox(1);
        y = currentBbox(2);
        w = currentBbox(3);
        h = currentBbox(4);
        
        count = count + 1;
        tmp_bboxs(count, :) = [x, y, w, h];
    end

    % 최종 결과
    bboxes = tmp_bboxs(1:count, :);
end