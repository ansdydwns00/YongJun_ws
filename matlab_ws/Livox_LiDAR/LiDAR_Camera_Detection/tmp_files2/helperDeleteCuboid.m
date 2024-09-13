function helperDeleteCuboid(ax)

    % Find all line & text objects in an Axes object
    lines = findall(ax, 'Type', 'line');
    texts = findall(ax, 'Type', 'text');

    % Delete lines &  text
    delete(lines);
    delete(texts); 
    
end