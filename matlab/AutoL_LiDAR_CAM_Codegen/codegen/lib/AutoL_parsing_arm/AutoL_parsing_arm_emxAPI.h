/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: AutoL_parsing_arm_emxAPI.h
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 28-May-2024 17:15:30
 */

#ifndef AUTOL_PARSING_ARM_EMXAPI_H
#define AUTOL_PARSING_ARM_EMXAPI_H

/* Include Files */
#include "AutoL_parsing_arm_types.h"
#include "rtwtypes.h"
#include <stddef.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
extern emxArray_real32_T *emxCreateND_real32_T(int numDimensions,
                                               const int *size);

extern emxArray_real32_T *
emxCreateWrapperND_real32_T(float *data, int numDimensions, const int *size);

extern emxArray_real32_T *emxCreateWrapper_real32_T(float *data, int rows,
                                                    int cols);

extern emxArray_real32_T *emxCreate_real32_T(int rows, int cols);

extern void emxDestroyArray_real32_T(emxArray_real32_T *emxArray);

extern void emxInitArray_real32_T(emxArray_real32_T **pEmxArray,
                                  int numDimensions);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for AutoL_parsing_arm_emxAPI.h
 *
 * [EOF]
 */
