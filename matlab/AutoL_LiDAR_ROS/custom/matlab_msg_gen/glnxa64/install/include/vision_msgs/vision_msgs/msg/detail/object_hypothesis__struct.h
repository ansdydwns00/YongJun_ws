// generated from rosidl_generator_c/resource/idl__struct.h.em
// with input from vision_msgs:msg/ObjectHypothesis.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS__STRUCT_H_
#define VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS__STRUCT_H_

#ifdef __cplusplus
extern "C"
{
#endif

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>


// Constants defined in the message

// Include directives for member types
// Member 'class_id'
#include "rosidl_runtime_c/string.h"

/// Struct defined in msg/ObjectHypothesis in the package vision_msgs.
/**
  * An object hypothesis that contains no pose information.
  * If you would like to define an array of ObjectHypothesis messages,
  *   please see the Classification message type.
 */
typedef struct vision_msgs__msg__ObjectHypothesis
{
  /// The unique ID of the object class. To get additional information about
  ///   this ID, such as its human-readable class name, listeners should perform a
  ///   lookup in a metadata database. See vision_msgs/VisionInfo.msg for more detail.
  rosidl_runtime_c__String class_id;
  /// The probability or confidence value of the detected object. By convention,
  ///   this value should lie in the range.
  double score;
} vision_msgs__msg__ObjectHypothesis;

// Struct for a sequence of vision_msgs__msg__ObjectHypothesis.
typedef struct vision_msgs__msg__ObjectHypothesis__Sequence
{
  vision_msgs__msg__ObjectHypothesis * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} vision_msgs__msg__ObjectHypothesis__Sequence;

#ifdef __cplusplus
}
#endif

#endif  // VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS__STRUCT_H_
