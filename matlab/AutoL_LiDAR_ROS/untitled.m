envCfg = coder.gpuEnvConfig('host');
envCfg.DeepLibTarget = 'cudnn';
envCfg.DeepCodegen = 1;
envCfg.Quiet = 1;
coder.checkGpuInstall(envCfg);

%% 

matFile = 'detector.mat';
pretrainedDetector = load('pretrainedPointPillarsDetector.mat','detector');
detector = pretrainedDetector.detector;
confidenceThreshold = 0.2;
%% 

pc = pcread('pandasetDrivingData.pcd');
confidenceThreshold = 0.7;
[bboxes,~,labels] = detect(detector,pc,'Threshold',confidenceThreshold);
bboxesCar = bboxes(labels == 'Car',:);
bboxesTruck = bboxes(labels == 'Truck',:);
helperDisplay3DBoxesOverlaidPointCloud(pc.Location,bboxesCar,'green',...
                      bboxesTruck,'magenta','Predicted bounding boxes');
%% 
clear cfg

cfg = coder.gpuConfig('mex');
cfg.TargetLang = 'C++';
cfg.DeepLearningConfig = coder.DeepLearningConfig(TargetLibrary='cudnn');

dataLoc = ptCloud.Location;
dataInt = ptCloud.Intensity;

args = {coder.Constant(matFile) coder.typeof(dataLoc,[Inf,3],[1 0]) coder.typeof(dataInt,[Inf,1],[1 0]) coder.typeof(confidenceThreshold)};

codegen -config cfg pointpillarsDetect -args args -report

%% 
dataLoc = ptCloud.Location;
dataInt = ptCloud.Intensity;
tic
[bboxes,~,labels] = pointpillarsDetect_mex(matFile,dataLoc,dataInt,confidenceThreshold);
toc