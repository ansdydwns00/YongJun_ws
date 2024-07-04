//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: vision_msgs_ObjectHypothesisStruct.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "vision_msgs_ObjectHypothesisStruct.h"
#include "deployedPointPillarModel_types.h"
#include "rt_nonfinite.h"
#include "coder_array.h"

// Function Definitions
//
// Message struct definition for vision_msgs/ObjectHypothesis
//
// Arguments    : vision_msgs_ObjectHypothesisStruct_T *msg
// Return Type  : void
//
void vision_msgs_ObjectHypothesisStruct(
    vision_msgs_ObjectHypothesisStruct_T *msg)
{
  static const char b_cv[28]{'v', 'i', 's', 'i', 'o', 'n', '_', 'm', 's', 'g',
                             's', '/', 'O', 'b', 'j', 'e', 'c', 't', 'H', 'y',
                             'p', 'o', 't', 'h', 'e', 's', 'i', 's'};
  for (int i{0}; i < 28; i++) {
    msg->MessageType[i] = b_cv[i];
  }
  msg->class_id.set_size(1, 0);
  msg->score = 0.0;
  //(msg);
}

//
// File trailer for vision_msgs_ObjectHypothesisStruct.cu
//
// [EOF]
//
