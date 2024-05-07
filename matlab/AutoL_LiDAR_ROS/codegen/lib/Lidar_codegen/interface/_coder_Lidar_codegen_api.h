/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_Lidar_codegen_api.h
 *
 * MATLAB Coder version            : 23.2
 * C/C++ source code generated on  : 03-May-2024 21:18:42
 */

#ifndef _CODER_LIDAR_CODEGEN_API_H
#define _CODER_LIDAR_CODEGEN_API_H

/* Include Files */
#include "emlrt.h"
#include "mex.h"
#include "tmwtypes.h"
#include <string.h>

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
void Lidar_codegen(real_T points[68352]);

void Lidar_codegen_api(const mxArray **plhs);

void Lidar_codegen_atexit(void);

void Lidar_codegen_initialize(void);

void Lidar_codegen_terminate(void);

void Lidar_codegen_xil_shutdown(void);

void Lidar_codegen_xil_terminate(void);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for _coder_Lidar_codegen_api.h
 *
 * [EOF]
 */
