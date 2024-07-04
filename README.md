<details>
	<summary>CUDA 삭제</summary>
  	<div markdown="1">
	
	CUDA 삭제

	$ sudo rm -rf /usr/local/cuda*
		
	$ sudo apt-get --purge remove 'cuda*'
		
	$ sudo apt-get autoremove --purge 'cuda*'
	

	
	제거 확인
	
	$ sudo dpkg -l|grep cuda
			
	# 만약 설치된게 남았다면:
	$ sudo apt-get remove --purge 남은 찌꺼기 이름
	



	이후 재부팅
	
	$ sudo reboot
	

</details> 


<details>
	<summary>CUDA 설치</summary>
  	<div markdown="1">
	
	CUDA 설치

 	# 해당 링크에 접속하여 본인 driver에 맞는 cuda 버전 확인
 	https://developer.nvidia.com/cuda-toolkit-archive

	# 해당 사이트 참고
	https://honbul.tistory.com/41

 	# CUDA 버전 확인
 	/usr/local/cuda-버전/bin/nvcc -V
</details> 

<details>
	<summary>torch & torchvision 삭제 및 설치</summary>
  	<div markdown="1">
	
	torch & torchvision 삭제
 	$ pip uninstall torch torchvision

	torch & torchvision 설치(아래 링크 참고)
	https://pytorch.org/get-started/locally/

 	# 버전 확인
  	python3 -c "import torch; print(torch.__version__)"
  	python3 -c "import torchvision; print(torchvision.__version__)"

</details> 

<details>
	<summary>Cudnn</summary>
  	<div markdown="1">
	

	Cudnn 설치(아래 링크 참고)
	https://hjh1023.tistory.com/59

 	cudnn 버전 확인
 	# cuDNN 8.x.x 이전 버전
	cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2

	# cuDNN 8.x.x 이후 버전
	cat /usr/local/cuda/include/cudnn_version.h | grep CUDNN_MAJOR -A 2

</details> 

<details>
	<summary>matlab ros msg</summary>
  	<div markdown="1">
	

 	# Matlab에 존재하는 ros2 msg list
	>> ros2 msg list

 	# 만약 Matlab에 원하는 ros2 msg가 없을경우 따로 build 해줘야 함
  	# build 하기 원하는 ros2 msg가 포함되어 있는 폴더의 경로로 이동 후 아래 명령어 실행
   	>> ros2genmsg(pwd)	

</details> 

<details>
	<summary>MATAB 설치</summary>
  	<div markdown="1">
	
	# sudo apt install python3.10 && sudo apt install python3.10-venv
 		

</details> 


<details>
	<summary>Python 관련</summary>
  	<div markdown="1">

 ### Ubuntu의 경우 여러 버전의 같은 소프트웨어가 설치되었을 경우, update-alternatives를 이용하여 버전 관리 가능

 #### 현재 alternatives에 등록된 python의 리스트 확인(등록된 python이 없을 경우 오류 출력됨)
 	# sudo update-alternatives --list python3

 #### python 등록 
  	# sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.x 1
   	# sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.x 2
   
 #### 등록된 python을 선택
	# sudo update-alternatives --config python3
 		
</details> 


<details>
	<summary>ZED</summary>
  	<div markdown="1">

 	# ZED SDK download
	# https://www.stereolabs.com/developers/release
 
 	# ZED SDK download guide
	# https://www.stereolabs.com/docs/installation/linux

 	# ZED ROS2 
  	# https://github.com/stereolabs/zed-ros2-wrapper

  	# dependency
   	# sudo apt-get install ros-<your-ros-distro>-robot-localization
	# sudo apt-get install ros-<your-ros-distro>-diagnostic-updater
	# sudo apt-get install ros-<your-ros-distro>-nmea-msgs
	# sudo apt-get install ros-<your-ros-distro>-xacro
 
 		
</details> 


---


## Development Environment 
```
# Intel i7-9700 CPU 3.60Hz x 8
# NVIDIA GeForce GTX 1660 Ti
# Driver Version: 535.171.04
# CUDA Version: 12.2

# Ubuntu 20.04.6 LTS 
# ROS2 - foxy version
# uname -a (kernel version) - Linux aiv 5.15.0-113-generic #123~20.04.1-Ubuntu SMP Wed Jun 12 17:33:13 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux

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






## AutoL G32 LiDAR Parsing

Parsing at 10hz




https://github.com/ansdydwns00/YongJun_ws/assets/81146105/8f324a0f-939f-426e-9792-fc5cbd16456b





Parsing at 25hz




https://github.com/ansdydwns00/YongJun_ws/assets/81146105/ab8b633e-7686-4c68-8682-fac468bb7ce4





## RGB-D(Object Detection using LiDAR + Camera)

### pointcloud viewer distance(~=4.2hz)

![Screenshot from 2024-05-23 15-57-19](https://github.com/ansdydwns00/YongJun_ws/assets/81146105/17cce61c-d360-4737-9ea5-0791b377121d)



### image viewer distance

![Screenshot from 2024-05-23 16-09-37](https://github.com/ansdydwns00/YongJun_ws/assets/81146105/bf34853c-2df1-4bd7-90d7-49a6e727e881)





## RGB-D(Object Detection using Only LiDAR)

### pointcloud viewer distance(~=8hz)


![Screenshot from 2024-05-23 15-22-03](https://github.com/ansdydwns00/YongJun_ws/assets/81146105/c44e3af3-99c7-4aff-9b88-10892f42fd5e)













## Reference
[Yolov8](https://github.com/kirkfreire/yolov8_ros2) 


[USB_CAM](https://github.com/ros-drivers/usb_cam)

https://kr.mathworks.com/help/ros/ref/ros2genmsg.html
