// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from vision_msgs:msg/Classification.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__CLASSIFICATION__BUILDER_HPP_
#define VISION_MSGS__MSG__DETAIL__CLASSIFICATION__BUILDER_HPP_

#include <algorithm>
#include <utility>

#include "vision_msgs/msg/detail/classification__struct.hpp"
#include "rosidl_runtime_cpp/message_initialization.hpp"


namespace vision_msgs
{

namespace msg
{

namespace builder
{

class Init_Classification_results
{
public:
  explicit Init_Classification_results(::vision_msgs::msg::Classification & msg)
  : msg_(msg)
  {}
  ::vision_msgs::msg::Classification results(::vision_msgs::msg::Classification::_results_type arg)
  {
    msg_.results = std::move(arg);
    return std::move(msg_);
  }

private:
  ::vision_msgs::msg::Classification msg_;
};

class Init_Classification_header
{
public:
  Init_Classification_header()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_Classification_results header(::vision_msgs::msg::Classification::_header_type arg)
  {
    msg_.header = std::move(arg);
    return Init_Classification_results(msg_);
  }

private:
  ::vision_msgs::msg::Classification msg_;
};

}  // namespace builder

}  // namespace msg

template<typename MessageType>
auto build();

template<>
inline
auto build<::vision_msgs::msg::Classification>()
{
  return vision_msgs::msg::builder::Init_Classification_header();
}

}  // namespace vision_msgs

#endif  // VISION_MSGS__MSG__DETAIL__CLASSIFICATION__BUILDER_HPP_
