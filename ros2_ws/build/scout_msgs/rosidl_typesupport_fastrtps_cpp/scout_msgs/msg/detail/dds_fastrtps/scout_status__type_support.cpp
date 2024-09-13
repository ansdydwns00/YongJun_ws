// generated from rosidl_typesupport_fastrtps_cpp/resource/idl__type_support.cpp.em
// with input from scout_msgs:msg/ScoutStatus.idl
// generated code does not contain a copyright notice
#include "scout_msgs/msg/detail/scout_status__rosidl_typesupport_fastrtps_cpp.hpp"
#include "scout_msgs/msg/detail/scout_status__struct.hpp"

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
namespace std_msgs
{
namespace msg
{
namespace typesupport_fastrtps_cpp
{
bool cdr_serialize(
  const std_msgs::msg::Header &,
  eprosima::fastcdr::Cdr &);
bool cdr_deserialize(
  eprosima::fastcdr::Cdr &,
  std_msgs::msg::Header &);
size_t get_serialized_size(
  const std_msgs::msg::Header &,
  size_t current_alignment);
size_t
max_serialized_size_Header(
  bool & full_bounded,
  size_t current_alignment);
}  // namespace typesupport_fastrtps_cpp
}  // namespace msg
}  // namespace std_msgs

namespace scout_msgs
{
namespace msg
{
namespace typesupport_fastrtps_cpp
{
bool cdr_serialize(
  const scout_msgs::msg::ScoutActuatorState &,
  eprosima::fastcdr::Cdr &);
bool cdr_deserialize(
  eprosima::fastcdr::Cdr &,
  scout_msgs::msg::ScoutActuatorState &);
size_t get_serialized_size(
  const scout_msgs::msg::ScoutActuatorState &,
  size_t current_alignment);
size_t
max_serialized_size_ScoutActuatorState(
  bool & full_bounded,
  size_t current_alignment);
}  // namespace typesupport_fastrtps_cpp
}  // namespace msg
}  // namespace scout_msgs

namespace scout_msgs
{
namespace msg
{
namespace typesupport_fastrtps_cpp
{
bool cdr_serialize(
  const scout_msgs::msg::ScoutLightState &,
  eprosima::fastcdr::Cdr &);
bool cdr_deserialize(
  eprosima::fastcdr::Cdr &,
  scout_msgs::msg::ScoutLightState &);
size_t get_serialized_size(
  const scout_msgs::msg::ScoutLightState &,
  size_t current_alignment);
size_t
max_serialized_size_ScoutLightState(
  bool & full_bounded,
  size_t current_alignment);
}  // namespace typesupport_fastrtps_cpp
}  // namespace msg
}  // namespace scout_msgs

namespace scout_msgs
{
namespace msg
{
namespace typesupport_fastrtps_cpp
{
bool cdr_serialize(
  const scout_msgs::msg::ScoutLightState &,
  eprosima::fastcdr::Cdr &);
bool cdr_deserialize(
  eprosima::fastcdr::Cdr &,
  scout_msgs::msg::ScoutLightState &);
size_t get_serialized_size(
  const scout_msgs::msg::ScoutLightState &,
  size_t current_alignment);
size_t
max_serialized_size_ScoutLightState(
  bool & full_bounded,
  size_t current_alignment);
}  // namespace typesupport_fastrtps_cpp
}  // namespace msg
}  // namespace scout_msgs


namespace scout_msgs
{

namespace msg
{

namespace typesupport_fastrtps_cpp
{

bool
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_scout_msgs
cdr_serialize(
  const scout_msgs::msg::ScoutStatus & ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  // Member: header
  std_msgs::msg::typesupport_fastrtps_cpp::cdr_serialize(
    ros_message.header,
    cdr);
  // Member: linear_velocity
  cdr << ros_message.linear_velocity;
  // Member: angular_velocity
  cdr << ros_message.angular_velocity;
  // Member: vehicle_state
  cdr << ros_message.vehicle_state;
  // Member: control_mode
  cdr << ros_message.control_mode;
  // Member: error_code
  cdr << ros_message.error_code;
  // Member: battery_voltage
  cdr << ros_message.battery_voltage;
  // Member: actuator_states
  {
    for (size_t i = 0; i < 4; i++) {
      scout_msgs::msg::typesupport_fastrtps_cpp::cdr_serialize(
        ros_message.actuator_states[i],
        cdr);
    }
  }
  // Member: light_control_enabled
  cdr << (ros_message.light_control_enabled ? true : false);
  // Member: front_light_state
  scout_msgs::msg::typesupport_fastrtps_cpp::cdr_serialize(
    ros_message.front_light_state,
    cdr);
  // Member: rear_light_state
  scout_msgs::msg::typesupport_fastrtps_cpp::cdr_serialize(
    ros_message.rear_light_state,
    cdr);
  return true;
}

bool
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_scout_msgs
cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  scout_msgs::msg::ScoutStatus & ros_message)
{
  // Member: header
  std_msgs::msg::typesupport_fastrtps_cpp::cdr_deserialize(
    cdr, ros_message.header);

  // Member: linear_velocity
  cdr >> ros_message.linear_velocity;

  // Member: angular_velocity
  cdr >> ros_message.angular_velocity;

  // Member: vehicle_state
  cdr >> ros_message.vehicle_state;

  // Member: control_mode
  cdr >> ros_message.control_mode;

  // Member: error_code
  cdr >> ros_message.error_code;

  // Member: battery_voltage
  cdr >> ros_message.battery_voltage;

  // Member: actuator_states
  {
    for (size_t i = 0; i < 4; i++) {
      scout_msgs::msg::typesupport_fastrtps_cpp::cdr_deserialize(
        cdr,
        ros_message.actuator_states[i]);
    }
  }

  // Member: light_control_enabled
  {
    uint8_t tmp;
    cdr >> tmp;
    ros_message.light_control_enabled = tmp ? true : false;
  }

  // Member: front_light_state
  scout_msgs::msg::typesupport_fastrtps_cpp::cdr_deserialize(
    cdr, ros_message.front_light_state);

  // Member: rear_light_state
  scout_msgs::msg::typesupport_fastrtps_cpp::cdr_deserialize(
    cdr, ros_message.rear_light_state);

  return true;
}

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_scout_msgs
get_serialized_size(
  const scout_msgs::msg::ScoutStatus & ros_message,
  size_t current_alignment)
{
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  (void)padding;
  (void)wchar_size;

  // Member: header

  current_alignment +=
    std_msgs::msg::typesupport_fastrtps_cpp::get_serialized_size(
    ros_message.header, current_alignment);
  // Member: linear_velocity
  {
    size_t item_size = sizeof(ros_message.linear_velocity);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: angular_velocity
  {
    size_t item_size = sizeof(ros_message.angular_velocity);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: vehicle_state
  {
    size_t item_size = sizeof(ros_message.vehicle_state);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: control_mode
  {
    size_t item_size = sizeof(ros_message.control_mode);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: error_code
  {
    size_t item_size = sizeof(ros_message.error_code);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: battery_voltage
  {
    size_t item_size = sizeof(ros_message.battery_voltage);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: actuator_states
  {
    size_t array_size = 4;

    for (size_t index = 0; index < array_size; ++index) {
      current_alignment +=
        scout_msgs::msg::typesupport_fastrtps_cpp::get_serialized_size(
        ros_message.actuator_states[index], current_alignment);
    }
  }
  // Member: light_control_enabled
  {
    size_t item_size = sizeof(ros_message.light_control_enabled);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: front_light_state

  current_alignment +=
    scout_msgs::msg::typesupport_fastrtps_cpp::get_serialized_size(
    ros_message.front_light_state, current_alignment);
  // Member: rear_light_state

  current_alignment +=
    scout_msgs::msg::typesupport_fastrtps_cpp::get_serialized_size(
    ros_message.rear_light_state, current_alignment);

  return current_alignment - initial_alignment;
}

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_scout_msgs
max_serialized_size_ScoutStatus(
  bool & full_bounded,
  size_t current_alignment)
{
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  (void)padding;
  (void)wchar_size;
  (void)full_bounded;


  // Member: header
  {
    size_t array_size = 1;


    for (size_t index = 0; index < array_size; ++index) {
      current_alignment +=
        std_msgs::msg::typesupport_fastrtps_cpp::max_serialized_size_Header(
        full_bounded, current_alignment);
    }
  }

  // Member: linear_velocity
  {
    size_t array_size = 1;

    current_alignment += array_size * sizeof(uint64_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint64_t));
  }

  // Member: angular_velocity
  {
    size_t array_size = 1;

    current_alignment += array_size * sizeof(uint64_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint64_t));
  }

  // Member: vehicle_state
  {
    size_t array_size = 1;

    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: control_mode
  {
    size_t array_size = 1;

    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: error_code
  {
    size_t array_size = 1;

    current_alignment += array_size * sizeof(uint16_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint16_t));
  }

  // Member: battery_voltage
  {
    size_t array_size = 1;

    current_alignment += array_size * sizeof(uint64_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint64_t));
  }

  // Member: actuator_states
  {
    size_t array_size = 4;


    for (size_t index = 0; index < array_size; ++index) {
      current_alignment +=
        scout_msgs::msg::typesupport_fastrtps_cpp::max_serialized_size_ScoutActuatorState(
        full_bounded, current_alignment);
    }
  }

  // Member: light_control_enabled
  {
    size_t array_size = 1;

    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: front_light_state
  {
    size_t array_size = 1;


    for (size_t index = 0; index < array_size; ++index) {
      current_alignment +=
        scout_msgs::msg::typesupport_fastrtps_cpp::max_serialized_size_ScoutLightState(
        full_bounded, current_alignment);
    }
  }

  // Member: rear_light_state
  {
    size_t array_size = 1;


    for (size_t index = 0; index < array_size; ++index) {
      current_alignment +=
        scout_msgs::msg::typesupport_fastrtps_cpp::max_serialized_size_ScoutLightState(
        full_bounded, current_alignment);
    }
  }

  return current_alignment - initial_alignment;
}

static bool _ScoutStatus__cdr_serialize(
  const void * untyped_ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  auto typed_message =
    static_cast<const scout_msgs::msg::ScoutStatus *>(
    untyped_ros_message);
  return cdr_serialize(*typed_message, cdr);
}

static bool _ScoutStatus__cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  void * untyped_ros_message)
{
  auto typed_message =
    static_cast<scout_msgs::msg::ScoutStatus *>(
    untyped_ros_message);
  return cdr_deserialize(cdr, *typed_message);
}

static uint32_t _ScoutStatus__get_serialized_size(
  const void * untyped_ros_message)
{
  auto typed_message =
    static_cast<const scout_msgs::msg::ScoutStatus *>(
    untyped_ros_message);
  return static_cast<uint32_t>(get_serialized_size(*typed_message, 0));
}

static size_t _ScoutStatus__max_serialized_size(bool & full_bounded)
{
  return max_serialized_size_ScoutStatus(full_bounded, 0);
}

static message_type_support_callbacks_t _ScoutStatus__callbacks = {
  "scout_msgs::msg",
  "ScoutStatus",
  _ScoutStatus__cdr_serialize,
  _ScoutStatus__cdr_deserialize,
  _ScoutStatus__get_serialized_size,
  _ScoutStatus__max_serialized_size
};

static rosidl_message_type_support_t _ScoutStatus__handle = {
  rosidl_typesupport_fastrtps_cpp::typesupport_identifier,
  &_ScoutStatus__callbacks,
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
get_message_type_support_handle<scout_msgs::msg::ScoutStatus>()
{
  return &scout_msgs::msg::typesupport_fastrtps_cpp::_ScoutStatus__handle;
}

}  // namespace rosidl_typesupport_fastrtps_cpp

#ifdef __cplusplus
extern "C"
{
#endif

const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_cpp, scout_msgs, msg, ScoutStatus)() {
  return &scout_msgs::msg::typesupport_fastrtps_cpp::_ScoutStatus__handle;
}

#ifdef __cplusplus
}
#endif
