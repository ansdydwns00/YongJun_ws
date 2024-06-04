//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: sortIdx.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

#ifndef SORTIDX_H
#define SORTIDX_H

// Include Files
#include "rtwtypes.h"
#include "coder_array.h"
#include <cstddef>
#include <cstdlib>

// Function Declarations
namespace coder {
namespace internal {
void merge_block(array<int, 2U> &idx, array<float, 2U> &b_x, int b_offset,
                 int n, int preSortLevel, array<int, 1U> &iwork,
                 array<float, 1U> &xwork);

}
} // namespace coder

#endif
//
// File trailer for sortIdx.h
//
// [EOF]
//
