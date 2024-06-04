#ifndef _ROS2_STRUCTMSG_CONVERSION_H_
#define _ROS2_STRUCTMSG_CONVERSION_H_

#include "rclcpp/rclcpp.hpp"
#include <builtin_interfaces/msg/time.hpp>
#include <geometry_msgs/msg/point.hpp>
#include <geometry_msgs/msg/pose.hpp>
#include <geometry_msgs/msg/pose_with_covariance.hpp>
#include <geometry_msgs/msg/quaternion.hpp>
#include <geometry_msgs/msg/vector3.hpp>
#include <sensor_msgs/msg/point_cloud2.hpp>
#include <sensor_msgs/msg/point_field.hpp>
#include <std_msgs/msg/header.hpp>
#include <vision_msgs/msg/bounding_box3_d.hpp>
#include <vision_msgs/msg/detection3_d.hpp>
#include <vision_msgs/msg/detection3_d_array.hpp>
#include <vision_msgs/msg/object_hypothesis.hpp>
#include <vision_msgs/msg/object_hypothesis_with_pose.hpp>
#include "deployedPointPillarModel_types.h"
#include "mlros2_msgconvert_utils.h"


void struct2msg(builtin_interfaces::msg::Time& msgPtr, builtin_interfaces_TimeStruct_T const* structPtr);
void msg2struct(builtin_interfaces_TimeStruct_T* structPtr, const builtin_interfaces::msg::Time& msgPtr);

void struct2msg(geometry_msgs::msg::Point& msgPtr, geometry_msgs_PointStruct_T const* structPtr);
void msg2struct(geometry_msgs_PointStruct_T* structPtr, const geometry_msgs::msg::Point& msgPtr);

void struct2msg(geometry_msgs::msg::Pose& msgPtr, geometry_msgs_PoseStruct_T const* structPtr);
void msg2struct(geometry_msgs_PoseStruct_T* structPtr, const geometry_msgs::msg::Pose& msgPtr);

void struct2msg(geometry_msgs::msg::PoseWithCovariance& msgPtr, geometry_msgs_PoseWithCovarianceStruct_T const* structPtr);
void msg2struct(geometry_msgs_PoseWithCovarianceStruct_T* structPtr, const geometry_msgs::msg::PoseWithCovariance& msgPtr);

void struct2msg(geometry_msgs::msg::Quaternion& msgPtr, geometry_msgs_QuaternionStruct_T const* structPtr);
void msg2struct(geometry_msgs_QuaternionStruct_T* structPtr, const geometry_msgs::msg::Quaternion& msgPtr);

void struct2msg(geometry_msgs::msg::Vector3& msgPtr, geometry_msgs_Vector3Struct_T const* structPtr);
void msg2struct(geometry_msgs_Vector3Struct_T* structPtr, const geometry_msgs::msg::Vector3& msgPtr);

void struct2msg(sensor_msgs::msg::PointCloud2& msgPtr, sensor_msgs_PointCloud2Struct_T const* structPtr);
void msg2struct(sensor_msgs_PointCloud2Struct_T* structPtr, const sensor_msgs::msg::PointCloud2& msgPtr);

void struct2msg(sensor_msgs::msg::PointField& msgPtr, sensor_msgs_PointFieldStruct_T const* structPtr);
void msg2struct(sensor_msgs_PointFieldStruct_T* structPtr, const sensor_msgs::msg::PointField& msgPtr);

void struct2msg(std_msgs::msg::Header& msgPtr, std_msgs_HeaderStruct_T const* structPtr);
void msg2struct(std_msgs_HeaderStruct_T* structPtr, const std_msgs::msg::Header& msgPtr);

void struct2msg(vision_msgs::msg::BoundingBox3D& msgPtr, vision_msgs_BoundingBox3DStruct_T const* structPtr);
void msg2struct(vision_msgs_BoundingBox3DStruct_T* structPtr, const vision_msgs::msg::BoundingBox3D& msgPtr);

void struct2msg(vision_msgs::msg::Detection3D& msgPtr, vision_msgs_Detection3DStruct_T const* structPtr);
void msg2struct(vision_msgs_Detection3DStruct_T* structPtr, const vision_msgs::msg::Detection3D& msgPtr);

void struct2msg(vision_msgs::msg::Detection3DArray& msgPtr, vision_msgs_Detection3DArrayStruct_T const* structPtr);
void msg2struct(vision_msgs_Detection3DArrayStruct_T* structPtr, const vision_msgs::msg::Detection3DArray& msgPtr);

void struct2msg(vision_msgs::msg::ObjectHypothesis& msgPtr, vision_msgs_ObjectHypothesisStruct_T const* structPtr);
void msg2struct(vision_msgs_ObjectHypothesisStruct_T* structPtr, const vision_msgs::msg::ObjectHypothesis& msgPtr);

void struct2msg(vision_msgs::msg::ObjectHypothesisWithPose& msgPtr, vision_msgs_ObjectHypothesisWithPoseStruct_T const* structPtr);
void msg2struct(vision_msgs_ObjectHypothesisWithPoseStruct_T* structPtr, const vision_msgs::msg::ObjectHypothesisWithPose& msgPtr);


#endif
