/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_AutoL_parsing_reset_api.h
 *
 * MATLAB Coder version            : 23.2
 * C/C++ source code generated on  : 06-May-2024 17:28:39
 */

#ifndef _CODER_AUTOL_PARSING_RESET_API_H
#define _CODER_AUTOL_PARSING_RESET_API_H

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
void AutoL_parsing_reset(void);

void AutoL_parsing_reset_api(void);

void AutoL_parsing_reset_atexit(void);

void AutoL_parsing_reset_initialize(void);

void AutoL_parsing_reset_terminate(void);

void AutoL_parsing_reset_xil_shutdown(void);

void AutoL_parsing_reset_xil_terminate(void);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for _coder_AutoL_parsing_reset_api.h
 *
 * [EOF]
 */
