//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// selectStrongestBboxMulticlass.h
//
// Code generation for function 'selectStrongestBboxMulticlass'
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
struct pointpillardetectStackData;

// Function Declarations
namespace coder {
void b_selectStrongestBboxCodegen(pointpillardetectStackData *SD,
                                  const real32_T bbox_data[],
                                  const int32_T bbox_size[2],
                                  const real32_T label_data[],
                                  boolean_T selectedIndex_data[],
                                  int32_T selectedIndex_size[1]);

}

// End of code generation (selectStrongestBboxMulticlass.h)
