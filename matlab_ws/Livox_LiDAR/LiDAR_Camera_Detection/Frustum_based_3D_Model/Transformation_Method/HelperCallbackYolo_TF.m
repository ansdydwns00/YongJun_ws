function HelperCallbackYolo_TF(msg)
   
    % global g_id
    % global g_cls
    global g_bboxes


    % g_id = {};
    % g_cls = {};
    g_bboxes = [];

    % bounding box info
    for idx = 1:length(msg.detections)
        x = msg.detections(idx).bbox.center.position.x;
        y = msg.detections(idx).bbox.center.position.y;
        w = msg.detections(idx).bbox.size.x;
        h = msg.detections(idx).bbox.size.y;
        
        % Bounding box info
        bbox = [x-w/2, y-h/2, w, h];
        g_bboxes(idx,:) = bbox;

        % Tracker id info 
        % g_id{idx} = msg.detections(idx).id;

        % Object info
        % g_cls{idx} = msg.detections(idx).class_name;     
    end

    
end