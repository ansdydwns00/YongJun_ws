//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: cat.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "cat.h"
#include "rt_nonfinite.h"
#include "coder_array.h"

// Function Definitions
//
// Arguments    : const array<double, 2U> &varargin_1
//                const array<double, 2U> &varargin_2
//                array<double, 2U> &b_y
// Return Type  : void
//
namespace coder {
void cat(const array<double, 2U> &varargin_1,
         const array<double, 2U> &varargin_2, array<double, 2U> &b_y)
{
  int i1;
  int iy;
  b_y.set_size(varargin_1.size(0), 4);
  iy = varargin_1.size(0) << 1;
  for (int j{0}; j < iy; j++) {
    b_y[j] = varargin_1[j];
  }
  if (iy - 1 < 0) {
    iy = -1;
  } else {
    iy--;
  }
  i1 = varargin_2.size(0) << 1;
  for (int j{0}; j < i1; j++) {
    b_y[(iy + j) + 1] = varargin_2[j];
  }
}

} // namespace coder

//
// File trailer for cat.cu
//
// [EOF]
//
