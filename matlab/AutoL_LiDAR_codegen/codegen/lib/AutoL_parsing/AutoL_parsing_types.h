/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: AutoL_parsing_types.h
 *
 * MATLAB Coder version            : 23.2
 * C/C++ source code generated on  : 16-May-2024 15:16:24
 */

#ifndef AUTOL_PARSING_TYPES_H
#define AUTOL_PARSING_TYPES_H

/* Include Files */
#include "rtwtypes.h"

/* Type Definitions */
#ifndef struct_emxArray_real32_T
#define struct_emxArray_real32_T
struct emxArray_real32_T {
  float *data;
  int *size;
  int allocatedSize;
  int numDimensions;
  boolean_T canFreeData;
};
#endif /* struct_emxArray_real32_T */
#ifndef typedef_emxArray_real32_T
#define typedef_emxArray_real32_T
typedef struct emxArray_real32_T emxArray_real32_T;
#endif /* typedef_emxArray_real32_T */

#ifndef struct_emxArray_uint16_T
#define struct_emxArray_uint16_T
struct emxArray_uint16_T {
  unsigned short *data;
  int *size;
  int allocatedSize;
  int numDimensions;
  boolean_T canFreeData;
};
#endif /* struct_emxArray_uint16_T */
#ifndef typedef_emxArray_uint16_T
#define typedef_emxArray_uint16_T
typedef struct emxArray_uint16_T emxArray_uint16_T;
#endif /* typedef_emxArray_uint16_T */

#endif
/*
 * File trailer for AutoL_parsing_types.h
 *
 * [EOF]
 */
