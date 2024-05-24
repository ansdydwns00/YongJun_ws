// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from vision_msgs:msg/VisionClass.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__VISION_CLASS__BUILDER_HPP_
#define VISION_MSGS__MSG__DETAIL__VISION_CLASS__BUILDER_HPP_

#include <algorithm>
#include <utility>

#include "vision_msgs/msg/detail/vision_class__struct.hpp"
#include "rosidl_runtime_cpp/message_initialization.hpp"


namespace vision_msgs
{

namespace msg
{

namespace builder
{

class Init_VisionClass_class_name
{
public:
  explicit Init_VisionClass_class_name(::vision_msgs::msg::VisionClass & msg)
  : msg_(msg)
  {}
  ::vision_msgs::msg::VisionClass class_name(::vision_msgs::msg::VisionClass::_class_name_type arg)
  {
    msg_.class_name = std::move(arg);
    return std::move(msg_);
  }

private:
  ::vision_msgs::msg::VisionClass msg_;
};

class Init_VisionClass_class_id
{
public:
  Init_VisionClass_class_id()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_VisionClass_class_name class_id(::vision_msgs::msg::VisionClass::_class_id_type arg)
  {
    msg_.class_id = std::move(arg);
    return Init_VisionClass_class_name(msg_);
  }

private:
  ::vision_msgs::msg::VisionClass msg_;
};

}  // namespace builder

}  // namespace msg

template<typename MessageType>
auto build();

template<>
inline
auto build<::vision_msgs::msg::VisionClass>()
{
  return vision_msgs::msg::builder::Init_VisionClass_class_id();
}

}  // namespace vision_msgs

#endif  // VISION_MSGS__MSG__DETAIL__VISION_CLASS__BUILDER_HPP_
