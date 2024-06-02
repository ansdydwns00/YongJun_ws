/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: Avia_parsing.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 02-Jun-2024 17:26:03
 */

/* Include Files */
#include "Avia_parsing.h"
#include "Avia_parsing_data.h"
#include "Avia_parsing_emxutil.h"
#include "Avia_parsing_initialize.h"
#include "Avia_parsing_types.h"
#include "rt_nonfinite.h"
#include "rt_nonfinite.h"
#include <math.h>
#include <stddef.h>
#include <string.h>

/* Variable Definitions */
static boolean_T points_not_empty;

/* Function Definitions */
/*
 * Initialize of persistent parameters
 *
 * Arguments    : const float packet[1362]
 *                float reset_flag
 *                emxArray_real32_T *xyzCoords
 *                boolean_T *isValid
 * Return Type  : void
 */
void Avia_parsing(const float packet[1362], float reset_flag,
                  emxArray_real32_T *xyzCoords, boolean_T *isValid)
{
  static float points[72000];
  static float i;
  emxArray_int16_T *r;
  emxArray_real32_T *vec;
  float b_packet[1344];
  float xyzPoints[288];
  float out_tmp;
  float *xyzCoords_data;
  int b_int32Value;
  int c_int32Value;
  int idx;
  int int32Value;
  short *r1;
  if (!isInitialized_Avia_parsing) {
    Avia_parsing_initialize();
  }
  if ((!points_not_empty) || (reset_flag == 0.0F)) {
    memset(&points[0], 0, 72000U * sizeof(float));
    points_not_empty = true;
    i = 1.0F;
  }
  /*  Cartesian coordinate data is 19:end  */
  /*  96 data consists of 14 bytes */
  /*  Precompute the indices for faster access */
  for (idx = 0; idx < 96; idx++) {
    unsigned char x[4];
    unsigned char u;
    memcpy(&b_packet[0], &packet[18], 1344U * sizeof(float));
    out_tmp = roundf(b_packet[14 * idx]);
    if (out_tmp < 256.0F) {
      if (out_tmp >= 0.0F) {
        u = (unsigned char)out_tmp;
      } else {
        u = 0U;
      }
    } else if (out_tmp >= 256.0F) {
      u = MAX_uint8_T;
    } else {
      u = 0U;
    }
    x[0] = u;
    out_tmp = roundf(b_packet[14 * idx + 1]);
    if (out_tmp < 256.0F) {
      if (out_tmp >= 0.0F) {
        u = (unsigned char)out_tmp;
      } else {
        u = 0U;
      }
    } else if (out_tmp >= 256.0F) {
      u = MAX_uint8_T;
    } else {
      u = 0U;
    }
    x[1] = u;
    out_tmp = roundf(b_packet[14 * idx + 2]);
    if (out_tmp < 256.0F) {
      if (out_tmp >= 0.0F) {
        u = (unsigned char)out_tmp;
      } else {
        u = 0U;
      }
    } else if (out_tmp >= 256.0F) {
      u = MAX_uint8_T;
    } else {
      u = 0U;
    }
    x[2] = u;
    out_tmp = roundf(b_packet[14 * idx + 3]);
    if (out_tmp < 256.0F) {
      if (out_tmp >= 0.0F) {
        u = (unsigned char)out_tmp;
      } else {
        u = 0U;
      }
    } else if (out_tmp >= 256.0F) {
      u = MAX_uint8_T;
    } else {
      u = 0U;
    }
    x[3] = u;
    memcpy((void *)&int32Value, (void *)&x[0],
           (unsigned int)((size_t)1 * sizeof(int)));
    memcpy(&b_packet[0], &packet[18], 1344U * sizeof(float));
    out_tmp = roundf(b_packet[14 * idx + 4]);
    if (out_tmp < 256.0F) {
      if (out_tmp >= 0.0F) {
        u = (unsigned char)out_tmp;
      } else {
        u = 0U;
      }
    } else if (out_tmp >= 256.0F) {
      u = MAX_uint8_T;
    } else {
      u = 0U;
    }
    x[0] = u;
    out_tmp = roundf(b_packet[14 * idx + 5]);
    if (out_tmp < 256.0F) {
      if (out_tmp >= 0.0F) {
        u = (unsigned char)out_tmp;
      } else {
        u = 0U;
      }
    } else if (out_tmp >= 256.0F) {
      u = MAX_uint8_T;
    } else {
      u = 0U;
    }
    x[1] = u;
    out_tmp = roundf(b_packet[14 * idx + 6]);
    if (out_tmp < 256.0F) {
      if (out_tmp >= 0.0F) {
        u = (unsigned char)out_tmp;
      } else {
        u = 0U;
      }
    } else if (out_tmp >= 256.0F) {
      u = MAX_uint8_T;
    } else {
      u = 0U;
    }
    x[2] = u;
    out_tmp = roundf(b_packet[14 * idx + 7]);
    if (out_tmp < 256.0F) {
      if (out_tmp >= 0.0F) {
        u = (unsigned char)out_tmp;
      } else {
        u = 0U;
      }
    } else if (out_tmp >= 256.0F) {
      u = MAX_uint8_T;
    } else {
      u = 0U;
    }
    x[3] = u;
    memcpy((void *)&b_int32Value, (void *)&x[0],
           (unsigned int)((size_t)1 * sizeof(int)));
    memcpy(&b_packet[0], &packet[18], 1344U * sizeof(float));
    out_tmp = roundf(b_packet[14 * idx + 8]);
    if (out_tmp < 256.0F) {
      if (out_tmp >= 0.0F) {
        u = (unsigned char)out_tmp;
      } else {
        u = 0U;
      }
    } else if (out_tmp >= 256.0F) {
      u = MAX_uint8_T;
    } else {
      u = 0U;
    }
    x[0] = u;
    out_tmp = roundf(b_packet[14 * idx + 9]);
    if (out_tmp < 256.0F) {
      if (out_tmp >= 0.0F) {
        u = (unsigned char)out_tmp;
      } else {
        u = 0U;
      }
    } else if (out_tmp >= 256.0F) {
      u = MAX_uint8_T;
    } else {
      u = 0U;
    }
    x[1] = u;
    out_tmp = roundf(b_packet[14 * idx + 10]);
    if (out_tmp < 256.0F) {
      if (out_tmp >= 0.0F) {
        u = (unsigned char)out_tmp;
      } else {
        u = 0U;
      }
    } else if (out_tmp >= 256.0F) {
      u = MAX_uint8_T;
    } else {
      u = 0U;
    }
    x[2] = u;
    out_tmp = roundf(b_packet[14 * idx + 11]);
    if (out_tmp < 256.0F) {
      if (out_tmp >= 0.0F) {
        u = (unsigned char)out_tmp;
      } else {
        u = 0U;
      }
    } else if (out_tmp >= 256.0F) {
      u = MAX_uint8_T;
    } else {
      u = 0U;
    }
    x[3] = u;
    memcpy((void *)&c_int32Value, (void *)&x[0],
           (unsigned int)((size_t)1 * sizeof(int)));
    xyzPoints[idx] = (float)int32Value / 1000.0F;
    xyzPoints[idx + 96] = (float)b_int32Value / 1000.0F;
    xyzPoints[idx + 192] = (float)c_int32Value / 1000.0F;
  }
  if (i == 250.0F) {
    idx = xyzCoords->size[0] * xyzCoords->size[1];
    xyzCoords->size[0] = 24000;
    xyzCoords->size[1] = 3;
    emxEnsureCapacity_real32_T(xyzCoords, idx);
    xyzCoords_data = xyzCoords->data;
    for (idx = 0; idx < 72000; idx++) {
      xyzCoords_data[idx] = points[idx];
    }
    *isValid = true;
    /*  Reset parameters */
    memset(&points[0], 0, 72000U * sizeof(float));
    i = 1.0F;
  } else {
    out_tmp = (i - 1.0F) * 96.0F;
    emxInit_real32_T(&vec, 2);
    xyzCoords_data = vec->data;
    if (out_tmp + 96.0F < out_tmp + 1.0F) {
      vec->size[0] = 1;
      vec->size[1] = 0;
    } else if ((rtIsInfF(out_tmp + 1.0F) || rtIsInfF(out_tmp + 96.0F)) &&
               (out_tmp + 1.0F == out_tmp + 96.0F)) {
      idx = vec->size[0] * vec->size[1];
      vec->size[0] = 1;
      vec->size[1] = 1;
      emxEnsureCapacity_real32_T(vec, idx);
      xyzCoords_data = vec->data;
      xyzCoords_data[0] = rtNaNF;
    } else if (out_tmp + 1.0F == out_tmp + 1.0F) {
      if ((fabsf(out_tmp + 1.0F) >= 1.07374182E+9F) ||
          (fabsf(out_tmp + 96.0F) >= 1.07374182E+9F)) {
        idx = vec->size[0] * vec->size[1];
        vec->size[0] = 1;
        int32Value = (int)((double)(out_tmp + 96.0F) - (out_tmp + 1.0F));
        vec->size[1] = int32Value + 1;
        emxEnsureCapacity_real32_T(vec, idx);
        xyzCoords_data = vec->data;
        for (idx = 0; idx <= int32Value; idx++) {
          xyzCoords_data[idx] = (float)((out_tmp + 1.0F) + (double)idx);
        }
      } else {
        int32Value = (int)floorf(out_tmp + 1.0F);
        b_int32Value = (int)floorf(out_tmp + 96.0F) - int32Value;
        idx = vec->size[0] * vec->size[1];
        vec->size[0] = 1;
        vec->size[1] = b_int32Value + 1;
        emxEnsureCapacity_real32_T(vec, idx);
        xyzCoords_data = vec->data;
        for (c_int32Value = 0; c_int32Value <= b_int32Value; c_int32Value++) {
          xyzCoords_data[c_int32Value] = (float)(int32Value + c_int32Value);
        }
      }
    } else {
      double apnd;
      double cdiff;
      double ndbl;
      float b1;
      ndbl = floor(((double)(out_tmp + 96.0F) - (out_tmp + 1.0F)) + 0.5);
      apnd = (out_tmp + 1.0F) + ndbl;
      cdiff = apnd - (out_tmp + 96.0F);
      if (fabs(cdiff) < 2.384185791015625E-7 *
                            fmax(fabs(out_tmp + 1.0F), fabs(out_tmp + 96.0F))) {
        ndbl++;
        b1 = out_tmp + 96.0F;
      } else if (cdiff > 0.0) {
        b1 = (float)((out_tmp + 1.0F) + (ndbl - 1.0));
      } else {
        ndbl++;
        b1 = (float)apnd;
      }
      if (ndbl >= 0.0) {
        b_int32Value = (int)ndbl;
      } else {
        b_int32Value = 0;
      }
      idx = vec->size[0] * vec->size[1];
      vec->size[0] = 1;
      vec->size[1] = b_int32Value;
      emxEnsureCapacity_real32_T(vec, idx);
      xyzCoords_data = vec->data;
      if (b_int32Value > 0) {
        xyzCoords_data[0] = out_tmp + 1.0F;
        if (b_int32Value > 1) {
          xyzCoords_data[b_int32Value - 1] = b1;
          int32Value = (b_int32Value - 1) / 2;
          for (c_int32Value = 0; c_int32Value <= int32Value - 2;
               c_int32Value++) {
            xyzCoords_data[c_int32Value + 1] =
                (out_tmp + 1.0F) + (float)(c_int32Value + 1);
            xyzCoords_data[(b_int32Value - c_int32Value) - 2] =
                b1 - (float)(c_int32Value + 1);
          }
          if (int32Value << 1 == b_int32Value - 1) {
            xyzCoords_data[int32Value] = ((out_tmp + 1.0F) + b1) / 2.0F;
          } else {
            xyzCoords_data[int32Value] = (out_tmp + 1.0F) + (float)int32Value;
            xyzCoords_data[int32Value + 1] = b1 - (float)int32Value;
          }
        }
      }
    }
    emxInit_int16_T(&r);
    int32Value = vec->size[1];
    idx = r->size[0];
    r->size[0] = vec->size[1];
    emxEnsureCapacity_int16_T(r, idx);
    r1 = r->data;
    for (idx = 0; idx < int32Value; idx++) {
      r1[idx] = (short)((short)xyzCoords_data[idx] - 1);
    }
    b_int32Value = vec->size[1];
    emxFree_real32_T(&vec);
    for (idx = 0; idx < 3; idx++) {
      for (c_int32Value = 0; c_int32Value < int32Value; c_int32Value++) {
        points[r1[c_int32Value] + 24000 * idx] =
            xyzPoints[c_int32Value + b_int32Value * idx];
      }
    }
    emxFree_int16_T(&r);
    i++;
    xyzCoords->size[0] = 0;
    xyzCoords->size[1] = 0;
    *isValid = false;
  }
}

/*
 * Arguments    : void
 * Return Type  : void
 */
void Avia_parsing_init(void)
{
  points_not_empty = false;
}

/*
 * File trailer for Avia_parsing.c
 *
 * [EOF]
 */
