 

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

# [Yolov8](https://github.com/kirkfreire/yolov8_ros2) 
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
