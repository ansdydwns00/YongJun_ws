//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: geometry_msgs_Vector3Struct.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "geometry_msgs_Vector3Struct.h"
#include "deployedPointPillarModel_types.h"
#include "rt_nonfinite.h"

// Function Definitions
//
// Message struct definition for geometry_msgs/Vector3
//
// Arguments    : void
// Return Type  : geometry_msgs_Vector3Struct_T
//
geometry_msgs_Vector3Struct_T geometry_msgs_Vector3Struct()
{
  static const geometry_msgs_Vector3Struct_T b_msg{
      {'g', 'e', 'o', 'm', 'e', 't', 'r', 'y', '_', 'm', 's',
       'g', 's', '/', 'V', 'e', 'c', 't', 'o', 'r', '3'}, // MessageType
      0.0,                                                // x
      0.0,                                                // y
      0.0                                                 // z
  };
  geometry_msgs_Vector3Struct_T msg;
  msg = b_msg;
  //(&b_msg);
  return msg;
}

//
// File trailer for geometry_msgs_Vector3Struct.cu
//
// [EOF]
//
