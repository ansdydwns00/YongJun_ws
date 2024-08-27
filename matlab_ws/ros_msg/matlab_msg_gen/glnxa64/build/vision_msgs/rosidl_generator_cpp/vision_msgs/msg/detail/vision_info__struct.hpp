// generated from rosidl_generator_cpp/resource/idl__struct.hpp.em
// with input from vision_msgs:msg/VisionInfo.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__VISION_INFO__STRUCT_HPP_
#define VISION_MSGS__MSG__DETAIL__VISION_INFO__STRUCT_HPP_

#include <algorithm>
#include <array>
#include <memory>
#include <string>
#include <vector>

#include "rosidl_runtime_cpp/bounded_vector.hpp"
#include "rosidl_runtime_cpp/message_initialization.hpp"


// Include directives for member types
// Member 'header'
#include "std_msgs/msg/detail/header__struct.hpp"

#ifndef _WIN32
# define DEPRECATED__vision_msgs__msg__VisionInfo __attribute__((deprecated))
#else
# define DEPRECATED__vision_msgs__msg__VisionInfo __declspec(deprecated)
#endif

namespace vision_msgs
{

namespace msg
{

// message struct
template<class ContainerAllocator>
struct VisionInfo_
{
  using Type = VisionInfo_<ContainerAllocator>;

  explicit VisionInfo_(rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : header(_init)
  {
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->method = "";
      this->database_location = "";
      this->database_version = 0l;
    }
  }

  explicit VisionInfo_(const ContainerAllocator & _alloc, rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : header(_alloc, _init),
    method(_alloc),
    database_location(_alloc)
  {
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->method = "";
      this->database_location = "";
      this->database_version = 0l;
    }
  }

  // field types and members
  using _header_type =
    std_msgs::msg::Header_<ContainerAllocator>;
  _header_type header;
  using _method_type =
    std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>;
  _method_type method;
  using _database_location_type =
    std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>;
  _database_location_type database_location;
  using _database_version_type =
    int32_t;
  _database_version_type database_version;

  // setters for named parameter idiom
  Type & set__header(
    const std_msgs::msg::Header_<ContainerAllocator> & _arg)
  {
    this->header = _arg;
    return *this;
  }
  Type & set__method(
    const std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> & _arg)
  {
    this->method = _arg;
    return *this;
  }
  Type & set__database_location(
    const std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> & _arg)
  {
    this->database_location = _arg;
    return *this;
  }
  Type & set__database_version(
    const int32_t & _arg)
  {
    this->database_version = _arg;
    return *this;
  }

  // constant declarations

  // pointer types
  using RawPtr =
    vision_msgs::msg::VisionInfo_<ContainerAllocator> *;
  using ConstRawPtr =
    const vision_msgs::msg::VisionInfo_<ContainerAllocator> *;
  using SharedPtr =
    std::shared_ptr<vision_msgs::msg::VisionInfo_<ContainerAllocator>>;
  using ConstSharedPtr =
    std::shared_ptr<vision_msgs::msg::VisionInfo_<ContainerAllocator> const>;

  template<typename Deleter = std::default_delete<
      vision_msgs::msg::VisionInfo_<ContainerAllocator>>>
  using UniquePtrWithDeleter =
    std::unique_ptr<vision_msgs::msg::VisionInfo_<ContainerAllocator>, Deleter>;

  using UniquePtr = UniquePtrWithDeleter<>;

  template<typename Deleter = std::default_delete<
      vision_msgs::msg::VisionInfo_<ContainerAllocator>>>
  using ConstUniquePtrWithDeleter =
    std::unique_ptr<vision_msgs::msg::VisionInfo_<ContainerAllocator> const, Deleter>;
  using ConstUniquePtr = ConstUniquePtrWithDeleter<>;

  using WeakPtr =
    std::weak_ptr<vision_msgs::msg::VisionInfo_<ContainerAllocator>>;
  using ConstWeakPtr =
    std::weak_ptr<vision_msgs::msg::VisionInfo_<ContainerAllocator> const>;

  // pointer types similar to ROS 1, use SharedPtr / ConstSharedPtr instead
  // NOTE: Can't use 'using' here because GNU C++ can't parse attributes properly
  typedef DEPRECATED__vision_msgs__msg__VisionInfo
    std::shared_ptr<vision_msgs::msg::VisionInfo_<ContainerAllocator>>
    Ptr;
  typedef DEPRECATED__vision_msgs__msg__VisionInfo
    std::shared_ptr<vision_msgs::msg::VisionInfo_<ContainerAllocator> const>
    ConstPtr;

  // comparison operators
  bool operator==(const VisionInfo_ & other) const
  {
    if (this->header != other.header) {
      return false;
    }
    if (this->method != other.method) {
      return false;
    }
    if (this->database_location != other.database_location) {
      return false;
    }
    if (this->database_version != other.database_version) {
      return false;
    }
    return true;
  }
  bool operator!=(const VisionInfo_ & other) const
  {
    return !this->operator==(other);
  }
};  // struct VisionInfo_

// alias to use template instance with default allocator
using VisionInfo =
  vision_msgs::msg::VisionInfo_<std::allocator<void>>;

// constant definitions

}  // namespace msg

}  // namespace vision_msgs

#endif  // VISION_MSGS__MSG__DETAIL__VISION_INFO__STRUCT_HPP_
