/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: Avia_parsing_single.h
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 29-Jun-2024 20:44:43
 */

#ifndef AVIA_PARSING_SINGLE_H
#define AVIA_PARSING_SINGLE_H

/* Include Files */
#include "Avia_parsing_single_types.h"
#include "rtwtypes.h"
#include <stddef.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
extern void Avia_parsing_single(const float packet[1362], float reset_flag,
                                emxArray_real32_T *xyzCoords,
                                emxArray_real32_T *xyzIntensity, bool *isValid);

void Avia_parsing_single_init(void);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for Avia_parsing_single.h
 *
 * [EOF]
 */
