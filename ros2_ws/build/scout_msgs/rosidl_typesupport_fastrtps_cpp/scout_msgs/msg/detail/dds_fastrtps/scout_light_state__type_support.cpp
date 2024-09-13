// generated from rosidl_typesupport_fastrtps_cpp/resource/idl__type_support.cpp.em
// with input from scout_msgs:msg/ScoutLightState.idl
// generated code does not contain a copyright notice
#include "scout_msgs/msg/detail/scout_light_state__rosidl_typesupport_fastrtps_cpp.hpp"
#include "scout_msgs/msg/detail/scout_light_state__struct.hpp"

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

namespace scout_msgs
{

namespace msg
{

namespace typesupport_fastrtps_cpp
{

bool
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_scout_msgs
cdr_serialize(
  const scout_msgs::msg::ScoutLightState & ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  // Member: mode
  cdr << ros_message.mode;
  // Member: custom_value
  cdr << ros_message.custom_value;
  return true;
}

bool
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_scout_msgs
cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  scout_msgs::msg::ScoutLightState & ros_message)
{
  // Member: mode
  cdr >> ros_message.mode;

  // Member: custom_value
  cdr >> ros_message.custom_value;

  return true;
}

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_scout_msgs
get_serialized_size(
  const scout_msgs::msg::ScoutLightState & ros_message,
  size_t current_alignment)
{
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  (void)padding;
  (void)wchar_size;

  // Member: mode
  {
    size_t item_size = sizeof(ros_message.mode);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: custom_value
  {
    size_t item_size = sizeof(ros_message.custom_value);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }

  return current_alignment - initial_alignment;
}

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_scout_msgs
max_serialized_size_ScoutLightState(
  bool & full_bounded,
  size_t current_alignment)
{
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  (void)padding;
  (void)wchar_size;
  (void)full_bounded;


  // Member: mode
  {
    size_t array_size = 1;

    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: custom_value
  {
    size_t array_size = 1;

    current_alignment += array_size * sizeof(uint8_t);
  }

  return current_alignment - initial_alignment;
}

static bool _ScoutLightState__cdr_serialize(
  const void * untyped_ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  auto typed_message =
    static_cast<const scout_msgs::msg::ScoutLightState *>(
    untyped_ros_message);
  return cdr_serialize(*typed_message, cdr);
}

static bool _ScoutLightState__cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  void * untyped_ros_message)
{
  auto typed_message =
    static_cast<scout_msgs::msg::ScoutLightState *>(
    untyped_ros_message);
  return cdr_deserialize(cdr, *typed_message);
}

static uint32_t _ScoutLightState__get_serialized_size(
  const void * untyped_ros_message)
{
  auto typed_message =
    static_cast<const scout_msgs::msg::ScoutLightState *>(
    untyped_ros_message);
  return static_cast<uint32_t>(get_serialized_size(*typed_message, 0));
}

static size_t _ScoutLightState__max_serialized_size(bool & full_bounded)
{
  return max_serialized_size_ScoutLightState(full_bounded, 0);
}

static message_type_support_callbacks_t _ScoutLightState__callbacks = {
  "scout_msgs::msg",
  "ScoutLightState",
  _ScoutLightState__cdr_serialize,
  _ScoutLightState__cdr_deserialize,
  _ScoutLightState__get_serialized_size,
  _ScoutLightState__max_serialized_size
};

static rosidl_message_type_support_t _ScoutLightState__handle = {
  rosidl_typesupport_fastrtps_cpp::typesupport_identifier,
  &_ScoutLightState__callbacks,
  get_message_typesupport_handle_function,
};

}  // namespace typesupport_fastrtps_cpp

}  // namespace msg

}  // namespace scout_msgs

namespace rosidl_typesupport_fastrtps_cpp
{

template<>
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_EXPORT_scout_msgs
const rosidl_message_type_support_t *
get_message_type_support_handle<scout_msgs::msg::ScoutLightState>()
{
  return &scout_msgs::msg::typesupport_fastrtps_cpp::_ScoutLightState__handle;
}

}  // namespace rosidl_typesupport_fastrtps_cpp

#ifdef __cplusplus
extern "C"
{
#endif

const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_cpp, scout_msgs, msg, ScoutLightState)() {
  return &scout_msgs::msg::typesupport_fastrtps_cpp::_ScoutLightState__handle;
}

#ifdef __cplusplus
}
#endif
