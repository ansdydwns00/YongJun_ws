//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: cellstr_sort.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "cellstr_sort.h"
#include "deployedPointPillarModel_internal_types.h"
#include "introsort.h"
#include "rt_nonfinite.h"
#include "coder_array.h"
#include <cmath>

// Function Definitions
//
// Arguments    : const array<cell_wrap_6, 1U> &c
//                array<cell_wrap_6, 1U> &sorted
//                array<int, 1U> &idx
// Return Type  : void
//
namespace coder {
namespace matlab {
namespace internal {
namespace coder {
namespace datatypes {
void cellstr_sort(const array<cell_wrap_6, 1U> &c,
                  array<cell_wrap_6, 1U> &sorted, array<int, 1U> &idx)
{
  array<int, 2U> b_y;
  int n;
  int yk;
  n = c.size(0);
  b_y.set_size(1, c.size(0));
  if (c.size(0) > 0) {
    b_y[0] = 1;
    yk = 1;
    for (int k{0}; k <= n - 2; k++) {
      yk++;
      b_y[k + 1] = yk;
    }
  }
  idx.set_size(b_y.size(1));
  for (int k{0}; k < b_y.size(1); k++) {
    idx[k] = b_y[k];
  }
  ::coder::internal::introsort(idx, c.size(0), c);
  sorted.set_size(c.size(0));
  n = c.size(0);
  for (int i{0}; i < n; i++) {
    sorted[i].f1.set_size(1, c[idx[i] - 1].f1.size(1));
    yk = c[idx[i] - 1].f1.size(1);
    for (int k{0}; k < yk; k++) {
      sorted[i].f1[k] = c[idx[i] - 1].f1[k];
    }
  }
}

//
// Arguments    : const array<cell_wrap_6, 1U> &c
//                int i
//                int j
// Return Type  : bool
//
bool cellstr_sort_anonFcn1(const array<cell_wrap_6, 1U> &c, int i, int j)
{
  int k;
  int n;
  bool varargout_1;
  n = static_cast<int>(std::fmin(static_cast<double>(c[i - 1].f1.size(1)),
                                 static_cast<double>(c[j - 1].f1.size(1))));
  varargout_1 = (c[i - 1].f1.size(1) < c[j - 1].f1.size(1));
  k = 0;
  int exitg1;
  do {
    exitg1 = 0;
    if (k <= n - 1) {
      if (c[i - 1].f1[k] != c[j - 1].f1[k]) {
        varargout_1 = (c[i - 1].f1[k] < c[j - 1].f1[k]);
        exitg1 = 1;
      } else {
        k++;
      }
    } else {
      if (c[i - 1].f1.size(1) == c[j - 1].f1.size(1)) {
        varargout_1 = (i < j);
      }
      exitg1 = 1;
    }
  } while (exitg1 == 0);
  return varargout_1;
}

} // namespace datatypes
} // namespace coder
} // namespace internal
} // namespace matlab
} // namespace coder

//
// File trailer for cellstr_sort.cu
//
// [EOF]
//
