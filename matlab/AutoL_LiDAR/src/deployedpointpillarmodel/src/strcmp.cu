//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: strcmp.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "strcmp.h"
#include "rt_nonfinite.h"
#include "coder_array.h"

// Function Definitions
//
// Arguments    : const array<char, 2U> &a
//                const array<char, 2U> &b
// Return Type  : bool
//
namespace coder {
namespace internal {
bool b_strcmp(const array<char, 2U> &a, const array<char, 2U> &b)
{
  bool b_b;
  bool b_bool;
  b_bool = false;
  b_b = (a.size(1) == 0);
  if (b_b && (b.size(1) == 0)) {
    b_bool = true;
  } else if (a.size(1) == b.size(1)) {
    int kstr;
    kstr = 0;
    int exitg1;
    do {
      exitg1 = 0;
      if (kstr + 1 <= b.size(1)) {
        if (a[kstr] != b[kstr]) {
          exitg1 = 1;
        } else {
          kstr++;
        }
      } else {
        b_bool = true;
        exitg1 = 1;
      }
    } while (exitg1 == 0);
  }
  return b_bool;
}

} // namespace internal
} // namespace coder

//
// File trailer for strcmp.cu
//
// [EOF]
//
