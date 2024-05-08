 
ㅇㅇ
## Development Environment 
```
# Intel i7-9700 CPU 3.60Hz x 8
# NVIDIA GeForce GTX 1660 Ti
# Driver Version: 535.171.04
# CUDA Version: 12.2

# Ubuntu 20.04.6 LTS 
# ROS2 - foxy version
```


## Installation Dependency
```
$ git clone https://github.com/ansdydwns00/YongJun_ws.git

# Yolov8
$ cd YongJun_ws/src
$ pip3 install -r YOLO/Yolov8/requirements.txt
$ cd ../
$ rosdep install --from-paths src --ignore-src -r -y

# USB_CAM
$ sudo apt-get install ros-foxy-usb-cam
$ rosdep install --from-paths src --ignore-src -y


# Before build, remove build, install, log folder
$ colcon build --symlink-install 
```



## USB_CAM
```
# usb_cam launch
$ cd YongJun_ws
$ source install/setup.bash
$ ros2 launch usb_cam camera.launch.py

```


If you want setting camera config
```
$ sudo apt install guvcview
$ guvcview
```

## YOLOV8
```
# Yolov8 launch
$ cd YongJun_ws
$ source install/setup.bash
$ ros2 launch yolov8_bringup yolov8.launch.py

```






https://github.com/ansdydwns00/YongJun_ws/assets/81146105/5b0c084b-5386-486c-bef9-30e43c3b9cea












## Build custom ros msg in MATLAB
```
% Matlab 내 정의되어 있는 ros msg type
>> ros2 msg list

% Custom ros msg를 사용하기 위해 custom msg가 정의되어 있는 작업 공간에서 Build 진행
>> msg_path =  '/home/yong/YongJun_ws/src/YOLO/Yolov8';
>> ros2genmsg(msg_path)

% Custom ros msg가 제대로 추가 되었는지 확인
>> ros2 msg list
```








## Reference
[Yolov8](https://github.com/kirkfreire/yolov8_ros2) 


[USB_CAM](https://github.com/ros-drivers/usb_cam)

https://kr.mathworks.com/help/ros/ref/ros2genmsg.html
