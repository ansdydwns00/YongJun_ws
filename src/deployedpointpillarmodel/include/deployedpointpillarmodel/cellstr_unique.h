//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: cellstr_unique.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

#ifndef CELLSTR_UNIQUE_H
#define CELLSTR_UNIQUE_H

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
void cellstr_unique(const array<cell_wrap_6, 1U> &a, array<cell_wrap_6, 1U> &u);

void cellstr_unique(const array<cell_wrap_6, 1U> &a, array<cell_wrap_6, 1U> &u,
                    array<double, 1U> &ia);

} // namespace datatypes
} // namespace coder
} // namespace internal
} // namespace matlab
} // namespace coder

#endif
//
// File trailer for cellstr_unique.h
//
// [EOF]
//
