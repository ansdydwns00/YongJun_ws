// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from vision_msgs:msg/BoundingBox3DArray.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__BOUNDING_BOX3_D_ARRAY__BUILDER_HPP_
#define VISION_MSGS__MSG__DETAIL__BOUNDING_BOX3_D_ARRAY__BUILDER_HPP_

#include <algorithm>
#include <utility>

#include "vision_msgs/msg/detail/bounding_box3_d_array__struct.hpp"
#include "rosidl_runtime_cpp/message_initialization.hpp"


namespace vision_msgs
{

namespace msg
{

namespace builder
{

class Init_BoundingBox3DArray_boxes
{
public:
  explicit Init_BoundingBox3DArray_boxes(::vision_msgs::msg::BoundingBox3DArray & msg)
  : msg_(msg)
  {}
  ::vision_msgs::msg::BoundingBox3DArray boxes(::vision_msgs::msg::BoundingBox3DArray::_boxes_type arg)
  {
    msg_.boxes = std::move(arg);
    return std::move(msg_);
  }

private:
  ::vision_msgs::msg::BoundingBox3DArray msg_;
};

class Init_BoundingBox3DArray_header
{
public:
  Init_BoundingBox3DArray_header()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_BoundingBox3DArray_boxes header(::vision_msgs::msg::BoundingBox3DArray::_header_type arg)
  {
    msg_.header = std::move(arg);
    return Init_BoundingBox3DArray_boxes(msg_);
  }

private:
  ::vision_msgs::msg::BoundingBox3DArray msg_;
};

}  // namespace builder

}  // namespace msg

template<typename MessageType>
auto build();

template<>
inline
auto build<::vision_msgs::msg::BoundingBox3DArray>()
{
  return vision_msgs::msg::builder::Init_BoundingBox3DArray_header();
}

}  // namespace vision_msgs

#endif  // VISION_MSGS__MSG__DETAIL__BOUNDING_BOX3_D_ARRAY__BUILDER_HPP_
