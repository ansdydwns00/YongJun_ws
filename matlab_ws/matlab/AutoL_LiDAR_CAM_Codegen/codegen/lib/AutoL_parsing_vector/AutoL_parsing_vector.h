/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: AutoL_parsing_vector.h
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 28-May-2024 15:54:00
 */

#ifndef AUTOL_PARSING_VECTOR_H
#define AUTOL_PARSING_VECTOR_H

/* Include Files */
#include "AutoL_parsing_vector_types.h"
#include "rtwtypes.h"
#include <stddef.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
extern void AutoL_parsing_vector(const float packetData[1330], float reset_flag,
                                 emxArray_real32_T *xyzCoords, bool *isValid);

void AutoL_parsing_vector_init(void);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for AutoL_parsing_vector.h
 *
 * [EOF]
 */
