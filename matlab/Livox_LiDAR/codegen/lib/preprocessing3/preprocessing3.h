/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: preprocessing3.h
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 26-Jun-2024 14:35:29
 */

#ifndef PREPROCESSING3_H
#define PREPROCESSING3_H

/* Include Files */
#include "preprocessing3_types.h"
#include "rtwtypes.h"
#include <stddef.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
extern void preprocessing3(const float points[172800],
                           const float intensity[57600],
                           emxArray_real32_T *Points,
                           emxArray_real32_T *Intensity);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for preprocessing3.h
 *
 * [EOF]
 */
