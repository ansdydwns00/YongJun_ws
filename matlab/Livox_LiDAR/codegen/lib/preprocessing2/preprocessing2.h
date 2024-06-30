/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: preprocessing2.h
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 26-Jun-2024 13:33:54
 */

#ifndef PREPROCESSING2_H
#define PREPROCESSING2_H

/* Include Files */
#include "preprocessing2_types.h"
#include "rtwtypes.h"
#include <stddef.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
extern void preprocessing2(const float points[172800],
                           const float intensity[57600], const float ROI[6],
                           float GroundMaxDistance,
                           const float GroundReferenceVector[3],
                           float GroundMaxAngularDistance,
                           emxArray_real32_T *Points,
                           emxArray_real32_T *Intensity);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for preprocessing2.h
 *
 * [EOF]
 */
