// generated from rosidl_typesupport_introspection_c/resource/idl__type_support.c.em
// with input from scout_msgs:msg/ScoutLightCmd.idl
// generated code does not contain a copyright notice

#include <stddef.h>
#include "scout_msgs/msg/detail/scout_light_cmd__rosidl_typesupport_introspection_c.h"
#include "scout_msgs/msg/rosidl_typesupport_introspection_c__visibility_control.h"
#include "rosidl_typesupport_introspection_c/field_types.h"
#include "rosidl_typesupport_introspection_c/identifier.h"
#include "rosidl_typesupport_introspection_c/message_introspection.h"
#include "scout_msgs/msg/detail/scout_light_cmd__functions.h"
#include "scout_msgs/msg/detail/scout_light_cmd__struct.h"


#ifdef __cplusplus
extern "C"
{
#endif

void ScoutLightCmd__rosidl_typesupport_introspection_c__ScoutLightCmd_init_function(
  void * message_memory, enum rosidl_runtime_c__message_initialization _init)
{
  // TODO(karsten1987): initializers are not yet implemented for typesupport c
  // see https://github.com/ros2/ros2/issues/397
  (void) _init;
  scout_msgs__msg__ScoutLightCmd__init(message_memory);
}

void ScoutLightCmd__rosidl_typesupport_introspection_c__ScoutLightCmd_fini_function(void * message_memory)
{
  scout_msgs__msg__ScoutLightCmd__fini(message_memory);
}

static rosidl_typesupport_introspection_c__MessageMember ScoutLightCmd__rosidl_typesupport_introspection_c__ScoutLightCmd_message_member_array[5] = {
  {
    "cmd_ctrl_allowed",  // name
    rosidl_typesupport_introspection_c__ROS_TYPE_BOOLEAN,  // type
    0,  // upper bound of string
    NULL,  // members of sub message
    false,  // is array
    0,  // array size
    false,  // is upper bound
    offsetof(scout_msgs__msg__ScoutLightCmd, cmd_ctrl_allowed),  // bytes offset in struct
    NULL,  // default value
    NULL,  // size() function pointer
    NULL,  // get_const(index) function pointer
    NULL,  // get(index) function pointer
    NULL  // resize(index) function pointer
  },
  {
    "front_mode",  // name
    rosidl_typesupport_introspection_c__ROS_TYPE_UINT8,  // type
    0,  // upper bound of string
    NULL,  // members of sub message
    false,  // is array
    0,  // array size
    false,  // is upper bound
    offsetof(scout_msgs__msg__ScoutLightCmd, front_mode),  // bytes offset in struct
    NULL,  // default value
    NULL,  // size() function pointer
    NULL,  // get_const(index) function pointer
    NULL,  // get(index) function pointer
    NULL  // resize(index) function pointer
  },
  {
    "front_custom_value",  // name
    rosidl_typesupport_introspection_c__ROS_TYPE_UINT8,  // type
    0,  // upper bound of string
    NULL,  // members of sub message
    false,  // is array
    0,  // array size
    false,  // is upper bound
    offsetof(scout_msgs__msg__ScoutLightCmd, front_custom_value),  // bytes offset in struct
    NULL,  // default value
    NULL,  // size() function pointer
    NULL,  // get_const(index) function pointer
    NULL,  // get(index) function pointer
    NULL  // resize(index) function pointer
  },
  {
    "rear_mode",  // name
    rosidl_typesupport_introspection_c__ROS_TYPE_UINT8,  // type
    0,  // upper bound of string
    NULL,  // members of sub message
    false,  // is array
    0,  // array size
    false,  // is upper bound
    offsetof(scout_msgs__msg__ScoutLightCmd, rear_mode),  // bytes offset in struct
    NULL,  // default value
    NULL,  // size() function pointer
    NULL,  // get_const(index) function pointer
    NULL,  // get(index) function pointer
    NULL  // resize(index) function pointer
  },
  {
    "rear_custom_value",  // name
    rosidl_typesupport_introspection_c__ROS_TYPE_UINT8,  // type
    0,  // upper bound of string
    NULL,  // members of sub message
    false,  // is array
    0,  // array size
    false,  // is upper bound
    offsetof(scout_msgs__msg__ScoutLightCmd, rear_custom_value),  // bytes offset in struct
    NULL,  // default value
    NULL,  // size() function pointer
    NULL,  // get_const(index) function pointer
    NULL,  // get(index) function pointer
    NULL  // resize(index) function pointer
  }
};

static const rosidl_typesupport_introspection_c__MessageMembers ScoutLightCmd__rosidl_typesupport_introspection_c__ScoutLightCmd_message_members = {
  "scout_msgs__msg",  // message namespace
  "ScoutLightCmd",  // message name
  5,  // number of fields
  sizeof(scout_msgs__msg__ScoutLightCmd),
  ScoutLightCmd__rosidl_typesupport_introspection_c__ScoutLightCmd_message_member_array,  // message members
  ScoutLightCmd__rosidl_typesupport_introspection_c__ScoutLightCmd_init_function,  // function to initialize message memory (memory has to be allocated)
  ScoutLightCmd__rosidl_typesupport_introspection_c__ScoutLightCmd_fini_function  // function to terminate message instance (will not free memory)
};

// this is not const since it must be initialized on first access
// since C does not allow non-integral compile-time constants
static rosidl_message_type_support_t ScoutLightCmd__rosidl_typesupport_introspection_c__ScoutLightCmd_message_type_support_handle = {
  0,
  &ScoutLightCmd__rosidl_typesupport_introspection_c__ScoutLightCmd_message_members,
  get_message_typesupport_handle_function,
};

ROSIDL_TYPESUPPORT_INTROSPECTION_C_EXPORT_scout_msgs
const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_introspection_c, scout_msgs, msg, ScoutLightCmd)() {
  if (!ScoutLightCmd__rosidl_typesupport_introspection_c__ScoutLightCmd_message_type_support_handle.typesupport_identifier) {
    ScoutLightCmd__rosidl_typesupport_introspection_c__ScoutLightCmd_message_type_support_handle.typesupport_identifier =
      rosidl_typesupport_introspection_c__identifier;
  }
  return &ScoutLightCmd__rosidl_typesupport_introspection_c__ScoutLightCmd_message_type_support_handle;
}
#ifdef __cplusplus
}
#endif
