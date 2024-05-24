//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// dlnetwork.h
//
// Code generation for function 'dlnetwork'
//

#pragma once

// Include files
#include "rtwtypes.h"
#include "emlrt.h"
#include "mex.h"
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>

// Custom Header Code

#ifdef __CUDA_ARCH__
#undef printf
#endif

// Type Declarations
class pretrained0_0;

// Function Declarations
namespace coder {
namespace internal {
void dlnetwork_delete(pretrained0_0 *obj);

void dlnetwork_setup(pretrained0_0 *obj);

void l_dlnetwork_layerPredictWithCol(const real32_T gpu_varargin_1[768000],
                                     const real32_T gpu_varargin_2[24000],
                                     real32_T gpu_varargout_1[13713408]);

void l_dlnetwork_layerPredictWithCol(const real32_T varargin_1[1714176],
                                     real32_T varargout_1[6856704]);

void m_dlnetwork_layerPredictWithCol(const real32_T varargin_1[428544],
                                     real32_T varargout_1[6856704]);

} // namespace internal
} // namespace coder

// End of code generation (dlnetwork.h)
