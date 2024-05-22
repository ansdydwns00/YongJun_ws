//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: createAnchorsPointPillars.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

#ifndef CREATEANCHORSPOINTPILLARS_H
#define CREATEANCHORSPOINTPILLARS_H

// Include Files
#include "rtwtypes.h"
#include "coder_array.h"
#include <cstddef>
#include <cstdlib>

struct cell_wrap_5;

// Function Declarations
namespace coder {
namespace lidar {
namespace internal {
namespace cnn {
void createAnchorsPointPillars(const cell_wrap_5 anchorBoxes[1],
                               array<double, 2U> &anchors3D,
                               array<double, 2U> &anchorsBEV);

}
} // namespace internal
} // namespace lidar
} // namespace coder

#endif
//
// File trailer for createAnchorsPointPillars.h
//
// [EOF]
//
