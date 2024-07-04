/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * initializeRansacModel.h
 *
 * Code generation for function 'initializeRansacModel'
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
int32_T initializeRansacModel(const emlrtStack *sp, const pointCloud *ptCloud,
                              pointCloud *iobj_0, pointCloud **pc,
                              emxArray_real_T *validPtCloudIndices);

/* End of code generation (initializeRansacModel.h) */
