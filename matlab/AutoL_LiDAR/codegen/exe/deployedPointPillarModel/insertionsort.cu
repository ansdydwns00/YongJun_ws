//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: insertionsort.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "insertionsort.h"
#include "cellstr_sort.h"
#include "deployedPointPillarModel_internal_types.h"
#include "deployedPointPillarModel_rtwutil.h"
#include "rt_nonfinite.h"
#include "coder_array.h"

// Function Definitions
//
// Arguments    : array<int, 1U> &b_x
//                int b_xstart
//                int b_xend
//                const array<cell_wrap_6, 1U> &cmp_workspace_c
// Return Type  : void
//
namespace coder {
namespace internal {
void insertionsort(array<int, 1U> &b_x, int b_xstart, int b_xend,
                   const array<cell_wrap_6, 1U> &cmp_workspace_c)
{
  long long b;
  b = computeEndIdx(static_cast<long long>(b_xstart + 1),
                    static_cast<long long>(b_xend), 1LL);
  for (long long k{0LL}; k <= b; k++) {
    int idx;
    int xc;
    xc = b_x[static_cast<int>((b_xstart + 1) + k) - 1];
    idx = static_cast<int>((b_xstart + 1) + k) - 1;
    while ((idx >= b_xstart) &&
           matlab::internal::coder::datatypes::cellstr_sort_anonFcn1(
               cmp_workspace_c, xc, b_x[idx - 1])) {
      b_x[idx] = b_x[idx - 1];
      idx--;
    }
    b_x[idx] = xc;
  }
}

} // namespace internal
} // namespace coder

//
// File trailer for insertionsort.cu
//
// [EOF]
//
