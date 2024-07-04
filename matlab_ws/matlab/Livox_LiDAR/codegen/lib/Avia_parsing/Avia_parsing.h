/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: Avia_parsing.h
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 30-Jun-2024 15:39:37
 */

#ifndef AVIA_PARSING_H
#define AVIA_PARSING_H

/* Include Files */
#include "Avia_parsing_types.h"
#include "rtwtypes.h"
#include <stddef.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
extern void Avia_parsing(const float packet[1362], float reset_flag,
                         emxArray_real32_T *xyzCoords,
                         float xyzIntensity_data[], int xyzIntensity_size[2],
                         bool *isValid);

void Avia_parsing_init(void);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for Avia_parsing.h
 *
 * [EOF]
 */
