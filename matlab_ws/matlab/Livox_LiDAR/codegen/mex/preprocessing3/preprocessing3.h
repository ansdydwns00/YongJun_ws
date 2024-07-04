/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * preprocessing3.h
 *
 * Code generation for function 'preprocessing3'
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
void preprocessing3(preprocessing3StackData *SD, const emlrtStack *sp,
                    const real32_T points[172800],
                    const real32_T intensity[57600], emxArray_real32_T *Points,
                    emxArray_real32_T *Intensity);

/* End of code generation (preprocessing3.h) */
