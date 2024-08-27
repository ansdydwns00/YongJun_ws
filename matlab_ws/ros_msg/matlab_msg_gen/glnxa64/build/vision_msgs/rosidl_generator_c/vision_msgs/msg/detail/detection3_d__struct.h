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
// Member 'source_cloud'
#include "sensor_msgs/msg/detail/point_cloud2__struct.h"
// Member 'tracking_id'
#include "rosidl_runtime_c/string.h"

/// Struct defined in msg/Detection3D in the package vision_msgs.
/**
  * Defines a 3D detection result.
  *
  * This extends a basic 3D classification by including position information,
  *   allowing a classification result for a specific position in an image to
  *   to be located in the larger image.
 */
typedef struct vision_msgs__msg__Detection3D
{
  std_msgs__msg__Header header;
  /// Class probabilities. Does not have to include hypotheses for all possible
  ///   object ids, the scores for any ids not listed are assumed to be 0.
  vision_msgs__msg__ObjectHypothesisWithPose__Sequence results;
  /// 3D bounding box surrounding the object.
  vision_msgs__msg__BoundingBox3D bbox;
  /// The 3D data that generated these results (i.e. region proposal cropped out of
  ///   the image). This information is not required for all detectors, so it may
  ///   be empty.
  sensor_msgs__msg__PointCloud2 source_cloud;
  /// If this message was tracking result, this field set true.
  bool is_tracking;
  /// ID used for consistency across multiple detection messages. This value will
  ///   likely differ from the id field set in each individual ObjectHypothesis.
  /// If you set this field, be sure to also set is_tracking to True.
  rosidl_runtime_c__String tracking_id;
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
