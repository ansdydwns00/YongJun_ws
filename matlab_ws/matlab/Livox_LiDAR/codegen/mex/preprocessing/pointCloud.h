/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * pointCloud.h
 *
 * Code generation for function 'pointCloud'
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
pointCloud *b_pointCloud_pointCloud(const emlrtStack *sp, pointCloud *b_this,
                                    const emxArray_real32_T *varargin_1,
                                    const emxArray_uint8_T *varargin_3,
                                    const emxArray_real32_T *varargin_5,
                                    const emxArray_real32_T *varargin_7);

void pointCloud_findPointsInROI(const emlrtStack *sp,
                                const b_pointCloud *b_this,
                                const real32_T varargin_1[6],
                                emxArray_uint32_T *indices);

b_pointCloud *pointCloud_pointCloud(const emlrtStack *sp, b_pointCloud *b_this,
                                    const real32_T varargin_1[172800],
                                    const real32_T varargin_3[57600]);

pointCloud *pointCloud_select(const emlrtStack *sp, const b_pointCloud *b_this,
                              const emxArray_uint32_T *varargin_1,
                              pointCloud *iobj_0);

/* End of code generation (pointCloud.h) */
