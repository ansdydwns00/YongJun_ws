//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: geometry_msgs_QuaternionStruct.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "geometry_msgs_QuaternionStruct.h"
#include "deployedPointPillarModel_types.h"
#include "rt_nonfinite.h"

// Function Definitions
//
// Message struct definition for geometry_msgs/Quaternion
//
// Arguments    : void
// Return Type  : geometry_msgs_QuaternionStruct_T
//
geometry_msgs_QuaternionStruct_T geometry_msgs_QuaternionStruct()
{
  static const geometry_msgs_QuaternionStruct_T b_msg{
      {'g', 'e', 'o', 'm', 'e', 't', 'r', 'y', '_', 'm', 's', 'g', 's',
       '/', 'Q', 'u', 'a', 't', 'e', 'r', 'n', 'i', 'o', 'n'}, // MessageType
      0.0,                                                     // x
      0.0,                                                     // y
      0.0,                                                     // z
      0.0                                                      // w
  };
  geometry_msgs_QuaternionStruct_T msg;
  msg = b_msg;
  //(&b_msg);
  return msg;
}

//
// File trailer for geometry_msgs_QuaternionStruct.cu
//
// [EOF]
//
