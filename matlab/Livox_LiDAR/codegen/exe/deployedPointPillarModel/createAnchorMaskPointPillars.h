//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: createAnchorMaskPointPillars.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

#ifndef CREATEANCHORMASKPOINTPILLARS_H
#define CREATEANCHORMASKPOINTPILLARS_H

// Include Files
#include "rtwtypes.h"
#include "coder_array.h"
#include <cstddef>
#include <cstdlib>

// Function Declarations
namespace coder {
namespace lidar {
namespace internal {
namespace cnn {
void createAnchorMaskPointPillars(const float pillarIndices[24000],
                                  const double pcRange[6],
                                  const array<double, 2U> &anchorsBEV,
                                  array<double, 1U> &anchorMask);

}
} // namespace internal
} // namespace lidar
} // namespace coder

#endif
//
// File trailer for createAnchorMaskPointPillars.h
//
// [EOF]
//
