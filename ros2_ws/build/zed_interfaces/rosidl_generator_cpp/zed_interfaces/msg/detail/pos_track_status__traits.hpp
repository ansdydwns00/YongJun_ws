// generated from rosidl_generator_cpp/resource/idl__traits.hpp.em
// with input from zed_interfaces:msg/PosTrackStatus.idl
// generated code does not contain a copyright notice

#ifndef ZED_INTERFACES__MSG__DETAIL__POS_TRACK_STATUS__TRAITS_HPP_
#define ZED_INTERFACES__MSG__DETAIL__POS_TRACK_STATUS__TRAITS_HPP_

#include "zed_interfaces/msg/detail/pos_track_status__struct.hpp"
#include <rosidl_runtime_cpp/traits.hpp>
#include <stdint.h>
#include <type_traits>

namespace rosidl_generator_traits
{

template<>
inline const char * data_type<zed_interfaces::msg::PosTrackStatus>()
{
  return "zed_interfaces::msg::PosTrackStatus";
}

template<>
inline const char * name<zed_interfaces::msg::PosTrackStatus>()
{
  return "zed_interfaces/msg/PosTrackStatus";
}

template<>
struct has_fixed_size<zed_interfaces::msg::PosTrackStatus>
  : std::integral_constant<bool, true> {};

template<>
struct has_bounded_size<zed_interfaces::msg::PosTrackStatus>
  : std::integral_constant<bool, true> {};

template<>
struct is_message<zed_interfaces::msg::PosTrackStatus>
  : std::true_type {};

}  // namespace rosidl_generator_traits

#endif  // ZED_INTERFACES__MSG__DETAIL__POS_TRACK_STATUS__TRAITS_HPP_
