function [Distances, Velocity, Model, l_id, l_cls] = helperComputeDistance(bboxes, l_id, l_cls, ptCld, cameraParams, CamToLidar, clusterThreshold, varargin)
    
    Distances = [];
    Velocity = [];

    Model = {};
    
    if length(varargin) == 2
        
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
                    vel = (invert(CamToLidar).R)*[varargin{1}(i); varargin{2}(i); 0];
                    Velocity(i,:) = (floor(sqrt(vel(1)^2+vel(2)^2)*10)/10)/(1/30);
    
                    % fprintf("%f %f\n",floor(sqrt(varargin{1}(i)^2+varargin{2}(i)^2)*10)/10, Velocity(i,:));
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