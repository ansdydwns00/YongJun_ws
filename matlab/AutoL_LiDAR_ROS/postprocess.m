function [s_box] = postprocess(classes,bboxes,origin_img,conf,model_name)
%POSTPROCESS Summary of this function goes here
%   Detailed explanation goes here

%% extract boxes
% dl detached.
classes = extractdata(classes);
classes = squeeze(classes);


if model_name == "damoyolo"
    %only damoyolo has separated data.
    bboxes = extractdata(bboxes);
    bboxes = squeeze(bboxes);

    % max confidence sort.
    [class_max,category] = max(classes,[],2);
    % NMS
    [s_box,s_score,s_class] = selectStrongestBboxMulticlass(bboxes,class_max,category,'NumStrongest',100);
    
    % conf sort.
    ind = find(s_score>conf);
    s_box = s_box(ind,:);
    % s_score = s_score(ind);
    % s_class = s_class(ind);
end



% resize & width height cal.
origin_size = size(origin_img);
ratio_width = origin_size(2) / 640;
ratio_height = origin_size(1) / 640;
s_box(:,[1 3]) = s_box(:,[1 3]) * ratio_width;
s_box(:,[2 4]) = s_box(:,[2 4]) * ratio_height;


%width height cal.
s_box(:,3) = s_box(:,3) - s_box(:,1);
s_box(:,4) = s_box(:,4) - s_box(:,2);



% detach & annotation add.
s_box = gather(s_box);
% s_score = string(gather(s_score));
% s_class = gather(s_class);
% class_k = class_list(s_class);
% origin_img = gather(origin_img);
% annotations = append(class_k," : ",s_score.');
% output = insertObjectAnnotation(origin_img,'rectangle',s_box,cellstr(annotations));

end

