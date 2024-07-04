//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: heapsort.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "heapsort.h"
#include "cellstr_sort.h"
#include "deployedPointPillarModel_internal_types.h"
#include "rt_nonfinite.h"
#include "coder_array.h"

// Function Declarations
namespace coder {
namespace internal {
static void heapify(array<int, 1U> &b_x, int idx, int b_xstart, int b_xend,
                    const array<cell_wrap_6, 1U> &cmp_workspace_c);

}
} // namespace coder

// Function Definitions
//
// Arguments    : array<int, 1U> &b_x
//                int idx
//                int b_xstart
//                int b_xend
//                const array<cell_wrap_6, 1U> &cmp_workspace_c
// Return Type  : void
//
namespace coder {
namespace internal {
static void heapify(array<int, 1U> &b_x, int idx, int b_xstart, int b_xend,
                    const array<cell_wrap_6, 1U> &cmp_workspace_c)
{
  int extremum;
  int extremumIdx;
  int leftIdx;
  bool changed;
  bool exitg1;
  changed = true;
  extremumIdx = (idx + b_xstart) - 2;
  leftIdx = ((idx << 1) + b_xstart) - 1;
  exitg1 = false;
  while ((!exitg1) && (leftIdx < b_xend)) {
    int cmpIdx;
    int xcmp;
    changed = false;
    extremum = b_x[extremumIdx];
    cmpIdx = leftIdx - 1;
    xcmp = b_x[leftIdx - 1];
    if (matlab::internal::coder::datatypes::cellstr_sort_anonFcn1(
            cmp_workspace_c, b_x[leftIdx - 1], b_x[leftIdx])) {
      cmpIdx = leftIdx;
      xcmp = b_x[leftIdx];
    }
    if (matlab::internal::coder::datatypes::cellstr_sort_anonFcn1(
            cmp_workspace_c, b_x[extremumIdx], xcmp)) {
      b_x[extremumIdx] = xcmp;
      b_x[cmpIdx] = extremum;
      extremumIdx = cmpIdx;
      leftIdx = ((((cmpIdx - b_xstart) + 2) << 1) + b_xstart) - 1;
      changed = true;
    } else {
      exitg1 = true;
    }
  }
  if (changed && (leftIdx <= b_xend)) {
    extremum = b_x[extremumIdx];
    if (matlab::internal::coder::datatypes::cellstr_sort_anonFcn1(
            cmp_workspace_c, b_x[extremumIdx], b_x[leftIdx - 1])) {
      b_x[extremumIdx] = b_x[leftIdx - 1];
      b_x[leftIdx - 1] = extremum;
    }
  }
}

//
// Arguments    : array<int, 1U> &b_x
//                int b_xstart
//                int b_xend
//                const array<cell_wrap_6, 1U> &cmp_workspace_c
// Return Type  : void
//
void b_heapsort(array<int, 1U> &b_x, int b_xstart, int b_xend,
                const array<cell_wrap_6, 1U> &cmp_workspace_c)
{
  int n;
  int t;
  n = b_xend - b_xstart;
  for (t = 0; t <= n; t++) {
    heapify(b_x, (n - t) + 1, b_xstart, b_xend, cmp_workspace_c);
  }
  for (int k{0}; k < n; k++) {
    t = b_x[(b_xend - k) - 1];
    b_x[(b_xend - k) - 1] = b_x[b_xstart - 1];
    b_x[b_xstart - 1] = t;
    heapify(b_x, 1, b_xstart, (b_xend - k) - 1, cmp_workspace_c);
  }
}

} // namespace internal
} // namespace coder

//
// File trailer for heapsort.cu
//
// [EOF]
//
