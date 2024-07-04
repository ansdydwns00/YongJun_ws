// generated from rosidl_generator_cpp/resource/idl__struct.hpp.em
// with input from vision_msgs:msg/Detection3DArray.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__DETECTION3_D_ARRAY__STRUCT_HPP_
#define VISION_MSGS__MSG__DETAIL__DETECTION3_D_ARRAY__STRUCT_HPP_

#include <rosidl_runtime_cpp/bounded_vector.hpp>
#include <rosidl_runtime_cpp/message_initialization.hpp>
#include <algorithm>
#include <array>
#include <memory>
#include <string>
#include <vector>


// Include directives for member types
// Member 'header'
#include "std_msgs/msg/detail/header__struct.hpp"
// Member 'detections'
#include "vision_msgs/msg/detail/detection3_d__struct.hpp"

#ifndef _WIN32
# define DEPRECATED__vision_msgs__msg__Detection3DArray __attribute__((deprecated))
#else
# define DEPRECATED__vision_msgs__msg__Detection3DArray __declspec(deprecated)
#endif

namespace vision_msgs
{

namespace msg
{

// message struct
template<class ContainerAllocator>
struct Detection3DArray_
{
  using Type = Detection3DArray_<ContainerAllocator>;

  explicit Detection3DArray_(rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : header(_init)
  {
    (void)_init;
  }

  explicit Detection3DArray_(const ContainerAllocator & _alloc, rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : header(_alloc, _init)
  {
    (void)_init;
  }

  // field types and members
  using _header_type =
    std_msgs::msg::Header_<ContainerAllocator>;
  _header_type header;
  using _detections_type =
    std::vector<vision_msgs::msg::Detection3D_<ContainerAllocator>, typename ContainerAllocator::template rebind<vision_msgs::msg::Detection3D_<ContainerAllocator>>::other>;
  _detections_type detections;

  // setters for named parameter idiom
  Type & set__header(
    const std_msgs::msg::Header_<ContainerAllocator> & _arg)
  {
    this->header = _arg;
    return *this;
  }
  Type & set__detections(
    const std::vector<vision_msgs::msg::Detection3D_<ContainerAllocator>, typename ContainerAllocator::template rebind<vision_msgs::msg::Detection3D_<ContainerAllocator>>::other> & _arg)
  {
    this->detections = _arg;
    return *this;
  }

  // constant declarations

  // pointer types
  using RawPtr =
    vision_msgs::msg::Detection3DArray_<ContainerAllocator> *;
  using ConstRawPtr =
    const vision_msgs::msg::Detection3DArray_<ContainerAllocator> *;
  using SharedPtr =
    std::shared_ptr<vision_msgs::msg::Detection3DArray_<ContainerAllocator>>;
  using ConstSharedPtr =
    std::shared_ptr<vision_msgs::msg::Detection3DArray_<ContainerAllocator> const>;

  template<typename Deleter = std::default_delete<
      vision_msgs::msg::Detection3DArray_<ContainerAllocator>>>
  using UniquePtrWithDeleter =
    std::unique_ptr<vision_msgs::msg::Detection3DArray_<ContainerAllocator>, Deleter>;

  using UniquePtr = UniquePtrWithDeleter<>;

  template<typename Deleter = std::default_delete<
      vision_msgs::msg::Detection3DArray_<ContainerAllocator>>>
  using ConstUniquePtrWithDeleter =
    std::unique_ptr<vision_msgs::msg::Detection3DArray_<ContainerAllocator> const, Deleter>;
  using ConstUniquePtr = ConstUniquePtrWithDeleter<>;

  using WeakPtr =
    std::weak_ptr<vision_msgs::msg::Detection3DArray_<ContainerAllocator>>;
  using ConstWeakPtr =
    std::weak_ptr<vision_msgs::msg::Detection3DArray_<ContainerAllocator> const>;

  // pointer types similar to ROS 1, use SharedPtr / ConstSharedPtr instead
  // NOTE: Can't use 'using' here because GNU C++ can't parse attributes properly
  typedef DEPRECATED__vision_msgs__msg__Detection3DArray
    std::shared_ptr<vision_msgs::msg::Detection3DArray_<ContainerAllocator>>
    Ptr;
  typedef DEPRECATED__vision_msgs__msg__Detection3DArray
    std::shared_ptr<vision_msgs::msg::Detection3DArray_<ContainerAllocator> const>
    ConstPtr;

  // comparison operators
  bool operator==(const Detection3DArray_ & other) const
  {
    if (this->header != other.header) {
      return false;
    }
    if (this->detections != other.detections) {
      return false;
    }
    return true;
  }
  bool operator!=(const Detection3DArray_ & other) const
  {
    return !this->operator==(other);
  }
};  // struct Detection3DArray_

// alias to use template instance with default allocator
using Detection3DArray =
  vision_msgs::msg::Detection3DArray_<std::allocator<void>>;

// constant definitions

}  // namespace msg

}  // namespace vision_msgs

#endif  // VISION_MSGS__MSG__DETAIL__DETECTION3_D_ARRAY__STRUCT_HPP_
