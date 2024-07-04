/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * validateAndParseRansacInputs.h
 *
 * Code generation for function 'validateAndParseRansacInputs'
 *
 */

#pragma once

/* Include files */
#include "rtwtypes.h"
#include "covrt.h"
#include "emlrt.h"
#include "mex.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Function Declarations */
void checkMaxAngularDistance(const emlrtStack *sp, real32_T b_value);

void checkMaxDistance(const emlrtStack *sp, real32_T b_value);

void checkReferenceVector(const emlrtStack *sp, const real32_T b_value[3]);

/* End of code generation (validateAndParseRansacInputs.h) */
