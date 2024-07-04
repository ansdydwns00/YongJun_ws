/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: Avia_parsing_emxutil.h
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 30-Jun-2024 15:39:37
 */

#ifndef AVIA_PARSING_EMXUTIL_H
#define AVIA_PARSING_EMXUTIL_H

/* Include Files */
#include "Avia_parsing_types.h"
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
 * File trailer for Avia_parsing_emxutil.h
 *
 * [EOF]
 */
