/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: G32_parsing_emxutil.h
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 29-Jul-2024 11:53:30
 */

#ifndef G32_PARSING_EMXUTIL_H
#define G32_PARSING_EMXUTIL_H

/* Include Files */
#include "G32_parsing_types.h"
#include "rtwtypes.h"
#include <stddef.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
extern void emxEnsureCapacity_int16_T(emxArray_int16_T *emxArray, int oldNumel);

extern void emxEnsureCapacity_real32_T(emxArray_real32_T *emxArray,
                                       int oldNumel);

extern void emxFree_int16_T(emxArray_int16_T **pEmxArray);

extern void emxFree_real32_T(emxArray_real32_T **pEmxArray);

extern void emxInit_int16_T(emxArray_int16_T **pEmxArray);

extern void emxInit_real32_T(emxArray_real32_T **pEmxArray, int numDimensions);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for G32_parsing_emxutil.h
 *
 * [EOF]
 */
