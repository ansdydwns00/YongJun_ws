function [frame] = preprocess(origin_img,infer_size)
%PREPROCESS Summary of this function goes here
%   Detailed explanation goes here
% origin_img = origin_img(:,1:1280,:);
I = imresize(origin_img,[infer_size,infer_size]);
frame = dlarray(single(I),"SSC");
% frame = gpuArray(frame);


end

