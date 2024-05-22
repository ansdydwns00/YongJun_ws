//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: find.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "find.h"
#include "rt_nonfinite.h"
#include "coder_array.h"

// Function Definitions
//
// Arguments    : const array<bool, 1U> &b_x
//                array<int, 1U> &i
// Return Type  : void
//
namespace coder {
void eml_find(const array<bool, 1U> &b_x, array<int, 1U> &i)
{
  int idx;
  int ii;
  int nx;
  bool exitg1;
  nx = b_x.size(0);
  idx = 0;
  i.set_size(b_x.size(0));
  ii = 1;
  exitg1 = false;
  while ((!exitg1) && (ii <= nx)) {
    if (b_x[ii - 1]) {
      idx++;
      i[idx - 1] = ii;
      if (idx >= nx) {
        exitg1 = true;
      } else {
        ii++;
      }
    } else {
      ii++;
    }
  }
  if (b_x.size(0) == 1) {
    if (idx == 0) {
      i.set_size(0);
    }
  } else {
    if (idx < 1) {
      idx = 0;
    }
    i.set_size(idx);
  }
}

} // namespace coder

//
// File trailer for find.cu
//
// [EOF]
//
