/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_Lidar_codegen_mex.h
 *
 * MATLAB Coder version            : 23.2
 * C/C++ source code generated on  : 03-May-2024 21:18:42
 */

#ifndef _CODER_LIDAR_CODEGEN_MEX_H
#define _CODER_LIDAR_CODEGEN_MEX_H

/* Include Files */
#include "emlrt.h"
#include "mex.h"
#include "tmwtypes.h"

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
MEXFUNCTION_LINKAGE void mexFunction(int32_T nlhs, mxArray *plhs[],
                                     int32_T nrhs, const mxArray *prhs[]);

emlrtCTX mexFunctionCreateRootTLS(void);

void unsafe_Lidar_codegen_mexFunction(int32_T nlhs, mxArray *plhs[1],
                                      int32_T nrhs);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for _coder_Lidar_codegen_mex.h
 *
 * [EOF]
 */
