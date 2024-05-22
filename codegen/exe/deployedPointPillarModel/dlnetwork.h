//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: dlnetwork.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

#ifndef DLNETWORK_H
#define DLNETWORK_H

// Include Files
#include "rtwtypes.h"
#include <cstddef>
#include <cstdlib>

class detector0_0;

// Function Declarations
namespace coder {
namespace internal {
void b_dlnetwork_layerPredictWithColMajority(const float varargin_1[428544],
                                             float varargout_1[6856704]);

void dlnetwork_layerPredictWithColMajority(const float gpu_varargin_1[768000],
                                           const float gpu_varargin_2[24000],
                                           float gpu_varargout_1[13713408]);

void dlnetwork_layerPredictWithColMajority(const float varargin_1[1714176],
                                           float varargout_1[6856704]);

void dlnetwork_setup(detector0_0 *obj);

} // namespace internal
} // namespace coder

#endif
//
// File trailer for dlnetwork.h
//
// [EOF]
//
