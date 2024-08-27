// generated from rosidl_generator_c/resource/idl__struct.h.em
// with input from vision_msgs:msg/VisionInfo.idl
// generated code does not contain a copyright notice

#ifndef VISION_MSGS__MSG__DETAIL__VISION_INFO__STRUCT_H_
#define VISION_MSGS__MSG__DETAIL__VISION_INFO__STRUCT_H_

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
// Member 'method'
// Member 'database_location'
#include "rosidl_runtime_c/string.h"

/// Struct defined in msg/VisionInfo in the package vision_msgs.
/**
  * Provides meta-information about a visual pipeline.
  *
  * This message serves a similar purpose to sensor_msgs/CameraInfo, but instead
  *   of being tied to hardware, it represents information about a specific
  *   computer vision pipeline. This information stays constant (or relatively
  *   constant) over time, and so it is wasteful to send it with each individual
  *   result. By listening to these messages, subscribers will receive
  *   the context in which published vision messages are to be interpreted.
  * Each vision pipeline should publish its VisionInfo messages to its own topic,
  *   in a manner similar to CameraInfo.
 */
typedef struct vision_msgs__msg__VisionInfo
{
  /// Used for sequencing
  std_msgs__msg__Header header;
  /// Name of the vision pipeline. This should be a value that is meaningful to an
  ///   outside user.
  rosidl_runtime_c__String method;
  /// Location where the metadata database is stored. The recommended location is
  ///   as an XML string on the ROS parameter server, but the exact implementation
  ///   and information is left up to the user.
  /// The database should store information attached to class ids. Each
  ///   class id should map to an atomic, visually recognizable element. This
  ///   definition is intentionally vague to allow extreme flexibility. The
  ///   elements could be classes in a pixel segmentation algorithm, object classes
  ///   in a detector, different people's faces in a face detection algorithm, etc.
  ///   Vision pipelines report results in terms of numeric IDs, which map into
  ///   this  database.
  /// The information stored in this database is, again, left up to the user. The
  ///   database could be as simple as a map from ID to class name, or it could
  ///   include information such as object meshes or colors to use for
  ///   visualization.
  rosidl_runtime_c__String database_location;
  /// Metadata database version. This counter is incremented
  ///   each time the pipeline begins using a new version of the database (useful
  ///   in the case of online training or user modifications).
  ///   The counter value can be monitored by listeners to ensure that the pipeline
  ///   and the listener are using the same metadata.
  int32_t database_version;
} vision_msgs__msg__VisionInfo;

// Struct for a sequence of vision_msgs__msg__VisionInfo.
typedef struct vision_msgs__msg__VisionInfo__Sequence
{
  vision_msgs__msg__VisionInfo * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} vision_msgs__msg__VisionInfo__Sequence;

#ifdef __cplusplus
}
#endif

#endif  // VISION_MSGS__MSG__DETAIL__VISION_INFO__STRUCT_H_
