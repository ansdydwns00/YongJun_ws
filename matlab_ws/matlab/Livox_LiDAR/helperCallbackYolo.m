function [bboxes_tmp,id_tmp,cls_tmp] = helperCallbackYolo(src,msg)
   
    global bboxes_tmp id_tmp cls_tmp
    
    bboxes_tmp = [];
    id_tmp = {};
    cls_tmp = {};

    % % bounding box info
    for idx = 1:length(src.detections)
        x = src.detections(idx).bbox.center.position.x;
        y = src.detections(idx).bbox.center.position.y;
        w = src.detections(idx).bbox.size.x;
        h = src.detections(idx).bbox.size.y;

        % Bounding box info
        bbox = [x-w/2, y-h/2, w, h];
        bboxes_tmp(idx,:) = bbox;

        % Tracker id info 
        id_tmp{idx} = src.detections(idx).class_id;

        % Object info
        cls_tmp{idx} = src.detections(idx).class_name;
    end

    
    
end