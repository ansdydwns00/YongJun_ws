//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: Resize2DLayer.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

#ifndef RESIZE2DLAYER_H
#define RESIZE2DLAYER_H

// Include Files
#include "rtwtypes.h"
#include <cstddef>
#include <cstdlib>

// Function Declarations
namespace coder {
namespace nnet {
namespace internal {
namespace cnn {
namespace coder {
void b_interp1CustomImpl(const double b_x[62], const float v[1714176],
                         const double xq[248], float out[6856704]);

void b_interpAlongSpatialDim(const float inTmp[428544], float out[1714176]);

void interp1CustomImpl(const double b_x[124], const float v[3428352],
                       const double xq[248], float out[6856704]);

void interpAlongSpatialDim(const float inTmp[1714176], float out[3428352]);

} // namespace coder
} // namespace cnn
} // namespace internal
} // namespace nnet
} // namespace coder

#endif
//
// File trailer for Resize2DLayer.h
//
// [EOF]
//
