// generated from rosidl_generator_cpp/resource/idl__struct.hpp.em
// with input from vision_msgs:msg/ObjectHypothesis.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS__STRUCT_HPP_
#define VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS__STRUCT_HPP_

#include <rosidl_runtime_cpp/bounded_vector.hpp>
#include <rosidl_runtime_cpp/message_initialization.hpp>
#include <algorithm>
#include <array>
#include <memory>
#include <string>
#include <vector>


#ifndef _WIN32
# define DEPRECATED__vision_msgs__msg__ObjectHypothesis __attribute__((deprecated))
#else
# define DEPRECATED__vision_msgs__msg__ObjectHypothesis __declspec(deprecated)
#endif

namespace vision_msgs
{

namespace msg
{

// message struct
template<class ContainerAllocator>
struct ObjectHypothesis_
{
  using Type = ObjectHypothesis_<ContainerAllocator>;

  explicit ObjectHypothesis_(rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  {
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->class_id = "";
      this->score = 0.0;
    }
  }

  explicit ObjectHypothesis_(const ContainerAllocator & _alloc, rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : class_id(_alloc)
  {
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->class_id = "";
      this->score = 0.0;
    }
  }

  // field types and members
  using _class_id_type =
    std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other>;
  _class_id_type class_id;
  using _score_type =
    double;
  _score_type score;

  // setters for named parameter idiom
  Type & set__class_id(
    const std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other> & _arg)
  {
    this->class_id = _arg;
    return *this;
  }
  Type & set__score(
    const double & _arg)
  {
    this->score = _arg;
    return *this;
  }

  // constant declarations

  // pointer types
  using RawPtr =
    vision_msgs::msg::ObjectHypothesis_<ContainerAllocator> *;
  using ConstRawPtr =
    const vision_msgs::msg::ObjectHypothesis_<ContainerAllocator> *;
  using SharedPtr =
    std::shared_ptr<vision_msgs::msg::ObjectHypothesis_<ContainerAllocator>>;
  using ConstSharedPtr =
    std::shared_ptr<vision_msgs::msg::ObjectHypothesis_<ContainerAllocator> const>;

  template<typename Deleter = std::default_delete<
      vision_msgs::msg::ObjectHypothesis_<ContainerAllocator>>>
  using UniquePtrWithDeleter =
    std::unique_ptr<vision_msgs::msg::ObjectHypothesis_<ContainerAllocator>, Deleter>;

  using UniquePtr = UniquePtrWithDeleter<>;

  template<typename Deleter = std::default_delete<
      vision_msgs::msg::ObjectHypothesis_<ContainerAllocator>>>
  using ConstUniquePtrWithDeleter =
    std::unique_ptr<vision_msgs::msg::ObjectHypothesis_<ContainerAllocator> const, Deleter>;
  using ConstUniquePtr = ConstUniquePtrWithDeleter<>;

  using WeakPtr =
    std::weak_ptr<vision_msgs::msg::ObjectHypothesis_<ContainerAllocator>>;
  using ConstWeakPtr =
    std::weak_ptr<vision_msgs::msg::ObjectHypothesis_<ContainerAllocator> const>;

  // pointer types similar to ROS 1, use SharedPtr / ConstSharedPtr instead
  // NOTE: Can't use 'using' here because GNU C++ can't parse attributes properly
  typedef DEPRECATED__vision_msgs__msg__ObjectHypothesis
    std::shared_ptr<vision_msgs::msg::ObjectHypothesis_<ContainerAllocator>>
    Ptr;
  typedef DEPRECATED__vision_msgs__msg__ObjectHypothesis
    std::shared_ptr<vision_msgs::msg::ObjectHypothesis_<ContainerAllocator> const>
    ConstPtr;

  // comparison operators
  bool operator==(const ObjectHypothesis_ & other) const
  {
    if (this->class_id != other.class_id) {
      return false;
    }
    if (this->score != other.score) {
      return false;
    }
    return true;
  }
  bool operator!=(const ObjectHypothesis_ & other) const
  {
    return !this->operator==(other);
  }
};  // struct ObjectHypothesis_

// alias to use template instance with default allocator
using ObjectHypothesis =
  vision_msgs::msg::ObjectHypothesis_<std::allocator<void>>;

// constant definitions

}  // namespace msg

}  // namespace vision_msgs

#endif  // VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS__STRUCT_HPP_
