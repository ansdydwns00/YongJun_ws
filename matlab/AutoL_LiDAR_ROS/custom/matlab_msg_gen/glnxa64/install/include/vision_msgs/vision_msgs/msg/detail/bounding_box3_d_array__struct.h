// generated from rosidl_generator_c/resource/idl__struct.h.em
// with input from vision_msgs:msg/BoundingBox3DArray.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__BOUNDING_BOX3_D_ARRAY__STRUCT_H_
#define VISION_MSGS__MSG__DETAIL__BOUNDING_BOX3_D_ARRAY__STRUCT_H_

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
// Member 'boxes'
#include "vision_msgs/msg/detail/bounding_box3_d__struct.h"

/// Struct defined in msg/BoundingBox3DArray in the package vision_msgs.
typedef struct vision_msgs__msg__BoundingBox3DArray
{
  std_msgs__msg__Header header;
  vision_msgs__msg__BoundingBox3D__Sequence boxes;
} vision_msgs__msg__BoundingBox3DArray;

// Struct for a sequence of vision_msgs__msg__BoundingBox3DArray.
typedef struct vision_msgs__msg__BoundingBox3DArray__Sequence
{
  vision_msgs__msg__BoundingBox3DArray * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} vision_msgs__msg__BoundingBox3DArray__Sequence;

#ifdef __cplusplus
}
#endif

#endif  // VISION_MSGS__MSG__DETAIL__BOUNDING_BOX3_D_ARRAY__STRUCT_H_
