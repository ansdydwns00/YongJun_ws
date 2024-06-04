//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: geometry_msgs_PointStruct.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "geometry_msgs_PointStruct.h"
#include "deployedPointPillarModel_types.h"
#include "rt_nonfinite.h"

// Function Definitions
//
// Message struct definition for geometry_msgs/Point
//
// Arguments    : void
// Return Type  : geometry_msgs_PointStruct_T
//
geometry_msgs_PointStruct_T geometry_msgs_PointStruct()
{
  static const geometry_msgs_PointStruct_T b_msg{
      {'g', 'e', 'o', 'm', 'e', 't', 'r', 'y', '_', 'm', 's', 'g', 's', '/',
       'P', 'o', 'i', 'n', 't'}, // MessageType
      0.0,                       // x
      0.0,                       // y
      0.0                        // z
  };
  geometry_msgs_PointStruct_T msg;
  msg = b_msg;
  //(&b_msg);
  return msg;
}

//
// File trailer for geometry_msgs_PointStruct.cu
//
// [EOF]
//
