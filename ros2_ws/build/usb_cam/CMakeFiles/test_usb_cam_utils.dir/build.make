# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/aiv/YongJun_ws/ros2_ws/src/sensor/usb_cam

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/aiv/YongJun_ws/ros2_ws/build/usb_cam

# Include any dependencies generated for this target.
include CMakeFiles/test_usb_cam_utils.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/test_usb_cam_utils.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test_usb_cam_utils.dir/flags.make

CMakeFiles/test_usb_cam_utils.dir/test/test_usb_cam_utils.cpp.o: CMakeFiles/test_usb_cam_utils.dir/flags.make
CMakeFiles/test_usb_cam_utils.dir/test/test_usb_cam_utils.cpp.o: /home/aiv/YongJun_ws/ros2_ws/src/sensor/usb_cam/test/test_usb_cam_utils.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/aiv/YongJun_ws/ros2_ws/build/usb_cam/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/test_usb_cam_utils.dir/test/test_usb_cam_utils.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_usb_cam_utils.dir/test/test_usb_cam_utils.cpp.o -c /home/aiv/YongJun_ws/ros2_ws/src/sensor/usb_cam/test/test_usb_cam_utils.cpp

CMakeFiles/test_usb_cam_utils.dir/test/test_usb_cam_utils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_usb_cam_utils.dir/test/test_usb_cam_utils.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/aiv/YongJun_ws/ros2_ws/src/sensor/usb_cam/test/test_usb_cam_utils.cpp > CMakeFiles/test_usb_cam_utils.dir/test/test_usb_cam_utils.cpp.i

CMakeFiles/test_usb_cam_utils.dir/test/test_usb_cam_utils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_usb_cam_utils.dir/test/test_usb_cam_utils.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/aiv/YongJun_ws/ros2_ws/src/sensor/usb_cam/test/test_usb_cam_utils.cpp -o CMakeFiles/test_usb_cam_utils.dir/test/test_usb_cam_utils.cpp.s

# Object files for target test_usb_cam_utils
test_usb_cam_utils_OBJECTS = \
"CMakeFiles/test_usb_cam_utils.dir/test/test_usb_cam_utils.cpp.o"

# External object files for target test_usb_cam_utils
test_usb_cam_utils_EXTERNAL_OBJECTS =

test_usb_cam_utils: CMakeFiles/test_usb_cam_utils.dir/test/test_usb_cam_utils.cpp.o
test_usb_cam_utils: CMakeFiles/test_usb_cam_utils.dir/build.make
test_usb_cam_utils: gtest/libgtest_main.a
test_usb_cam_utils: gtest/libgtest.a
test_usb_cam_utils: libusb_cam.so
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_stitching.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_aruco.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_bgsegm.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_bioinspired.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_ccalib.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_dnn_objdetect.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_dnn_superres.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_dpm.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_face.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_freetype.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_fuzzy.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_hdf.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_hfs.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_img_hash.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_line_descriptor.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_quality.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_reg.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_rgbd.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_saliency.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_shape.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_stereo.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_structured_light.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_phase_unwrapping.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_superres.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_optflow.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_surface_matching.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_tracking.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_datasets.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_plot.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_text.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_dnn.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_videostab.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_videoio.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_viz.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_ximgproc.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_video.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_xobjdetect.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_imgcodecs.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_xphoto.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.4.2.0
test_usb_cam_utils: /usr/lib/x86_64-linux-gnu/libopencv_core.so.4.2.0
test_usb_cam_utils: CMakeFiles/test_usb_cam_utils.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/aiv/YongJun_ws/ros2_ws/build/usb_cam/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable test_usb_cam_utils"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_usb_cam_utils.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test_usb_cam_utils.dir/build: test_usb_cam_utils

.PHONY : CMakeFiles/test_usb_cam_utils.dir/build

CMakeFiles/test_usb_cam_utils.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test_usb_cam_utils.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test_usb_cam_utils.dir/clean

CMakeFiles/test_usb_cam_utils.dir/depend:
	cd /home/aiv/YongJun_ws/ros2_ws/build/usb_cam && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/aiv/YongJun_ws/ros2_ws/src/sensor/usb_cam /home/aiv/YongJun_ws/ros2_ws/src/sensor/usb_cam /home/aiv/YongJun_ws/ros2_ws/build/usb_cam /home/aiv/YongJun_ws/ros2_ws/build/usb_cam /home/aiv/YongJun_ws/ros2_ws/build/usb_cam/CMakeFiles/test_usb_cam_utils.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test_usb_cam_utils.dir/depend

