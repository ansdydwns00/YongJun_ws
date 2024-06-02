//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// _coder_pointpillarsDetect_mex.h
//
// Code generation for function '_coder_pointpillarsDetect_mex'
//

#pragma once

// Include files
#include "pointpillarsDetect_types.h"
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

// Function Declarations
MEXFUNCTION_LINKAGE void mexFunction(int32_T nlhs, mxArray *plhs[],
                                     int32_T nrhs, const mxArray *prhs[]);

emlrtCTX mexFunctionCreateRootTLS();

void unsafe_pointpillarsDetect_mexFunction(pointpillarsDetectStackData *SD,
                                           int32_T nlhs, mxArray *plhs[3],
                                           int32_T nrhs,
                                           const mxArray *prhs[4]);

// End of code generation (_coder_pointpillarsDetect_mex.h)