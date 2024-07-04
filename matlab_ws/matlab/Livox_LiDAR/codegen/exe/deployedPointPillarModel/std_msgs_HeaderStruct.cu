//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: std_msgs_HeaderStruct.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "std_msgs_HeaderStruct.h"
#include "builtin_interfaces_TimeStruct.h"
#include "deployedPointPillarModel_types.h"
#include "rt_nonfinite.h"
#include "coder_array.h"

// Function Definitions
//
// Message struct definition for std_msgs/Header
//
// Arguments    : std_msgs_HeaderStruct_T *msg
// Return Type  : void
//
void std_msgs_HeaderStruct(std_msgs_HeaderStruct_T *msg)
{
  static const char b_cv[15]{'s', 't', 'd', '_', 'm', 's', 'g', 's',
                             '/', 'H', 'e', 'a', 'd', 'e', 'r'};
  for (int i{0}; i < 15; i++) {
    msg->MessageType[i] = b_cv[i];
  }
  msg->stamp = builtin_interfaces_TimeStruct();
  msg->frame_id.set_size(1, 0);
  //(msg);
}

//
// File trailer for std_msgs_HeaderStruct.cu
//
// [EOF]
//
