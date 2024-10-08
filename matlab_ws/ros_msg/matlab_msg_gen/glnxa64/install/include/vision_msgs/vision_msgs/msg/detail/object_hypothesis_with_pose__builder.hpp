// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from vision_msgs:msg/ObjectHypothesisWithPose.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS_WITH_POSE__BUILDER_HPP_
#define VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS_WITH_POSE__BUILDER_HPP_

#include <algorithm>
#include <utility>

#include "vision_msgs/msg/detail/object_hypothesis_with_pose__struct.hpp"
#include "rosidl_runtime_cpp/message_initialization.hpp"


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

class Init_ObjectHypothesisWithPose_score
{
public:
  explicit Init_ObjectHypothesisWithPose_score(::vision_msgs::msg::ObjectHypothesisWithPose & msg)
  : msg_(msg)
  {}
  Init_ObjectHypothesisWithPose_pose score(::vision_msgs::msg::ObjectHypothesisWithPose::_score_type arg)
  {
    msg_.score = std::move(arg);
    return Init_ObjectHypothesisWithPose_pose(msg_);
  }

private:
  ::vision_msgs::msg::ObjectHypothesisWithPose msg_;
};

class Init_ObjectHypothesisWithPose_id
{
public:
  Init_ObjectHypothesisWithPose_id()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_ObjectHypothesisWithPose_score id(::vision_msgs::msg::ObjectHypothesisWithPose::_id_type arg)
  {
    msg_.id = std::move(arg);
    return Init_ObjectHypothesisWithPose_score(msg_);
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
  return vision_msgs::msg::builder::Init_ObjectHypothesisWithPose_id();
}

}  // namespace vision_msgs

#endif  // VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS_WITH_POSE__BUILDER_HPP_
