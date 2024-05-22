//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: deployedPointPillarModel_rtwutil.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "deployedPointPillarModel_rtwutil.h"
#include "rt_nonfinite.h"
#include <cfloat>
#include <cmath>

// Function Definitions
//
// Arguments    : long long start
//                long long end
//                long long stride
// Return Type  : long long
//
long long computeEndIdx(long long start, long long end, long long stride)
{
  long long newEnd;
  newEnd = -1LL;
  if ((stride > 0LL) && (start <= end)) {
    newEnd = (end - start) / stride;
  } else if ((stride < 0LL) && (end <= start)) {
    newEnd = (start - end) / -stride;
  }
  return newEnd;
}

//
// Arguments    : float u0
//                float u1
// Return Type  : float
//
float rt_remf_snf(float u0, float u1)
{
  float b_y;
  if (std::isnan(u0) || std::isnan(u1) || std::isinf(u0)) {
    b_y = rtNaNF;
  } else if (std::isinf(u1)) {
    b_y = u0;
  } else if ((u1 != 0.0F) && (u1 != std::trunc(u1))) {
    float q;
    q = std::abs(u0 / u1);
    if (!(std::abs(q - std::floor(q + 0.5F)) > FLT_EPSILON * q)) {
      b_y = 0.0F * u0;
    } else {
      b_y = std::fmod(u0, u1);
    }
  } else {
    b_y = std::fmod(u0, u1);
  }
  return b_y;
}

//
// File trailer for deployedPointPillarModel_rtwutil.cu
//
// [EOF]
//
