// generated from rosidl_generator_cpp/resource/idl__traits.hpp.em
// with input from scout_msgs:msg/ScoutLightCmd.idl
// generated code does not contain a copyright notice

#ifndef SCOUT_MSGS__MSG__DETAIL__SCOUT_LIGHT_CMD__TRAITS_HPP_
#define SCOUT_MSGS__MSG__DETAIL__SCOUT_LIGHT_CMD__TRAITS_HPP_

#include "scout_msgs/msg/detail/scout_light_cmd__struct.hpp"
#include <rosidl_runtime_cpp/traits.hpp>
#include <stdint.h>
#include <type_traits>

namespace rosidl_generator_traits
{

template<>
inline const char * data_type<scout_msgs::msg::ScoutLightCmd>()
{
  return "scout_msgs::msg::ScoutLightCmd";
}

template<>
inline const char * name<scout_msgs::msg::ScoutLightCmd>()
{
  return "scout_msgs/msg/ScoutLightCmd";
}

template<>
struct has_fixed_size<scout_msgs::msg::ScoutLightCmd>
  : std::integral_constant<bool, true> {};

template<>
struct has_bounded_size<scout_msgs::msg::ScoutLightCmd>
  : std::integral_constant<bool, true> {};

template<>
struct is_message<scout_msgs::msg::ScoutLightCmd>
  : std::true_type {};

}  // namespace rosidl_generator_traits

#endif  // SCOUT_MSGS__MSG__DETAIL__SCOUT_LIGHT_CMD__TRAITS_HPP_
