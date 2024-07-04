// generated from rosidl_generator_cpp/resource/idl__traits.hpp.em
// with input from zed_interfaces:msg/GnssFusionStatus.idl
// generated code does not contain a copyright notice

#ifndef ZED_INTERFACES__MSG__DETAIL__GNSS_FUSION_STATUS__TRAITS_HPP_
#define ZED_INTERFACES__MSG__DETAIL__GNSS_FUSION_STATUS__TRAITS_HPP_

#include "zed_interfaces/msg/detail/gnss_fusion_status__struct.hpp"
#include <rosidl_runtime_cpp/traits.hpp>
#include <stdint.h>
#include <type_traits>

namespace rosidl_generator_traits
{

template<>
inline const char * data_type<zed_interfaces::msg::GnssFusionStatus>()
{
  return "zed_interfaces::msg::GnssFusionStatus";
}

template<>
inline const char * name<zed_interfaces::msg::GnssFusionStatus>()
{
  return "zed_interfaces/msg/GnssFusionStatus";
}

template<>
struct has_fixed_size<zed_interfaces::msg::GnssFusionStatus>
  : std::integral_constant<bool, true> {};

template<>
struct has_bounded_size<zed_interfaces::msg::GnssFusionStatus>
  : std::integral_constant<bool, true> {};

template<>
struct is_message<zed_interfaces::msg::GnssFusionStatus>
  : std::true_type {};

}  // namespace rosidl_generator_traits

#endif  // ZED_INTERFACES__MSG__DETAIL__GNSS_FUSION_STATUS__TRAITS_HPP_