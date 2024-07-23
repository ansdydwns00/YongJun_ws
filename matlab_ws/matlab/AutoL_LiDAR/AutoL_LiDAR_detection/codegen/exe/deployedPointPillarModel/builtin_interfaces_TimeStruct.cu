//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: builtin_interfaces_TimeStruct.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "builtin_interfaces_TimeStruct.h"
#include "deployedPointPillarModel_types.h"
#include "rt_nonfinite.h"

// Function Definitions
//
// Message struct definition for builtin_interfaces/Time
//
// Arguments    : void
// Return Type  : builtin_interfaces_TimeStruct_T
//
builtin_interfaces_TimeStruct_T builtin_interfaces_TimeStruct()
{
  static const builtin_interfaces_TimeStruct_T b_msg{
      {'b', 'u', 'i', 'l', 't', 'i', 'n', '_', 'i', 'n', 't', 'e',
       'r', 'f', 'a', 'c', 'e', 's', '/', 'T', 'i', 'm', 'e'}, // MessageType
      0,                                                       // sec
      0U                                                       // nanosec
  };
  builtin_interfaces_TimeStruct_T msg;
  msg = b_msg;
  //(&b_msg);
  return msg;
}

//
// File trailer for builtin_interfaces_TimeStruct.cu
//
// [EOF]
//
