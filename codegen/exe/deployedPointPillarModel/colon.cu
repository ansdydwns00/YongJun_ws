//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: colon.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "colon.h"
#include "rt_nonfinite.h"
#include "coder_array.h"

// Function Definitions
//
// Arguments    : int a
//                int b
//                array<int, 2U> &b_y
// Return Type  : void
//
namespace coder {
void eml_integer_colon_dispatcher(int a, int b, array<int, 2U> &b_y)
{
  int n;
  if (b < a) {
    n = 0;
  } else {
    if ((a < 0) && (b >= 0)) {
      n = b - a;
    } else {
      n = b - a;
    }
    n++;
  }
  b_y.set_size(1, n);
  if (n > 0) {
    int yk;
    b_y[0] = a;
    yk = a;
    for (int k{0}; k <= n - 2; k++) {
      yk++;
      b_y[k + 1] = yk;
    }
  }
}

} // namespace coder

//
// File trailer for colon.cu
//
// [EOF]
//
