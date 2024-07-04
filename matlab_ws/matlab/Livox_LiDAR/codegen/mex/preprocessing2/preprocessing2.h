/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * preprocessing2.h
 *
 * Code generation for function 'preprocessing2'
 *
 */

#pragma once

/* Include files */
#include "preprocessing2_types.h"
#include "rtwtypes.h"
#include "covrt.h"
#include "emlrt.h"
#include "mex.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Function Declarations */
void preprocessing2(preprocessing2StackData *SD, const emlrtStack *sp,
                    const real32_T points[172800],
                    const real32_T intensity[57600], const real32_T ROI[6],
                    real32_T GroundMaxDistance,
                    const real32_T GroundReferenceVector[3],
                    real32_T GroundMaxAngularDistance,
                    emxArray_real32_T *Points, emxArray_real32_T *Intensity);

/* End of code generation (preprocessing2.h) */
