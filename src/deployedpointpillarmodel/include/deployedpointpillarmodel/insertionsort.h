//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: insertionsort.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

#ifndef INSERTIONSORT_H
#define INSERTIONSORT_H

// Include Files
#include "deployedPointPillarModel_internal_types.h"
#include "rtwtypes.h"
#include "coder_array.h"
#include <cstddef>
#include <cstdlib>

// Function Declarations
namespace coder {
namespace internal {
void insertionsort(array<int, 1U> &b_x, int b_xstart, int b_xend,
                   const array<cell_wrap_6, 1U> &cmp_workspace_c);

}
} // namespace coder

#endif
//
// File trailer for insertionsort.h
//
// [EOF]
//
