// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from vision_msgs:msg/BoundingBox2D.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__BOUNDING_BOX2_D__BUILDER_HPP_
#define VISION_MSGS__MSG__DETAIL__BOUNDING_BOX2_D__BUILDER_HPP_

#include <algorithm>
#include <utility>

#include "vision_msgs/msg/detail/bounding_box2_d__struct.hpp"
#include "rosidl_runtime_cpp/message_initialization.hpp"


namespace vision_msgs
{

namespace msg
{

namespace builder
{

class Init_BoundingBox2D_size_y
{
public:
  explicit Init_BoundingBox2D_size_y(::vision_msgs::msg::BoundingBox2D & msg)
  : msg_(msg)
  {}
  ::vision_msgs::msg::BoundingBox2D size_y(::vision_msgs::msg::BoundingBox2D::_size_y_type arg)
  {
    msg_.size_y = std::move(arg);
    return std::move(msg_);
  }

private:
  ::vision_msgs::msg::BoundingBox2D msg_;
};

class Init_BoundingBox2D_size_x
{
public:
  explicit Init_BoundingBox2D_size_x(::vision_msgs::msg::BoundingBox2D & msg)
  : msg_(msg)
  {}
  Init_BoundingBox2D_size_y size_x(::vision_msgs::msg::BoundingBox2D::_size_x_type arg)
  {
    msg_.size_x = std::move(arg);
    return Init_BoundingBox2D_size_y(msg_);
  }

private:
  ::vision_msgs::msg::BoundingBox2D msg_;
};

class Init_BoundingBox2D_center
{
public:
  Init_BoundingBox2D_center()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_BoundingBox2D_size_x center(::vision_msgs::msg::BoundingBox2D::_center_type arg)
  {
    msg_.center = std::move(arg);
    return Init_BoundingBox2D_size_x(msg_);
  }

private:
  ::vision_msgs::msg::BoundingBox2D msg_;
};

}  // namespace builder

}  // namespace msg

template<typename MessageType>
auto build();

template<>
inline
auto build<::vision_msgs::msg::BoundingBox2D>()
{
  return vision_msgs::msg::builder::Init_BoundingBox2D_center();
}

}  // namespace vision_msgs

#endif  // VISION_MSGS__MSG__DETAIL__BOUNDING_BOX2_D__BUILDER_HPP_
