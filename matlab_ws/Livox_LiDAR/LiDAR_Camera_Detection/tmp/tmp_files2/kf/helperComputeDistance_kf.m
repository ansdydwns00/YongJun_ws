function [Distances, Velocity, Model, l_id, l_cls] = helperComputeDistance_kf(bboxes, l_id, l_cls, ptCld, cameraParams, CamToLidar, clusterThreshold, varargin)
    
    Distances = [];
    Velocity = [];

    Model = {};
    
    if nargin == 9
        
        if ~isempty(bboxes) && ~isempty(ptCld.Location)
             
            [bboxesLidar, indicies, bboxesUsed] = bboxCameraToLidar(bboxes, ptCld, cameraParams, CamToLidar, 'ClusterThreshold', clusterThreshold,'MaxDetectionRange',[3,70]);  
            
            % [0 0 0 0 0 0 0 0 0] value remove
            idx_del = all(bboxesLidar == 0, 2);
            bboxesLidar(idx_del,:) = [];
    
            indicies(~bboxesUsed,:) = [];
            l_id(~bboxesUsed') = [];
            l_cls(~bboxesUsed') = [];
            varargin{1}(~bboxesUsed,:) = [];
            varargin{2}(~bboxesUsed,:) = [];
            
            % fprintf("%f %f\n",varargin{1},varargin{2});
            
            if ~isempty(bboxesLidar) && (size(bboxesLidar,1) == size(indicies,1))
                
                numLidarDetections = size(bboxesLidar,1);
          
                for i = 1:numLidarDetections
                    
                    % Create cuboidModel
                    model = pcfitcuboid(ptCld,indicies{i});
                    Model{i} = model;
    
                    % Find points inside cuboid
                    ind = findPointsInModel(model,ptCld);
                    pts = select(ptCld,ind);
            
                    if ~isempty(pts)
                        % Calculatae the distance of the 3-D rectangle
                        obj_x = min(pts.Location(:,1));
                        obj_y = min(pts.Location(:,2));
                        obj_z = min(pts.Location(:,3));
    
                        dist = sqrt(obj_x.^2+obj_y.^2+obj_z.^2);
                        Distances(i,:) = dist;
                    else
                        Distances(i,:) = 0;
                    end
                    
                    % Calculate the object velocity
                    vel = [varargin{1}(i); varargin{2}(i)];
                    Velocity(i,:) = (round(sqrt(vel(1)^2+vel(2)^2),3))/(1/30);
                    
                    % tmp = (CamToLidar.R)*([varargin{1}(i); varargin{2}(i);0]);
                    % tmp = tmp/(1/30);
                    % Velocity(i,:) = round(sqrt(tmp(1)^2+tmp(2)^2),3);
                    % fprintf("%f\n",round(sqrt(tmp(1)^2+tmp(2)^2),3));
                    
                end
    
                Model = Model';
            end
        end
    else
        if ~isempty(bboxes) && ~isempty(ptCld.Location)
    
            [bboxesLidar, indicies, bboxesUsed] = bboxCameraToLidar(bboxes, ptCld, cameraParams, CamToLidar, 'ClusterThreshold', clusterThreshold,'MaxDetectionRange',[3,70]);  
            
            % [0 0 0 0 0 0 0 0 0] value remove
            idx_del = all(bboxesLidar == 0, 2);
            bboxesLidar(idx_del,:) = [];
    
            indicies(~bboxesUsed,:) = [];
            l_id(~bboxesUsed') = [];
            l_cls(~bboxesUsed') = [];
            
            if ~isempty(bboxesLidar) && (size(bboxesLidar,1) == size(indicies,1))
                
                numLidarDetections = size(bboxesLidar,1);
          
                for i = 1:numLidarDetections
                    
                    % Create cuboidModel
                    model = pcfitcuboid(ptCld,indicies{i});
                    Model{i} = model;
    
                    % Find points inside cuboid
                    ind = findPointsInModel(model,ptCld);
                    pts = select(ptCld,ind);
            
                    % Calculatae the distance of the 3-D rectangle
                    obj_x = min(pts.Location(:,1));
                    obj_y = min(pts.Location(:,2));
                    dist = sqrt(obj_x.^2+obj_y.^2);
                    Distances(i,:) = dist;
                end
    
                Model = Model';
            end
        end
    end
end