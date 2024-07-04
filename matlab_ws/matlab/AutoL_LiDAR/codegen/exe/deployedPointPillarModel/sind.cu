//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: sind.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "sind.h"
#include "deployedPointPillarModel_rtwutil.h"
#include "rt_nonfinite.h"
#include "coder_array.h"
#include <cmath>

// Function Definitions
//
// Arguments    : array<float, 1U> &b_x
// Return Type  : void
//
namespace coder {
void b_sind(array<float, 1U> &b_x)
{
  int nx;
  nx = b_x.size(0);
  for (int k{0}; k < nx; k++) {
    float c_x;
    c_x = b_x[k];
    if (std::isinf(c_x) || std::isnan(c_x)) {
      b_x[k] = rtNaNF;
    } else {
      float absx;
      signed char n;
      c_x = rt_remf_snf(c_x, 360.0F);
      absx = std::abs(c_x);
      if (absx > 180.0F) {
        if (c_x > 0.0F) {
          c_x -= 360.0F;
        } else {
          c_x += 360.0F;
        }
        absx = std::abs(c_x);
      }
      if (absx <= 45.0F) {
        c_x *= 0.0174532924F;
        n = 0;
      } else if (absx <= 135.0F) {
        if (c_x > 0.0F) {
          c_x = 0.0174532924F * (c_x - 90.0F);
          n = 1;
        } else {
          c_x = 0.0174532924F * (c_x + 90.0F);
          n = -1;
        }
      } else if (c_x > 0.0F) {
        c_x = 0.0174532924F * (c_x - 180.0F);
        n = 2;
      } else {
        c_x = 0.0174532924F * (c_x + 180.0F);
        n = -2;
      }
      if (n == 0) {
        b_x[k] = std::sin(c_x);
      } else if (n == 1) {
        b_x[k] = std::cos(c_x);
      } else if (n == -1) {
        b_x[k] = -std::cos(c_x);
      } else {
        b_x[k] = -std::sin(c_x);
      }
    }
  }
}

} // namespace coder

//
// File trailer for sind.cu
//
// [EOF]
//
