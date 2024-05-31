// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from vision_msgs:msg/BoundingBox2DArray.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__BOUNDING_BOX2_D_ARRAY__BUILDER_HPP_
#define VISION_MSGS__MSG__DETAIL__BOUNDING_BOX2_D_ARRAY__BUILDER_HPP_

#include <algorithm>
#include <utility>

#include "vision_msgs/msg/detail/bounding_box2_d_array__struct.hpp"
#include "rosidl_runtime_cpp/message_initialization.hpp"


namespace vision_msgs
{

namespace msg
{

namespace builder
{

class Init_BoundingBox2DArray_boxes
{
public:
  explicit Init_BoundingBox2DArray_boxes(::vision_msgs::msg::BoundingBox2DArray & msg)
  : msg_(msg)
  {}
  ::vision_msgs::msg::BoundingBox2DArray boxes(::vision_msgs::msg::BoundingBox2DArray::_boxes_type arg)
  {
    msg_.boxes = std::move(arg);
    return std::move(msg_);
  }

private:
  ::vision_msgs::msg::BoundingBox2DArray msg_;
};

class Init_BoundingBox2DArray_header
{
public:
  Init_BoundingBox2DArray_header()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_BoundingBox2DArray_boxes header(::vision_msgs::msg::BoundingBox2DArray::_header_type arg)
  {
    msg_.header = std::move(arg);
    return Init_BoundingBox2DArray_boxes(msg_);
  }

private:
  ::vision_msgs::msg::BoundingBox2DArray msg_;
};

}  // namespace builder

}  // namespace msg

template<typename MessageType>
auto build();

template<>
inline
auto build<::vision_msgs::msg::BoundingBox2DArray>()
{
  return vision_msgs::msg::builder::Init_BoundingBox2DArray_header();
}

}  // namespace vision_msgs

#endif  // VISION_MSGS__MSG__DETAIL__BOUNDING_BOX2_D_ARRAY__BUILDER_HPP_
