//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: minOrMax.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "minOrMax.h"
#include "rt_nonfinite.h"
#include "coder_array.h"
#include <cmath>

// Function Definitions
//
// Arguments    : const array<float, 1U> &b_x
// Return Type  : float
//
namespace coder {
namespace internal {
float maximum(const array<float, 1U> &b_x)
{
  float ex;
  int vlen;
  vlen = b_x.size(0);
  ex = b_x[0];
  for (int i{0}; i <= vlen - 2; i++) {
    bool p;
    if (std::isnan(b_x[i + 1])) {
      p = false;
    } else if (std::isnan(ex)) {
      p = true;
    } else {
      p = (ex < b_x[i + 1]);
    }
    if (p) {
      ex = b_x[i + 1];
    }
  }
  return ex;
}

//
// Arguments    : const array<float, 1U> &b_x
// Return Type  : float
//
float minimum(const array<float, 1U> &b_x)
{
  float ex;
  int vlen;
  vlen = b_x.size(0);
  ex = b_x[0];
  for (int i{0}; i <= vlen - 2; i++) {
    bool p;
    if (std::isnan(b_x[i + 1])) {
      p = false;
    } else if (std::isnan(ex)) {
      p = true;
    } else {
      p = (ex > b_x[i + 1]);
    }
    if (p) {
      ex = b_x[i + 1];
    }
  }
  return ex;
}

} // namespace internal
} // namespace coder

//
// File trailer for minOrMax.cu
//
// [EOF]
//
