%% GPU check 
clear; clc

cfg = coder.gpuEnvConfig;
cfg.GpuId = 0;
cfg.BasicCodegen = 1;
cfg.BasicCodeexec = 1;
cfg.DeepLibTarget = 'cudnn';
cfg.DeepCodegen = 1;
cfg.CudnnPath = '/usr/local/cuda';
% results = coder.checkGpuInstall(cfg)



%% code gen check
clear; clc

cfg = coder.config("exe");

cfg.Hardware = coder.hardware("Robot Operating System 2 (ROS 2)");


% cfg.Hardware.DeployTo = "Localhost";
cfg.Hardware.DeployTo = "Remote Device";
cfg.Hardware.RemoteDeviceAddress = '223.195.34.243';
cfg.Hardware.RemoteDeviceUsername = 'aiv';
cfg.Hardware.RemoteDevicePassword = '1';

cfg.Hardware.BuildAction = "Build and run";
cfg.HardwareImplementation.ProdLongLongMode = true; 

cfg.GpuConfig = coder.GpuCodeConfig;
cfg.GpuConfig.Enabled = true;
cfg.DeepLearningConfig = coder.DeepLearningConfig('cudnn');
cfg.TargetLang = "C++";


codegen deployedPointPillarModel -config cfg
%% 

