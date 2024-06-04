//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: cellstr_strtrim.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "cellstr_strtrim.h"
#include "deployedPointPillarModel_data.h"
#include "deployedPointPillarModel_internal_types.h"
#include "rt_nonfinite.h"
#include "coder_array.h"

// Function Definitions
//
// Arguments    : const array<cell_wrap_9, 2U> &c
//                array<cell_wrap_6, 2U> &trimmed
// Return Type  : void
//
namespace coder {
namespace matlab {
namespace internal {
namespace coder {
namespace datatypes {
void cellstr_strtrim(const array<cell_wrap_9, 2U> &c,
                     array<cell_wrap_6, 2U> &trimmed)
{
  int i;
  trimmed.set_size(1, c.size(1));
  i = c.size(1);
  for (int b_i{0}; b_i < i; b_i++) {
    int b_j1;
    int j2;
    b_j1 = 0;
    while ((b_j1 + 1 <= 10) &&
           bv[static_cast<unsigned char>(c[b_i].f1[b_j1]) & 127] &&
           (c[b_i].f1[b_j1] != '\x00')) {
      b_j1++;
    }
    j2 = 9;
    while ((j2 + 1 > 0) &&
           bv[static_cast<unsigned char>(c[b_i].f1[j2]) & 127] &&
           (c[b_i].f1[j2] != '\x00')) {
      j2--;
    }
    if (b_j1 + 1 > j2 + 1) {
      b_j1 = 0;
      j2 = -1;
    }
    trimmed[trimmed.size(0) * b_i].f1.set_size(1, (j2 - b_j1) + 1);
    j2 -= b_j1;
    for (int c_i{0}; c_i <= j2; c_i++) {
      trimmed[b_i].f1[c_i] = c[b_i].f1[b_j1 + c_i];
    }
  }
}

} // namespace datatypes
} // namespace coder
} // namespace internal
} // namespace matlab
} // namespace coder

//
// File trailer for cellstr_strtrim.cu
//
// [EOF]
//
