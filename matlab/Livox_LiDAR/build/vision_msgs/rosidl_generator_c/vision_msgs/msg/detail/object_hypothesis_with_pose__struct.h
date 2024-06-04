// generated from rosidl_generator_c/resource/idl__struct.h.em
// with input from vision_msgs:msg/ObjectHypothesisWithPose.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS_WITH_POSE__STRUCT_H_
#define VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS_WITH_POSE__STRUCT_H_

#ifdef __cplusplus
extern "C"
{
#endif

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>


// Constants defined in the message

// Include directives for member types
// Member 'hypothesis'
#include "vision_msgs/msg/detail/object_hypothesis__struct.h"
// Member 'pose'
#include "geometry_msgs/msg/detail/pose_with_covariance__struct.h"

// Struct defined in msg/ObjectHypothesisWithPose in the package vision_msgs.
typedef struct vision_msgs__msg__ObjectHypothesisWithPose
{
  vision_msgs__msg__ObjectHypothesis hypothesis;
  geometry_msgs__msg__PoseWithCovariance pose;
} vision_msgs__msg__ObjectHypothesisWithPose;

// Struct for a sequence of vision_msgs__msg__ObjectHypothesisWithPose.
typedef struct vision_msgs__msg__ObjectHypothesisWithPose__Sequence
{
  vision_msgs__msg__ObjectHypothesisWithPose * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} vision_msgs__msg__ObjectHypothesisWithPose__Sequence;

#ifdef __cplusplus
}
#endif

#endif  // VISION_MSGS__MSG__DETAIL__OBJECT_HYPOTHESIS_WITH_POSE__STRUCT_H_
