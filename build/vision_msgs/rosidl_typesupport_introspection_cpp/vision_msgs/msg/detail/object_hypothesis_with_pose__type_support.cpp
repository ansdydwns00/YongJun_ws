// generated from rosidl_typesupport_introspection_cpp/resource/idl__type_support.cpp.em
// with input from vision_msgs:msg/ObjectHypothesisWithPose.idl
// generated code does not contain a copyright notice

#include "array"
#include "cstddef"
#include "string"
#include "vector"
#include "rosidl_runtime_c/message_type_support_struct.h"
#include "rosidl_typesupport_cpp/message_type_support.hpp"
#include "rosidl_typesupport_interface/macros.h"
#include "vision_msgs/msg/detail/object_hypothesis_with_pose__struct.hpp"
#include "rosidl_typesupport_introspection_cpp/field_types.hpp"
#include "rosidl_typesupport_introspection_cpp/identifier.hpp"
#include "rosidl_typesupport_introspection_cpp/message_introspection.hpp"
#include "rosidl_typesupport_introspection_cpp/message_type_support_decl.hpp"
#include "rosidl_typesupport_introspection_cpp/visibility_control.h"

namespace vision_msgs
{

namespace msg
{

namespace rosidl_typesupport_introspection_cpp
{

void ObjectHypothesisWithPose_init_function(
  void * message_memory, rosidl_runtime_cpp::MessageInitialization _init)
{
  new (message_memory) vision_msgs::msg::ObjectHypothesisWithPose(_init);
}

void ObjectHypothesisWithPose_fini_function(void * message_memory)
{
  auto typed_message = static_cast<vision_msgs::msg::ObjectHypothesisWithPose *>(message_memory);
  typed_message->~ObjectHypothesisWithPose();
}

static const ::rosidl_typesupport_introspection_cpp::MessageMember ObjectHypothesisWithPose_message_member_array[2] = {
  {
    "hypothesis",  // name
    ::rosidl_typesupport_introspection_cpp::ROS_TYPE_MESSAGE,  // type
    0,  // upper bound of string
    ::rosidl_typesupport_introspection_cpp::get_message_type_support_handle<vision_msgs::msg::ObjectHypothesis>(),  // members of sub message
    false,  // is array
    0,  // array size
    false,  // is upper bound
    offsetof(vision_msgs::msg::ObjectHypothesisWithPose, hypothesis),  // bytes offset in struct
    nullptr,  // default value
    nullptr,  // size() function pointer
    nullptr,  // get_const(index) function pointer
    nullptr,  // get(index) function pointer
    nullptr  // resize(index) function pointer
  },
  {
    "pose",  // name
    ::rosidl_typesupport_introspection_cpp::ROS_TYPE_MESSAGE,  // type
    0,  // upper bound of string
    ::rosidl_typesupport_introspection_cpp::get_message_type_support_handle<geometry_msgs::msg::PoseWithCovariance>(),  // members of sub message
    false,  // is array
    0,  // array size
    false,  // is upper bound
    offsetof(vision_msgs::msg::ObjectHypothesisWithPose, pose),  // bytes offset in struct
    nullptr,  // default value
    nullptr,  // size() function pointer
    nullptr,  // get_const(index) function pointer
    nullptr,  // get(index) function pointer
    nullptr  // resize(index) function pointer
  }
};

static const ::rosidl_typesupport_introspection_cpp::MessageMembers ObjectHypothesisWithPose_message_members = {
  "vision_msgs::msg",  // message namespace
  "ObjectHypothesisWithPose",  // message name
  2,  // number of fields
  sizeof(vision_msgs::msg::ObjectHypothesisWithPose),
  ObjectHypothesisWithPose_message_member_array,  // message members
  ObjectHypothesisWithPose_init_function,  // function to initialize message memory (memory has to be allocated)
  ObjectHypothesisWithPose_fini_function  // function to terminate message instance (will not free memory)
};

static const rosidl_message_type_support_t ObjectHypothesisWithPose_message_type_support_handle = {
  ::rosidl_typesupport_introspection_cpp::typesupport_identifier,
  &ObjectHypothesisWithPose_message_members,
  get_message_typesupport_handle_function,
};

}  // namespace rosidl_typesupport_introspection_cpp

}  // namespace msg

}  // namespace vision_msgs


namespace rosidl_typesupport_introspection_cpp
{

template<>
ROSIDL_TYPESUPPORT_INTROSPECTION_CPP_PUBLIC
const rosidl_message_type_support_t *
get_message_type_support_handle<vision_msgs::msg::ObjectHypothesisWithPose>()
{
  return &::vision_msgs::msg::rosidl_typesupport_introspection_cpp::ObjectHypothesisWithPose_message_type_support_handle;
}

}  // namespace rosidl_typesupport_introspection_cpp

#ifdef __cplusplus
extern "C"
{
#endif

ROSIDL_TYPESUPPORT_INTROSPECTION_CPP_PUBLIC
const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_introspection_cpp, vision_msgs, msg, ObjectHypothesisWithPose)() {
  return &::vision_msgs::msg::rosidl_typesupport_introspection_cpp::ObjectHypothesisWithPose_message_type_support_handle;
}

#ifdef __cplusplus
}
#endif
