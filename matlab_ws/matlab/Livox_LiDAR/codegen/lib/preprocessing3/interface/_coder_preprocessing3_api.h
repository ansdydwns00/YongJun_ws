/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_preprocessing3_api.h
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 26-Jun-2024 14:35:29
 */

#ifndef _CODER_PREPROCESSING3_API_H
#define _CODER_PREPROCESSING3_API_H

/* Include Files */
#include "emlrt.h"
#include "mex.h"
#include "tmwtypes.h"
#include <string.h>

/* Type Definitions */
#ifndef struct_emxArray_real32_T
#define struct_emxArray_real32_T
struct emxArray_real32_T {
  real32_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};
#endif /* struct_emxArray_real32_T */
#ifndef typedef_emxArray_real32_T
#define typedef_emxArray_real32_T
typedef struct emxArray_real32_T emxArray_real32_T;
#endif /* typedef_emxArray_real32_T */

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
void preprocessing3(real32_T points[172800], real32_T intensity[57600],
                    emxArray_real32_T *Points, emxArray_real32_T *Intensity);

void preprocessing3_api(const mxArray *const prhs[2], int32_T nlhs,
                        const mxArray *plhs[2]);

void preprocessing3_atexit(void);

void preprocessing3_initialize(void);

void preprocessing3_terminate(void);

void preprocessing3_xil_shutdown(void);

void preprocessing3_xil_terminate(void);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for _coder_preprocessing3_api.h
 *
 * [EOF]
 */
