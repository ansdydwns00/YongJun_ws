// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from vision_msgs:msg/VisionInfo.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__VISION_INFO__BUILDER_HPP_
#define VISION_MSGS__MSG__DETAIL__VISION_INFO__BUILDER_HPP_

#include <algorithm>
#include <utility>

#include "vision_msgs/msg/detail/vision_info__struct.hpp"
#include "rosidl_runtime_cpp/message_initialization.hpp"


namespace vision_msgs
{

namespace msg
{

namespace builder
{

class Init_VisionInfo_database_version
{
public:
  explicit Init_VisionInfo_database_version(::vision_msgs::msg::VisionInfo & msg)
  : msg_(msg)
  {}
  ::vision_msgs::msg::VisionInfo database_version(::vision_msgs::msg::VisionInfo::_database_version_type arg)
  {
    msg_.database_version = std::move(arg);
    return std::move(msg_);
  }

private:
  ::vision_msgs::msg::VisionInfo msg_;
};

class Init_VisionInfo_database_location
{
public:
  explicit Init_VisionInfo_database_location(::vision_msgs::msg::VisionInfo & msg)
  : msg_(msg)
  {}
  Init_VisionInfo_database_version database_location(::vision_msgs::msg::VisionInfo::_database_location_type arg)
  {
    msg_.database_location = std::move(arg);
    return Init_VisionInfo_database_version(msg_);
  }

private:
  ::vision_msgs::msg::VisionInfo msg_;
};

class Init_VisionInfo_method
{
public:
  explicit Init_VisionInfo_method(::vision_msgs::msg::VisionInfo & msg)
  : msg_(msg)
  {}
  Init_VisionInfo_database_location method(::vision_msgs::msg::VisionInfo::_method_type arg)
  {
    msg_.method = std::move(arg);
    return Init_VisionInfo_database_location(msg_);
  }

private:
  ::vision_msgs::msg::VisionInfo msg_;
};

class Init_VisionInfo_header
{
public:
  Init_VisionInfo_header()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_VisionInfo_method header(::vision_msgs::msg::VisionInfo::_header_type arg)
  {
    msg_.header = std::move(arg);
    return Init_VisionInfo_method(msg_);
  }

private:
  ::vision_msgs::msg::VisionInfo msg_;
};

}  // namespace builder

}  // namespace msg

template<typename MessageType>
auto build();

template<>
inline
auto build<::vision_msgs::msg::VisionInfo>()
{
  return vision_msgs::msg::builder::Init_VisionInfo_header();
}

}  // namespace vision_msgs

#endif  // VISION_MSGS__MSG__DETAIL__VISION_INFO__BUILDER_HPP_
