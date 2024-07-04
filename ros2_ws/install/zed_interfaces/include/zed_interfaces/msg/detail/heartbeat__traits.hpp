// generated from rosidl_generator_cpp/resource/idl__traits.hpp.em
// with input from zed_interfaces:msg/Heartbeat.idl
// generated code does not contain a copyright notice

#ifndef ZED_INTERFACES__MSG__DETAIL__HEARTBEAT__TRAITS_HPP_
#define ZED_INTERFACES__MSG__DETAIL__HEARTBEAT__TRAITS_HPP_

#include "zed_interfaces/msg/detail/heartbeat__struct.hpp"
#include <rosidl_runtime_cpp/traits.hpp>
#include <stdint.h>
#include <type_traits>

namespace rosidl_generator_traits
{

template<>
inline const char * data_type<zed_interfaces::msg::Heartbeat>()
{
  return "zed_interfaces::msg::Heartbeat";
}

template<>
inline const char * name<zed_interfaces::msg::Heartbeat>()
{
  return "zed_interfaces/msg/Heartbeat";
}

template<>
struct has_fixed_size<zed_interfaces::msg::Heartbeat>
  : std::integral_constant<bool, false> {};

template<>
struct has_bounded_size<zed_interfaces::msg::Heartbeat>
  : std::integral_constant<bool, false> {};

template<>
struct is_message<zed_interfaces::msg::Heartbeat>
  : std::true_type {};

}  // namespace rosidl_generator_traits

#endif  // ZED_INTERFACES__MSG__DETAIL__HEARTBEAT__TRAITS_HPP_
