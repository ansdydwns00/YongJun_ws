# Install script for directory: /home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/src/yolov8_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/rosidl_interfaces" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/ament_cmake_index/share/ament_index/resource_index/rosidl_interfaces/yolov8_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/yolov8_msgs/yolov8_msgs" TYPE DIRECTORY FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/rosidl_generator_c/yolov8_msgs/" REGEX "/[^/]*\\.h$")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/environment" TYPE FILE FILES "/usr/local/MATLAB/R2024a/sys/ros2/glnxa64/ros2/lib/python3.9/site-packages/ament_package/template/environment_hook/library_path.sh")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/environment" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/ament_cmake_environment_hooks/library_path.dsv")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/libyolov8_msgs__rosidl_generator_c.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libyolov8_msgs__rosidl_generator_c.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libyolov8_msgs__rosidl_generator_c.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libyolov8_msgs__rosidl_generator_c.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/yolov8_msgs/yolov8_msgs" TYPE DIRECTORY FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/rosidl_typesupport_fastrtps_c/yolov8_msgs/" REGEX "/[^/]*\\.cpp$" EXCLUDE)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/libyolov8_msgs__rosidl_typesupport_fastrtps_c.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libyolov8_msgs__rosidl_typesupport_fastrtps_c.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libyolov8_msgs__rosidl_typesupport_fastrtps_c.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libyolov8_msgs__rosidl_typesupport_fastrtps_c.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/yolov8_msgs/yolov8_msgs" TYPE DIRECTORY FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/rosidl_typesupport_introspection_c/yolov8_msgs/" REGEX "/[^/]*\\.h$")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/libyolov8_msgs__rosidl_typesupport_introspection_c.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libyolov8_msgs__rosidl_typesupport_introspection_c.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libyolov8_msgs__rosidl_typesupport_introspection_c.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libyolov8_msgs__rosidl_typesupport_introspection_c.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/libyolov8_msgs__rosidl_typesupport_c.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libyolov8_msgs__rosidl_typesupport_c.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libyolov8_msgs__rosidl_typesupport_c.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libyolov8_msgs__rosidl_typesupport_c.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/yolov8_msgs/yolov8_msgs" TYPE DIRECTORY FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/rosidl_generator_cpp/yolov8_msgs/" REGEX "/[^/]*\\.hpp$")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/yolov8_msgs/yolov8_msgs" TYPE DIRECTORY FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/rosidl_typesupport_fastrtps_cpp/yolov8_msgs/" REGEX "/[^/]*\\.cpp$" EXCLUDE)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/libyolov8_msgs__rosidl_typesupport_fastrtps_cpp.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libyolov8_msgs__rosidl_typesupport_fastrtps_cpp.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libyolov8_msgs__rosidl_typesupport_fastrtps_cpp.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libyolov8_msgs__rosidl_typesupport_fastrtps_cpp.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/yolov8_msgs/yolov8_msgs" TYPE DIRECTORY FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/rosidl_typesupport_introspection_cpp/yolov8_msgs/" REGEX "/[^/]*\\.hpp$")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/libyolov8_msgs__rosidl_typesupport_introspection_cpp.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libyolov8_msgs__rosidl_typesupport_introspection_cpp.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libyolov8_msgs__rosidl_typesupport_introspection_cpp.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libyolov8_msgs__rosidl_typesupport_introspection_cpp.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/libyolov8_msgs__rosidl_typesupport_cpp.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libyolov8_msgs__rosidl_typesupport_cpp.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libyolov8_msgs__rosidl_typesupport_cpp.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libyolov8_msgs__rosidl_typesupport_cpp.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/msg" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/rosidl_adapter/yolov8_msgs/msg/BoundingBox2D.idl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/msg" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/rosidl_adapter/yolov8_msgs/msg/BoundingBox3D.idl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/msg" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/rosidl_adapter/yolov8_msgs/msg/Detection.idl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/msg" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/rosidl_adapter/yolov8_msgs/msg/DetectionArray.idl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/msg" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/rosidl_adapter/yolov8_msgs/msg/KeyPoint2D.idl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/msg" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/rosidl_adapter/yolov8_msgs/msg/KeyPoint2DArray.idl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/msg" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/rosidl_adapter/yolov8_msgs/msg/KeyPoint3D.idl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/msg" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/rosidl_adapter/yolov8_msgs/msg/KeyPoint3DArray.idl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/msg" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/rosidl_adapter/yolov8_msgs/msg/Mask.idl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/msg" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/rosidl_adapter/yolov8_msgs/msg/Point2D.idl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/msg" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/rosidl_adapter/yolov8_msgs/msg/Pose2D.idl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/msg" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/rosidl_adapter/yolov8_msgs/msg/Vector2.idl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/msg" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/src/yolov8_msgs/msg/BoundingBox2D.msg")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/msg" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/src/yolov8_msgs/msg/BoundingBox3D.msg")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/msg" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/src/yolov8_msgs/msg/Detection.msg")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/msg" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/src/yolov8_msgs/msg/DetectionArray.msg")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/msg" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/src/yolov8_msgs/msg/KeyPoint2D.msg")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/msg" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/src/yolov8_msgs/msg/KeyPoint2DArray.msg")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/msg" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/src/yolov8_msgs/msg/KeyPoint3D.msg")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/msg" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/src/yolov8_msgs/msg/KeyPoint3DArray.msg")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/msg" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/src/yolov8_msgs/msg/Mask.msg")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/msg" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/src/yolov8_msgs/msg/Point2D.msg")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/msg" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/src/yolov8_msgs/msg/Pose2D.msg")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/msg" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/src/yolov8_msgs/msg/Vector2.msg")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/src/yolov8_msgs/include/")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/libyolov8_msgs_matlab.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libyolov8_msgs_matlab.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libyolov8_msgs_matlab.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libyolov8_msgs_matlab.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/m/" TYPE DIRECTORY FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/src/yolov8_msgs/m/" FILES_MATCHING REGEX "/[^/]*\\.m$")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/package_run_dependencies" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/ament_cmake_index/share/ament_index/resource_index/package_run_dependencies/yolov8_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/parent_prefix_path" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/ament_cmake_index/share/ament_index/resource_index/parent_prefix_path/yolov8_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/environment" TYPE FILE FILES "/usr/local/MATLAB/R2024a/sys/ros2/glnxa64/ros2/share/ament_cmake_core/cmake/environment_hooks/environment/ament_prefix_path.sh")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/environment" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/ament_cmake_environment_hooks/ament_prefix_path.dsv")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/environment" TYPE FILE FILES "/usr/local/MATLAB/R2024a/sys/ros2/glnxa64/ros2/share/ament_cmake_core/cmake/environment_hooks/environment/path.sh")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/environment" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/ament_cmake_environment_hooks/path.dsv")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/ament_cmake_environment_hooks/local_setup.bash")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/ament_cmake_environment_hooks/local_setup.sh")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/ament_cmake_environment_hooks/local_setup.zsh")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/ament_cmake_environment_hooks/local_setup.dsv")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/ament_cmake_environment_hooks/package.dsv")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/packages" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/ament_cmake_index/share/ament_index/resource_index/packages/yolov8_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/export_yolov8_msgs__rosidl_generator_cExport.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/export_yolov8_msgs__rosidl_generator_cExport.cmake"
         "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/CMakeFiles/Export/c3533b237934bbe8573d95a31b864b11/export_yolov8_msgs__rosidl_generator_cExport.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/export_yolov8_msgs__rosidl_generator_cExport-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/export_yolov8_msgs__rosidl_generator_cExport.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/CMakeFiles/Export/c3533b237934bbe8573d95a31b864b11/export_yolov8_msgs__rosidl_generator_cExport.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/CMakeFiles/Export/c3533b237934bbe8573d95a31b864b11/export_yolov8_msgs__rosidl_generator_cExport-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/export_yolov8_msgs__rosidl_typesupport_fastrtps_cExport.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/export_yolov8_msgs__rosidl_typesupport_fastrtps_cExport.cmake"
         "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/CMakeFiles/Export/c3533b237934bbe8573d95a31b864b11/export_yolov8_msgs__rosidl_typesupport_fastrtps_cExport.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/export_yolov8_msgs__rosidl_typesupport_fastrtps_cExport-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/export_yolov8_msgs__rosidl_typesupport_fastrtps_cExport.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/CMakeFiles/Export/c3533b237934bbe8573d95a31b864b11/export_yolov8_msgs__rosidl_typesupport_fastrtps_cExport.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/CMakeFiles/Export/c3533b237934bbe8573d95a31b864b11/export_yolov8_msgs__rosidl_typesupport_fastrtps_cExport-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/yolov8_msgs__rosidl_typesupport_introspection_cExport.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/yolov8_msgs__rosidl_typesupport_introspection_cExport.cmake"
         "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/CMakeFiles/Export/c3533b237934bbe8573d95a31b864b11/yolov8_msgs__rosidl_typesupport_introspection_cExport.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/yolov8_msgs__rosidl_typesupport_introspection_cExport-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/yolov8_msgs__rosidl_typesupport_introspection_cExport.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/CMakeFiles/Export/c3533b237934bbe8573d95a31b864b11/yolov8_msgs__rosidl_typesupport_introspection_cExport.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/CMakeFiles/Export/c3533b237934bbe8573d95a31b864b11/yolov8_msgs__rosidl_typesupport_introspection_cExport-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/yolov8_msgs__rosidl_typesupport_cExport.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/yolov8_msgs__rosidl_typesupport_cExport.cmake"
         "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/CMakeFiles/Export/c3533b237934bbe8573d95a31b864b11/yolov8_msgs__rosidl_typesupport_cExport.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/yolov8_msgs__rosidl_typesupport_cExport-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/yolov8_msgs__rosidl_typesupport_cExport.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/CMakeFiles/Export/c3533b237934bbe8573d95a31b864b11/yolov8_msgs__rosidl_typesupport_cExport.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/CMakeFiles/Export/c3533b237934bbe8573d95a31b864b11/yolov8_msgs__rosidl_typesupport_cExport-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/export_yolov8_msgs__rosidl_generator_cppExport.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/export_yolov8_msgs__rosidl_generator_cppExport.cmake"
         "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/CMakeFiles/Export/c3533b237934bbe8573d95a31b864b11/export_yolov8_msgs__rosidl_generator_cppExport.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/export_yolov8_msgs__rosidl_generator_cppExport-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/export_yolov8_msgs__rosidl_generator_cppExport.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/CMakeFiles/Export/c3533b237934bbe8573d95a31b864b11/export_yolov8_msgs__rosidl_generator_cppExport.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/export_yolov8_msgs__rosidl_typesupport_fastrtps_cppExport.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/export_yolov8_msgs__rosidl_typesupport_fastrtps_cppExport.cmake"
         "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/CMakeFiles/Export/c3533b237934bbe8573d95a31b864b11/export_yolov8_msgs__rosidl_typesupport_fastrtps_cppExport.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/export_yolov8_msgs__rosidl_typesupport_fastrtps_cppExport-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/export_yolov8_msgs__rosidl_typesupport_fastrtps_cppExport.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/CMakeFiles/Export/c3533b237934bbe8573d95a31b864b11/export_yolov8_msgs__rosidl_typesupport_fastrtps_cppExport.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/CMakeFiles/Export/c3533b237934bbe8573d95a31b864b11/export_yolov8_msgs__rosidl_typesupport_fastrtps_cppExport-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/yolov8_msgs__rosidl_typesupport_introspection_cppExport.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/yolov8_msgs__rosidl_typesupport_introspection_cppExport.cmake"
         "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/CMakeFiles/Export/c3533b237934bbe8573d95a31b864b11/yolov8_msgs__rosidl_typesupport_introspection_cppExport.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/yolov8_msgs__rosidl_typesupport_introspection_cppExport-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/yolov8_msgs__rosidl_typesupport_introspection_cppExport.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/CMakeFiles/Export/c3533b237934bbe8573d95a31b864b11/yolov8_msgs__rosidl_typesupport_introspection_cppExport.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/CMakeFiles/Export/c3533b237934bbe8573d95a31b864b11/yolov8_msgs__rosidl_typesupport_introspection_cppExport-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/yolov8_msgs__rosidl_typesupport_cppExport.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/yolov8_msgs__rosidl_typesupport_cppExport.cmake"
         "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/CMakeFiles/Export/c3533b237934bbe8573d95a31b864b11/yolov8_msgs__rosidl_typesupport_cppExport.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/yolov8_msgs__rosidl_typesupport_cppExport-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake/yolov8_msgs__rosidl_typesupport_cppExport.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/CMakeFiles/Export/c3533b237934bbe8573d95a31b864b11/yolov8_msgs__rosidl_typesupport_cppExport.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/CMakeFiles/Export/c3533b237934bbe8573d95a31b864b11/yolov8_msgs__rosidl_typesupport_cppExport-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/rosidl_cmake/rosidl_cmake-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/ament_cmake_export_dependencies/ament_cmake_export_dependencies-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/ament_cmake_export_include_directories/ament_cmake_export_include_directories-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/ament_cmake_export_libraries/ament_cmake_export_libraries-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/ament_cmake_export_targets/ament_cmake_export_targets-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/rosidl_cmake/rosidl_cmake_export_typesupport_targets-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/rosidl_cmake/rosidl_cmake_export_typesupport_libraries-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs/cmake" TYPE FILE FILES
    "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/ament_cmake_core/yolov8_msgsConfig.cmake"
    "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/ament_cmake_core/yolov8_msgsConfig-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolov8_msgs" TYPE FILE FILES "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/src/yolov8_msgs/package.xml")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/aiv/YongJun_ws/src/YOLO/Yolov8/matlab_msg_gen/glnxa64/build/yolov8_msgs/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
