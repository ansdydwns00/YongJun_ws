// generated from rosidl_typesupport_fastrtps_cpp/resource/idl__type_support.cpp.em
// with input from vision_msgs:msg/ObjectHypothesis.idl
// generated code does not contain a copyright notice
#include "vision_msgs/msg/detail/object_hypothesis__rosidl_typesupport_fastrtps_cpp.hpp"
#include "vision_msgs/msg/detail/object_hypothesis__struct.hpp"

#include <limits>
#include <stdexcept>
#include <string>
#include "rosidl_typesupport_cpp/message_type_support.hpp"
#include "rosidl_typesupport_fastrtps_cpp/identifier.hpp"
#include "rosidl_typesupport_fastrtps_cpp/message_type_support.h"
#include "rosidl_typesupport_fastrtps_cpp/message_type_support_decl.hpp"
#include "rosidl_typesupport_fastrtps_cpp/wstring_conversion.hpp"
#include "fastcdr/Cdr.h"


// forward declaration of message dependencies and their conversion functions

namespace vision_msgs
{

namespace msg
{

namespace typesupport_fastrtps_cpp
{

bool
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_vision_msgs
cdr_serialize(
  const vision_msgs::msg::ObjectHypothesis & ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  // Member: class_id
  cdr << ros_message.class_id;
  // Member: score
  cdr << ros_message.score;
  return true;
}

bool
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_vision_msgs
cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  vision_msgs::msg::ObjectHypothesis & ros_message)
{
  // Member: class_id
  cdr >> ros_message.class_id;

  // Member: score
  cdr >> ros_message.score;

  return true;
}

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_vision_msgs
get_serialized_size(
  const vision_msgs::msg::ObjectHypothesis & ros_message,
  size_t current_alignment)
{
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  (void)padding;
  (void)wchar_size;

  // Member: class_id
  current_alignment += padding +
    eprosima::fastcdr::Cdr::alignment(current_alignment, padding) +
    (ros_message.class_id.size() + 1);
  // Member: score
  {
    size_t item_size = sizeof(ros_message.score);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }

  return current_alignment - initial_alignment;
}

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_vision_msgs
max_serialized_size_ObjectHypothesis(
  bool & full_bounded,
  size_t current_alignment)
{
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  (void)padding;
  (void)wchar_size;
  (void)full_bounded;


  // Member: class_id
  {
    size_t array_size = 1;

    full_bounded = false;
    for (size_t index = 0; index < array_size; ++index) {
      current_alignment += padding +
        eprosima::fastcdr::Cdr::alignment(current_alignment, padding) +
        1;
    }
  }

  // Member: score
  {
    size_t array_size = 1;

    current_alignment += array_size * sizeof(uint64_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint64_t));
  }

  return current_alignment - initial_alignment;
}

static bool _ObjectHypothesis__cdr_serialize(
  const void * untyped_ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  auto typed_message =
    static_cast<const vision_msgs::msg::ObjectHypothesis *>(
    untyped_ros_message);
  return cdr_serialize(*typed_message, cdr);
}

static bool _ObjectHypothesis__cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  void * untyped_ros_message)
{
  auto typed_message =
    static_cast<vision_msgs::msg::ObjectHypothesis *>(
    untyped_ros_message);
  return cdr_deserialize(cdr, *typed_message);
}

static uint32_t _ObjectHypothesis__get_serialized_size(
  const void * untyped_ros_message)
{
  auto typed_message =
    static_cast<const vision_msgs::msg::ObjectHypothesis *>(
    untyped_ros_message);
  return static_cast<uint32_t>(get_serialized_size(*typed_message, 0));
}

static size_t _ObjectHypothesis__max_serialized_size(bool & full_bounded)
{
  return max_serialized_size_ObjectHypothesis(full_bounded, 0);
}

static message_type_support_callbacks_t _ObjectHypothesis__callbacks = {
  "vision_msgs::msg",
  "ObjectHypothesis",
  _ObjectHypothesis__cdr_serialize,
  _ObjectHypothesis__cdr_deserialize,
  _ObjectHypothesis__get_serialized_size,
  _ObjectHypothesis__max_serialized_size
};

static rosidl_message_type_support_t _ObjectHypothesis__handle = {
  rosidl_typesupport_fastrtps_cpp::typesupport_identifier,
  &_ObjectHypothesis__callbacks,
  get_message_typesupport_handle_function,
};

}  // namespace typesupport_fastrtps_cpp

}  // namespace msg

}  // namespace vision_msgs

namespace rosidl_typesupport_fastrtps_cpp
{

template<>
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_EXPORT_vision_msgs
const rosidl_message_type_support_t *
get_message_type_support_handle<vision_msgs::msg::ObjectHypothesis>()
{
  return &vision_msgs::msg::typesupport_fastrtps_cpp::_ObjectHypothesis__handle;
}

}  // namespace rosidl_typesupport_fastrtps_cpp

#ifdef __cplusplus
extern "C"
{
#endif

const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_cpp, vision_msgs, msg, ObjectHypothesis)() {
  return &vision_msgs::msg::typesupport_fastrtps_cpp::_ObjectHypothesis__handle;
}

#ifdef __cplusplus
}
#endif
