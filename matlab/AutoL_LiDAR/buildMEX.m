%% 
clear cfg

cfg = coder.gpuConfig('mex');
cfg.TargetLang = 'C++';
cfg.DeepLearningConfig = coder.DeepLearningConfig(TargetLibrary='cudnn');

dataLoc = ptCloud.Location;
dataInt = ptCloud.Intensity;

matFile = 'detector.mat';
confidenceThreshold = 0.7;

args = {coder.Constant(matFile) coder.typeof(dataLoc,[Inf,3],[1 0]) coder.typeof(dataInt,[Inf,1],[1 0]) coder.typeof(confidenceThreshold)};

codegen -config cfg pointpillarsDetect -args args -report

%% 
dataLoc = ptCloud.Location;
dataInt = ptCloud.Intensity;
tic
[bboxes,~,labels] = pointpillarsDetect_mex(matFile,dataLoc,dataInt,confidenceThreshold);
toc