// generated from rosidl_generator_cpp/resource/idl__traits.hpp.em
// with input from vision_msgs:msg/BoundingBox3DArray.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__BOUNDING_BOX3_D_ARRAY__TRAITS_HPP_
#define VISION_MSGS__MSG__DETAIL__BOUNDING_BOX3_D_ARRAY__TRAITS_HPP_

#include <stdint.h>

#include <sstream>
#include <string>
#include <type_traits>

#include "vision_msgs/msg/detail/bounding_box3_d_array__struct.hpp"
#include "rosidl_runtime_cpp/traits.hpp"

// Include directives for member types
// Member 'header'
#include "std_msgs/msg/detail/header__traits.hpp"
// Member 'boxes'
#include "vision_msgs/msg/detail/bounding_box3_d__traits.hpp"

namespace vision_msgs
{

namespace msg
{

inline void to_flow_style_yaml(
  const BoundingBox3DArray & msg,
  std::ostream & out)
{
  out << "{";
  // member: header
  {
    out << "header: ";
    to_flow_style_yaml(msg.header, out);
    out << ", ";
  }

  // member: boxes
  {
    if (msg.boxes.size() == 0) {
      out << "boxes: []";
    } else {
      out << "boxes: [";
      size_t pending_items = msg.boxes.size();
      for (auto item : msg.boxes) {
        to_flow_style_yaml(item, out);
        if (--pending_items > 0) {
          out << ", ";
        }
      }
      out << "]";
    }
  }
  out << "}";
}  // NOLINT(readability/fn_size)

inline void to_block_style_yaml(
  const BoundingBox3DArray & msg,
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

  // member: boxes
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    if (msg.boxes.size() == 0) {
      out << "boxes: []\n";
    } else {
      out << "boxes:\n";
      for (auto item : msg.boxes) {
        if (indentation > 0) {
          out << std::string(indentation, ' ');
        }
        out << "-\n";
        to_block_style_yaml(item, out, indentation + 2);
      }
    }
  }
}  // NOLINT(readability/fn_size)

inline std::string to_yaml(const BoundingBox3DArray & msg, bool use_flow_style = false)
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
  const vision_msgs::msg::BoundingBox3DArray & msg,
  std::ostream & out, size_t indentation = 0)
{
  vision_msgs::msg::to_block_style_yaml(msg, out, indentation);
}

[[deprecated("use vision_msgs::msg::to_yaml() instead")]]
inline std::string to_yaml(const vision_msgs::msg::BoundingBox3DArray & msg)
{
  return vision_msgs::msg::to_yaml(msg);
}

template<>
inline const char * data_type<vision_msgs::msg::BoundingBox3DArray>()
{
  return "vision_msgs::msg::BoundingBox3DArray";
}

template<>
inline const char * name<vision_msgs::msg::BoundingBox3DArray>()
{
  return "vision_msgs/msg/BoundingBox3DArray";
}

template<>
struct has_fixed_size<vision_msgs::msg::BoundingBox3DArray>
  : std::integral_constant<bool, false> {};

template<>
struct has_bounded_size<vision_msgs::msg::BoundingBox3DArray>
  : std::integral_constant<bool, false> {};

template<>
struct is_message<vision_msgs::msg::BoundingBox3DArray>
  : std::true_type {};

}  // namespace rosidl_generator_traits

#endif  // VISION_MSGS__MSG__DETAIL__BOUNDING_BOX3_D_ARRAY__TRAITS_HPP_
