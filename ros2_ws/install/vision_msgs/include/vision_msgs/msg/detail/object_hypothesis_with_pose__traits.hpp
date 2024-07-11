// generated from rosidl_generator_cpp/resource/idl__traits.hpp.em
// with input from vision_msgs:msg/ObjectHypothesisWithPose.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS_WITH_POSE__TRAITS_HPP_
#define VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS_WITH_POSE__TRAITS_HPP_

#include "vision_msgs/msg/detail/object_hypothesis_with_pose__struct.hpp"
#include <rosidl_runtime_cpp/traits.hpp>
#include <stdint.h>
#include <type_traits>

// Include directives for member types
// Member 'hypothesis'
#include "vision_msgs/msg/detail/object_hypothesis__traits.hpp"
// Member 'pose'
#include "geometry_msgs/msg/detail/pose_with_covariance__traits.hpp"

namespace rosidl_generator_traits
{

template<>
inline const char * data_type<vision_msgs::msg::ObjectHypothesisWithPose>()
{
  return "vision_msgs::msg::ObjectHypothesisWithPose";
}

template<>
inline const char * name<vision_msgs::msg::ObjectHypothesisWithPose>()
{
  return "vision_msgs/msg/ObjectHypothesisWithPose";
}

template<>
struct has_fixed_size<vision_msgs::msg::ObjectHypothesisWithPose>
  : std::integral_constant<bool, has_fixed_size<geometry_msgs::msg::PoseWithCovariance>::value && has_fixed_size<vision_msgs::msg::ObjectHypothesis>::value> {};

template<>
struct has_bounded_size<vision_msgs::msg::ObjectHypothesisWithPose>
  : std::integral_constant<bool, has_bounded_size<geometry_msgs::msg::PoseWithCovariance>::value && has_bounded_size<vision_msgs::msg::ObjectHypothesis>::value> {};

template<>
struct is_message<vision_msgs::msg::ObjectHypothesisWithPose>
  : std::true_type {};

}  // namespace rosidl_generator_traits

#endif  // VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS_WITH_POSE__TRAITS_HPP_
