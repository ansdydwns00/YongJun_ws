/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: G32_parsing.h
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 29-Jul-2024 12:55:51
 */

#ifndef G32_PARSING_H
#define G32_PARSING_H

/* Include Files */
#include "G32_parsing_types.h"
#include "rtwtypes.h"
#include <stddef.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
extern void G32_parsing(const float packetData[1330], float reset_flag,
                        emxArray_real32_T *xyzCoords,
                        emxArray_real32_T *xyzIntensity, bool *isValid);

void G32_parsing_init(void);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for G32_parsing.h
 *
 * [EOF]
 */
