// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from vision_msgs:msg/Point2D.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__POINT2_D__BUILDER_HPP_
#define VISION_MSGS__MSG__DETAIL__POINT2_D__BUILDER_HPP_

#include <algorithm>
#include <utility>

#include "vision_msgs/msg/detail/point2_d__struct.hpp"
#include "rosidl_runtime_cpp/message_initialization.hpp"


namespace vision_msgs
{

namespace msg
{

namespace builder
{

class Init_Point2D_y
{
public:
  explicit Init_Point2D_y(::vision_msgs::msg::Point2D & msg)
  : msg_(msg)
  {}
  ::vision_msgs::msg::Point2D y(::vision_msgs::msg::Point2D::_y_type arg)
  {
    msg_.y = std::move(arg);
    return std::move(msg_);
  }

private:
  ::vision_msgs::msg::Point2D msg_;
};

class Init_Point2D_x
{
public:
  Init_Point2D_x()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_Point2D_y x(::vision_msgs::msg::Point2D::_x_type arg)
  {
    msg_.x = std::move(arg);
    return Init_Point2D_y(msg_);
  }

private:
  ::vision_msgs::msg::Point2D msg_;
};

}  // namespace builder

}  // namespace msg

template<typename MessageType>
auto build();

template<>
inline
auto build<::vision_msgs::msg::Point2D>()
{
  return vision_msgs::msg::builder::Init_Point2D_x();
}

}  // namespace vision_msgs

#endif  // VISION_MSGS__MSG__DETAIL__POINT2_D__BUILDER_HPP_
