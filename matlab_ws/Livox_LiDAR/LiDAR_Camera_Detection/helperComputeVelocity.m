function [VelocityInfo,OrientInfo,vel_flag] = helperComputeVelocity(modelInfo)
 
    persistent prev_detect

    if isempty(prev_detect)
        prev_detect = struct([]);
    end
    cnt = 0;

    isObjectDetected = ~isempty(modelInfo);
    VelocityInfo = zeros(0,2);
    OrientInfo = zeros(0,2);
    vel_flag = false;
    
    % Detect OK
    if isObjectDetected
        if isempty(prev_detect)
            prev_detect = modelInfo;
        else
            if size(prev_detect.Distance,1) >= size(modelInfo.Distance,1)
                for i = 1:size(modelInfo.Distance,1)
                    cnt = 0;
                    for j = 1:size(prev_detect.Distance,1)
                        if strcmp(modelInfo.ID{i}, prev_detect.ID{j})
                            curr_x = modelInfo.BoxCenter(i,1);
                            curr_y = modelInfo.BoxCenter(i,2);
                            
                            prev_x = prev_detect.BoxCenter(j,1);
                            prev_y = prev_detect.BoxCenter(j,2);
                            
                            dx = curr_x-prev_x;
                            dy = curr_y-prev_y;
                            OrientInfo = [OrientInfo; [dx,dy]];

                            vx = abs(curr_x-prev_x)/(1/15);
                            vy = abs(curr_y-prev_y)/(1/15);
                            VelocityInfo = [VelocityInfo; [vx,vy]];
                            
                            break;
                        else
                            cnt = cnt + 1;
                        end
                    end
                    if cnt == size(prev_detect.Distance,1)
                        VelocityInfo = [VelocityInfo; [0,0]];
                        OrientInfo = [OrientInfo; [0,0]];
                    end
                end
                prev_detect = modelInfo;
                vel_flag = true;
            else
                for i = 1:size(modelInfo.Distance,1)
                    cnt = 0;
                    for j = 1:size(prev_detect.Distance,1)
                        if strcmp(modelInfo.ID{i}, prev_detect.ID{j})
                            curr_x = modelInfo.BoxCenter(i,1);
                            curr_y = modelInfo.BoxCenter(i,2);
                            
                            prev_x = prev_detect.BoxCenter(j,1);
                            prev_y = prev_detect.BoxCenter(j,2);
                            
                            dx = curr_x-prev_x;
                            dy = curr_y-prev_y;
                            OrientInfo = [OrientInfo; [dx,dy]];

                            vx = abs(curr_x-prev_x)/(1/15);
                            vy = abs(curr_y-prev_y)/(1/15);
                            VelocityInfo = [VelocityInfo; [vx,vy]];
                          
                            break;
                        else
                            cnt = cnt + 1; 
                        end
                        
                    end
                    if cnt == size(prev_detect.Distance,1)
                         VelocityInfo = [VelocityInfo; [0,0]];
                         OrientInfo = [OrientInfo; [0,0]];
                    end
                end
                prev_detect = modelInfo;
                vel_flag = true;
            end
        end
    else
        % nothing 
    end
end