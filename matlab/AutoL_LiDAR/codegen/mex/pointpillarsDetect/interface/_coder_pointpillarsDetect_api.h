//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// _coder_pointpillarsDetect_api.h
//
// Code generation for function '_coder_pointpillarsDetect_api'
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
struct pointpillarsDetectStackData;

// Function Declarations
void b_pointpillarsDetect_api(pointpillarsDetectStackData *SD,
                              const mxArray *const prhs[4], int32_T nlhs,
                              const mxArray *plhs[3]);

// End of code generation (_coder_pointpillarsDetect_api.h)
