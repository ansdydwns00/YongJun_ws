/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: AutoL_parsing.h
 *
 * MATLAB Coder version            : 23.2
 * C/C++ source code generated on  : 07-May-2024 13:08:27
 */

#ifndef AUTOL_PARSING_H
#define AUTOL_PARSING_H

/* Include Files */
#include "AutoL_parsing_types.h"
#include "rtwtypes.h"
#include <stddef.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
extern void AutoL_parsing(const double packetData[1330], double reset_flag,
                          emxArray_real_T *xyzCoords, boolean_T *isValid);

void AutoL_parsing_init(void);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for AutoL_parsing.h
 *
 * [EOF]
 */
