// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from vision_msgs:msg/ObjectHypothesis.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS__BUILDER_HPP_
#define VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS__BUILDER_HPP_

#include "vision_msgs/msg/detail/object_hypothesis__struct.hpp"
#include <rosidl_runtime_cpp/message_initialization.hpp>
#include <algorithm>
#include <utility>


namespace vision_msgs
{

namespace msg
{

namespace builder
{

class Init_ObjectHypothesis_score
{
public:
  explicit Init_ObjectHypothesis_score(::vision_msgs::msg::ObjectHypothesis & msg)
  : msg_(msg)
  {}
  ::vision_msgs::msg::ObjectHypothesis score(::vision_msgs::msg::ObjectHypothesis::_score_type arg)
  {
    msg_.score = std::move(arg);
    return std::move(msg_);
  }

private:
  ::vision_msgs::msg::ObjectHypothesis msg_;
};

class Init_ObjectHypothesis_class_id
{
public:
  Init_ObjectHypothesis_class_id()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_ObjectHypothesis_score class_id(::vision_msgs::msg::ObjectHypothesis::_class_id_type arg)
  {
    msg_.class_id = std::move(arg);
    return Init_ObjectHypothesis_score(msg_);
  }

private:
  ::vision_msgs::msg::ObjectHypothesis msg_;
};

}  // namespace builder

}  // namespace msg

template<typename MessageType>
auto build();

template<>
inline
auto build<::vision_msgs::msg::ObjectHypothesis>()
{
  return vision_msgs::msg::builder::Init_ObjectHypothesis_class_id();
}

}  // namespace vision_msgs

#endif  // VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS__BUILDER_HPP_
