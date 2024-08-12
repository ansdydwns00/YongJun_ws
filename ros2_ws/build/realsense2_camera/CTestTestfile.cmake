# CMake generated Testfile for 
# Source directory: /home/aiv/YongJun_ws/ros2_ws/src/realsense-ros/realsense2_camera
# Build directory: /home/aiv/YongJun_ws/ros2_ws/build/realsense2_camera
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(gtest_template "/usr/bin/python3" "-u" "/opt/ros/foxy/share/ament_cmake_test/cmake/run_test.py" "/home/aiv/YongJun_ws/ros2_ws/build/realsense2_camera/test_results/realsense2_camera/gtest_template.gtest.xml" "--package-name" "realsense2_camera" "--output-file" "/home/aiv/YongJun_ws/ros2_ws/build/realsense2_camera/ament_cmake_gtest/gtest_template.txt" "--command" "/home/aiv/YongJun_ws/ros2_ws/build/realsense2_camera/gtest_template" "--gtest_output=xml:/home/aiv/YongJun_ws/ros2_ws/build/realsense2_camera/test_results/realsense2_camera/gtest_template.gtest.xml")
set_tests_properties(gtest_template PROPERTIES  LABELS "gtest" REQUIRED_FILES "/home/aiv/YongJun_ws/ros2_ws/build/realsense2_camera/gtest_template" TIMEOUT "60" WORKING_DIRECTORY "/home/aiv/YongJun_ws/ros2_ws/build/realsense2_camera" _BACKTRACE_TRIPLES "/opt/ros/foxy/share/ament_cmake_test/cmake/ament_add_test.cmake;118;add_test;/opt/ros/foxy/share/ament_cmake_gtest/cmake/ament_add_gtest_test.cmake;86;ament_add_test;/opt/ros/foxy/share/ament_cmake_gtest/cmake/ament_add_gtest.cmake;93;ament_add_gtest_test;/home/aiv/YongJun_ws/ros2_ws/src/realsense-ros/realsense2_camera/CMakeLists.txt;313;ament_add_gtest;/home/aiv/YongJun_ws/ros2_ws/src/realsense-ros/realsense2_camera/CMakeLists.txt;0;")
subdirs("gtest")
