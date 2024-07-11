// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from vision_msgs:msg/ObjectHypothesisWithPose.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS_WITH_POSE__BUILDER_HPP_
#define VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS_WITH_POSE__BUILDER_HPP_

#include "vision_msgs/msg/detail/object_hypothesis_with_pose__struct.hpp"
#include <rosidl_runtime_cpp/message_initialization.hpp>
#include <algorithm>
#include <utility>


namespace vision_msgs
{

namespace msg
{

namespace builder
{

class Init_ObjectHypothesisWithPose_pose
{
public:
  explicit Init_ObjectHypothesisWithPose_pose(::vision_msgs::msg::ObjectHypothesisWithPose & msg)
  : msg_(msg)
  {}
  ::vision_msgs::msg::ObjectHypothesisWithPose pose(::vision_msgs::msg::ObjectHypothesisWithPose::_pose_type arg)
  {
    msg_.pose = std::move(arg);
    return std::move(msg_);
  }

private:
  ::vision_msgs::msg::ObjectHypothesisWithPose msg_;
};

class Init_ObjectHypothesisWithPose_hypothesis
{
public:
  Init_ObjectHypothesisWithPose_hypothesis()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_ObjectHypothesisWithPose_pose hypothesis(::vision_msgs::msg::ObjectHypothesisWithPose::_hypothesis_type arg)
  {
    msg_.hypothesis = std::move(arg);
    return Init_ObjectHypothesisWithPose_pose(msg_);
  }

private:
  ::vision_msgs::msg::ObjectHypothesisWithPose msg_;
};

}  // namespace builder

}  // namespace msg

template<typename MessageType>
auto build();

template<>
inline
auto build<::vision_msgs::msg::ObjectHypothesisWithPose>()
{
  return vision_msgs::msg::builder::Init_ObjectHypothesisWithPose_hypothesis();
}

}  // namespace vision_msgs

#endif  // VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS_WITH_POSE__BUILDER_HPP_
