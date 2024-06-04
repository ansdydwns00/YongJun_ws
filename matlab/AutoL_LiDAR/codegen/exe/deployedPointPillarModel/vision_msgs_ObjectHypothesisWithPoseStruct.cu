//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: vision_msgs_ObjectHypothesisWithPoseStruct.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "vision_msgs_ObjectHypothesisWithPoseStruct.h"
#include "deployedPointPillarModel_types.h"
#include "geometry_msgs_PoseWithCovarianceStruct.h"
#include "rt_nonfinite.h"
#include "vision_msgs_ObjectHypothesisStruct.h"

// Function Definitions
//
// Message struct definition for vision_msgs/ObjectHypothesisWithPose
//
// Arguments    : vision_msgs_ObjectHypothesisWithPoseStruct_T *msg
// Return Type  : void
//
void vision_msgs_ObjectHypothesisWithPoseStruct(
    vision_msgs_ObjectHypothesisWithPoseStruct_T *msg)
{
  static const char b_cv[36]{'v', 'i', 's', 'i', 'o', 'n', '_', 'm', 's',
                             'g', 's', '/', 'O', 'b', 'j', 'e', 'c', 't',
                             'H', 'y', 'p', 'o', 't', 'h', 'e', 's', 'i',
                             's', 'W', 'i', 't', 'h', 'P', 'o', 's', 'e'};
  for (int i{0}; i < 36; i++) {
    msg->MessageType[i] = b_cv[i];
  }
  vision_msgs_ObjectHypothesisStruct(&msg->hypothesis);
  geometry_msgs_PoseWithCovarianceStruct(&msg->pose);
  //(msg);
}

//
// File trailer for vision_msgs_ObjectHypothesisWithPoseStruct.cu
//
// [EOF]
//
