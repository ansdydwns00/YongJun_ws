/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: pointCloud.h
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 26-Jun-2024 14:35:29
 */

#ifndef POINTCLOUD_H
#define POINTCLOUD_H

/* Include Files */
#include "preprocessing3_types.h"
#include "rtwtypes.h"
#include <stddef.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
pointCloud *pointCloud_select(const b_pointCloud *b_this,
                              const emxArray_boolean_T *varargin_1,
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
