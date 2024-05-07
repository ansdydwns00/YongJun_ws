cfg = coder.config("exe");
cfg.Hardware = coder.hardware("Robot Operating System 2 (ROS 2)");

cfg.Hardware.DeployTo = "Remote Device";
% cfg.Hardware.DeployTo = "Localhost";

cfg.Hardware.BuildAction = "Build and load";
cfg.Hardware.ROS2Folder = '/opt/ros/foxy';
cfg.Hardware.ROS2Workspace = '~/Jun';

cfg.Hardware.RemoteDeviceAddress = '223.195.34.242';
cfg.Hardware.RemoteDeviceUsername = 'yong';
cfg.Hardware.RemoteDevicePassword = '1';

codegen lidarnodetest -config cfg
