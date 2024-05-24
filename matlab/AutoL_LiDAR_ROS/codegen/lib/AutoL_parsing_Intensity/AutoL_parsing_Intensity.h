/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: AutoL_parsing_Intensity.h
 *
 * MATLAB Coder version            : 23.2
 * C/C++ source code generated on  : 20-May-2024 11:17:09
 */

#ifndef AUTOL_PARSING_INTENSITY_H
#define AUTOL_PARSING_INTENSITY_H

/* Include Files */
#include "AutoL_parsing_Intensity_types.h"
#include "rtwtypes.h"
#include <stddef.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
extern void AutoL_parsing_Intensity(const float packetData[1330],
                                    float reset_flag,
                                    emxArray_real32_T *xyzCoords,
                                    emxArray_real32_T *xyzIntensity,
                                    boolean_T *isValid);

void AutoL_parsing_Intensity_init(void);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for AutoL_parsing_Intensity.h
 *
 * [EOF]
 */
