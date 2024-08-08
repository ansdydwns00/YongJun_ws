function cuboidInfo = getCuboidInfo(bboxesLidar)
    
    % [cen_x,cen_y,cen_z,len_x,len_y,len_z]
    cuboidInfo = [bboxesLidar(:,1), bboxesLidar(:,2), bboxesLidar(:,3), bboxesLidar(:,4), bboxesLidar(:,5), bboxesLidar(:,6)];

end