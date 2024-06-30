/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: pointCloud.h
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 26-Jun-2024 13:33:54
 */

#ifndef POINTCLOUD_H
#define POINTCLOUD_H

/* Include Files */
#include "preprocessing2_types.h"
#include "rtwtypes.h"
#include <stddef.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
pointCloud *pointCloud_pointCloud(pointCloud *b_this,
                                  const emxArray_real32_T *varargin_1,
                                  const emxArray_uint8_T *varargin_3,
                                  const emxArray_real32_T *varargin_5,
                                  const emxArray_real32_T *varargin_7);

pointCloud *pointCloud_select(const b_pointCloud *b_this,
                              const boolean_T varargin_1[57600],
                              pointCloud *iobj_0);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for pointCloud.h
 *
 * [EOF]
 */
