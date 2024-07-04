//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: inpolygon.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

#ifndef INPOLYGON_H
#define INPOLYGON_H

// Include Files
#include "rtwtypes.h"
#include "coder_array.h"
#include <cstddef>
#include <cstdlib>

// Function Declarations
namespace coder {
namespace images {
namespace internal {
namespace coder {
void inpolygon(const array<float, 1U> &points_x,
               const array<float, 1U> &points_y,
               const array<float, 1U> &polygon_x,
               const array<float, 1U> &polygon_y, array<bool, 2U> &in);

}
} // namespace internal
} // namespace images
} // namespace coder

#endif
//
// File trailer for inpolygon.h
//
// [EOF]
//
