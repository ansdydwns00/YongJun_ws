//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: vision_msgs_BoundingBox3DStruct.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "vision_msgs_BoundingBox3DStruct.h"
#include "deployedPointPillarModel_types.h"
#include "geometry_msgs_PoseStruct.h"
#include "geometry_msgs_Vector3Struct.h"
#include "rt_nonfinite.h"

// Function Definitions
//
// Message struct definition for vision_msgs/BoundingBox3D
//
// Arguments    : vision_msgs_BoundingBox3DStruct_T *msg
// Return Type  : void
//
void vision_msgs_BoundingBox3DStruct(vision_msgs_BoundingBox3DStruct_T *msg)
{
  static const char b_cv[25]{'v', 'i', 's', 'i', 'o', 'n', '_', 'm', 's',
                             'g', 's', '/', 'B', 'o', 'u', 'n', 'd', 'i',
                             'n', 'g', 'B', 'o', 'x', '3', 'D'};
  for (int i{0}; i < 25; i++) {
    msg->MessageType[i] = b_cv[i];
  }
  geometry_msgs_PoseStruct(&msg->center);
  msg->size = geometry_msgs_Vector3Struct();
  //(msg);
}

//
// File trailer for vision_msgs_BoundingBox3DStruct.cu
//
// [EOF]
//
