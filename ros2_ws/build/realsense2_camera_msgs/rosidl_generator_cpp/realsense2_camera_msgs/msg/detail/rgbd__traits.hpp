// generated from rosidl_generator_cpp/resource/idl__traits.hpp.em
// with input from realsense2_camera_msgs:msg/RGBD.idl
// generated code does not contain a copyright notice

#ifndef REALSENSE2_CAMERA_MSGS__MSG__DETAIL__RGBD__TRAITS_HPP_
#define REALSENSE2_CAMERA_MSGS__MSG__DETAIL__RGBD__TRAITS_HPP_

#include "realsense2_camera_msgs/msg/detail/rgbd__struct.hpp"
#include <rosidl_runtime_cpp/traits.hpp>
#include <stdint.h>
#include <type_traits>

// Include directives for member types
// Member 'header'
#include "std_msgs/msg/detail/header__traits.hpp"
// Member 'rgb_camera_info'
// Member 'depth_camera_info'
#include "sensor_msgs/msg/detail/camera_info__traits.hpp"
// Member 'rgb'
// Member 'depth'
#include "sensor_msgs/msg/detail/image__traits.hpp"

namespace rosidl_generator_traits
{

template<>
inline const char * data_type<realsense2_camera_msgs::msg::RGBD>()
{
  return "realsense2_camera_msgs::msg::RGBD";
}

template<>
inline const char * name<realsense2_camera_msgs::msg::RGBD>()
{
  return "realsense2_camera_msgs/msg/RGBD";
}

template<>
struct has_fixed_size<realsense2_camera_msgs::msg::RGBD>
  : std::integral_constant<bool, has_fixed_size<sensor_msgs::msg::CameraInfo>::value && has_fixed_size<sensor_msgs::msg::Image>::value && has_fixed_size<std_msgs::msg::Header>::value> {};

template<>
struct has_bounded_size<realsense2_camera_msgs::msg::RGBD>
  : std::integral_constant<bool, has_bounded_size<sensor_msgs::msg::CameraInfo>::value && has_bounded_size<sensor_msgs::msg::Image>::value && has_bounded_size<std_msgs::msg::Header>::value> {};

template<>
struct is_message<realsense2_camera_msgs::msg::RGBD>
  : std::true_type {};

}  // namespace rosidl_generator_traits

#endif  // REALSENSE2_CAMERA_MSGS__MSG__DETAIL__RGBD__TRAITS_HPP_
