classdef helperLidarCameraObjectsDisplay < handle
    %helperLidarCameraObjectsDisplay helper class to display image and point cloud data with oriented bounding boxes.
      
    properties (Access = private)
        % Image handle for visualizing 2-D images
        ImageH;
        
        % Axes handle for point cloud visualization in perspective view
        PcPlotAxes;
        
        % Axes handle for point cloud with oriented bounding box visualization in top view
        PcPlotBboxTopAxes;
        
        % Scatter plot handle for visualizing perspective view of pointcloud with oriented bounding box
        ScatterPlotSideH;
        
        % Scatter plot handle for visualizing point cloud with oriented bounding box in top view
        ScatterPlotTopH;
                
        % Rgb image axes handle
        ImageAxesH;
        
        % Property for holding all the holding frames from figure handle frames used for writing output video
        PFrames;
        
        % Main gui figure handle
        FigureH;
        
        % Range in x direction
        XRange;
        
        % Range in y direction
        YRange;
        
        % Range in z direction
        ZRange;
        
        % Set it if want to write a video output for the results
        WriteVideo
    end
    
    properties (Constant, Access = protected)
        
        % Default range in X direction
        DefaultXRange = [0, 20]; % x range to crop display
        
        % Default range in y direction
        DefaultYRange =[-5,5];% y range to crop display
        
        % Default range in z direction
        DefaultZRange =[-3,5];
        
        % Default value to write video
        DefaultWriteVideo = false;                
    end
    
    properties
        colorMap;
    end
    %----------------------------------------------------------------------
    methods        
        function obj = helperLidarCameraObjectsDisplay(varargin)
            
            parser = inputParser;
            parser.CaseSensitive = false;
            
            % Parameter Validator
            validScalarPosNum = @(x)  (isequal(size(x),[1,2]));
            validVideo = @(x) (islogical(x));                                           
            
            % Optional argument parsers
            addOptional(parser,'XLimits',obj.DefaultXRange,validScalarPosNum);
            addOptional(parser,'YLimits',obj.DefaultYRange,validScalarPosNum);
            addOptional(parser,'ZLimits',obj.DefaultZRange,validScalarPosNum);
            addOptional(parser,'Video',obj.DefaultWriteVideo,validVideo);
            
            % Parse input arguments
            parse(parser,varargin{:});
            obj.XRange=parser.Results.XLimits;
            obj.YRange=parser.Results.YLimits;
            obj.ZRange=parser.Results.ZLimits;
            obj.WriteVideo =  parser.Results.Video;
                        
            %% Initialize main figure
            obj.FigureH = figure('Visible','off','Position',[0, 0, 1200, 640],...
                'Name','Sensor Assignment','color',[0 0 0],'InvertHardcopy','off');
            
            %% Initialize panel for perspective point cloud visualization
            pointCloudSidePanel = uipanel('Parent',obj.FigureH,'Position',[0.5, 0.01, 0.48, 0.99],...
                'BackgroundColor',[0 0 0],'Title','Point Cloud View',...
                'ForegroundColor',[1,1,1],'FontSize',15);

            obj.PcPlotAxes = axes('Parent',pointCloudSidePanel,'Color',[0 0 0],...
                'Position',[0,0,1,1],'NextPlot','replacechildren',...
                'XLim',obj.XRange,'YLim',obj.YRange,'ZLim',obj.ZRange);

            axis(obj.PcPlotAxes,'equal');
            obj.PcPlotAxes.XLimMode = 'manual';
            obj.PcPlotAxes.YLimMode = 'manual';
            obj.PcPlotAxes.ZLimMode = 'manual';
            obj.ScatterPlotSideH = scatter3(obj.PcPlotAxes,nan,nan,nan,  7,  '.');
            view(obj.PcPlotAxes,3);
            campos([-180 60  60]);
            
            %% Initialize panel for top view point cloud visualization
            % pointCloudTopPanel = uipanel('Parent',obj.FigureH,'Position',[0.5, 0.01, 0.48, 0.99],...
            %     'BackgroundColor',[0 0 0],'Title','Top View'...
            %     ,'ForegroundColor',[1,1,1],'FontSize',15);
            % 
            % obj.PcPlotBboxTopAxes = axes('Parent',pointCloudTopPanel,'Color',[0 0 0],...
            %     'NextPlot','replacechildren','Position' , [0,0,1,1],...
            %     'XLim',obj.XRange,'YLim',obj.YRange,'ZLim',obj.ZRange,'XColor',[1 1 1],'YColor',[1 1 1],'ZColor',[1 1 1]);
            % 
            % obj.PcPlotBboxTopAxes.Title.Color = [1 1 1];
            % axis(obj.PcPlotBboxTopAxes,'equal');
            % obj.PcPlotBboxTopAxes.XLimMode = 'manual';
            % obj.PcPlotBboxTopAxes.YLimMode = 'manual';
            % obj.PcPlotBboxTopAxes.ZLimMode = 'manual';
            % obj.ScatterPlotTopH = scatter3(obj.PcPlotBboxTopAxes,nan,nan,nan,  7,  '.');
            % view(obj.PcPlotBboxTopAxes,3);
            % campos([29.4725   -3.1328  330.2545]);
            % campos([ -70.5515   -0.3620  322.5740]);
            % xlabel(obj.PcPlotBboxTopAxes, 'X axis', 'FontSize', 12, 'Color', [1 1 1]); 
            % ylabel(obj.PcPlotBboxTopAxes, 'Y axis', 'FontSize', 12, 'Color', [1 1 1]); 
            %% Image visualization
            hFrontView1 = uipanel(obj.FigureH, 'Position', [0.01, 0.01, 0.48, 0.99],...
                'Title','Image View','FontSize',15,'BackgroundColor',[0 0 0],'ForegroundColor',[1,1,1]);
            ImageAxes1 = axes('Parent',hFrontView1);
            obj.ImageH = imshow([],'Parent',ImageAxes1,'DisplayRange',[0,80]);
            ImageAxes1.NextPlot = 'add';
            ImageAxes1.Position = [0,0,1,1];
            hFrontView1.BackgroundColor = [0 0 0];
            hFrontView1.ForegroundColor = [1 1 1];
            axis(ImageAxes1,'tight');
            obj.ImageAxesH=ImageAxes1;
        end
        
        %------------------------------------------------------------------
        function Image = updateImage(obj, Image, bbox, varargin)
            %updateImage Method to update display with 2-D detections
            %   in the image.
            if nargin == 4
                labels = varargin{1};
            else
                labels = [];
            end
                
            obj.ImageH.CData = Image;
            if(isvalid(obj.ImageAxesH))
                delete(findobj(obj.ImageAxesH.Children, 'Tag', 'im2D'));
            end
            
            % Update color map for different bounding boxes
            obj.getColorMap(bbox);
            for i=1:size(bbox,1)
                box = bbox(i,:);
                if ~(isempty(box))
                    if labels
                        str = strcat(num2str(labels(i)), '');
                    else
                        str = 'Object';
                    end
                    Image = insertObjectAnnotation(Image, "rectangle",box, str, 'Color', 255.*obj.colorMap(i, :), 'FontSize', 40);
                    % Image = insertObjectAnnotation(Image, 'rectangle', ...
                    %  box, str, 'Color', 255.*obj.colorMap(i, :), 'FontSize', 40);
                    % Image = insertText(Image,[1,1],sprintf("FPS %2.2f",fps),"FontSize",24,"BoxColor","white");
                end
            end            
        end
        
        %------------------------------------------------------------------
        function updateDisplay(obj,Image,pc)
            %updateDisplay Method to update display with
            %   image and point cloud data
            % Image = insertText(Image,[1,1],sprintf("FPS %2.2f",fps),"FontSize",24,"BoxColor","white");            
            obj.ImageH.CData = Image;            
            location = pc.Location;
            s = size(location);

            % Check for unorganized point cloud
            if(size(s, 2) < 3)
                x = location(:, 1);
                y = location(:, 2);
                z = location(:, 3);                
            else
                x = reshape(location(:, :, 1), [], 1);
                y = reshape(location(:, :, 2), [], 1);
                z = reshape(location(:, :, 3), [], 1);                
            end
            color = z;            
            set(obj.ScatterPlotSideH, 'XData', x, 'YData', y, 'ZData', z, 'CData', color);
            set(obj.ScatterPlotTopH, 'XData', x, 'YData', y, 'ZData', z, 'CData', color);
        end
        
        
        %------------------------------------------------------------------
        function  updateLidarBbox(obj, model, varargin)
            %updatePC Method to update display with point cloud.             
                 
            if nargin == 2                
                color = obj.colorMap;
            else
                boxUsed = varargin{1};
                color = obj.colorMap(boxUsed, :);                
            end
            % showShape('cuboid',model, 'LabelTextColor', 'white',...
                % 'Color', color, 'LabelFontSize', 8, 'Parent', obj.PcPlotAxes, 'Opacity',0.15,'LabelOpacity', 0.1);
            showShape('cuboid',model, 'LabelTextColor', 'white', ...
                'Color', color, 'LabelFontSize', 8, 'Parent', obj.PcPlotBboxTopAxes, 'Opacity',0.15, 'LabelOpacity', 0.1);
            drawnow;
            
            % if obj.WriteVideo
            %     obj.PFrames{end+1} = getframe(obj.FigureH);
            % end
        end
        
        %------------------------------------------------------------------
        function myCleanupFun(FigureH)
            close(FigureH);
            clc;
        end
        
        %------------------------------------------------------------------
        function initializeDisplay(obj)
            %initializeDisplay To initialize the display
            %   turn on the visibility of display            
            set(obj.FigureH, 'Visible', 'on');
        end
    end
    
    %----------------------------------------------------------------------
    methods (Access =private, Hidden)
        function getColorMap(obj, labels)
            rng(1234)
            map = zeros(size(labels, 1), 3);
            for i = 1:size(labels, 1)
               map(i, :) = rand(1, 3);
            end
            obj.colorMap = map;
        end
    end
    
    %------------------------------------------------------------------
    methods (Access =public, Hidden)
        
        function writeMovie(obj,fileName)
            %writeMovie Method to write displayed results to video.
            
            if nargin <= 1
                fileName = 'Results';
            end
            
            vidFile = VideoWriter(fileName);
            vidFile.FrameRate =5;
            open(vidFile);
            for k = 1:length(obj.PFrames)
                writeVideo(vidFile,obj.PFrames{k});
            end
            close(vidFile);
        end        
    end
end