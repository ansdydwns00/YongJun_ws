//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// pointPillarsObjectDetector.h
//
// Code generation for function 'pointPillarsObjectDetector'
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

struct cell_wrap_6;

// Function Declarations
namespace coder {
namespace internal {
void c_returnCategoricalLabels(pointpillarsDetectStackData *SD,
                               int32_T labelNamesMod_codes_size[2],
                               cell_wrap_6 c_labelNamesMod_categoryNames_d[],
                               int32_T c_labelNamesMod_categoryNames_s[1]);

void c_returnCategoricalLabels(pointpillarsDetectStackData *SD,
                               real_T numBBoxes,
                               uint32_T labelNamesMod_codes_data[],
                               int32_T labelNamesMod_codes_size[2],
                               cell_wrap_6 c_labelNamesMod_categoryNames_d[],
                               int32_T c_labelNamesMod_categoryNames_s[1]);

} // namespace internal
} // namespace coder

// End of code generation (pointPillarsObjectDetector.h)
