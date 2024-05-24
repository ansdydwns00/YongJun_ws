// generated from rosidl_generator_cpp/resource/idl__traits.hpp.em
// with input from vision_msgs:msg/ObjectHypothesis.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS__TRAITS_HPP_
#define VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS__TRAITS_HPP_

#include <stdint.h>

#include <sstream>
#include <string>
#include <type_traits>

#include "vision_msgs/msg/detail/object_hypothesis__struct.hpp"
#include "rosidl_runtime_cpp/traits.hpp"

namespace vision_msgs
{

namespace msg
{

inline void to_flow_style_yaml(
  const ObjectHypothesis & msg,
  std::ostream & out)
{
  out << "{";
  // member: class_id
  {
    out << "class_id: ";
    rosidl_generator_traits::value_to_yaml(msg.class_id, out);
    out << ", ";
  }

  // member: score
  {
    out << "score: ";
    rosidl_generator_traits::value_to_yaml(msg.score, out);
  }
  out << "}";
}  // NOLINT(readability/fn_size)

inline void to_block_style_yaml(
  const ObjectHypothesis & msg,
  std::ostream & out, size_t indentation = 0)
{
  // member: class_id
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "class_id: ";
    rosidl_generator_traits::value_to_yaml(msg.class_id, out);
    out << "\n";
  }

  // member: score
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "score: ";
    rosidl_generator_traits::value_to_yaml(msg.score, out);
    out << "\n";
  }
}  // NOLINT(readability/fn_size)

inline std::string to_yaml(const ObjectHypothesis & msg, bool use_flow_style = false)
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
  const vision_msgs::msg::ObjectHypothesis & msg,
  std::ostream & out, size_t indentation = 0)
{
  vision_msgs::msg::to_block_style_yaml(msg, out, indentation);
}

[[deprecated("use vision_msgs::msg::to_yaml() instead")]]
inline std::string to_yaml(const vision_msgs::msg::ObjectHypothesis & msg)
{
  return vision_msgs::msg::to_yaml(msg);
}

template<>
inline const char * data_type<vision_msgs::msg::ObjectHypothesis>()
{
  return "vision_msgs::msg::ObjectHypothesis";
}

template<>
inline const char * name<vision_msgs::msg::ObjectHypothesis>()
{
  return "vision_msgs/msg/ObjectHypothesis";
}

template<>
struct has_fixed_size<vision_msgs::msg::ObjectHypothesis>
  : std::integral_constant<bool, false> {};

template<>
struct has_bounded_size<vision_msgs::msg::ObjectHypothesis>
  : std::integral_constant<bool, false> {};

template<>
struct is_message<vision_msgs::msg::ObjectHypothesis>
  : std::true_type {};

}  // namespace rosidl_generator_traits

#endif  // VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS__TRAITS_HPP_
