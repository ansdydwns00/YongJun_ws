// generated from rosidl_generator_cpp/resource/idl__struct.hpp.em
// with input from vision_msgs:msg/ObjectHypothesisWithPose.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS_WITH_POSE__STRUCT_HPP_
#define VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS_WITH_POSE__STRUCT_HPP_

#include <rosidl_runtime_cpp/bounded_vector.hpp>
#include <rosidl_runtime_cpp/message_initialization.hpp>
#include <algorithm>
#include <array>
#include <memory>
#include <string>
#include <vector>


// Include directives for member types
// Member 'hypothesis'
#include "vision_msgs/msg/detail/object_hypothesis__struct.hpp"
// Member 'pose'
#include "geometry_msgs/msg/detail/pose_with_covariance__struct.hpp"

#ifndef _WIN32
# define DEPRECATED__vision_msgs__msg__ObjectHypothesisWithPose __attribute__((deprecated))
#else
# define DEPRECATED__vision_msgs__msg__ObjectHypothesisWithPose __declspec(deprecated)
#endif

namespace vision_msgs
{

namespace msg
{

// message struct
template<class ContainerAllocator>
struct ObjectHypothesisWithPose_
{
  using Type = ObjectHypothesisWithPose_<ContainerAllocator>;

  explicit ObjectHypothesisWithPose_(rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : hypothesis(_init),
    pose(_init)
  {
    (void)_init;
  }

  explicit ObjectHypothesisWithPose_(const ContainerAllocator & _alloc, rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : hypothesis(_alloc, _init),
    pose(_alloc, _init)
  {
    (void)_init;
  }

  // field types and members
  using _hypothesis_type =
    vision_msgs::msg::ObjectHypothesis_<ContainerAllocator>;
  _hypothesis_type hypothesis;
  using _pose_type =
    geometry_msgs::msg::PoseWithCovariance_<ContainerAllocator>;
  _pose_type pose;

  // setters for named parameter idiom
  Type & set__hypothesis(
    const vision_msgs::msg::ObjectHypothesis_<ContainerAllocator> & _arg)
  {
    this->hypothesis = _arg;
    return *this;
  }
  Type & set__pose(
    const geometry_msgs::msg::PoseWithCovariance_<ContainerAllocator> & _arg)
  {
    this->pose = _arg;
    return *this;
  }

  // constant declarations

  // pointer types
  using RawPtr =
    vision_msgs::msg::ObjectHypothesisWithPose_<ContainerAllocator> *;
  using ConstRawPtr =
    const vision_msgs::msg::ObjectHypothesisWithPose_<ContainerAllocator> *;
  using SharedPtr =
    std::shared_ptr<vision_msgs::msg::ObjectHypothesisWithPose_<ContainerAllocator>>;
  using ConstSharedPtr =
    std::shared_ptr<vision_msgs::msg::ObjectHypothesisWithPose_<ContainerAllocator> const>;

  template<typename Deleter = std::default_delete<
      vision_msgs::msg::ObjectHypothesisWithPose_<ContainerAllocator>>>
  using UniquePtrWithDeleter =
    std::unique_ptr<vision_msgs::msg::ObjectHypothesisWithPose_<ContainerAllocator>, Deleter>;

  using UniquePtr = UniquePtrWithDeleter<>;

  template<typename Deleter = std::default_delete<
      vision_msgs::msg::ObjectHypothesisWithPose_<ContainerAllocator>>>
  using ConstUniquePtrWithDeleter =
    std::unique_ptr<vision_msgs::msg::ObjectHypothesisWithPose_<ContainerAllocator> const, Deleter>;
  using ConstUniquePtr = ConstUniquePtrWithDeleter<>;

  using WeakPtr =
    std::weak_ptr<vision_msgs::msg::ObjectHypothesisWithPose_<ContainerAllocator>>;
  using ConstWeakPtr =
    std::weak_ptr<vision_msgs::msg::ObjectHypothesisWithPose_<ContainerAllocator> const>;

  // pointer types similar to ROS 1, use SharedPtr / ConstSharedPtr instead
  // NOTE: Can't use 'using' here because GNU C++ can't parse attributes properly
  typedef DEPRECATED__vision_msgs__msg__ObjectHypothesisWithPose
    std::shared_ptr<vision_msgs::msg::ObjectHypothesisWithPose_<ContainerAllocator>>
    Ptr;
  typedef DEPRECATED__vision_msgs__msg__ObjectHypothesisWithPose
    std::shared_ptr<vision_msgs::msg::ObjectHypothesisWithPose_<ContainerAllocator> const>
    ConstPtr;

  // comparison operators
  bool operator==(const ObjectHypothesisWithPose_ & other) const
  {
    if (this->hypothesis != other.hypothesis) {
      return false;
    }
    if (this->pose != other.pose) {
      return false;
    }
    return true;
  }
  bool operator!=(const ObjectHypothesisWithPose_ & other) const
  {
    return !this->operator==(other);
  }
};  // struct ObjectHypothesisWithPose_

// alias to use template instance with default allocator
using ObjectHypothesisWithPose =
  vision_msgs::msg::ObjectHypothesisWithPose_<std::allocator<void>>;

// constant definitions

}  // namespace msg

}  // namespace vision_msgs

#endif  // VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS_WITH_POSE__STRUCT_HPP_
