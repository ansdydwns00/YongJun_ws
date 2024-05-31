// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from vision_msgs:msg/LabelInfo.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__LABEL_INFO__BUILDER_HPP_
#define VISION_MSGS__MSG__DETAIL__LABEL_INFO__BUILDER_HPP_

#include <algorithm>
#include <utility>

#include "vision_msgs/msg/detail/label_info__struct.hpp"
#include "rosidl_runtime_cpp/message_initialization.hpp"


namespace vision_msgs
{

namespace msg
{

namespace builder
{

class Init_LabelInfo_threshold
{
public:
  explicit Init_LabelInfo_threshold(::vision_msgs::msg::LabelInfo & msg)
  : msg_(msg)
  {}
  ::vision_msgs::msg::LabelInfo threshold(::vision_msgs::msg::LabelInfo::_threshold_type arg)
  {
    msg_.threshold = std::move(arg);
    return std::move(msg_);
  }

private:
  ::vision_msgs::msg::LabelInfo msg_;
};

class Init_LabelInfo_class_map
{
public:
  explicit Init_LabelInfo_class_map(::vision_msgs::msg::LabelInfo & msg)
  : msg_(msg)
  {}
  Init_LabelInfo_threshold class_map(::vision_msgs::msg::LabelInfo::_class_map_type arg)
  {
    msg_.class_map = std::move(arg);
    return Init_LabelInfo_threshold(msg_);
  }

private:
  ::vision_msgs::msg::LabelInfo msg_;
};

class Init_LabelInfo_header
{
public:
  Init_LabelInfo_header()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_LabelInfo_class_map header(::vision_msgs::msg::LabelInfo::_header_type arg)
  {
    msg_.header = std::move(arg);
    return Init_LabelInfo_class_map(msg_);
  }

private:
  ::vision_msgs::msg::LabelInfo msg_;
};

}  // namespace builder

}  // namespace msg

template<typename MessageType>
auto build();

template<>
inline
auto build<::vision_msgs::msg::LabelInfo>()
{
  return vision_msgs::msg::builder::Init_LabelInfo_header();
}

}  // namespace vision_msgs

#endif  // VISION_MSGS__MSG__DETAIL__LABEL_INFO__BUILDER_HPP_
