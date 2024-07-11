import sys
if sys.prefix == '/usr':
    sys.real_prefix = sys.prefix
    sys.prefix = sys.exec_prefix = '/home/user/YongJun_ws/ros2_ws/install/yolov8_ros'
