// generated from rosidl_generator_cpp/resource/idl__traits.hpp.em
// with input from vision_msgs:msg/Detection3DArray.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__DETECTION3_D_ARRAY__TRAITS_HPP_
#define VISION_MSGS__MSG__DETAIL__DETECTION3_D_ARRAY__TRAITS_HPP_

#include "vision_msgs/msg/detail/detection3_d_array__struct.hpp"
#include <rosidl_runtime_cpp/traits.hpp>
#include <stdint.h>
#include <type_traits>

// Include directives for member types
// Member 'header'
#include "std_msgs/msg/detail/header__traits.hpp"

namespace rosidl_generator_traits
{

template<>
inline const char * data_type<vision_msgs::msg::Detection3DArray>()
{
  return "vision_msgs::msg::Detection3DArray";
}

template<>
inline const char * name<vision_msgs::msg::Detection3DArray>()
{
  return "vision_msgs/msg/Detection3DArray";
}

template<>
struct has_fixed_size<vision_msgs::msg::Detection3DArray>
  : std::integral_constant<bool, false> {};

template<>
struct has_bounded_size<vision_msgs::msg::Detection3DArray>
  : std::integral_constant<bool, false> {};

template<>
struct is_message<vision_msgs::msg::Detection3DArray>
  : std::true_type {};

}  // namespace rosidl_generator_traits

#endif  // VISION_MSGS__MSG__DETAIL__DETECTION3_D_ARRAY__TRAITS_HPP_
