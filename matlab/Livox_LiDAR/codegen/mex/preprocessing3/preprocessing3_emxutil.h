/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * preprocessing3_emxutil.h
 *
 * Code generation for function 'preprocessing3_emxutil'
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
void c_emxFree_pointclouds_internal_(
    const emlrtStack *sp, c_emxArray_pointclouds_internal **pEmxArray);

void c_emxInit_pointclouds_internal_(
    const emlrtStack *sp, c_emxArray_pointclouds_internal **pEmxArray,
    const emlrtRTEInfo *srcLocation);

void emxEnsureCapacity_boolean_T(const emlrtStack *sp,
                                 emxArray_boolean_T *emxArray, int32_T oldNumel,
                                 const emlrtRTEInfo *srcLocation);

void emxEnsureCapacity_int32_T(const emlrtStack *sp, emxArray_int32_T *emxArray,
                               int32_T oldNumel,
                               const emlrtRTEInfo *srcLocation);

void emxEnsureCapacity_real32_T(const emlrtStack *sp,
                                emxArray_real32_T *emxArray, int32_T oldNumel,
                                const emlrtRTEInfo *srcLocation);

void emxEnsureCapacity_uint16_T(const emlrtStack *sp,
                                emxArray_uint16_T *emxArray, int32_T oldNumel,
                                const emlrtRTEInfo *srcLocation);

void emxEnsureCapacity_uint8_T(const emlrtStack *sp, emxArray_uint8_T *emxArray,
                               int32_T oldNumel,
                               const emlrtRTEInfo *srcLocation);

void emxFreeStruct_pointCloud(const emlrtStack *sp, pointCloud *pStruct);

void emxFreeStruct_pointCloud1(const emlrtStack *sp, b_pointCloud *pStruct);

void emxFree_boolean_T(const emlrtStack *sp, emxArray_boolean_T **pEmxArray);

void emxFree_int32_T(const emlrtStack *sp, emxArray_int32_T **pEmxArray);

void emxFree_real32_T(const emlrtStack *sp, emxArray_real32_T **pEmxArray);

void emxFree_uint16_T(const emlrtStack *sp, emxArray_uint16_T **pEmxArray);

void emxFree_uint8_T(const emlrtStack *sp, emxArray_uint8_T **pEmxArray);

void emxInitStruct_pointCloud(const emlrtStack *sp, pointCloud *pStruct,
                              const emlrtRTEInfo *srcLocation);

void emxInitStruct_pointCloud1(const emlrtStack *sp, b_pointCloud *pStruct,
                               const emlrtRTEInfo *srcLocation);

void emxInit_boolean_T(const emlrtStack *sp, emxArray_boolean_T **pEmxArray,
                       const emlrtRTEInfo *srcLocation);

void emxInit_int32_T(const emlrtStack *sp, emxArray_int32_T **pEmxArray,
                     const emlrtRTEInfo *srcLocation);

void emxInit_real32_T(const emlrtStack *sp, emxArray_real32_T **pEmxArray,
                      int32_T numDimensions, const emlrtRTEInfo *srcLocation);

void emxInit_uint16_T(const emlrtStack *sp, emxArray_uint16_T **pEmxArray,
                      const emlrtRTEInfo *srcLocation);

void emxInit_uint8_T(const emlrtStack *sp, emxArray_uint8_T **pEmxArray,
                     int32_T numDimensions, const emlrtRTEInfo *srcLocation);

/* End of code generation (preprocessing3_emxutil.h) */
