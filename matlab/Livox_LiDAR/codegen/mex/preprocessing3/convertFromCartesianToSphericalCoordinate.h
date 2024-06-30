/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * convertFromCartesianToSphericalCoordinate.h
 *
 * Code generation for function 'convertFromCartesianToSphericalCoordinate'
 *
 */

#pragma once

/* Include files */
#include "preprocessing3_types.h"
#include "rtwtypes.h"
#include "covrt.h"
#include "emlrt.h"
#include "mex.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Function Declarations */
void c_convertFromCartesianToSpheric(preprocessing3StackData *SD,
                                     const emlrtStack *sp,
                                     const real32_T xyzData[172800],
                                     real32_T rangeData[172800]);

/* End of code generation (convertFromCartesianToSphericalCoordinate.h) */
