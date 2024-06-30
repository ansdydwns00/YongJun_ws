/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * pcfitplane.h
 *
 * Code generation for function 'pcfitplane'
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
void evalPlane(const emlrtStack *sp, const real32_T model_data[],
               const int32_T model_size[2], const emxArray_real32_T *points,
               emxArray_real32_T *dis);

void pcfitplane(const emlrtStack *sp, pointCloud *varargin_1,
                real32_T varargin_2, const real32_T varargin_3[3],
                real32_T varargin_4, emxArray_real_T *inlierIndices,
                emxArray_real_T *outlierIndices);

/* End of code generation (pcfitplane.h) */
