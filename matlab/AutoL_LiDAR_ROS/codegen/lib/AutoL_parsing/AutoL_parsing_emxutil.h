/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: AutoL_parsing_emxutil.h
 *
 * MATLAB Coder version            : 23.2
 * C/C++ source code generated on  : 10-May-2024 19:22:11
 */

#ifndef AUTOL_PARSING_EMXUTIL_H
#define AUTOL_PARSING_EMXUTIL_H

/* Include Files */
#include "AutoL_parsing_types.h"
#include "rtwtypes.h"
#include <stddef.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
extern void emxEnsureCapacity_real32_T(emxArray_real32_T *emxArray,
                                       int oldNumel);

extern void emxFree_real32_T(emxArray_real32_T **pEmxArray);

extern void emxInit_real32_T(emxArray_real32_T **pEmxArray, int numDimensions);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for AutoL_parsing_emxutil.h
 *
 * [EOF]
 */
