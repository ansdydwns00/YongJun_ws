function Image = insertTrackBoxes(I, bbox, varargin)
    
    if nargin == 3
        labels = varargin{1};
    else
        labels = [];
    end

    colorMap = getColorMap(bbox);

    for i=1:size(bbox,1)
        box = bbox(i,:);
        if ~(isempty(box))
            if labels
                str = strcat(num2str(labels(i)), '');
            else
                str = 'Object';
            end
            Image = insertObjectAnnotation(I, "rectangle",box, str, 'Color', 255.*colorMap(i, :), 'FontSize', 40);
        end
    end 
end

function colorMap = getColorMap(labels)
    rng(1234)
    map = zeros(size(labels, 1), 3);
    for i = 1:size(labels, 1)
       map(i, :) = rand(1, 3);
    end
    colorMap = map;
end

