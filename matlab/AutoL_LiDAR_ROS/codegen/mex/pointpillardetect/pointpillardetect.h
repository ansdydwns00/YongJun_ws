//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// pointpillardetect.h
//
// Code generation for function 'pointpillardetect'
//

#pragma once

// Include files
#include "pointpillardetect_types.h"
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
void pointpillardetect(pointpillardetectStackData *SD,
                       const emxArray_real32_T *dataLoc,
                       const emxArray_real32_T *dataInt, real_T threshold,
                       real_T cpu_bboxes_data[], int32_T bboxes_size[2],
                       real32_T cpu_scores_data[], int32_T scores_size[1],
                       coder::categorical *labels);

void pointpillardetect_delete();

void pointpillardetect_emx_free();

void pointpillardetect_emx_init();

void pointpillardetect_init();

void pointpillardetect_new();

// End of code generation (pointpillardetect.h)
