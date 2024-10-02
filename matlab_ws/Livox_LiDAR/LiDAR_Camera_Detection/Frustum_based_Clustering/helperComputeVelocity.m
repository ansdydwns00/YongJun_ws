function [VelocityInfo,OrientInfo,vel_flag] = helperComputeVelocity(modelInfo, vehiclePose)
 
    persistent prev_detect
    persistent prev_pose

    if isempty(prev_detect)
        prev_detect = struct([]);
        prev_pose = zeros(0,3);
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
            prev_pose = vehiclePose;
        else
            
            theta = vehiclePose(3) - prev_pose(3);
            
            R = [cos(theta), -sin(theta), 0;
                 sin(theta),  cos(theta), 0;
                 0,           0,          1];
            
            T = [vehiclePose(1)-prev_pose(1), vehiclePose(2)-prev_pose(2), vehiclePose(3)-prev_pose(3)];

            A = [R, T';
                 0, 0, 0, 1];
            
            % inv_R = R';
            % inv_T = -inv_R * T';
            % int_A = [inv_R, inv_T;
            %          0, 0, 0, 1];

            for i = 1:size(modelInfo.Distance,1)
                cnt = 0;
                for j = 1:size(prev_detect.Distance,1)
                    if strcmp(modelInfo.ID{i}, prev_detect.ID{j}) && ~isempty(modelInfo.BoxMean) && ~isempty(prev_detect.BoxMean)
                        
                        prev_BoxMean = A * [modelInfo.BoxMean(i,1),modelInfo.BoxMean(i,2),modelInfo.BoxMean(i,3),1]';
                        prev_BoxCenter = A * [modelInfo.BoxCenter(i,1),modelInfo.BoxCenter(i,2),modelInfo.BoxCenter(i,3),1]';

                        curr_x = prev_BoxMean(1);
                        curr_y = prev_BoxMean(2);
                        
                        prev_x = prev_detect.BoxMean(j,1);
                        prev_y = prev_detect.BoxMean(j,2);
                        
                        % fprintf("%f %f,   %f %f\n",curr_x,curr_y,prev_x,prev_y);
                        
                        Cx = curr_x - prev_x;
                        Cy = curr_y - prev_y;

                        vx = abs(Cx)/(1/15);
                        vy = abs(Cy)/(1/15);

                        VelocityInfo = [VelocityInfo; [vx,vy]];

                        prev_cuboid = [prev_detect.BoxCenter(j,:), prev_detect.BoxSize(j,:), prev_detect.BoxMean(j,:)];
                        curr_cuboid = [[prev_BoxCenter(1),prev_BoxCenter(2),prev_BoxCenter(3)],modelInfo.BoxSize(i,:),[prev_BoxMean(1),prev_BoxMean(2),prev_BoxMean(3)]];
                        [dx,dy] = helperComputeOrientation(prev_cuboid,curr_cuboid,Cx,Cy);
                        OrientInfo = [OrientInfo; [dx,dy]];
                        
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
            prev_pose = vehiclePose;
            vel_flag = true;
        end
    end
end