// generated from rosidl_generator_cpp/resource/idl__struct.hpp.em
// with input from vision_msgs:msg/BoundingBox2D.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__BOUNDING_BOX2_D__STRUCT_HPP_
#define VISION_MSGS__MSG__DETAIL__BOUNDING_BOX2_D__STRUCT_HPP_

#include <algorithm>
#include <array>
#include <memory>
#include <string>
#include <vector>

#include "rosidl_runtime_cpp/bounded_vector.hpp"
#include "rosidl_runtime_cpp/message_initialization.hpp"


// Include directives for member types
// Member 'center'
#include "vision_msgs/msg/detail/pose2_d__struct.hpp"

#ifndef _WIN32
# define DEPRECATED__vision_msgs__msg__BoundingBox2D __attribute__((deprecated))
#else
# define DEPRECATED__vision_msgs__msg__BoundingBox2D __declspec(deprecated)
#endif

namespace vision_msgs
{

namespace msg
{

// message struct
template<class ContainerAllocator>
struct BoundingBox2D_
{
  using Type = BoundingBox2D_<ContainerAllocator>;

  explicit BoundingBox2D_(rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : center(_init)
  {
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->size_x = 0.0;
      this->size_y = 0.0;
    }
  }

  explicit BoundingBox2D_(const ContainerAllocator & _alloc, rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : center(_alloc, _init)
  {
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->size_x = 0.0;
      this->size_y = 0.0;
    }
  }

  // field types and members
  using _center_type =
    vision_msgs::msg::Pose2D_<ContainerAllocator>;
  _center_type center;
  using _size_x_type =
    double;
  _size_x_type size_x;
  using _size_y_type =
    double;
  _size_y_type size_y;

  // setters for named parameter idiom
  Type & set__center(
    const vision_msgs::msg::Pose2D_<ContainerAllocator> & _arg)
  {
    this->center = _arg;
    return *this;
  }
  Type & set__size_x(
    const double & _arg)
  {
    this->size_x = _arg;
    return *this;
  }
  Type & set__size_y(
    const double & _arg)
  {
    this->size_y = _arg;
    return *this;
  }

  // constant declarations

  // pointer types
  using RawPtr =
    vision_msgs::msg::BoundingBox2D_<ContainerAllocator> *;
  using ConstRawPtr =
    const vision_msgs::msg::BoundingBox2D_<ContainerAllocator> *;
  using SharedPtr =
    std::shared_ptr<vision_msgs::msg::BoundingBox2D_<ContainerAllocator>>;
  using ConstSharedPtr =
    std::shared_ptr<vision_msgs::msg::BoundingBox2D_<ContainerAllocator> const>;

  template<typename Deleter = std::default_delete<
      vision_msgs::msg::BoundingBox2D_<ContainerAllocator>>>
  using UniquePtrWithDeleter =
    std::unique_ptr<vision_msgs::msg::BoundingBox2D_<ContainerAllocator>, Deleter>;

  using UniquePtr = UniquePtrWithDeleter<>;

  template<typename Deleter = std::default_delete<
      vision_msgs::msg::BoundingBox2D_<ContainerAllocator>>>
  using ConstUniquePtrWithDeleter =
    std::unique_ptr<vision_msgs::msg::BoundingBox2D_<ContainerAllocator> const, Deleter>;
  using ConstUniquePtr = ConstUniquePtrWithDeleter<>;

  using WeakPtr =
    std::weak_ptr<vision_msgs::msg::BoundingBox2D_<ContainerAllocator>>;
  using ConstWeakPtr =
    std::weak_ptr<vision_msgs::msg::BoundingBox2D_<ContainerAllocator> const>;

  // pointer types similar to ROS 1, use SharedPtr / ConstSharedPtr instead
  // NOTE: Can't use 'using' here because GNU C++ can't parse attributes properly
  typedef DEPRECATED__vision_msgs__msg__BoundingBox2D
    std::shared_ptr<vision_msgs::msg::BoundingBox2D_<ContainerAllocator>>
    Ptr;
  typedef DEPRECATED__vision_msgs__msg__BoundingBox2D
    std::shared_ptr<vision_msgs::msg::BoundingBox2D_<ContainerAllocator> const>
    ConstPtr;

  // comparison operators
  bool operator==(const BoundingBox2D_ & other) const
  {
    if (this->center != other.center) {
      return false;
    }
    if (this->size_x != other.size_x) {
      return false;
    }
    if (this->size_y != other.size_y) {
      return false;
    }
    return true;
  }
  bool operator!=(const BoundingBox2D_ & other) const
  {
    return !this->operator==(other);
  }
};  // struct BoundingBox2D_

// alias to use template instance with default allocator
using BoundingBox2D =
  vision_msgs::msg::BoundingBox2D_<std::allocator<void>>;

// constant definitions

}  // namespace msg

}  // namespace vision_msgs

#endif  // VISION_MSGS__MSG__DETAIL__BOUNDING_BOX2_D__STRUCT_HPP_
