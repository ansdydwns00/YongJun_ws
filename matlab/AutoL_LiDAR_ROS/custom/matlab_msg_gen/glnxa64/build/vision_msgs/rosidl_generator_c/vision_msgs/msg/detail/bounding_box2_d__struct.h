// generated from rosidl_generator_c/resource/idl__struct.h.em
// with input from vision_msgs:msg/BoundingBox2D.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__BOUNDING_BOX2_D__STRUCT_H_
#define VISION_MSGS__MSG__DETAIL__BOUNDING_BOX2_D__STRUCT_H_

#ifdef __cplusplus
extern "C"
{
#endif

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>


// Constants defined in the message

// Include directives for member types
// Member 'center'
#include "vision_msgs/msg/detail/pose2_d__struct.h"

/// Struct defined in msg/BoundingBox2D in the package vision_msgs.
/**
  * A 2D bounding box that can be rotated about its center.
  * All dimensions are in pixels, but represented using floating-point
  *   values to allow sub-pixel precision. If an exact pixel crop is required
  *   for a rotated bounding box, it can be calculated using Bresenham's line
  *   algorithm.
 */
typedef struct vision_msgs__msg__BoundingBox2D
{
  /// The 2D position (in pixels) and orientation of the bounding box center.
  vision_msgs__msg__Pose2D center;
  /// The total size (in pixels) of the bounding box surrounding the object relative
  ///   to the pose of its center.
  double size_x;
  double size_y;
} vision_msgs__msg__BoundingBox2D;

// Struct for a sequence of vision_msgs__msg__BoundingBox2D.
typedef struct vision_msgs__msg__BoundingBox2D__Sequence
{
  vision_msgs__msg__BoundingBox2D * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} vision_msgs__msg__BoundingBox2D__Sequence;

#ifdef __cplusplus
}
#endif

#endif  // VISION_MSGS__MSG__DETAIL__BOUNDING_BOX2_D__STRUCT_H_
