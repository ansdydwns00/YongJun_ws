/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: AutoL_parsing_arm_emxutil.h
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 28-May-2024 17:15:30
 */

#ifndef AUTOL_PARSING_ARM_EMXUTIL_H
#define AUTOL_PARSING_ARM_EMXUTIL_H

/* Include Files */
#include "AutoL_parsing_arm_types.h"
#include "rtwtypes.h"
#include <stddef.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
extern void emxEnsureCapacity_real32_T(emxArray_real32_T *emxArray,
                                       int oldNumel);

extern void emxEnsureCapacity_uint16_T(emxArray_uint16_T *emxArray,
                                       int oldNumel);

extern void emxFree_real32_T(emxArray_real32_T **pEmxArray);

extern void emxFree_uint16_T(emxArray_uint16_T **pEmxArray);

extern void emxInit_real32_T(emxArray_real32_T **pEmxArray, int numDimensions);

extern void emxInit_uint16_T(emxArray_uint16_T **pEmxArray);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for AutoL_parsing_arm_emxutil.h
 *
 * [EOF]
 */
