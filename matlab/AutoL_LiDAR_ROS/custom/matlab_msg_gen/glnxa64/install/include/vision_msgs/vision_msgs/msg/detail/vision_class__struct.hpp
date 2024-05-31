// generated from rosidl_generator_cpp/resource/idl__struct.hpp.em
// with input from vision_msgs:msg/VisionClass.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__VISION_CLASS__STRUCT_HPP_
#define VISION_MSGS__MSG__DETAIL__VISION_CLASS__STRUCT_HPP_

#include <algorithm>
#include <array>
#include <memory>
#include <string>
#include <vector>

#include "rosidl_runtime_cpp/bounded_vector.hpp"
#include "rosidl_runtime_cpp/message_initialization.hpp"


#ifndef _WIN32
# define DEPRECATED__vision_msgs__msg__VisionClass __attribute__((deprecated))
#else
# define DEPRECATED__vision_msgs__msg__VisionClass __declspec(deprecated)
#endif

namespace vision_msgs
{

namespace msg
{

// message struct
template<class ContainerAllocator>
struct VisionClass_
{
  using Type = VisionClass_<ContainerAllocator>;

  explicit VisionClass_(rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  {
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->class_id = 0;
      this->class_name = "";
    }
  }

  explicit VisionClass_(const ContainerAllocator & _alloc, rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : class_name(_alloc)
  {
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->class_id = 0;
      this->class_name = "";
    }
  }

  // field types and members
  using _class_id_type =
    uint16_t;
  _class_id_type class_id;
  using _class_name_type =
    std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>;
  _class_name_type class_name;

  // setters for named parameter idiom
  Type & set__class_id(
    const uint16_t & _arg)
  {
    this->class_id = _arg;
    return *this;
  }
  Type & set__class_name(
    const std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> & _arg)
  {
    this->class_name = _arg;
    return *this;
  }

  // constant declarations

  // pointer types
  using RawPtr =
    vision_msgs::msg::VisionClass_<ContainerAllocator> *;
  using ConstRawPtr =
    const vision_msgs::msg::VisionClass_<ContainerAllocator> *;
  using SharedPtr =
    std::shared_ptr<vision_msgs::msg::VisionClass_<ContainerAllocator>>;
  using ConstSharedPtr =
    std::shared_ptr<vision_msgs::msg::VisionClass_<ContainerAllocator> const>;

  template<typename Deleter = std::default_delete<
      vision_msgs::msg::VisionClass_<ContainerAllocator>>>
  using UniquePtrWithDeleter =
    std::unique_ptr<vision_msgs::msg::VisionClass_<ContainerAllocator>, Deleter>;

  using UniquePtr = UniquePtrWithDeleter<>;

  template<typename Deleter = std::default_delete<
      vision_msgs::msg::VisionClass_<ContainerAllocator>>>
  using ConstUniquePtrWithDeleter =
    std::unique_ptr<vision_msgs::msg::VisionClass_<ContainerAllocator> const, Deleter>;
  using ConstUniquePtr = ConstUniquePtrWithDeleter<>;

  using WeakPtr =
    std::weak_ptr<vision_msgs::msg::VisionClass_<ContainerAllocator>>;
  using ConstWeakPtr =
    std::weak_ptr<vision_msgs::msg::VisionClass_<ContainerAllocator> const>;

  // pointer types similar to ROS 1, use SharedPtr / ConstSharedPtr instead
  // NOTE: Can't use 'using' here because GNU C++ can't parse attributes properly
  typedef DEPRECATED__vision_msgs__msg__VisionClass
    std::shared_ptr<vision_msgs::msg::VisionClass_<ContainerAllocator>>
    Ptr;
  typedef DEPRECATED__vision_msgs__msg__VisionClass
    std::shared_ptr<vision_msgs::msg::VisionClass_<ContainerAllocator> const>
    ConstPtr;

  // comparison operators
  bool operator==(const VisionClass_ & other) const
  {
    if (this->class_id != other.class_id) {
      return false;
    }
    if (this->class_name != other.class_name) {
      return false;
    }
    return true;
  }
  bool operator!=(const VisionClass_ & other) const
  {
    return !this->operator==(other);
  }
};  // struct VisionClass_

// alias to use template instance with default allocator
using VisionClass =
  vision_msgs::msg::VisionClass_<std::allocator<void>>;

// constant definitions

}  // namespace msg

}  // namespace vision_msgs

#endif  // VISION_MSGS__MSG__DETAIL__VISION_CLASS__STRUCT_HPP_
