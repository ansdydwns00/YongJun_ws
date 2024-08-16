function I = insertTrackBoxes(I, tracks, positionSelector, fps)

    if isempty(tracks)
        % I = insertText(I,[1,1],sprintf("FPS %2.2f",fps),"FontSize",24,"BoxColor","white");
        return
    end

    % Allocate memory.
%     labels = cell(numel(tracks), 1);

    % Retrieve positions of bounding boxes.
    bboxes = getTrackPositions(tracks, positionSelector);
    
%     for i = 1:numel(tracks)        
%         box = bboxes(i, :);
%         
% %         Convert to vehicle coordinates using monoCamera object.
%         xyVehicle = imageToVehicle(sensor, [box(1)+box(3)/2, box(2)+box(4)]);
%         
%         labels{i} = sprintf('x=%.1f,y=%.1f',xyVehicle(1),xyVehicle(2));
%     end
    
%     I = insertObjectAnnotation(I, 'rectangle', bboxes, labels, 'Color', 'yellow', ...
%         'FontSize', 10, 'TextBoxOpacity', .8, 'LineWidth', 2);
      I = insertShape(I,"rectangle",bboxes,"LineWidth",2,"Color","red");
      % I = insertText(I,[1,1],sprintf("FPS %2.2f",fps),"FontSize",24,"BoxColor","white");
end