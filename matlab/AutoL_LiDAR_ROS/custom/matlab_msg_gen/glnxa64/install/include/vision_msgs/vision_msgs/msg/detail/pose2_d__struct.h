// generated from rosidl_generator_c/resource/idl__struct.h.em
// with input from vision_msgs:msg/Pose2D.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__POSE2_D__STRUCT_H_
#define VISION_MSGS__MSG__DETAIL__POSE2_D__STRUCT_H_

#ifdef __cplusplus
extern "C"
{
#endif

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>


// Constants defined in the message

// Include directives for member types
// Member 'position'
#include "vision_msgs/msg/detail/point2_d__struct.h"

/// Struct defined in msg/Pose2D in the package vision_msgs.
/**
  * Represents a 2D pose (coordinates and a radian rotation). Rotation is positive counterclockwise.
 */
typedef struct vision_msgs__msg__Pose2D
{
  vision_msgs__msg__Point2D position;
  double theta;
} vision_msgs__msg__Pose2D;

// Struct for a sequence of vision_msgs__msg__Pose2D.
typedef struct vision_msgs__msg__Pose2D__Sequence
{
  vision_msgs__msg__Pose2D * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} vision_msgs__msg__Pose2D__Sequence;

#ifdef __cplusplus
}
#endif

#endif  // VISION_MSGS__MSG__DETAIL__POSE2_D__STRUCT_H_
