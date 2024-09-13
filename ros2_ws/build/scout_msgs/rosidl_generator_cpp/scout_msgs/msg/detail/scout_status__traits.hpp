// generated from rosidl_generator_cpp/resource/idl__traits.hpp.em
// with input from scout_msgs:msg/ScoutStatus.idl
// generated code does not contain a copyright notice

#ifndef SCOUT_MSGS__MSG__DETAIL__SCOUT_STATUS__TRAITS_HPP_
#define SCOUT_MSGS__MSG__DETAIL__SCOUT_STATUS__TRAITS_HPP_

#include "scout_msgs/msg/detail/scout_status__struct.hpp"
#include <rosidl_runtime_cpp/traits.hpp>
#include <stdint.h>
#include <type_traits>

// Include directives for member types
// Member 'header'
#include "std_msgs/msg/detail/header__traits.hpp"
// Member 'actuator_states'
#include "scout_msgs/msg/detail/scout_actuator_state__traits.hpp"
// Member 'front_light_state'
// Member 'rear_light_state'
#include "scout_msgs/msg/detail/scout_light_state__traits.hpp"

namespace rosidl_generator_traits
{

template<>
inline const char * data_type<scout_msgs::msg::ScoutStatus>()
{
  return "scout_msgs::msg::ScoutStatus";
}

template<>
inline const char * name<scout_msgs::msg::ScoutStatus>()
{
  return "scout_msgs/msg/ScoutStatus";
}

template<>
struct has_fixed_size<scout_msgs::msg::ScoutStatus>
  : std::integral_constant<bool, has_fixed_size<scout_msgs::msg::ScoutActuatorState>::value && has_fixed_size<scout_msgs::msg::ScoutLightState>::value && has_fixed_size<std_msgs::msg::Header>::value> {};

template<>
struct has_bounded_size<scout_msgs::msg::ScoutStatus>
  : std::integral_constant<bool, has_bounded_size<scout_msgs::msg::ScoutActuatorState>::value && has_bounded_size<scout_msgs::msg::ScoutLightState>::value && has_bounded_size<std_msgs::msg::Header>::value> {};

template<>
struct is_message<scout_msgs::msg::ScoutStatus>
  : std::true_type {};

}  // namespace rosidl_generator_traits

#endif  // SCOUT_MSGS__MSG__DETAIL__SCOUT_STATUS__TRAITS_HPP_
