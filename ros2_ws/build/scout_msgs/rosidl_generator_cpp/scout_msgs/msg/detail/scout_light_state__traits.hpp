// generated from rosidl_generator_cpp/resource/idl__traits.hpp.em
// with input from scout_msgs:msg/ScoutLightState.idl
// generated code does not contain a copyright notice

#ifndef SCOUT_MSGS__MSG__DETAIL__SCOUT_LIGHT_STATE__TRAITS_HPP_
#define SCOUT_MSGS__MSG__DETAIL__SCOUT_LIGHT_STATE__TRAITS_HPP_

#include "scout_msgs/msg/detail/scout_light_state__struct.hpp"
#include <rosidl_runtime_cpp/traits.hpp>
#include <stdint.h>
#include <type_traits>

namespace rosidl_generator_traits
{

template<>
inline const char * data_type<scout_msgs::msg::ScoutLightState>()
{
  return "scout_msgs::msg::ScoutLightState";
}

template<>
inline const char * name<scout_msgs::msg::ScoutLightState>()
{
  return "scout_msgs/msg/ScoutLightState";
}

template<>
struct has_fixed_size<scout_msgs::msg::ScoutLightState>
  : std::integral_constant<bool, true> {};

template<>
struct has_bounded_size<scout_msgs::msg::ScoutLightState>
  : std::integral_constant<bool, true> {};

template<>
struct is_message<scout_msgs::msg::ScoutLightState>
  : std::true_type {};

}  // namespace rosidl_generator_traits

#endif  // SCOUT_MSGS__MSG__DETAIL__SCOUT_LIGHT_STATE__TRAITS_HPP_
