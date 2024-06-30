/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: pcfitplane.h
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 26-Jun-2024 13:22:25
 */

#ifndef PCFITPLANE_H
#define PCFITPLANE_H

/* Include Files */
#include "preprocessing_types.h"
#include "rtwtypes.h"
#include <stddef.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
void evalPlane(const float model_data[], const emxArray_real32_T *points,
               emxArray_real32_T *dis);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for pcfitplane.h
 *
 * [EOF]
 */
