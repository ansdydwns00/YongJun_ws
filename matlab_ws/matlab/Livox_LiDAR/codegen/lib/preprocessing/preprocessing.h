/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: preprocessing.h
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 26-Jun-2024 13:22:25
 */

#ifndef PREPROCESSING_H
#define PREPROCESSING_H

/* Include Files */
#include "preprocessing_types.h"
#include "rtwtypes.h"
#include <stddef.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
extern void preprocessing(const float points[172800],
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
 * File trailer for preprocessing.h
 *
 * [EOF]
 */
