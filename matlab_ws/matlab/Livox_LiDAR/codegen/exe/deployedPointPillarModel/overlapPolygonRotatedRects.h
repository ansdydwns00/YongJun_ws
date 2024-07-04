//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: overlapPolygonRotatedRects.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

#ifndef OVERLAPPOLYGONROTATEDRECTS_H
#define OVERLAPPOLYGONROTATEDRECTS_H

// Include Files
#include "rtwtypes.h"
#include "coder_array.h"
#include <cstddef>
#include <cstdlib>

// Function Declarations
namespace coder {
namespace vision {
namespace internal {
namespace detector {
void overlapPolygonRotatedRects_findOverlapPolyPoints(
    const array<float, 1U> &xIndices1, const array<float, 1U> &yIndices1,
    const array<float, 1U> &xIndices2, const array<float, 1U> &yIndices2,
    array<float, 2U> &overlapedPolyPts);

}
} // namespace internal
} // namespace vision
} // namespace coder
void minus(coder::array<float, 2U> &in1, const coder::array<float, 2U> &in2,
           const coder::array<float, 2U> &in3);

#endif
//
// File trailer for overlapPolygonRotatedRects.h
//
// [EOF]
//
