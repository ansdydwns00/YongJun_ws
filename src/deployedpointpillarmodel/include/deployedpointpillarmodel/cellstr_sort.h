//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: cellstr_sort.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

#ifndef CELLSTR_SORT_H
#define CELLSTR_SORT_H

// Include Files
#include "deployedPointPillarModel_internal_types.h"
#include "rtwtypes.h"
#include "coder_array.h"
#include <cstddef>
#include <cstdlib>

// Function Declarations
namespace coder {
namespace matlab {
namespace internal {
namespace coder {
namespace datatypes {
void cellstr_sort(const array<cell_wrap_6, 1U> &c,
                  array<cell_wrap_6, 1U> &sorted, array<int, 1U> &idx);

bool cellstr_sort_anonFcn1(const array<cell_wrap_6, 1U> &c, int i, int j);

} // namespace datatypes
} // namespace coder
} // namespace internal
} // namespace matlab
} // namespace coder

#endif
//
// File trailer for cellstr_sort.h
//
// [EOF]
//
