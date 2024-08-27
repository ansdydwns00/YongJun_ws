// generated from rosidl_generator_cpp/resource/idl__struct.hpp.em
// with input from vision_msgs:msg/Classification2D.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__CLASSIFICATION2_D__STRUCT_HPP_
#define VISION_MSGS__MSG__DETAIL__CLASSIFICATION2_D__STRUCT_HPP_

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
// Member 'results'
#include "vision_msgs/msg/detail/object_hypothesis__struct.hpp"
// Member 'source_img'
#include "sensor_msgs/msg/detail/image__struct.hpp"

#ifndef _WIN32
# define DEPRECATED__vision_msgs__msg__Classification2D __attribute__((deprecated))
#else
# define DEPRECATED__vision_msgs__msg__Classification2D __declspec(deprecated)
#endif

namespace vision_msgs
{

namespace msg
{

// message struct
template<class ContainerAllocator>
struct Classification2D_
{
  using Type = Classification2D_<ContainerAllocator>;

  explicit Classification2D_(rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : header(_init),
    source_img(_init)
  {
    (void)_init;
  }

  explicit Classification2D_(const ContainerAllocator & _alloc, rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : header(_alloc, _init),
    source_img(_alloc, _init)
  {
    (void)_init;
  }

  // field types and members
  using _header_type =
    std_msgs::msg::Header_<ContainerAllocator>;
  _header_type header;
  using _results_type =
    std::vector<vision_msgs::msg::ObjectHypothesis_<ContainerAllocator>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<vision_msgs::msg::ObjectHypothesis_<ContainerAllocator>>>;
  _results_type results;
  using _source_img_type =
    sensor_msgs::msg::Image_<ContainerAllocator>;
  _source_img_type source_img;

  // setters for named parameter idiom
  Type & set__header(
    const std_msgs::msg::Header_<ContainerAllocator> & _arg)
  {
    this->header = _arg;
    return *this;
  }
  Type & set__results(
    const std::vector<vision_msgs::msg::ObjectHypothesis_<ContainerAllocator>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<vision_msgs::msg::ObjectHypothesis_<ContainerAllocator>>> & _arg)
  {
    this->results = _arg;
    return *this;
  }
  Type & set__source_img(
    const sensor_msgs::msg::Image_<ContainerAllocator> & _arg)
  {
    this->source_img = _arg;
    return *this;
  }

  // constant declarations

  // pointer types
  using RawPtr =
    vision_msgs::msg::Classification2D_<ContainerAllocator> *;
  using ConstRawPtr =
    const vision_msgs::msg::Classification2D_<ContainerAllocator> *;
  using SharedPtr =
    std::shared_ptr<vision_msgs::msg::Classification2D_<ContainerAllocator>>;
  using ConstSharedPtr =
    std::shared_ptr<vision_msgs::msg::Classification2D_<ContainerAllocator> const>;

  template<typename Deleter = std::default_delete<
      vision_msgs::msg::Classification2D_<ContainerAllocator>>>
  using UniquePtrWithDeleter =
    std::unique_ptr<vision_msgs::msg::Classification2D_<ContainerAllocator>, Deleter>;

  using UniquePtr = UniquePtrWithDeleter<>;

  template<typename Deleter = std::default_delete<
      vision_msgs::msg::Classification2D_<ContainerAllocator>>>
  using ConstUniquePtrWithDeleter =
    std::unique_ptr<vision_msgs::msg::Classification2D_<ContainerAllocator> const, Deleter>;
  using ConstUniquePtr = ConstUniquePtrWithDeleter<>;

  using WeakPtr =
    std::weak_ptr<vision_msgs::msg::Classification2D_<ContainerAllocator>>;
  using ConstWeakPtr =
    std::weak_ptr<vision_msgs::msg::Classification2D_<ContainerAllocator> const>;

  // pointer types similar to ROS 1, use SharedPtr / ConstSharedPtr instead
  // NOTE: Can't use 'using' here because GNU C++ can't parse attributes properly
  typedef DEPRECATED__vision_msgs__msg__Classification2D
    std::shared_ptr<vision_msgs::msg::Classification2D_<ContainerAllocator>>
    Ptr;
  typedef DEPRECATED__vision_msgs__msg__Classification2D
    std::shared_ptr<vision_msgs::msg::Classification2D_<ContainerAllocator> const>
    ConstPtr;

  // comparison operators
  bool operator==(const Classification2D_ & other) const
  {
    if (this->header != other.header) {
      return false;
    }
    if (this->results != other.results) {
      return false;
    }
    if (this->source_img != other.source_img) {
      return false;
    }
    return true;
  }
  bool operator!=(const Classification2D_ & other) const
  {
    return !this->operator==(other);
  }
};  // struct Classification2D_

// alias to use template instance with default allocator
using Classification2D =
  vision_msgs::msg::Classification2D_<std::allocator<void>>;

// constant definitions

}  // namespace msg

}  // namespace vision_msgs

#endif  // VISION_MSGS__MSG__DETAIL__CLASSIFICATION2_D__STRUCT_HPP_
