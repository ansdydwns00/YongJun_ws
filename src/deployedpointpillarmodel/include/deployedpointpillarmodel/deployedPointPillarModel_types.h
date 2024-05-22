//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: deployedPointPillarModel_types.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

#ifndef DEPLOYEDPOINTPILLARMODEL_TYPES_H
#define DEPLOYEDPOINTPILLARMODEL_TYPES_H

// Include Files
#include "rtwtypes.h"
#include "coder_array.h"

// Type Definitions
struct builtin_interfaces_TimeStruct_T {
  char MessageType[23];
  int sec;
  unsigned int nanosec;
};

struct geometry_msgs_PointStruct_T {
  char MessageType[19];
  double x;
  double y;
  double z;
};

struct geometry_msgs_QuaternionStruct_T {
  char MessageType[24];
  double x;
  double y;
  double z;
  double w;
};

struct geometry_msgs_PoseStruct_T {
  char MessageType[18];
  geometry_msgs_PointStruct_T position;
  geometry_msgs_QuaternionStruct_T orientation;
};

struct geometry_msgs_PoseWithCovarianceStruct_T {
  char MessageType[32];
  geometry_msgs_PoseStruct_T pose;
  double covariance[36];
};

struct geometry_msgs_Vector3Struct_T {
  char MessageType[21];
  double x;
  double y;
  double z;
};

struct vision_msgs_BoundingBox3DStruct_T {
  char MessageType[25];
  geometry_msgs_PoseStruct_T center;
  geometry_msgs_Vector3Struct_T size;
};

struct sensor_msgs_PointFieldStruct_T {
  char MessageType[22];
  unsigned char INT8;
  unsigned char UINT8;
  unsigned char INT16;
  unsigned char UINT16;
  unsigned char INT32;
  unsigned char UINT32;
  unsigned char FLOAT32;
  unsigned char FLOAT64;
  coder::array<char, 2U> name;
  unsigned int offset;
  unsigned char datatype;
  unsigned int count;
};

struct std_msgs_HeaderStruct_T {
  char MessageType[15];
  builtin_interfaces_TimeStruct_T stamp;
  coder::array<char, 2U> frame_id;
};

struct sensor_msgs_PointCloud2Struct_T {
  char MessageType[23];
  std_msgs_HeaderStruct_T header;
  unsigned int height;
  unsigned int width;
  coder::array<sensor_msgs_PointFieldStruct_T, 1U> fields;
  bool is_bigendian;
  unsigned int point_step;
  unsigned int row_step;
  coder::array<unsigned char, 1U> data;
  bool is_dense;
};

struct vision_msgs_ObjectHypothesisStruct_T {
  char MessageType[28];
  coder::array<char, 2U> class_id;
  double score;
};

struct vision_msgs_ObjectHypothesisWithPoseStruct_T {
  char MessageType[36];
  vision_msgs_ObjectHypothesisStruct_T hypothesis;
  geometry_msgs_PoseWithCovarianceStruct_T pose;
};

struct vision_msgs_Detection3DStruct_T {
  char MessageType[23];
  std_msgs_HeaderStruct_T header;
  coder::array<vision_msgs_ObjectHypothesisWithPoseStruct_T, 1U> results;
  vision_msgs_BoundingBox3DStruct_T bbox;
  coder::array<char, 2U> id;
};

struct vision_msgs_Detection3DArrayStruct_T {
  char MessageType[28];
  std_msgs_HeaderStruct_T header;
  coder::array<vision_msgs_Detection3DStruct_T, 1U> detections;
};

#endif
//
// File trailer for deployedPointPillarModel_types.h
//
// [EOF]
//
