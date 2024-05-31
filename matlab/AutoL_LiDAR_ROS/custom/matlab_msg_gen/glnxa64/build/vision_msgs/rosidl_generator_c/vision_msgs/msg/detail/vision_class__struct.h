// generated from rosidl_generator_c/resource/idl__struct.h.em
// with input from vision_msgs:msg/VisionClass.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__VISION_CLASS__STRUCT_H_
#define VISION_MSGS__MSG__DETAIL__VISION_CLASS__STRUCT_H_

#ifdef __cplusplus
extern "C"
{
#endif

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>


// Constants defined in the message

// Include directives for member types
// Member 'class_name'
#include "rosidl_runtime_c/string.h"

/// Struct defined in msg/VisionClass in the package vision_msgs.
/**
  * A key value pair that maps an integer class_id to a string class label
  *   in computer vision systems.
 */
typedef struct vision_msgs__msg__VisionClass
{
  /// The int value that identifies the class.
  /// Elements identified with 65535, the maximum uint16 value are assumed
  ///   to belong to the "UNLABELED" class. For vision pipelines using less
  ///   than 255 classes the "UNLABELED" is the maximum value in the uint8
  ///   range.
  uint16_t class_id;
  /// The name of the class represented by the class_id
  rosidl_runtime_c__String class_name;
} vision_msgs__msg__VisionClass;

// Struct for a sequence of vision_msgs__msg__VisionClass.
typedef struct vision_msgs__msg__VisionClass__Sequence
{
  vision_msgs__msg__VisionClass * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} vision_msgs__msg__VisionClass__Sequence;

#ifdef __cplusplus
}
#endif

#endif  // VISION_MSGS__MSG__DETAIL__VISION_CLASS__STRUCT_H_
