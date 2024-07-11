// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from vision_msgs:msg/BoundingBox3D.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__BOUNDING_BOX3_D__BUILDER_HPP_
#define VISION_MSGS__MSG__DETAIL__BOUNDING_BOX3_D__BUILDER_HPP_

#include "vision_msgs/msg/detail/bounding_box3_d__struct.hpp"
#include <rosidl_runtime_cpp/message_initialization.hpp>
#include <algorithm>
#include <utility>


namespace vision_msgs
{

namespace msg
{

namespace builder
{

class Init_BoundingBox3D_size
{
public:
  explicit Init_BoundingBox3D_size(::vision_msgs::msg::BoundingBox3D & msg)
  : msg_(msg)
  {}
  ::vision_msgs::msg::BoundingBox3D size(::vision_msgs::msg::BoundingBox3D::_size_type arg)
  {
    msg_.size = std::move(arg);
    return std::move(msg_);
  }

private:
  ::vision_msgs::msg::BoundingBox3D msg_;
};

class Init_BoundingBox3D_center
{
public:
  Init_BoundingBox3D_center()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_BoundingBox3D_size center(::vision_msgs::msg::BoundingBox3D::_center_type arg)
  {
    msg_.center = std::move(arg);
    return Init_BoundingBox3D_size(msg_);
  }

private:
  ::vision_msgs::msg::BoundingBox3D msg_;
};

}  // namespace builder

}  // namespace msg

template<typename MessageType>
auto build();

template<>
inline
auto build<::vision_msgs::msg::BoundingBox3D>()
{
  return vision_msgs::msg::builder::Init_BoundingBox3D_center();
}

}  // namespace vision_msgs

#endif  // VISION_MSGS__MSG__DETAIL__BOUNDING_BOX3_D__BUILDER_HPP_
