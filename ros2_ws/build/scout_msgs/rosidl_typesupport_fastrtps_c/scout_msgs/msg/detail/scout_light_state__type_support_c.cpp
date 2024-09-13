// generated from rosidl_typesupport_fastrtps_c/resource/idl__type_support_c.cpp.em
// with input from scout_msgs:msg/ScoutLightState.idl
// generated code does not contain a copyright notice
#include "scout_msgs/msg/detail/scout_light_state__rosidl_typesupport_fastrtps_c.h"


#include <cassert>
#include <limits>
#include <string>
#include "rosidl_typesupport_fastrtps_c/identifier.h"
#include "rosidl_typesupport_fastrtps_c/wstring_conversion.hpp"
#include "rosidl_typesupport_fastrtps_cpp/message_type_support.h"
#include "scout_msgs/msg/rosidl_typesupport_fastrtps_c__visibility_control.h"
#include "scout_msgs/msg/detail/scout_light_state__struct.h"
#include "scout_msgs/msg/detail/scout_light_state__functions.h"
#include "fastcdr/Cdr.h"

#ifndef _WIN32
# pragma GCC diagnostic push
# pragma GCC diagnostic ignored "-Wunused-parameter"
# ifdef __clang__
#  pragma clang diagnostic ignored "-Wdeprecated-register"
#  pragma clang diagnostic ignored "-Wreturn-type-c-linkage"
# endif
#endif
#ifndef _WIN32
# pragma GCC diagnostic pop
#endif

// includes and forward declarations of message dependencies and their conversion functions

#if defined(__cplusplus)
extern "C"
{
#endif


// forward declare type support functions


using _ScoutLightState__ros_msg_type = scout_msgs__msg__ScoutLightState;

static bool _ScoutLightState__cdr_serialize(
  const void * untyped_ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  if (!untyped_ros_message) {
    fprintf(stderr, "ros message handle is null\n");
    return false;
  }
  const _ScoutLightState__ros_msg_type * ros_message = static_cast<const _ScoutLightState__ros_msg_type *>(untyped_ros_message);
  // Field name: mode
  {
    cdr << ros_message->mode;
  }

  // Field name: custom_value
  {
    cdr << ros_message->custom_value;
  }

  return true;
}

static bool _ScoutLightState__cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  void * untyped_ros_message)
{
  if (!untyped_ros_message) {
    fprintf(stderr, "ros message handle is null\n");
    return false;
  }
  _ScoutLightState__ros_msg_type * ros_message = static_cast<_ScoutLightState__ros_msg_type *>(untyped_ros_message);
  // Field name: mode
  {
    cdr >> ros_message->mode;
  }

  // Field name: custom_value
  {
    cdr >> ros_message->custom_value;
  }

  return true;
}

ROSIDL_TYPESUPPORT_FASTRTPS_C_PUBLIC_scout_msgs
size_t get_serialized_size_scout_msgs__msg__ScoutLightState(
  const void * untyped_ros_message,
  size_t current_alignment)
{
  const _ScoutLightState__ros_msg_type * ros_message = static_cast<const _ScoutLightState__ros_msg_type *>(untyped_ros_message);
  (void)ros_message;
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  (void)padding;
  (void)wchar_size;

  // field.name mode
  {
    size_t item_size = sizeof(ros_message->mode);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name custom_value
  {
    size_t item_size = sizeof(ros_message->custom_value);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }

  return current_alignment - initial_alignment;
}

static uint32_t _ScoutLightState__get_serialized_size(const void * untyped_ros_message)
{
  return static_cast<uint32_t>(
    get_serialized_size_scout_msgs__msg__ScoutLightState(
      untyped_ros_message, 0));
}

ROSIDL_TYPESUPPORT_FASTRTPS_C_PUBLIC_scout_msgs
size_t max_serialized_size_scout_msgs__msg__ScoutLightState(
  bool & full_bounded,
  size_t current_alignment)
{
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  (void)padding;
  (void)wchar_size;
  (void)full_bounded;

  // member: mode
  {
    size_t array_size = 1;

    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: custom_value
  {
    size_t array_size = 1;

    current_alignment += array_size * sizeof(uint8_t);
  }

  return current_alignment - initial_alignment;
}

static size_t _ScoutLightState__max_serialized_size(bool & full_bounded)
{
  return max_serialized_size_scout_msgs__msg__ScoutLightState(
    full_bounded, 0);
}


static message_type_support_callbacks_t __callbacks_ScoutLightState = {
  "scout_msgs::msg",
  "ScoutLightState",
  _ScoutLightState__cdr_serialize,
  _ScoutLightState__cdr_deserialize,
  _ScoutLightState__get_serialized_size,
  _ScoutLightState__max_serialized_size
};

static rosidl_message_type_support_t _ScoutLightState__type_support = {
  rosidl_typesupport_fastrtps_c__identifier,
  &__callbacks_ScoutLightState,
  get_message_typesupport_handle_function,
};

const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_c, scout_msgs, msg, ScoutLightState)() {
  return &_ScoutLightState__type_support;
}

#if defined(__cplusplus)
}
#endif
