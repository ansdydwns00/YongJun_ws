// generated from rosidl_typesupport_introspection_c/resource/idl__type_support.c.em
// with input from vision_msgs:msg/ObjectHypothesisWithPose.idl
// generated code does not contain a copyright notice

#include <stddef.h>
#include "vision_msgs/msg/detail/object_hypothesis_with_pose__rosidl_typesupport_introspection_c.h"
#include "vision_msgs/msg/rosidl_typesupport_introspection_c__visibility_control.h"
#include "rosidl_typesupport_introspection_c/field_types.h"
#include "rosidl_typesupport_introspection_c/identifier.h"
#include "rosidl_typesupport_introspection_c/message_introspection.h"
#include "vision_msgs/msg/detail/object_hypothesis_with_pose__functions.h"
#include "vision_msgs/msg/detail/object_hypothesis_with_pose__struct.h"


// Include directives for member types
// Member `hypothesis`
#include "vision_msgs/msg/object_hypothesis.h"
// Member `hypothesis`
#include "vision_msgs/msg/detail/object_hypothesis__rosidl_typesupport_introspection_c.h"
// Member `pose`
#include "geometry_msgs/msg/pose_with_covariance.h"
// Member `pose`
#include "geometry_msgs/msg/detail/pose_with_covariance__rosidl_typesupport_introspection_c.h"

#ifdef __cplusplus
extern "C"
{
#endif

void ObjectHypothesisWithPose__rosidl_typesupport_introspection_c__ObjectHypothesisWithPose_init_function(
  void * message_memory, enum rosidl_runtime_c__message_initialization _init)
{
  // TODO(karsten1987): initializers are not yet implemented for typesupport c
  // see https://github.com/ros2/ros2/issues/397
  (void) _init;
  vision_msgs__msg__ObjectHypothesisWithPose__init(message_memory);
}

void ObjectHypothesisWithPose__rosidl_typesupport_introspection_c__ObjectHypothesisWithPose_fini_function(void * message_memory)
{
  vision_msgs__msg__ObjectHypothesisWithPose__fini(message_memory);
}

static rosidl_typesupport_introspection_c__MessageMember ObjectHypothesisWithPose__rosidl_typesupport_introspection_c__ObjectHypothesisWithPose_message_member_array[2] = {
  {
    "hypothesis",  // name
    rosidl_typesupport_introspection_c__ROS_TYPE_MESSAGE,  // type
    0,  // upper bound of string
    NULL,  // members of sub message (initialized later)
    false,  // is array
    0,  // array size
    false,  // is upper bound
    offsetof(vision_msgs__msg__ObjectHypothesisWithPose, hypothesis),  // bytes offset in struct
    NULL,  // default value
    NULL,  // size() function pointer
    NULL,  // get_const(index) function pointer
    NULL,  // get(index) function pointer
    NULL  // resize(index) function pointer
  },
  {
    "pose",  // name
    rosidl_typesupport_introspection_c__ROS_TYPE_MESSAGE,  // type
    0,  // upper bound of string
    NULL,  // members of sub message (initialized later)
    false,  // is array
    0,  // array size
    false,  // is upper bound
    offsetof(vision_msgs__msg__ObjectHypothesisWithPose, pose),  // bytes offset in struct
    NULL,  // default value
    NULL,  // size() function pointer
    NULL,  // get_const(index) function pointer
    NULL,  // get(index) function pointer
    NULL  // resize(index) function pointer
  }
};

static const rosidl_typesupport_introspection_c__MessageMembers ObjectHypothesisWithPose__rosidl_typesupport_introspection_c__ObjectHypothesisWithPose_message_members = {
  "vision_msgs__msg",  // message namespace
  "ObjectHypothesisWithPose",  // message name
  2,  // number of fields
  sizeof(vision_msgs__msg__ObjectHypothesisWithPose),
  ObjectHypothesisWithPose__rosidl_typesupport_introspection_c__ObjectHypothesisWithPose_message_member_array,  // message members
  ObjectHypothesisWithPose__rosidl_typesupport_introspection_c__ObjectHypothesisWithPose_init_function,  // function to initialize message memory (memory has to be allocated)
  ObjectHypothesisWithPose__rosidl_typesupport_introspection_c__ObjectHypothesisWithPose_fini_function  // function to terminate message instance (will not free memory)
};

// this is not const since it must be initialized on first access
// since C does not allow non-integral compile-time constants
static rosidl_message_type_support_t ObjectHypothesisWithPose__rosidl_typesupport_introspection_c__ObjectHypothesisWithPose_message_type_support_handle = {
  0,
  &ObjectHypothesisWithPose__rosidl_typesupport_introspection_c__ObjectHypothesisWithPose_message_members,
  get_message_typesupport_handle_function,
};

ROSIDL_TYPESUPPORT_INTROSPECTION_C_EXPORT_vision_msgs
const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_introspection_c, vision_msgs, msg, ObjectHypothesisWithPose)() {
  ObjectHypothesisWithPose__rosidl_typesupport_introspection_c__ObjectHypothesisWithPose_message_member_array[0].members_ =
    ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_introspection_c, vision_msgs, msg, ObjectHypothesis)();
  ObjectHypothesisWithPose__rosidl_typesupport_introspection_c__ObjectHypothesisWithPose_message_member_array[1].members_ =
    ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_introspection_c, geometry_msgs, msg, PoseWithCovariance)();
  if (!ObjectHypothesisWithPose__rosidl_typesupport_introspection_c__ObjectHypothesisWithPose_message_type_support_handle.typesupport_identifier) {
    ObjectHypothesisWithPose__rosidl_typesupport_introspection_c__ObjectHypothesisWithPose_message_type_support_handle.typesupport_identifier =
      rosidl_typesupport_introspection_c__identifier;
  }
  return &ObjectHypothesisWithPose__rosidl_typesupport_introspection_c__ObjectHypothesisWithPose_message_type_support_handle;
}
#ifdef __cplusplus
}
#endif
