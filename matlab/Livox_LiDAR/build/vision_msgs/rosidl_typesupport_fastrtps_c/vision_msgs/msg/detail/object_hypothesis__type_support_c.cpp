// generated from rosidl_typesupport_fastrtps_c/resource/idl__type_support_c.cpp.em
// with input from vision_msgs:msg/ObjectHypothesis.idl
// generated code does not contain a copyright notice
#include "vision_msgs/msg/detail/object_hypothesis__rosidl_typesupport_fastrtps_c.h"


#include <cassert>
#include <limits>
#include <string>
#include "rosidl_typesupport_fastrtps_c/identifier.h"
#include "rosidl_typesupport_fastrtps_c/wstring_conversion.hpp"
#include "rosidl_typesupport_fastrtps_cpp/message_type_support.h"
#include "vision_msgs/msg/rosidl_typesupport_fastrtps_c__visibility_control.h"
#include "vision_msgs/msg/detail/object_hypothesis__struct.h"
#include "vision_msgs/msg/detail/object_hypothesis__functions.h"
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

#include "rosidl_runtime_c/string.h"  // class_id
#include "rosidl_runtime_c/string_functions.h"  // class_id

// forward declare type support functions


using _ObjectHypothesis__ros_msg_type = vision_msgs__msg__ObjectHypothesis;

static bool _ObjectHypothesis__cdr_serialize(
  const void * untyped_ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  if (!untyped_ros_message) {
    fprintf(stderr, "ros message handle is null\n");
    return false;
  }
  const _ObjectHypothesis__ros_msg_type * ros_message = static_cast<const _ObjectHypothesis__ros_msg_type *>(untyped_ros_message);
  // Field name: class_id
  {
    const rosidl_runtime_c__String * str = &ros_message->class_id;
    if (str->capacity == 0 || str->capacity <= str->size) {
      fprintf(stderr, "string capacity not greater than size\n");
      return false;
    }
    if (str->data[str->size] != '\0') {
      fprintf(stderr, "string not null-terminated\n");
      return false;
    }
    cdr << str->data;
  }

  // Field name: score
  {
    cdr << ros_message->score;
  }

  return true;
}

static bool _ObjectHypothesis__cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  void * untyped_ros_message)
{
  if (!untyped_ros_message) {
    fprintf(stderr, "ros message handle is null\n");
    return false;
  }
  _ObjectHypothesis__ros_msg_type * ros_message = static_cast<_ObjectHypothesis__ros_msg_type *>(untyped_ros_message);
  // Field name: class_id
  {
    std::string tmp;
    cdr >> tmp;
    if (!ros_message->class_id.data) {
      rosidl_runtime_c__String__init(&ros_message->class_id);
    }
    bool succeeded = rosidl_runtime_c__String__assign(
      &ros_message->class_id,
      tmp.c_str());
    if (!succeeded) {
      fprintf(stderr, "failed to assign string into field 'class_id'\n");
      return false;
    }
  }

  // Field name: score
  {
    cdr >> ros_message->score;
  }

  return true;
}

ROSIDL_TYPESUPPORT_FASTRTPS_C_PUBLIC_vision_msgs
size_t get_serialized_size_vision_msgs__msg__ObjectHypothesis(
  const void * untyped_ros_message,
  size_t current_alignment)
{
  const _ObjectHypothesis__ros_msg_type * ros_message = static_cast<const _ObjectHypothesis__ros_msg_type *>(untyped_ros_message);
  (void)ros_message;
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  (void)padding;
  (void)wchar_size;

  // field.name class_id
  current_alignment += padding +
    eprosima::fastcdr::Cdr::alignment(current_alignment, padding) +
    (ros_message->class_id.size + 1);
  // field.name score
  {
    size_t item_size = sizeof(ros_message->score);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }

  return current_alignment - initial_alignment;
}

static uint32_t _ObjectHypothesis__get_serialized_size(const void * untyped_ros_message)
{
  return static_cast<uint32_t>(
    get_serialized_size_vision_msgs__msg__ObjectHypothesis(
      untyped_ros_message, 0));
}

ROSIDL_TYPESUPPORT_FASTRTPS_C_PUBLIC_vision_msgs
size_t max_serialized_size_vision_msgs__msg__ObjectHypothesis(
  bool & full_bounded,
  size_t current_alignment)
{
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  (void)padding;
  (void)wchar_size;
  (void)full_bounded;

  // member: class_id
  {
    size_t array_size = 1;

    full_bounded = false;
    for (size_t index = 0; index < array_size; ++index) {
      current_alignment += padding +
        eprosima::fastcdr::Cdr::alignment(current_alignment, padding) +
        1;
    }
  }
  // member: score
  {
    size_t array_size = 1;

    current_alignment += array_size * sizeof(uint64_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint64_t));
  }

  return current_alignment - initial_alignment;
}

static size_t _ObjectHypothesis__max_serialized_size(bool & full_bounded)
{
  return max_serialized_size_vision_msgs__msg__ObjectHypothesis(
    full_bounded, 0);
}


static message_type_support_callbacks_t __callbacks_ObjectHypothesis = {
  "vision_msgs::msg",
  "ObjectHypothesis",
  _ObjectHypothesis__cdr_serialize,
  _ObjectHypothesis__cdr_deserialize,
  _ObjectHypothesis__get_serialized_size,
  _ObjectHypothesis__max_serialized_size
};

static rosidl_message_type_support_t _ObjectHypothesis__type_support = {
  rosidl_typesupport_fastrtps_c__identifier,
  &__callbacks_ObjectHypothesis,
  get_message_typesupport_handle_function,
};

const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_c, vision_msgs, msg, ObjectHypothesis)() {
  return &_ObjectHypothesis__type_support;
}

#if defined(__cplusplus)
}
#endif
