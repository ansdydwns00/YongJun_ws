/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: msac.h
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 26-Jun-2024 13:22:25
 */

#ifndef MSAC_H
#define MSAC_H

/* Include Files */
#include "preprocessing_types.h"
#include "rtwtypes.h"
#include <stddef.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
boolean_T msac(const emxArray_real32_T *allPoints, float params_maxDistance,
               const double varargin_1_data[], double varargin_2,
               float bestModelParams_data[], int bestModelParams_size[2]);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for msac.h
 *
 * [EOF]
 */
