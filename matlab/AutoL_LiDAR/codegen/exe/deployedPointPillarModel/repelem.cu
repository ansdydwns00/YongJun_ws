//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: repelem.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "repelem.h"
#include "rt_nonfinite.h"
#include "coder_array.h"

// Function Definitions
//
// Arguments    : const double b_x[107136]
//                double varargin_1
//                array<double, 2U> &b_y
// Return Type  : void
//
namespace coder {
void repelem(const double b_x[107136], double varargin_1,
             array<double, 2U> &b_y)
{
  b_y.set_size(53568 * static_cast<int>(varargin_1), 2);
  if (53568 * static_cast<int>(varargin_1) != 0) {
    int rowreps;
    rowreps = static_cast<int>(varargin_1);
    for (int j{0}; j < 2; j++) {
      int rowIdx;
      rowIdx = -1;
      for (int i{0}; i < 53568; i++) {
        for (int k{0}; k < rowreps; k++) {
          b_y[((rowIdx + k) + b_y.size(0) * j) + 1] = b_x[i + 53568 * j];
        }
        if (static_cast<int>(varargin_1) - 1 >= 0) {
          rowIdx += static_cast<int>(varargin_1);
        }
      }
    }
  }
}

} // namespace coder

//
// File trailer for repelem.cu
//
// [EOF]
//
