// generated from rosidl_typesupport_introspection_cpp/resource/idl__type_support.cpp.em
// with input from vision_msgs:msg/LabelInfo.idl
// generated code does not contain a copyright notice

#include "array"
#include "cstddef"
#include "string"
#include "vector"
#include "rosidl_runtime_c/message_type_support_struct.h"
#include "rosidl_typesupport_cpp/message_type_support.hpp"
#include "rosidl_typesupport_interface/macros.h"
#include "vision_msgs/msg/detail/label_info__struct.hpp"
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

void LabelInfo_init_function(
  void * message_memory, rosidl_runtime_cpp::MessageInitialization _init)
{
  new (message_memory) vision_msgs::msg::LabelInfo(_init);
}

void LabelInfo_fini_function(void * message_memory)
{
  auto typed_message = static_cast<vision_msgs::msg::LabelInfo *>(message_memory);
  typed_message->~LabelInfo();
}

size_t size_function__LabelInfo__class_map(const void * untyped_member)
{
  const auto * member = reinterpret_cast<const std::vector<vision_msgs::msg::VisionClass> *>(untyped_member);
  return member->size();
}

const void * get_const_function__LabelInfo__class_map(const void * untyped_member, size_t index)
{
  const auto & member =
    *reinterpret_cast<const std::vector<vision_msgs::msg::VisionClass> *>(untyped_member);
  return &member[index];
}

void * get_function__LabelInfo__class_map(void * untyped_member, size_t index)
{
  auto & member =
    *reinterpret_cast<std::vector<vision_msgs::msg::VisionClass> *>(untyped_member);
  return &member[index];
}

void fetch_function__LabelInfo__class_map(
  const void * untyped_member, size_t index, void * untyped_value)
{
  const auto & item = *reinterpret_cast<const vision_msgs::msg::VisionClass *>(
    get_const_function__LabelInfo__class_map(untyped_member, index));
  auto & value = *reinterpret_cast<vision_msgs::msg::VisionClass *>(untyped_value);
  value = item;
}

void assign_function__LabelInfo__class_map(
  void * untyped_member, size_t index, const void * untyped_value)
{
  auto & item = *reinterpret_cast<vision_msgs::msg::VisionClass *>(
    get_function__LabelInfo__class_map(untyped_member, index));
  const auto & value = *reinterpret_cast<const vision_msgs::msg::VisionClass *>(untyped_value);
  item = value;
}

void resize_function__LabelInfo__class_map(void * untyped_member, size_t size)
{
  auto * member =
    reinterpret_cast<std::vector<vision_msgs::msg::VisionClass> *>(untyped_member);
  member->resize(size);
}

static const ::rosidl_typesupport_introspection_cpp::MessageMember LabelInfo_message_member_array[3] = {
  {
    "header",  // name
    ::rosidl_typesupport_introspection_cpp::ROS_TYPE_MESSAGE,  // type
    0,  // upper bound of string
    ::rosidl_typesupport_introspection_cpp::get_message_type_support_handle<std_msgs::msg::Header>(),  // members of sub message
    false,  // is array
    0,  // array size
    false,  // is upper bound
    offsetof(vision_msgs::msg::LabelInfo, header),  // bytes offset in struct
    nullptr,  // default value
    nullptr,  // size() function pointer
    nullptr,  // get_const(index) function pointer
    nullptr,  // get(index) function pointer
    nullptr,  // fetch(index, &value) function pointer
    nullptr,  // assign(index, value) function pointer
    nullptr  // resize(index) function pointer
  },
  {
    "class_map",  // name
    ::rosidl_typesupport_introspection_cpp::ROS_TYPE_MESSAGE,  // type
    0,  // upper bound of string
    ::rosidl_typesupport_introspection_cpp::get_message_type_support_handle<vision_msgs::msg::VisionClass>(),  // members of sub message
    true,  // is array
    0,  // array size
    false,  // is upper bound
    offsetof(vision_msgs::msg::LabelInfo, class_map),  // bytes offset in struct
    nullptr,  // default value
    size_function__LabelInfo__class_map,  // size() function pointer
    get_const_function__LabelInfo__class_map,  // get_const(index) function pointer
    get_function__LabelInfo__class_map,  // get(index) function pointer
    fetch_function__LabelInfo__class_map,  // fetch(index, &value) function pointer
    assign_function__LabelInfo__class_map,  // assign(index, value) function pointer
    resize_function__LabelInfo__class_map  // resize(index) function pointer
  },
  {
    "threshold",  // name
    ::rosidl_typesupport_introspection_cpp::ROS_TYPE_FLOAT,  // type
    0,  // upper bound of string
    nullptr,  // members of sub message
    false,  // is array
    0,  // array size
    false,  // is upper bound
    offsetof(vision_msgs::msg::LabelInfo, threshold),  // bytes offset in struct
    nullptr,  // default value
    nullptr,  // size() function pointer
    nullptr,  // get_const(index) function pointer
    nullptr,  // get(index) function pointer
    nullptr,  // fetch(index, &value) function pointer
    nullptr,  // assign(index, value) function pointer
    nullptr  // resize(index) function pointer
  }
};

static const ::rosidl_typesupport_introspection_cpp::MessageMembers LabelInfo_message_members = {
  "vision_msgs::msg",  // message namespace
  "LabelInfo",  // message name
  3,  // number of fields
  sizeof(vision_msgs::msg::LabelInfo),
  LabelInfo_message_member_array,  // message members
  LabelInfo_init_function,  // function to initialize message memory (memory has to be allocated)
  LabelInfo_fini_function  // function to terminate message instance (will not free memory)
};

static const rosidl_message_type_support_t LabelInfo_message_type_support_handle = {
  ::rosidl_typesupport_introspection_cpp::typesupport_identifier,
  &LabelInfo_message_members,
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
get_message_type_support_handle<vision_msgs::msg::LabelInfo>()
{
  return &::vision_msgs::msg::rosidl_typesupport_introspection_cpp::LabelInfo_message_type_support_handle;
}

}  // namespace rosidl_typesupport_introspection_cpp

#ifdef __cplusplus
extern "C"
{
#endif

ROSIDL_TYPESUPPORT_INTROSPECTION_CPP_PUBLIC
const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_introspection_cpp, vision_msgs, msg, LabelInfo)() {
  return &::vision_msgs::msg::rosidl_typesupport_introspection_cpp::LabelInfo_message_type_support_handle;
}

#ifdef __cplusplus
}
#endif
