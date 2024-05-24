// generated from rosidl_generator_c/resource/idl__struct.h.em
// with input from vision_msgs:msg/LabelInfo.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__LABEL_INFO__STRUCT_H_
#define VISION_MSGS__MSG__DETAIL__LABEL_INFO__STRUCT_H_

#ifdef __cplusplus
extern "C"
{
#endif

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>


// Constants defined in the message

// Include directives for member types
// Member 'header'
#include "std_msgs/msg/detail/header__struct.h"
// Member 'class_map'
#include "vision_msgs/msg/detail/vision_class__struct.h"

/// Struct defined in msg/LabelInfo in the package vision_msgs.
/**
  * Provides meta-information about a visual pipeline.
  *
  * This message serves a similar purpose to sensor_msgs/CameraInfo, but instead
  *   of being tied to hardware, it represents information about a specific
  *   computer vision pipeline. This information stays constant (or relatively
  *   constant) over time, and so it is wasteful to send it with each individual
  *   result. By listening to these messages, subscribers will receive
  *   the context in which published vision messages are to be interpreted.
  * Each vision pipeline should publish its LabelInfo messages to its own topic,
  *   in a manner similar to CameraInfo.
  * This message is meant to allow converting data from vision pipelines that
  *   return id based classifications back to human readable string class names.
 */
typedef struct vision_msgs__msg__LabelInfo
{
  /// Used for sequencing
  std_msgs__msg__Header header;
  /// An array of uint16 keys and string values containing the association
  ///   between class identifiers and their names. According to the amount
  ///   of classes and the datatype used to store their ids internally, the
  ///   maxiumum class id allowed (65535 for uint16 and 255 for uint8) belongs to
  ///   the "UNLABELED" class.
  vision_msgs__msg__VisionClass__Sequence class_map;
  /// The value between 0-1 used as confidence threshold for the inference.
  float threshold;
} vision_msgs__msg__LabelInfo;

// Struct for a sequence of vision_msgs__msg__LabelInfo.
typedef struct vision_msgs__msg__LabelInfo__Sequence
{
  vision_msgs__msg__LabelInfo * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} vision_msgs__msg__LabelInfo__Sequence;

#ifdef __cplusplus
}
#endif

#endif  // VISION_MSGS__MSG__DETAIL__LABEL_INFO__STRUCT_H_
