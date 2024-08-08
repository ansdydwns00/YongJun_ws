// generated from rosidl_generator_cpp/resource/idl__traits.hpp.em
// with input from vision_msgs:msg/ObjectHypothesisWithPose.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS_WITH_POSE__TRAITS_HPP_
#define VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS_WITH_POSE__TRAITS_HPP_

#include <stdint.h>

#include <sstream>
#include <string>
#include <type_traits>

#include "vision_msgs/msg/detail/object_hypothesis_with_pose__struct.hpp"
#include "rosidl_runtime_cpp/traits.hpp"

// Include directives for member types
// Member 'hypothesis'
#include "vision_msgs/msg/detail/object_hypothesis__traits.hpp"
// Member 'pose'
#include "geometry_msgs/msg/detail/pose_with_covariance__traits.hpp"

namespace vision_msgs
{

namespace msg
{

inline void to_flow_style_yaml(
  const ObjectHypothesisWithPose & msg,
  std::ostream & out)
{
  out << "{";
  // member: hypothesis
  {
    out << "hypothesis: ";
    to_flow_style_yaml(msg.hypothesis, out);
    out << ", ";
  }

  // member: pose
  {
    out << "pose: ";
    to_flow_style_yaml(msg.pose, out);
  }
  out << "}";
}  // NOLINT(readability/fn_size)

inline void to_block_style_yaml(
  const ObjectHypothesisWithPose & msg,
  std::ostream & out, size_t indentation = 0)
{
  // member: hypothesis
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "hypothesis:\n";
    to_block_style_yaml(msg.hypothesis, out, indentation + 2);
  }

  // member: pose
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "pose:\n";
    to_block_style_yaml(msg.pose, out, indentation + 2);
  }
}  // NOLINT(readability/fn_size)

inline std::string to_yaml(const ObjectHypothesisWithPose & msg, bool use_flow_style = false)
{
  std::ostringstream out;
  if (use_flow_style) {
    to_flow_style_yaml(msg, out);
  } else {
    to_block_style_yaml(msg, out);
  }
  return out.str();
}

}  // namespace msg

}  // namespace vision_msgs

namespace rosidl_generator_traits
{

[[deprecated("use vision_msgs::msg::to_block_style_yaml() instead")]]
inline void to_yaml(
  const vision_msgs::msg::ObjectHypothesisWithPose & msg,
  std::ostream & out, size_t indentation = 0)
{
  vision_msgs::msg::to_block_style_yaml(msg, out, indentation);
}

[[deprecated("use vision_msgs::msg::to_yaml() instead")]]
inline std::string to_yaml(const vision_msgs::msg::ObjectHypothesisWithPose & msg)
{
  return vision_msgs::msg::to_yaml(msg);
}

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
