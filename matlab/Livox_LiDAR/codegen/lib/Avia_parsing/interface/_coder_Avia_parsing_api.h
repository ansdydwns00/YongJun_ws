/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_Avia_parsing_api.h
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 02-Jun-2024 17:26:03
 */

#ifndef _CODER_AVIA_PARSING_API_H
#define _CODER_AVIA_PARSING_API_H

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
void Avia_parsing(real32_T packet[1362], real32_T reset_flag,
                  emxArray_real32_T *xyzCoords, boolean_T *isValid);

void Avia_parsing_api(const mxArray *const prhs[2], int32_T nlhs,
                      const mxArray *plhs[2]);

void Avia_parsing_atexit(void);

void Avia_parsing_initialize(void);

void Avia_parsing_terminate(void);

void Avia_parsing_xil_shutdown(void);

void Avia_parsing_xil_terminate(void);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for _coder_Avia_parsing_api.h
 *
 * [EOF]
 */
