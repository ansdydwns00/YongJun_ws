#include "ros2_structmsg_conversion.h"


// Conversions between builtin_interfaces_TimeStruct_T and builtin_interfaces::msg::Time

void struct2msg(builtin_interfaces::msg::Time& msgPtr, builtin_interfaces_TimeStruct_T const* structPtr)
{
  const std::string rosMessageType("builtin_interfaces/Time");

  msgPtr.nanosec =  structPtr->nanosec;
  msgPtr.sec =  structPtr->sec;
}

void msg2struct(builtin_interfaces_TimeStruct_T* structPtr, const builtin_interfaces::msg::Time& msgPtr)
{
  const std::string rosMessageType("builtin_interfaces/Time");

  structPtr->nanosec =  msgPtr.nanosec;
  structPtr->sec =  msgPtr.sec;
}


// Conversions between geometry_msgs_PointStruct_T and geometry_msgs::msg::Point

void struct2msg(geometry_msgs::msg::Point& msgPtr, geometry_msgs_PointStruct_T const* structPtr)
{
  const std::string rosMessageType("geometry_msgs/Point");

  msgPtr.x =  structPtr->x;
  msgPtr.y =  structPtr->y;
  msgPtr.z =  structPtr->z;
}

void msg2struct(geometry_msgs_PointStruct_T* structPtr, const geometry_msgs::msg::Point& msgPtr)
{
  const std::string rosMessageType("geometry_msgs/Point");

  structPtr->x =  msgPtr.x;
  structPtr->y =  msgPtr.y;
  structPtr->z =  msgPtr.z;
}


// Conversions between geometry_msgs_PoseStruct_T and geometry_msgs::msg::Pose

void struct2msg(geometry_msgs::msg::Pose& msgPtr, geometry_msgs_PoseStruct_T const* structPtr)
{
  const std::string rosMessageType("geometry_msgs/Pose");

  struct2msg(msgPtr.orientation, &structPtr->orientation);
  struct2msg(msgPtr.position, &structPtr->position);
}

void msg2struct(geometry_msgs_PoseStruct_T* structPtr, const geometry_msgs::msg::Pose& msgPtr)
{
  const std::string rosMessageType("geometry_msgs/Pose");

  msg2struct(&structPtr->orientation, msgPtr.orientation);
  msg2struct(&structPtr->position, msgPtr.position);
}


// Conversions between geometry_msgs_PoseWithCovarianceStruct_T and geometry_msgs::msg::PoseWithCovariance

void struct2msg(geometry_msgs::msg::PoseWithCovariance& msgPtr, geometry_msgs_PoseWithCovarianceStruct_T const* structPtr)
{
  const std::string rosMessageType("geometry_msgs/PoseWithCovariance");

  convertFromStructPrimitiveArray(msgPtr.covariance, structPtr->covariance);
  struct2msg(msgPtr.pose, &structPtr->pose);
}

void msg2struct(geometry_msgs_PoseWithCovarianceStruct_T* structPtr, const geometry_msgs::msg::PoseWithCovariance& msgPtr)
{
  const std::string rosMessageType("geometry_msgs/PoseWithCovariance");

  convertToStructPrimitiveArray(structPtr->covariance, msgPtr.covariance);
  msg2struct(&structPtr->pose, msgPtr.pose);
}


// Conversions between geometry_msgs_QuaternionStruct_T and geometry_msgs::msg::Quaternion

void struct2msg(geometry_msgs::msg::Quaternion& msgPtr, geometry_msgs_QuaternionStruct_T const* structPtr)
{
  const std::string rosMessageType("geometry_msgs/Quaternion");

  msgPtr.w =  structPtr->w;
  msgPtr.x =  structPtr->x;
  msgPtr.y =  structPtr->y;
  msgPtr.z =  structPtr->z;
}

void msg2struct(geometry_msgs_QuaternionStruct_T* structPtr, const geometry_msgs::msg::Quaternion& msgPtr)
{
  const std::string rosMessageType("geometry_msgs/Quaternion");

  structPtr->w =  msgPtr.w;
  structPtr->x =  msgPtr.x;
  structPtr->y =  msgPtr.y;
  structPtr->z =  msgPtr.z;
}


// Conversions between geometry_msgs_Vector3Struct_T and geometry_msgs::msg::Vector3

void struct2msg(geometry_msgs::msg::Vector3& msgPtr, geometry_msgs_Vector3Struct_T const* structPtr)
{
  const std::string rosMessageType("geometry_msgs/Vector3");

  msgPtr.x =  structPtr->x;
  msgPtr.y =  structPtr->y;
  msgPtr.z =  structPtr->z;
}

void msg2struct(geometry_msgs_Vector3Struct_T* structPtr, const geometry_msgs::msg::Vector3& msgPtr)
{
  const std::string rosMessageType("geometry_msgs/Vector3");

  structPtr->x =  msgPtr.x;
  structPtr->y =  msgPtr.y;
  structPtr->z =  msgPtr.z;
}


// Conversions between sensor_msgs_PointCloud2Struct_T and sensor_msgs::msg::PointCloud2

void struct2msg(sensor_msgs::msg::PointCloud2& msgPtr, sensor_msgs_PointCloud2Struct_T const* structPtr)
{
  const std::string rosMessageType("sensor_msgs/PointCloud2");

  convertFromStructPrimitiveArray(msgPtr.data, structPtr->data);
  convertFromStructNestedArray(msgPtr.fields, structPtr->fields);
  struct2msg(msgPtr.header, &structPtr->header);
  msgPtr.height =  structPtr->height;
  msgPtr.is_bigendian =  structPtr->is_bigendian;
  msgPtr.is_dense =  structPtr->is_dense;
  msgPtr.point_step =  structPtr->point_step;
  msgPtr.row_step =  structPtr->row_step;
  msgPtr.width =  structPtr->width;
}

void msg2struct(sensor_msgs_PointCloud2Struct_T* structPtr, const sensor_msgs::msg::PointCloud2& msgPtr)
{
  const std::string rosMessageType("sensor_msgs/PointCloud2");

  convertToStructPrimitiveArray(structPtr->data, msgPtr.data);
  convertToStructNestedArray(structPtr->fields, msgPtr.fields);
  msg2struct(&structPtr->header, msgPtr.header);
  structPtr->height =  msgPtr.height;
  structPtr->is_bigendian =  msgPtr.is_bigendian;
  structPtr->is_dense =  msgPtr.is_dense;
  structPtr->point_step =  msgPtr.point_step;
  structPtr->row_step =  msgPtr.row_step;
  structPtr->width =  msgPtr.width;
}


// Conversions between sensor_msgs_PointFieldStruct_T and sensor_msgs::msg::PointField

void struct2msg(sensor_msgs::msg::PointField& msgPtr, sensor_msgs_PointFieldStruct_T const* structPtr)
{
  const std::string rosMessageType("sensor_msgs/PointField");

  msgPtr.count =  structPtr->count;
  msgPtr.datatype =  structPtr->datatype;
  convertFromStructPrimitiveArray(msgPtr.name, structPtr->name);
  msgPtr.offset =  structPtr->offset;
}

void msg2struct(sensor_msgs_PointFieldStruct_T* structPtr, const sensor_msgs::msg::PointField& msgPtr)
{
  const std::string rosMessageType("sensor_msgs/PointField");

  structPtr->count =  msgPtr.count;
  structPtr->datatype =  msgPtr.datatype;
  convertToStructPrimitiveArray(structPtr->name, msgPtr.name);
  structPtr->offset =  msgPtr.offset;
}


// Conversions between std_msgs_HeaderStruct_T and std_msgs::msg::Header

void struct2msg(std_msgs::msg::Header& msgPtr, std_msgs_HeaderStruct_T const* structPtr)
{
  const std::string rosMessageType("std_msgs/Header");

  convertFromStructPrimitiveArray(msgPtr.frame_id, structPtr->frame_id);
  struct2msg(msgPtr.stamp, &structPtr->stamp);
}

void msg2struct(std_msgs_HeaderStruct_T* structPtr, const std_msgs::msg::Header& msgPtr)
{
  const std::string rosMessageType("std_msgs/Header");

  convertToStructPrimitiveArray(structPtr->frame_id, msgPtr.frame_id);
  msg2struct(&structPtr->stamp, msgPtr.stamp);
}


// Conversions between vision_msgs_BoundingBox3DStruct_T and vision_msgs::msg::BoundingBox3D

void struct2msg(vision_msgs::msg::BoundingBox3D& msgPtr, vision_msgs_BoundingBox3DStruct_T const* structPtr)
{
  const std::string rosMessageType("vision_msgs/BoundingBox3D");

  struct2msg(msgPtr.center, &structPtr->center);
  struct2msg(msgPtr.size, &structPtr->size);
}

void msg2struct(vision_msgs_BoundingBox3DStruct_T* structPtr, const vision_msgs::msg::BoundingBox3D& msgPtr)
{
  const std::string rosMessageType("vision_msgs/BoundingBox3D");

  msg2struct(&structPtr->center, msgPtr.center);
  msg2struct(&structPtr->size, msgPtr.size);
}


// Conversions between vision_msgs_Detection3DStruct_T and vision_msgs::msg::Detection3D

void struct2msg(vision_msgs::msg::Detection3D& msgPtr, vision_msgs_Detection3DStruct_T const* structPtr)
{
  const std::string rosMessageType("vision_msgs/Detection3D");

  struct2msg(msgPtr.bbox, &structPtr->bbox);
  struct2msg(msgPtr.header, &structPtr->header);
  convertFromStructPrimitiveArray(msgPtr.id, structPtr->id);
  convertFromStructNestedArray(msgPtr.results, structPtr->results);
}

void msg2struct(vision_msgs_Detection3DStruct_T* structPtr, const vision_msgs::msg::Detection3D& msgPtr)
{
  const std::string rosMessageType("vision_msgs/Detection3D");

  msg2struct(&structPtr->bbox, msgPtr.bbox);
  msg2struct(&structPtr->header, msgPtr.header);
  convertToStructPrimitiveArray(structPtr->id, msgPtr.id);
  convertToStructNestedArray(structPtr->results, msgPtr.results);
}


// Conversions between vision_msgs_Detection3DArrayStruct_T and vision_msgs::msg::Detection3DArray

void struct2msg(vision_msgs::msg::Detection3DArray& msgPtr, vision_msgs_Detection3DArrayStruct_T const* structPtr)
{
  const std::string rosMessageType("vision_msgs/Detection3DArray");

  convertFromStructNestedArray(msgPtr.detections, structPtr->detections);
  struct2msg(msgPtr.header, &structPtr->header);
}

void msg2struct(vision_msgs_Detection3DArrayStruct_T* structPtr, const vision_msgs::msg::Detection3DArray& msgPtr)
{
  const std::string rosMessageType("vision_msgs/Detection3DArray");

  convertToStructNestedArray(structPtr->detections, msgPtr.detections);
  msg2struct(&structPtr->header, msgPtr.header);
}


// Conversions between vision_msgs_ObjectHypothesisStruct_T and vision_msgs::msg::ObjectHypothesis

void struct2msg(vision_msgs::msg::ObjectHypothesis& msgPtr, vision_msgs_ObjectHypothesisStruct_T const* structPtr)
{
  const std::string rosMessageType("vision_msgs/ObjectHypothesis");

  convertFromStructPrimitiveArray(msgPtr.class_id, structPtr->class_id);
  msgPtr.score =  structPtr->score;
}

void msg2struct(vision_msgs_ObjectHypothesisStruct_T* structPtr, const vision_msgs::msg::ObjectHypothesis& msgPtr)
{
  const std::string rosMessageType("vision_msgs/ObjectHypothesis");

  convertToStructPrimitiveArray(structPtr->class_id, msgPtr.class_id);
  structPtr->score =  msgPtr.score;
}


// Conversions between vision_msgs_ObjectHypothesisWithPoseStruct_T and vision_msgs::msg::ObjectHypothesisWithPose

void struct2msg(vision_msgs::msg::ObjectHypothesisWithPose& msgPtr, vision_msgs_ObjectHypothesisWithPoseStruct_T const* structPtr)
{
  const std::string rosMessageType("vision_msgs/ObjectHypothesisWithPose");

  struct2msg(msgPtr.hypothesis, &structPtr->hypothesis);
  struct2msg(msgPtr.pose, &structPtr->pose);
}

void msg2struct(vision_msgs_ObjectHypothesisWithPoseStruct_T* structPtr, const vision_msgs::msg::ObjectHypothesisWithPose& msgPtr)
{
  const std::string rosMessageType("vision_msgs/ObjectHypothesisWithPose");

  msg2struct(&structPtr->hypothesis, msgPtr.hypothesis);
  msg2struct(&structPtr->pose, msgPtr.pose);
}

