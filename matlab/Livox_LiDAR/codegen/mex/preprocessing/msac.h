/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * msac.h
 *
 * Code generation for function 'msac'
 *
 */

#pragma once

/* Include files */
#include "preprocessing_types.h"
#include "rtwtypes.h"
#include "covrt.h"
#include "emlrt.h"
#include "mex.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Function Declarations */
boolean_T msac(const emlrtStack *sp, const emxArray_real32_T *allPoints,
               real32_T params_maxDistance, const real_T varargin_1_data[],
               real_T varargin_2, real32_T bestModelParams_data[],
               int32_T bestModelParams_size[2]);

/* End of code generation (msac.h) */
