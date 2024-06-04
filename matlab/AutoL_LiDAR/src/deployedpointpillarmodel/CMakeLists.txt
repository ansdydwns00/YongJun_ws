cmake_minimum_required(VERSION 3.5)
project(deployedpointpillarmodel)
set(CMAKE_VERBOSE_MAKEFILE ON)
# Set CMAKE_BUILD_TYPE
set(CMAKE_BUILD_TYPE Release)
# Default to C99
if(NOT CMAKE_C_STANDARD)
  set(CMAKE_C_STANDARD 99)
endif()
# Default to C++17
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 17)
endif()
if(ALIAS_ROS2_TF2)
  add_definitions(-Dtf2=ros2_tf2)
  add_definitions(-Dtf2_ros=ros2_tf2_ros)
  add_definitions(-Dmessage_filters=ros2_message_filters)
endif()
# find dependencies
find_package(ament_cmake REQUIRED)
find_package(ament_cmake_ros REQUIRED)
find_package( builtin_interfaces REQUIRED)
find_package( geometry_msgs REQUIRED)
find_package( rclcpp REQUIRED)
find_package( sensor_msgs REQUIRED)
find_package( std_msgs REQUIRED)
find_package( vision_msgs REQUIRED)
include_directories("/codegen/exe")
include_directories("include")
include_directories("include/deployedpointpillarmodel")
set (CMAKE_SKIP_BUILD_RPATH false)
set (CMAKE_BUILD_WITH_INSTALL_RPATH true)
set (CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")
set (CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
# Node
add_executable(deployedPointPillarModel 
src/MWBatchNormalizationLayer.cpp
src/MWCNNLayer.cpp
src/MWCUBLASUtils.cpp
src/MWConcatenationLayer.cpp
src/MWConvLayer.cpp
src/MWCudnnBatchNormalizationLayerImpl.cu
src/MWCudnnCNNLayerImpl.cu
src/MWCudnnConcatenationLayerImpl.cu
src/MWCudnnConvLayerImpl.cu
src/MWCudnnCustomLayerBase.cu
src/MWCudnnFusedConvActivationLayerImpl.cu
src/MWCudnnLayerImplFactory.cu
src/MWCudnnMaxPoolingLayerImpl.cu
src/MWCudnnOutputLayerImpl.cu
src/MWCudnnSigmoidLayerImpl.cu
src/MWCudnnSplittingLayerImpl.cu
src/MWCudnnTargetNetworkImpl.cu
src/MWFusedConvActivationLayer.cpp
src/MWInputLayer.cpp
src/MWMaxPoolingLayer.cpp
src/MWOutputLayer.cpp
src/MWSigmoidLayer.cpp
src/MWSplittingLayer.cpp
src/MWTensorBase.cpp
src/PointCloud2Types.cu
src/PointCloudImpl.cu
src/Resize2DLayer.cu
src/SpecialMsgUtil.cu
src/arrayfun.cu
src/bbox2poly.cu
src/builtin_interfaces_TimeStruct.cu
src/cat.cu
src/cellstr_sort.cu
src/cellstr_strtrim.cu
src/cellstr_unique.cu
src/coder_posix_time.c
src/colon.cu
src/cosd.cu
src/createAnchorMaskPointPillars.cu
src/createAnchorsPointPillars.cu
src/deployedPointPillarModel.cu
src/deployedPointPillarModel_data.cu
src/deployedPointPillarModel_initialize.cu
src/deployedPointPillarModel_rtwutil.cu
src/deployedPointPillarModel_terminate.cu
src/div.cu
src/dlnetwork.cu
src/find.cu
src/geometry_msgs_PointStruct.cu
src/geometry_msgs_PoseStruct.cu
src/geometry_msgs_PoseWithCovarianceStruct.cu
src/geometry_msgs_QuaternionStruct.cu
src/geometry_msgs_Vector3Struct.cu
src/getCategoryNames.cu
src/getSubsetPoints.cu
src/heapsort.cu
src/inpolygon.cu
src/insertionsort.cu
src/introsort.cu
src/ipermute.cu
src/main.cpp
src/minOrMax.cu
src/mtimes.cu
src/overlapPolygonRotatedRects.cu
src/pause.cu
src/permute.cu
src/pointCloudBase.cu
src/pointPillarsObjectDetector.cu
src/predict.cu
src/repelem.cu
src/ros2_structmsg_conversion.cpp
src/ros2publisher.cu
src/ros2rate.cu
src/ros2subscriber.cu
src/rosReadField.cu
src/rosReadXYZ.cu
src/rtGetInf.cu
src/rtGetNaN.cu
src/rt_nonfinite.cu
src/sensor_msgs_PointCloud2Struct.cu
src/sensor_msgs_PointFieldStruct.cu
src/setQOSProfile.cu
src/sind.cu
src/sort.cu
src/sortIdx.cu
src/std_msgs_HeaderStruct.cu
src/strcmp.cu
src/vision_msgs_BoundingBox3DStruct.cu
src/vision_msgs_Detection3DArrayStruct.cu
src/vision_msgs_Detection3DStruct.cu
src/vision_msgs_ObjectHypothesisStruct.cu
src/vision_msgs_ObjectHypothesisWithPoseStruct.cu
src/createPillarsImpl.cpp
src/mlros2_sub.cpp
)
if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
target_compile_options(deployedPointPillarModel PUBLIC 
  $<$<OR:$<COMPILE_LANGUAGE:CXX>,$<COMPILE_LANGUAGE:C>>:
  -Wall -Wextra -Wpedantic
  >)
endif()
target_compile_options(deployedPointPillarModel PRIVATE
  $<$<OR:$<COMPILE_LANGUAGE:CXX>,$<COMPILE_LANGUAGE:C>>:
  -DMW_CUDA_ARCH=750
  -D__MW_TARGET_USE_HARDWARE_RESOURCES_H__
  -DROS2_PROJECT
  -DSTACK_SIZE=200000
  -DMODEL=deployedPointPillarModel
  >
  $<$<COMPILE_LANGUAGE:CUDA>:
  -Xcompiler=
  -DMW_CUDA_ARCH=750
  -D__MW_TARGET_USE_HARDWARE_RESOURCES_H__
  -DROS2_PROJECT
  -DSTACK_SIZE=200000
  -DMODEL=deployedPointPillarModel
  >
  )
  # Declare CUDA Bins
  set(CUDA_BINS 
  cnn_detector0_0_angle_conv2d_b_fused.bin
  cnn_detector0_0_angle_conv2d_w_fused.bin
  cnn_detector0_0_cnn_block1_bn0_offset.bin
  cnn_detector0_0_cnn_block1_bn0_scale.bin
  cnn_detector0_0_cnn_block1_bn0_trainedMean.bin
  cnn_detector0_0_cnn_block1_bn0_trainedVariance.bin
  cnn_detector0_0_cnn_block1_bn1_offset.bin
  cnn_detector0_0_cnn_block1_bn1_scale.bin
  cnn_detector0_0_cnn_block1_bn1_trainedMean.bin
  cnn_detector0_0_cnn_block1_bn1_trainedVariance.bin
  cnn_detector0_0_cnn_block1_bn2_offset.bin
  cnn_detector0_0_cnn_block1_bn2_scale.bin
  cnn_detector0_0_cnn_block1_bn2_trainedMean.bin
  cnn_detector0_0_cnn_block1_bn2_trainedVariance.bin
  cnn_detector0_0_cnn_block1_bn3_offset.bin
  cnn_detector0_0_cnn_block1_bn3_scale.bin
  cnn_detector0_0_cnn_block1_bn3_trainedMean.bin
  cnn_detector0_0_cnn_block1_bn3_trainedVariance.bin
  cnn_detector0_0_cnn_block1_conv2d0_b.bin
  cnn_detector0_0_cnn_block1_conv2d0_w.bin
  cnn_detector0_0_cnn_block1_conv2d1_b.bin
  cnn_detector0_0_cnn_block1_conv2d1_w.bin
  cnn_detector0_0_cnn_block1_conv2d2_b.bin
  cnn_detector0_0_cnn_block1_conv2d2_w.bin
  cnn_detector0_0_cnn_block1_conv2d3_b.bin
  cnn_detector0_0_cnn_block1_conv2d3_w.bin
  cnn_detector0_0_cnn_block2_bn0_offset.bin
  cnn_detector0_0_cnn_block2_bn0_scale.bin
  cnn_detector0_0_cnn_block2_bn0_trainedMean.bin
  cnn_detector0_0_cnn_block2_bn0_trainedVariance.bin
  cnn_detector0_0_cnn_block2_bn1_offset.bin
  cnn_detector0_0_cnn_block2_bn1_scale.bin
  cnn_detector0_0_cnn_block2_bn1_trainedMean.bin
  cnn_detector0_0_cnn_block2_bn1_trainedVariance.bin
  cnn_detector0_0_cnn_block2_bn2_offset.bin
  cnn_detector0_0_cnn_block2_bn2_scale.bin
  cnn_detector0_0_cnn_block2_bn2_trainedMean.bin
  cnn_detector0_0_cnn_block2_bn2_trainedVariance.bin
  cnn_detector0_0_cnn_block2_bn3_offset.bin
  cnn_detector0_0_cnn_block2_bn3_scale.bin
  cnn_detector0_0_cnn_block2_bn3_trainedMean.bin
  cnn_detector0_0_cnn_block2_bn3_trainedVariance.bin
  cnn_detector0_0_cnn_block2_bn4_offset.bin
  cnn_detector0_0_cnn_block2_bn4_scale.bin
  cnn_detector0_0_cnn_block2_bn4_trainedMean.bin
  cnn_detector0_0_cnn_block2_bn4_trainedVariance.bin
  cnn_detector0_0_cnn_block2_bn5_offset.bin
  cnn_detector0_0_cnn_block2_bn5_scale.bin
  cnn_detector0_0_cnn_block2_bn5_trainedMean.bin
  cnn_detector0_0_cnn_block2_bn5_trainedVariance.bin
  cnn_detector0_0_cnn_block2_conv2d0_b.bin
  cnn_detector0_0_cnn_block2_conv2d0_w.bin
  cnn_detector0_0_cnn_block2_conv2d1_b.bin
  cnn_detector0_0_cnn_block2_conv2d1_w.bin
  cnn_detector0_0_cnn_block2_conv2d2_b.bin
  cnn_detector0_0_cnn_block2_conv2d2_w.bin
  cnn_detector0_0_cnn_block2_conv2d3_b.bin
  cnn_detector0_0_cnn_block2_conv2d3_w.bin
  cnn_detector0_0_cnn_block2_conv2d4_b.bin
  cnn_detector0_0_cnn_block2_conv2d4_w.bin
  cnn_detector0_0_cnn_block2_conv2d5_b.bin
  cnn_detector0_0_cnn_block2_conv2d5_w.bin
  cnn_detector0_0_cnn_block3_bn0_offset.bin
  cnn_detector0_0_cnn_block3_bn0_scale.bin
  cnn_detector0_0_cnn_block3_bn0_trainedMean.bin
  cnn_detector0_0_cnn_block3_bn0_trainedVariance.bin
  cnn_detector0_0_cnn_block3_bn1_offset.bin
  cnn_detector0_0_cnn_block3_bn1_scale.bin
  cnn_detector0_0_cnn_block3_bn1_trainedMean.bin
  cnn_detector0_0_cnn_block3_bn1_trainedVariance.bin
  cnn_detector0_0_cnn_block3_bn2_offset.bin
  cnn_detector0_0_cnn_block3_bn2_scale.bin
  cnn_detector0_0_cnn_block3_bn2_trainedMean.bin
  cnn_detector0_0_cnn_block3_bn2_trainedVariance.bin
  cnn_detector0_0_cnn_block3_bn3_offset.bin
  cnn_detector0_0_cnn_block3_bn3_scale.bin
  cnn_detector0_0_cnn_block3_bn3_trainedMean.bin
  cnn_detector0_0_cnn_block3_bn3_trainedVariance.bin
  cnn_detector0_0_cnn_block3_bn4_offset.bin
  cnn_detector0_0_cnn_block3_bn4_scale.bin
  cnn_detector0_0_cnn_block3_bn4_trainedMean.bin
  cnn_detector0_0_cnn_block3_bn4_trainedVariance.bin
  cnn_detector0_0_cnn_block3_bn5_offset.bin
  cnn_detector0_0_cnn_block3_bn5_scale.bin
  cnn_detector0_0_cnn_block3_bn5_trainedMean.bin
  cnn_detector0_0_cnn_block3_bn5_trainedVariance.bin
  cnn_detector0_0_cnn_block3_conv2d0_b.bin
  cnn_detector0_0_cnn_block3_conv2d0_w.bin
  cnn_detector0_0_cnn_block3_conv2d1_b.bin
  cnn_detector0_0_cnn_block3_conv2d1_w.bin
  cnn_detector0_0_cnn_block3_conv2d2_b.bin
  cnn_detector0_0_cnn_block3_conv2d2_w.bin
  cnn_detector0_0_cnn_block3_conv2d3_b.bin
  cnn_detector0_0_cnn_block3_conv2d3_w.bin
  cnn_detector0_0_cnn_block3_conv2d4_b.bin
  cnn_detector0_0_cnn_block3_conv2d4_w.bin
  cnn_detector0_0_cnn_block3_conv2d5_b.bin
  cnn_detector0_0_cnn_block3_conv2d5_w.bin
  cnn_detector0_0_cnn_up1_bn_offset.bin
  cnn_detector0_0_cnn_up1_bn_scale.bin
  cnn_detector0_0_cnn_up1_bn_trainedMean.bin
  cnn_detector0_0_cnn_up1_bn_trainedVariance.bin
  cnn_detector0_0_cnn_up1_conv2dt_b.bin
  cnn_detector0_0_cnn_up1_conv2dt_w.bin
  cnn_detector0_0_cnn_up2_bn_offset.bin
  cnn_detector0_0_cnn_up2_bn_scale.bin
  cnn_detector0_0_cnn_up2_bn_trainedMean.bin
  cnn_detector0_0_cnn_up2_bn_trainedVariance.bin
  cnn_detector0_0_cnn_up2_conv2dt_b.bin
  cnn_detector0_0_cnn_up2_conv2dt_w.bin
  cnn_detector0_0_cnn_up3_bn_offset.bin
  cnn_detector0_0_cnn_up3_bn_scale.bin
  cnn_detector0_0_cnn_up3_bn_trainedMean.bin
  cnn_detector0_0_cnn_up3_bn_trainedVariance.bin
  cnn_detector0_0_cnn_up3_conv2dt_b.bin
  cnn_detector0_0_cnn_up3_conv2dt_w.bin
  cnn_detector0_0_pillars_conv2d_b.bin
  cnn_detector0_0_pillars_conv2d_w.bin
  networkParamsInfo_detector0_0.bin
  _clang-format
  rtw_proj.tmw
  )
enable_language(CUDA)
include_directories(${CMAKE_CUDA_TOOLKIT_INCLUDE_DIRECTORIES})
set_target_properties(deployedPointPillarModel PROPERTIES CUDA_SEPARABLE_COMPILATION ON)
if (MSVC)
  target_compile_options(deployedPointPillarModel PRIVATE $<$<COMPILE_LANGUAGE:CUDA>:-arch sm_75 -rdc=true -Xcudafe "--display_error_number --diag_suppress=unsigned_compare_with_zero --diag_suppress=field_without_dll_interface --diag_suppress=base_class_has_different_dll_interface" >)
else()
 target_compile_options(deployedPointPillarModel PRIVATE $<$<COMPILE_LANGUAGE:CUDA>:-arch sm_75 -rdc=true -Xcudafe "--display_error_number --diag_suppress=unsigned_compare_with_zero --diag_suppress=field_without_dll_interface --diag_suppress=base_class_has_different_dll_interface" -Xcompiler=-fPIC>)
endif()
ament_target_dependencies(
  deployedPointPillarModel
  "builtin_interfaces"
  "geometry_msgs"
  "rclcpp"
  "sensor_msgs"
  "std_msgs"
  "vision_msgs"
)
target_include_directories(deployedPointPillarModel PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:include>)
target_link_libraries(deployedPointPillarModel 
    ${CUDA_LIBRARIES} cublas cudnn cufft curand cusolver cusparse
	${CMAKE_DL_LIBS}
    )
install(TARGETS deployedPointPillarModel
  EXPORT export_${PROJECT_NAME}
  DESTINATION lib/${PROJECT_NAME})
ament_export_include_directories(
  include
)
foreach(file_i ${CUDA_BINS})
add_custom_command(
                   TARGET deployedPointPillarModel
                   POST_BUILD
                   COMMAND ${CMAKE_COMMAND}
                   ARGS -E copy ${PROJECT_SOURCE_DIR}/src/${file_i} ${CMAKE_INSTALL_PREFIX}/deployedPointPillarModel_ert_rtw/${file_i}
				   )
add_custom_command(
                   TARGET deployedPointPillarModel
                   POST_BUILD
                   COMMAND ${CMAKE_COMMAND}
                   ARGS -E copy ${PROJECT_SOURCE_DIR}/src/${file_i} ${CMAKE_INSTALL_PREFIX}/codegen/exe/deployedPointPillarModel/${file_i}
				   )				   
endforeach(file_i)
ament_package()
# Generated on Tue Jun 04 16:25:04 2024
