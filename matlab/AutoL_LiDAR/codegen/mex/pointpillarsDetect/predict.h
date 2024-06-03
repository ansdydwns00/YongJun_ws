//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// predict.h
//
// Code generation for function 'predict'
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
class detector0_0;

// Function Declarations
namespace coder {
namespace internal {
void dlnetwork_predict(detector0_0 *obj, const real32_T varargin_1_Data[24000],
                       const real32_T varargin_2_Data[10800000],
                       real32_T varargout_1_Data[321408],
                       real32_T varargout_2_Data[321408],
                       real32_T varargout_3_Data[107136],
                       real32_T varargout_4_Data[107136],
                       real32_T varargout_5_Data[107136],
                       real32_T varargout_6_Data[107136]);

}
} // namespace coder

// End of code generation (predict.h)
