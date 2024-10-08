// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from vision_msgs:msg/Detection2D.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__DETECTION2_D__BUILDER_HPP_
#define VISION_MSGS__MSG__DETAIL__DETECTION2_D__BUILDER_HPP_

#include <algorithm>
#include <utility>

#include "vision_msgs/msg/detail/detection2_d__struct.hpp"
#include "rosidl_runtime_cpp/message_initialization.hpp"


namespace vision_msgs
{

namespace msg
{

namespace builder
{

class Init_Detection2D_tracking_id
{
public:
  explicit Init_Detection2D_tracking_id(::vision_msgs::msg::Detection2D & msg)
  : msg_(msg)
  {}
  ::vision_msgs::msg::Detection2D tracking_id(::vision_msgs::msg::Detection2D::_tracking_id_type arg)
  {
    msg_.tracking_id = std::move(arg);
    return std::move(msg_);
  }

private:
  ::vision_msgs::msg::Detection2D msg_;
};

class Init_Detection2D_is_tracking
{
public:
  explicit Init_Detection2D_is_tracking(::vision_msgs::msg::Detection2D & msg)
  : msg_(msg)
  {}
  Init_Detection2D_tracking_id is_tracking(::vision_msgs::msg::Detection2D::_is_tracking_type arg)
  {
    msg_.is_tracking = std::move(arg);
    return Init_Detection2D_tracking_id(msg_);
  }

private:
  ::vision_msgs::msg::Detection2D msg_;
};

class Init_Detection2D_source_img
{
public:
  explicit Init_Detection2D_source_img(::vision_msgs::msg::Detection2D & msg)
  : msg_(msg)
  {}
  Init_Detection2D_is_tracking source_img(::vision_msgs::msg::Detection2D::_source_img_type arg)
  {
    msg_.source_img = std::move(arg);
    return Init_Detection2D_is_tracking(msg_);
  }

private:
  ::vision_msgs::msg::Detection2D msg_;
};

class Init_Detection2D_bbox
{
public:
  explicit Init_Detection2D_bbox(::vision_msgs::msg::Detection2D & msg)
  : msg_(msg)
  {}
  Init_Detection2D_source_img bbox(::vision_msgs::msg::Detection2D::_bbox_type arg)
  {
    msg_.bbox = std::move(arg);
    return Init_Detection2D_source_img(msg_);
  }

private:
  ::vision_msgs::msg::Detection2D msg_;
};

class Init_Detection2D_results
{
public:
  explicit Init_Detection2D_results(::vision_msgs::msg::Detection2D & msg)
  : msg_(msg)
  {}
  Init_Detection2D_bbox results(::vision_msgs::msg::Detection2D::_results_type arg)
  {
    msg_.results = std::move(arg);
    return Init_Detection2D_bbox(msg_);
  }

private:
  ::vision_msgs::msg::Detection2D msg_;
};

class Init_Detection2D_header
{
public:
  Init_Detection2D_header()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_Detection2D_results header(::vision_msgs::msg::Detection2D::_header_type arg)
  {
    msg_.header = std::move(arg);
    return Init_Detection2D_results(msg_);
  }

private:
  ::vision_msgs::msg::Detection2D msg_;
};

}  // namespace builder

}  // namespace msg

template<typename MessageType>
auto build();

template<>
inline
auto build<::vision_msgs::msg::Detection2D>()
{
  return vision_msgs::msg::builder::Init_Detection2D_header();
}

}  // namespace vision_msgs

#endif  // VISION_MSGS__MSG__DETAIL__DETECTION2_D__BUILDER_HPP_
