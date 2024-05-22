cfg = coder.config("exe");

cfg.Hardware = coder.hardware("Robot Operating System 2 (ROS 2)");
cfg.Hardware.DeployTo = "Localhost";
cfg.Hardware.BuildAction = "Build and run";
cfg.HardwareImplementation.ProdLongLongMode = true; 

cfg.GpuConfig = coder.GpuCodeConfig;
cfg.GpuConfig.Enabled = true;

cfg.DeepLearningConfig = coder.DeepLearningConfig('cudnn');
codegen deployedPointPillarModel -config cfg