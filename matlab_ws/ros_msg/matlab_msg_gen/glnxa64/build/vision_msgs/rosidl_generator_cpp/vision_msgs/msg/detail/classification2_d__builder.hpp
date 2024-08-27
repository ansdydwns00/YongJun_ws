// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from vision_msgs:msg/Classification2D.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__CLASSIFICATION2_D__BUILDER_HPP_
#define VISION_MSGS__MSG__DETAIL__CLASSIFICATION2_D__BUILDER_HPP_

#include <algorithm>
#include <utility>

#include "vision_msgs/msg/detail/classification2_d__struct.hpp"
#include "rosidl_runtime_cpp/message_initialization.hpp"


namespace vision_msgs
{

namespace msg
{

namespace builder
{

class Init_Classification2D_source_img
{
public:
  explicit Init_Classification2D_source_img(::vision_msgs::msg::Classification2D & msg)
  : msg_(msg)
  {}
  ::vision_msgs::msg::Classification2D source_img(::vision_msgs::msg::Classification2D::_source_img_type arg)
  {
    msg_.source_img = std::move(arg);
    return std::move(msg_);
  }

private:
  ::vision_msgs::msg::Classification2D msg_;
};

class Init_Classification2D_results
{
public:
  explicit Init_Classification2D_results(::vision_msgs::msg::Classification2D & msg)
  : msg_(msg)
  {}
  Init_Classification2D_source_img results(::vision_msgs::msg::Classification2D::_results_type arg)
  {
    msg_.results = std::move(arg);
    return Init_Classification2D_source_img(msg_);
  }

private:
  ::vision_msgs::msg::Classification2D msg_;
};

class Init_Classification2D_header
{
public:
  Init_Classification2D_header()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_Classification2D_results header(::vision_msgs::msg::Classification2D::_header_type arg)
  {
    msg_.header = std::move(arg);
    return Init_Classification2D_results(msg_);
  }

private:
  ::vision_msgs::msg::Classification2D msg_;
};

}  // namespace builder

}  // namespace msg

template<typename MessageType>
auto build();

template<>
inline
auto build<::vision_msgs::msg::Classification2D>()
{
  return vision_msgs::msg::builder::Init_Classification2D_header();
}

}  // namespace vision_msgs

#endif  // VISION_MSGS__MSG__DETAIL__CLASSIFICATION2_D__BUILDER_HPP_
