//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// insertionsort.cu
//
// Code generation for function 'insertionsort'
//

// Include files
#include "insertionsort.h"
#include "pointpillardetect_mexutil.h"
#include "pointpillardetect_types.h"
#include "rt_nonfinite.h"
#include <cmath>

// Function Definitions
namespace coder {
namespace internal {
void insertionsort(int32_T x_data[], int32_T xstart, int32_T xend,
                   const cell_wrap_6 cmp_workspace_c_data[])
{
  int64_T b;
  b = computeEndIdx(static_cast<int64_T>(xstart + 1),
                    static_cast<int64_T>(xend), 1L);
  for (int64_T k{0L}; k <= b; k++) {
    int32_T idx;
    int32_T xc;
    boolean_T exitg1;
    xc = x_data[static_cast<int32_T>((xstart + 1) + k) - 1] - 1;
    idx = static_cast<int32_T>((xstart + 1) + k) - 2;
    exitg1 = false;
    while ((!exitg1) && (idx + 1 >= xstart)) {
      int32_T b_k;
      int32_T j;
      int32_T n;
      boolean_T varargout_1;
      j = x_data[idx];
      n = static_cast<int32_T>(
          std::fmin(static_cast<real_T>(cmp_workspace_c_data[xc].f1.size[1]),
                    static_cast<real_T>(
                        cmp_workspace_c_data[x_data[idx] - 1].f1.size[1])));
      varargout_1 = (cmp_workspace_c_data[xc].f1.size[1] <
                     cmp_workspace_c_data[x_data[idx] - 1].f1.size[1]);
      b_k = 0;
      int32_T exitg2;
      do {
        exitg2 = 0;
        if (b_k <= n - 1) {
          if (cmp_workspace_c_data[xc].f1.data[b_k] !=
              cmp_workspace_c_data[x_data[idx] - 1].f1.data[b_k]) {
            varargout_1 = (cmp_workspace_c_data[xc].f1.data[b_k] <
                           cmp_workspace_c_data[x_data[idx] - 1].f1.data[b_k]);
            exitg2 = 1;
          } else {
            b_k++;
          }
        } else {
          if (cmp_workspace_c_data[xc].f1.size[1] ==
              cmp_workspace_c_data[j - 1].f1.size[1]) {
            varargout_1 = (xc + 1 < j);
          }
          exitg2 = 1;
        }
      } while (exitg2 == 0);
      if (varargout_1) {
        x_data[idx + 1] = x_data[idx];
        idx--;
      } else {
        exitg1 = true;
      }
    }
    x_data[idx + 1] = xc + 1;
  }
}

} // namespace internal
} // namespace coder

// End of code generation (insertionsort.cu)
