// generated from rosidl_typesupport_fastrtps_c/resource/idl__type_support_c.cpp.em
// with input from zed_interfaces:msg/PosTrackStatus.idl
// generated code does not contain a copyright notice
#include "zed_interfaces/msg/detail/pos_track_status__rosidl_typesupport_fastrtps_c.h"


#include <cassert>
#include <limits>
#include <string>
#include "rosidl_typesupport_fastrtps_c/identifier.h"
#include "rosidl_typesupport_fastrtps_c/wstring_conversion.hpp"
#include "rosidl_typesupport_fastrtps_cpp/message_type_support.h"
#include "zed_interfaces/msg/rosidl_typesupport_fastrtps_c__visibility_control.h"
#include "zed_interfaces/msg/detail/pos_track_status__struct.h"
#include "zed_interfaces/msg/detail/pos_track_status__functions.h"
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


using _PosTrackStatus__ros_msg_type = zed_interfaces__msg__PosTrackStatus;

static bool _PosTrackStatus__cdr_serialize(
  const void * untyped_ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  if (!untyped_ros_message) {
    fprintf(stderr, "ros message handle is null\n");
    return false;
  }
  const _PosTrackStatus__ros_msg_type * ros_message = static_cast<const _PosTrackStatus__ros_msg_type *>(untyped_ros_message);
  // Field name: odometry_status
  {
    cdr << ros_message->odometry_status;
  }

  // Field name: spatial_memory_status
  {
    cdr << ros_message->spatial_memory_status;
  }

  // Field name: status
  {
    cdr << ros_message->status;
  }

  return true;
}

static bool _PosTrackStatus__cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  void * untyped_ros_message)
{
  if (!untyped_ros_message) {
    fprintf(stderr, "ros message handle is null\n");
    return false;
  }
  _PosTrackStatus__ros_msg_type * ros_message = static_cast<_PosTrackStatus__ros_msg_type *>(untyped_ros_message);
  // Field name: odometry_status
  {
    cdr >> ros_message->odometry_status;
  }

  // Field name: spatial_memory_status
  {
    cdr >> ros_message->spatial_memory_status;
  }

  // Field name: status
  {
    cdr >> ros_message->status;
  }

  return true;
}

ROSIDL_TYPESUPPORT_FASTRTPS_C_PUBLIC_zed_interfaces
size_t get_serialized_size_zed_interfaces__msg__PosTrackStatus(
  const void * untyped_ros_message,
  size_t current_alignment)
{
  const _PosTrackStatus__ros_msg_type * ros_message = static_cast<const _PosTrackStatus__ros_msg_type *>(untyped_ros_message);
  (void)ros_message;
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  (void)padding;
  (void)wchar_size;

  // field.name odometry_status
  {
    size_t item_size = sizeof(ros_message->odometry_status);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name spatial_memory_status
  {
    size_t item_size = sizeof(ros_message->spatial_memory_status);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name status
  {
    size_t item_size = sizeof(ros_message->status);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }

  return current_alignment - initial_alignment;
}

static uint32_t _PosTrackStatus__get_serialized_size(const void * untyped_ros_message)
{
  return static_cast<uint32_t>(
    get_serialized_size_zed_interfaces__msg__PosTrackStatus(
      untyped_ros_message, 0));
}

ROSIDL_TYPESUPPORT_FASTRTPS_C_PUBLIC_zed_interfaces
size_t max_serialized_size_zed_interfaces__msg__PosTrackStatus(
  bool & full_bounded,
  size_t current_alignment)
{
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  (void)padding;
  (void)wchar_size;
  (void)full_bounded;

  // member: odometry_status
  {
    size_t array_size = 1;

    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: spatial_memory_status
  {
    size_t array_size = 1;

    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: status
  {
    size_t array_size = 1;

    current_alignment += array_size * sizeof(uint8_t);
  }

  return current_alignment - initial_alignment;
}

static size_t _PosTrackStatus__max_serialized_size(bool & full_bounded)
{
  return max_serialized_size_zed_interfaces__msg__PosTrackStatus(
    full_bounded, 0);
}


static message_type_support_callbacks_t __callbacks_PosTrackStatus = {
  "zed_interfaces::msg",
  "PosTrackStatus",
  _PosTrackStatus__cdr_serialize,
  _PosTrackStatus__cdr_deserialize,
  _PosTrackStatus__get_serialized_size,
  _PosTrackStatus__max_serialized_size
};

static rosidl_message_type_support_t _PosTrackStatus__type_support = {
  rosidl_typesupport_fastrtps_c__identifier,
  &__callbacks_PosTrackStatus,
  get_message_typesupport_handle_function,
};

const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_c, zed_interfaces, msg, PosTrackStatus)() {
  return &_PosTrackStatus__type_support;
}

#if defined(__cplusplus)
}
#endif
