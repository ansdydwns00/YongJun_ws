function detectModel = helperBboxCameraToLidar(bboxesCamera, ptCloudIn, intrinsics, tform, varargin)

narginchk(4,8);
detectModel = {};

[camerabboxesCorner, intrinsicMatrix, ~, maxDetectionRange, ~] = validateAndParseInputs(bboxesCamera, ptCloudIn, intrinsics, tform, varargin{:});

% Find the corners for bounding boxes in image
numBboxes = size(camerabboxesCorner, 3);
lidarbboxesCorner = zeros(8, 3, numBboxes);

for i = 1:numBboxes
    cornersCamera = camerabboxesCorner(:, :, i);

    % Transform bounding boxes from camera to lidar as frustums
    lidarbboxesCorner(:, :, i) = lidar.internal.calibration.findFrustumCorners(cornersCamera, intrinsicMatrix, tform, maxDetectionRange);
end

% Find indices of points inside the frustum
frustumIndices = extractIndicesInsideFrustum(lidarbboxesCorner, ptCloudIn);

% Extract cuboid parameters from the points inside frustum
if ~isempty(frustumIndices)
    detectModel = extractCuboids(ptCloudIn, frustumIndices);
end

end

%--------------------------------------------------------------------------
function [bboxesCornersCamera, intrinsicMatrix, clusterThreshold,maxDetectionRange, idx] = validateAndParseInputs(bboxesCamera, ptCloudIn,intrinsics, tform, varargin)
% Parse and validate input

% Validate rectangles
validateattributes(bboxesCamera, {'single','double'}, ...
    {'real','nonsparse', 'ncols', 4,'finite'}, mfilename, 'bboxesCamera', 1);

% Validate point cloud
validateattributes(ptCloudIn, {'pointCloud'}, {'scalar'}, mfilename, 'ptCloudIn', 2);

xlims = ptCloudIn.XLimits;
ylims = ptCloudIn.YLimits;
zlims = ptCloudIn.ZLimits;

% Validate point cloud x range
validateattributes(xlims, {'double', 'single'}, {'real','nonsparse', 'finite', 'numel', 2}, mfilename, 'ptCloudIn.Xlimits');

% Validate point cloud y range
validateattributes(ylims, {'double', 'single'}, {'real','nonsparse', 'finite', 'numel', 2}, mfilename, 'ptCloudIn.Ylimits');

% Validate point cloud z range
validateattributes(zlims, {'double', 'single'}, {'real','nonsparse', 'finite', 'numel', 2}, mfilename, 'ptCloudIn.Zlimits');

% Validate camera intrinsics
validateattributes(intrinsics, {'cameraIntrinsics', 'cameraParameters'}, {'scalar'}, mfilename, 'intrinsics', 3);

% Validate camera-lidar transform
validateattributes(tform, {'rigidtform3d', 'rigid3d'}, {'scalar'}, mfilename, 'tform', 4);

intrinsicMatrix = intrinsics.IntrinsicMatrix;

% Convert rectangles from [x, y, l, w] to [x1, y1;x2, y2;x3, y3;x4, y4]
% where [xi, yi] represents the corner of the rectangles.
numBboxes = size(bboxesCamera, 1);
bboxesCornersCamera = zeros(4, 2, numBboxes);
j = 1;
idx = true(numBboxes, 1);
for i = 1:numBboxes
    bbox = bboxesCamera(i, :);

    % Check if the bounding box lies within the image dimension
    bboxCorners = getCornersFromBbox(bbox);
    if checkCameraCorners(bboxCorners, intrinsicMatrix)
        bboxesCornersCamera(:, :, j) = bboxCorners;
        j = j + 1;
    else
        idx(i) = false;
    end
end
newPc = pctransform(ptCloudIn, tform.invert());
xRange = newPc.ZLimits; %#ok<NASGU>

if (newPc.ZLimits(2) < 0.01)
    xRange = [newPc.ZLimits(2), 0.01];
else
    xRange = [0.01, newPc.ZLimits(2)];
end

% Validate XRange
validateattributes(xRange, {'single', 'double'}, ...
    {'real', 'nonsparse', 'finite', 'nonnan', 'numel', 2}, mfilename);

[clusterThreshold, maxDetectionRange] = validateAndParseOptionalArguments(xRange, varargin{:});
end

%--------------------------------------------------------------------------
function [threshold, maxRange] = validateAndParseOptionalArguments(xRange, varargin)
% Validate and parse optional inputs
if isSimMode()
    % Setup parser
    parser = inputParser;
    parser.CaseSensitive = false;
    parser.FunctionName  = mfilename;

    parser.addParameter('ClusterThreshold', 1);
    parser.addParameter('MaxDetectionRange', xRange);

    %Parse input
    parser.parse(varargin{:});

    threshold = checkThreshold(parser.Results.ClusterThreshold);
    maxRange = checkMaxDetectionRange(parser.Results.MaxDetectionRange, xRange);

else
    pvPairs = struct(...
        'ClusterThreshold',   uint32(0), ...
        'MaxDetectionRange', uint32(0));
    defaults = struct(...
        'ClusterThreshold',   1, ...
        'MaxDetectionRange', [0.001 inf]);
    popt = struct(...
        'CaseSensitivity', false, ...
        'StructExpand',    true,  ...
        'PartialMatching', true);

    optarg = eml_parse_parameter_inputs(pvPairs, popt, varargin{...
        1:end});

    threshold = eml_get_parameter_value(optarg.ClusterThreshold, ...
        defaults.ClusterThreshold, varargin{:});
    threshold = checkThreshold(threshold);

    maxRange = eml_get_parameter_value(optarg.MaxDetectionRange, ...
        defaults.MaxDetectionRange, varargin{:});
    maxRange = checkMaxDetectionRange(maxRange, xRange);
end
end

%--------------------------------------------------------------------------
function clusterThresholdOut = checkThreshold(clusterThreshold)
% Validate cluster threshold value
validateattributes(clusterThreshold, {'single','double'}, ...
    {'nonnan', 'nonsparse', 'scalar', 'real', 'positive', 'finite'}, ...
    'bboxCameraToLidar', 'clusterThreshold');
clusterThresholdOut = clusterThreshold;
end

%--------------------------------------------------------------------------
function maxRangeOut = checkMaxDetectionRange(defaultRange, maxRange)
% Validate detection range
validateattributes(defaultRange, {'single', 'double'}, ...
    { 'real', 'nonsparse', 'nonnan', 'positive', 'numel', 2}, 'bboxCameraToLidar', 'MaxDetectionRange');
% Check if the value is finite
if isfinite(defaultRange(2))
    maxRange(2) = defaultRange(2);
end
coder.internal.errorIf((maxRange(1) > maxRange(2) || defaultRange(1)==0 || ...
    defaultRange(1) > defaultRange(2) || eq(defaultRange(1), defaultRange(2))),...
    'lidar:imageToLidar:invalidRange');
maxRangeOut = maxRange;
end

%--------------------------------------------------------------------------
function tf = checkCameraCorners(bbox, intrinsics)
cx = intrinsics(3, 1);
cy = intrinsics(3, 2);
imageSize = [2*cx 2*cy];
checkBbox = zeros(4,2,'logical');
for i = 1:4
    checkBbox(i,:) = bbox(i,:) < imageSize;
end
if (sum(checkBbox(:, 1)) == 4 && size(find(checkBbox(:, 2)), 1))
    tf = true;
else
    tf = false;
end
end

%--------------------------------------------------------------------------
function frustumIndices = extractIndicesInsideFrustum(cornersLidar, ptCloudIn)
% EXTRACTINDICESINSIDEFRUSTUM Extracts indices of points using frustum
%   points in point cloud.
numBboxes = size(cornersLidar, 3);
frustumIndices =  cell(1, numBboxes);

for bboxesCount = 1:numBboxes
    bboxLidar = cornersLidar(:, :, bboxesCount);
    %     pts = ptCloudIn.Location;
    % Check if the point cloud is organized
    if (ndims(ptCloudIn.Location) == 3)
        pts = reshape(ptCloudIn.Location, [], 3);
    else
        pts = ptCloudIn.Location;
    end
    frustumIndices{bboxesCount} = ...
        lidar.internal.findPointsInFrustum(bboxLidar, pts);
end
end

%--------------------------------------------------------------------------
function cornersCamera = getCornersFromBbox(bbox)
% GETCORNERSFROMBBOX Returns the four corners from the rectangle defined as
%   [x, y, l, w]. The corners are arranged in the following fashion
%            (1)---------------(2)
%             |                 |
%             |                 |
%             |                 |
%             |                 |
%            (4)---------------(3)
%
cornersCamera = zeros(4, 2);
cornersCamera(1, 1:2) = bbox(1:2);
cornersCamera(2, 1:2) = bbox(1:2) + [bbox(3), 0];
cornersCamera(3, 1:2) = bbox(1:2) + bbox(3:4);
cornersCamera(4, 1:2) = bbox(1:2) + [0, bbox(4)];
end

%--------------------------------------------------------------------------
function Model = extractCuboids(ptCloudIn, frustumIndicesCell)

%EXTRACTCUBOIDS Fits a cuboid, bboxLidar in the point cloud.
numBbox = numel(frustumIndicesCell);

Model = {};

k = 1;

for countBbox = 1:numBbox
    frustumIndices = frustumIndicesCell{countBbox};

    % frustum 내의 pointcloud
    tmpPc = select(ptCloudIn, frustumIndices);
    
    if size(tmpPc.Location,1) == 0
        continue;
    end

    % frustum 내에서 euculid 기반 clustering
    [labels, ~] = pcsegdist(tmpPc, 2);
    
    % clustering 된 값 중 최대 빈도수를 가진 포인트클라우드 데이터만을 plot
    values = unique(labels); 
    counts = histcounts(labels, values);
    
    % 최대 빈도를 가지는 값의 인덱스를 찾음
    [~, idx] = max(counts); 
    mostFrequentValue = values(idx); 
    
    % 논리 배열 생성
    logicalArray = labels == mostFrequentValue; % 가장 빈도가 높은 값에 대해서만 1, 나머지는 0
    
    tmp_location = tmpPc.Location;
    tmp_intensity = tmpPc.Intensity;
    
    tmp_location(~logicalArray,:,:) = [];
    tmp_intensity(~logicalArray,:) = [];
    
    new_ptCloud = pointCloud(tmp_location,"Intensity",tmp_intensity);

    model = pcfitcuboid(new_ptCloud);

    Model{k} = model;
    k = k + 1;
end

end

%--------------------------------------------------------------------------
function flag = isSimMode()
flag = isempty(coder.target);
end

%#codegen

% Copyright 2020-2023 The MathWorks, Inc.