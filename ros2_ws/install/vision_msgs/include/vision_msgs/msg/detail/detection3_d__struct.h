// generated from rosidl_generator_c/resource/idl__struct.h.em
// with input from vision_msgs:msg/Detection3D.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__DETECTION3_D__STRUCT_H_
#define VISION_MSGS__MSG__DETAIL__DETECTION3_D__STRUCT_H_

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
// Member 'results'
#include "vision_msgs/msg/detail/object_hypothesis_with_pose__struct.h"
// Member 'bbox'
#include "vision_msgs/msg/detail/bounding_box3_d__struct.h"
// Member 'id'
#include "rosidl_runtime_c/string.h"

// Struct defined in msg/Detection3D in the package vision_msgs.
typedef struct vision_msgs__msg__Detection3D
{
  std_msgs__msg__Header header;
  vision_msgs__msg__ObjectHypothesisWithPose__Sequence results;
  vision_msgs__msg__BoundingBox3D bbox;
  rosidl_runtime_c__String id;
} vision_msgs__msg__Detection3D;

// Struct for a sequence of vision_msgs__msg__Detection3D.
typedef struct vision_msgs__msg__Detection3D__Sequence
{
  vision_msgs__msg__Detection3D * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} vision_msgs__msg__Detection3D__Sequence;

#ifdef __cplusplus
}
#endif

#endif  // VISION_MSGS__MSG__DETAIL__DETECTION3_D__STRUCT_H_
