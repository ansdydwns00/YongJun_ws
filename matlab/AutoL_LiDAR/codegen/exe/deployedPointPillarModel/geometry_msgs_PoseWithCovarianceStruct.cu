//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: geometry_msgs_PoseWithCovarianceStruct.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "geometry_msgs_PoseWithCovarianceStruct.h"
#include "deployedPointPillarModel_types.h"
#include "geometry_msgs_PoseStruct.h"
#include "rt_nonfinite.h"
#include <cstring>

// Function Definitions
//
// Message struct definition for geometry_msgs/PoseWithCovariance
//
// Arguments    : geometry_msgs_PoseWithCovarianceStruct_T *msg
// Return Type  : void
//
void geometry_msgs_PoseWithCovarianceStruct(
    geometry_msgs_PoseWithCovarianceStruct_T *msg)
{
  static const char b_cv[32]{'g', 'e', 'o', 'm', 'e', 't', 'r', 'y',
                             '_', 'm', 's', 'g', 's', '/', 'P', 'o',
                             's', 'e', 'W', 'i', 't', 'h', 'C', 'o',
                             'v', 'a', 'r', 'i', 'a', 'n', 'c', 'e'};
  for (int i{0}; i < 32; i++) {
    msg->MessageType[i] = b_cv[i];
  }
  geometry_msgs_PoseStruct(&msg->pose);
  std::memset(&msg->covariance[0], 0, 36U * sizeof(double));
  //(msg);
}

//
// File trailer for geometry_msgs_PoseWithCovarianceStruct.cu
//
// [EOF]
//
