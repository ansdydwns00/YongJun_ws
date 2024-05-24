// generated from rosidl_generator_cpp/resource/idl__traits.hpp.em
// with input from vision_msgs:msg/VisionInfo.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__VISION_INFO__TRAITS_HPP_
#define VISION_MSGS__MSG__DETAIL__VISION_INFO__TRAITS_HPP_

#include <stdint.h>

#include <sstream>
#include <string>
#include <type_traits>

#include "vision_msgs/msg/detail/vision_info__struct.hpp"
#include "rosidl_runtime_cpp/traits.hpp"

// Include directives for member types
// Member 'header'
#include "std_msgs/msg/detail/header__traits.hpp"

namespace vision_msgs
{

namespace msg
{

inline void to_flow_style_yaml(
  const VisionInfo & msg,
  std::ostream & out)
{
  out << "{";
  // member: header
  {
    out << "header: ";
    to_flow_style_yaml(msg.header, out);
    out << ", ";
  }

  // member: method
  {
    out << "method: ";
    rosidl_generator_traits::value_to_yaml(msg.method, out);
    out << ", ";
  }

  // member: database_location
  {
    out << "database_location: ";
    rosidl_generator_traits::value_to_yaml(msg.database_location, out);
    out << ", ";
  }

  // member: database_version
  {
    out << "database_version: ";
    rosidl_generator_traits::value_to_yaml(msg.database_version, out);
  }
  out << "}";
}  // NOLINT(readability/fn_size)

inline void to_block_style_yaml(
  const VisionInfo & msg,
  std::ostream & out, size_t indentation = 0)
{
  // member: header
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "header:\n";
    to_block_style_yaml(msg.header, out, indentation + 2);
  }

  // member: method
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "method: ";
    rosidl_generator_traits::value_to_yaml(msg.method, out);
    out << "\n";
  }

  // member: database_location
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "database_location: ";
    rosidl_generator_traits::value_to_yaml(msg.database_location, out);
    out << "\n";
  }

  // member: database_version
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "database_version: ";
    rosidl_generator_traits::value_to_yaml(msg.database_version, out);
    out << "\n";
  }
}  // NOLINT(readability/fn_size)

inline std::string to_yaml(const VisionInfo & msg, bool use_flow_style = false)
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
  const vision_msgs::msg::VisionInfo & msg,
  std::ostream & out, size_t indentation = 0)
{
  vision_msgs::msg::to_block_style_yaml(msg, out, indentation);
}

[[deprecated("use vision_msgs::msg::to_yaml() instead")]]
inline std::string to_yaml(const vision_msgs::msg::VisionInfo & msg)
{
  return vision_msgs::msg::to_yaml(msg);
}

template<>
inline const char * data_type<vision_msgs::msg::VisionInfo>()
{
  return "vision_msgs::msg::VisionInfo";
}

template<>
inline const char * name<vision_msgs::msg::VisionInfo>()
{
  return "vision_msgs/msg/VisionInfo";
}

template<>
struct has_fixed_size<vision_msgs::msg::VisionInfo>
  : std::integral_constant<bool, false> {};

template<>
struct has_bounded_size<vision_msgs::msg::VisionInfo>
  : std::integral_constant<bool, false> {};

template<>
struct is_message<vision_msgs::msg::VisionInfo>
  : std::true_type {};

}  // namespace rosidl_generator_traits

#endif  // VISION_MSGS__MSG__DETAIL__VISION_INFO__TRAITS_HPP_
