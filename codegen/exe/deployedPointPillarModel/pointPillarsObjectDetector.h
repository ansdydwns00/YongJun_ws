//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: pointPillarsObjectDetector.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

#ifndef POINTPILLARSOBJECTDETECTOR_H
#define POINTPILLARSOBJECTDETECTOR_H

// Include Files
#include "deployedPointPillarModel_internal_types.h"
#include "rtwtypes.h"
#include "coder_array.h"
#include <cstddef>
#include <cstdlib>

// Function Declarations
namespace coder {
namespace internal {
void pointPillarsObjectDetector_detect(
    detector0_0 *this_Network, const pointCloud *ptCloud,
    array<double, 2U> &bboxes, array<float, 1U> &scores,
    array<unsigned int, 2U> &varargout_1_codes,
    array<cell_wrap_6, 1U> &varargout_1_categoryNames);

}
} // namespace coder

#endif
//
// File trailer for pointPillarsObjectDetector.h
//
// [EOF]
//
