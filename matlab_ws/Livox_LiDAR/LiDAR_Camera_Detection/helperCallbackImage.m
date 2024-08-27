function helperCallbackImage(msg)
    
    
    global g_img

    g_img = [];

    g_img = rosReadImage(msg);
    
    % if ~isempty(g_img)
    %     toc
    % end
end