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
// Member 'id'
#include "rosidl_runtime_c/string.h"
// Member 'pose'
#include "geometry_msgs/msg/detail/pose_with_covariance__struct.h"

/// Struct defined in msg/ObjectHypothesisWithPose in the package vision_msgs.
/**
  * An object hypothesis that contains position information.
 */
typedef struct vision_msgs__msg__ObjectHypothesisWithPose
{
  /// The unique ID of the object class. To get additional information about
  ///   this ID, such as its human-readable class name, listeners should perform a
  ///   lookup in a metadata database. See vision_msgs/VisionInfo.msg for more detail.
  rosidl_runtime_c__String id;
  /// The probability or confidence value of the detected object. By convention,
  ///   this value should lie in the range.
  double score;
  /// The 6D pose of the object hypothesis. This pose should be
  ///   defined as the pose of some fixed reference point on the object, such a
  ///   the geometric center of the bounding box or the center of mass of the
  ///   object.
  /// Note that this pose is not stamped; frame information can be defined by
  ///   parent messages.
  /// Also note that different classes predicted for the same input data may have
  ///   different predicted 6D poses.
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
