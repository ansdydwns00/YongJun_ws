//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// pointpillardetect_data.h
//
// Code generation for function 'pointpillardetect_data'
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

// Variable Declarations
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;
extern real_T (*global_gpu_dv3)[248];
extern real_T (*global_gpu_xq)[216];
extern real_T (*b_global_gpu_xq)[248];
extern real_T (*c_global_gpu_xq)[216];
extern real_T (*d_global_gpu_xq)[248];

// End of code generation (pointpillardetect_data.h)
