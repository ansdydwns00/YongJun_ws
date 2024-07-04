// generated from rosidl_generator_cpp/resource/idl__struct.hpp.em
// with input from zed_interfaces:msg/PosTrackStatus.idl
// generated code does not contain a copyright notice

#ifndef ZED_INTERFACES__MSG__DETAIL__POS_TRACK_STATUS__STRUCT_HPP_
#define ZED_INTERFACES__MSG__DETAIL__POS_TRACK_STATUS__STRUCT_HPP_

#include <rosidl_runtime_cpp/bounded_vector.hpp>
#include <rosidl_runtime_cpp/message_initialization.hpp>
#include <algorithm>
#include <array>
#include <memory>
#include <string>
#include <vector>


#ifndef _WIN32
# define DEPRECATED__zed_interfaces__msg__PosTrackStatus __attribute__((deprecated))
#else
# define DEPRECATED__zed_interfaces__msg__PosTrackStatus __declspec(deprecated)
#endif

namespace zed_interfaces
{

namespace msg
{

// message struct
template<class ContainerAllocator>
struct PosTrackStatus_
{
  using Type = PosTrackStatus_<ContainerAllocator>;

  explicit PosTrackStatus_(rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  {
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->odometry_status = 0;
      this->spatial_memory_status = 0;
      this->status = 0;
    }
  }

  explicit PosTrackStatus_(const ContainerAllocator & _alloc, rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  {
    (void)_alloc;
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->odometry_status = 0;
      this->spatial_memory_status = 0;
      this->status = 0;
    }
  }

  // field types and members
  using _odometry_status_type =
    uint8_t;
  _odometry_status_type odometry_status;
  using _spatial_memory_status_type =
    uint8_t;
  _spatial_memory_status_type spatial_memory_status;
  using _status_type =
    uint8_t;
  _status_type status;

  // setters for named parameter idiom
  Type & set__odometry_status(
    const uint8_t & _arg)
  {
    this->odometry_status = _arg;
    return *this;
  }
  Type & set__spatial_memory_status(
    const uint8_t & _arg)
  {
    this->spatial_memory_status = _arg;
    return *this;
  }
  Type & set__status(
    const uint8_t & _arg)
  {
    this->status = _arg;
    return *this;
  }

  // constant declarations
  static constexpr uint8_t OK =
    0u;
  static constexpr uint8_t UNAVAILABLE =
    1u;
  static constexpr uint8_t LOOP_CLOSED =
    1u;
  static constexpr uint8_t SEARCHING =
    2u;
  static constexpr uint8_t OFF =
    3u;

  // pointer types
  using RawPtr =
    zed_interfaces::msg::PosTrackStatus_<ContainerAllocator> *;
  using ConstRawPtr =
    const zed_interfaces::msg::PosTrackStatus_<ContainerAllocator> *;
  using SharedPtr =
    std::shared_ptr<zed_interfaces::msg::PosTrackStatus_<ContainerAllocator>>;
  using ConstSharedPtr =
    std::shared_ptr<zed_interfaces::msg::PosTrackStatus_<ContainerAllocator> const>;

  template<typename Deleter = std::default_delete<
      zed_interfaces::msg::PosTrackStatus_<ContainerAllocator>>>
  using UniquePtrWithDeleter =
    std::unique_ptr<zed_interfaces::msg::PosTrackStatus_<ContainerAllocator>, Deleter>;

  using UniquePtr = UniquePtrWithDeleter<>;

  template<typename Deleter = std::default_delete<
      zed_interfaces::msg::PosTrackStatus_<ContainerAllocator>>>
  using ConstUniquePtrWithDeleter =
    std::unique_ptr<zed_interfaces::msg::PosTrackStatus_<ContainerAllocator> const, Deleter>;
  using ConstUniquePtr = ConstUniquePtrWithDeleter<>;

  using WeakPtr =
    std::weak_ptr<zed_interfaces::msg::PosTrackStatus_<ContainerAllocator>>;
  using ConstWeakPtr =
    std::weak_ptr<zed_interfaces::msg::PosTrackStatus_<ContainerAllocator> const>;

  // pointer types similar to ROS 1, use SharedPtr / ConstSharedPtr instead
  // NOTE: Can't use 'using' here because GNU C++ can't parse attributes properly
  typedef DEPRECATED__zed_interfaces__msg__PosTrackStatus
    std::shared_ptr<zed_interfaces::msg::PosTrackStatus_<ContainerAllocator>>
    Ptr;
  typedef DEPRECATED__zed_interfaces__msg__PosTrackStatus
    std::shared_ptr<zed_interfaces::msg::PosTrackStatus_<ContainerAllocator> const>
    ConstPtr;

  // comparison operators
  bool operator==(const PosTrackStatus_ & other) const
  {
    if (this->odometry_status != other.odometry_status) {
      return false;
    }
    if (this->spatial_memory_status != other.spatial_memory_status) {
      return false;
    }
    if (this->status != other.status) {
      return false;
    }
    return true;
  }
  bool operator!=(const PosTrackStatus_ & other) const
  {
    return !this->operator==(other);
  }
};  // struct PosTrackStatus_

// alias to use template instance with default allocator
using PosTrackStatus =
  zed_interfaces::msg::PosTrackStatus_<std::allocator<void>>;

// constant definitions
template<typename ContainerAllocator>
constexpr uint8_t PosTrackStatus_<ContainerAllocator>::OK;
template<typename ContainerAllocator>
constexpr uint8_t PosTrackStatus_<ContainerAllocator>::UNAVAILABLE;
template<typename ContainerAllocator>
constexpr uint8_t PosTrackStatus_<ContainerAllocator>::LOOP_CLOSED;
template<typename ContainerAllocator>
constexpr uint8_t PosTrackStatus_<ContainerAllocator>::SEARCHING;
template<typename ContainerAllocator>
constexpr uint8_t PosTrackStatus_<ContainerAllocator>::OFF;

}  // namespace msg

}  // namespace zed_interfaces

#endif  // ZED_INTERFACES__MSG__DETAIL__POS_TRACK_STATUS__STRUCT_HPP_
