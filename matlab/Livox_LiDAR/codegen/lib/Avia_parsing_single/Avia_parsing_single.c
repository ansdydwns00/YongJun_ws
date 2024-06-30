/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: Avia_parsing_single.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 29-Jun-2024 20:44:43
 */

/* Include Files */
#include "Avia_parsing_single.h"
#include "Avia_parsing_single_data.h"
#include "Avia_parsing_single_emxutil.h"
#include "Avia_parsing_single_initialize.h"
#include "Avia_parsing_single_types.h"
#include "colon.h"
#include "rt_nonfinite.h"
#include "rt_nonfinite.h"
#include <math.h>
#include <stddef.h>
#include <string.h>

/* Variable Definitions */
static bool points_not_empty;

/* Function Definitions */
/*
 * Initialize of persistent parameters
 *
 * Arguments    : const float packet[1362]
 *                float reset_flag
 *                emxArray_real32_T *xyzCoords
 *                emxArray_real32_T *xyzIntensity
 *                bool *isValid
 * Return Type  : void
 */
void Avia_parsing_single(const float packet[1362], float reset_flag,
                         emxArray_real32_T *xyzCoords,
                         emxArray_real32_T *xyzIntensity, bool *isValid)
{
  static float points[172800];
  static float Intensity[57600];
  static float b_i;
  emxArray_real32_T *vec;
  emxArray_uint16_T *r;
  float xyzPoints[288];
  float b_I[96];
  float x[96];
  float y[96];
  float z[96];
  float out_tmp;
  float *xyzCoords_data;
  int b_k;
  int i;
  int k;
  int n;
  int out;
  unsigned short *r1;
  if (!isInitialized_Avia_parsing_single) {
    Avia_parsing_single_initialize();
  }
  if ((!points_not_empty) || (reset_flag == 0.0F)) {
    memset(&points[0], 0, 172800U * sizeof(float));
    points_not_empty = true;
    memset(&Intensity[0], 0, 57600U * sizeof(float));
    b_i = 1.0F;
  }
  /*  Cartesian coordinate data is 19:end size"[1x1344] */
  /*  Precompute the indices for faster access */
  /*  Extract x, y, z coordinates */
  emxInit_real32_T(&vec, 2);
  xyzCoords_data = vec->data;
  for (k = 0; k < 96; k++) {
    int int32Value_data[334];
    unsigned char x_data[1338];
    unsigned char u;
    out = k * 14 + 1;
    n = k * 14 + 4;
    if (n < out) {
      vec->size[0] = 1;
      vec->size[1] = 0;
    } else {
      n -= out;
      i = vec->size[0] * vec->size[1];
      vec->size[0] = 1;
      vec->size[1] = (k * 14 - out) + 5;
      emxEnsureCapacity_real32_T(vec, i);
      xyzCoords_data = vec->data;
      for (b_k = 0; b_k <= n; b_k++) {
        xyzCoords_data[b_k] = ((float)(out + b_k) + 1.0F) - 1.0F;
      }
    }
    out = vec->size[1];
    n = vec->size[1];
    for (i = 0; i < out; i++) {
      out_tmp = roundf(packet[(int)xyzCoords_data[i] + 17]);
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
      x_data[i] = u;
    }
    if (n == 0) {
      i = 0;
    } else {
      i = n >> 2;
    }
    memcpy((void *)&int32Value_data[0], (void *)&x_data[0],
           (size_t)i * sizeof(int));
    x[k] = (float)int32Value_data[0] / 1000.0F;
    out = k * 14 + 5;
    n = k * 14 + 8;
    if (n < out) {
      vec->size[0] = 1;
      vec->size[1] = 0;
    } else {
      n -= out;
      i = vec->size[0] * vec->size[1];
      vec->size[0] = 1;
      vec->size[1] = (k * 14 - out) + 9;
      emxEnsureCapacity_real32_T(vec, i);
      xyzCoords_data = vec->data;
      for (b_k = 0; b_k <= n; b_k++) {
        xyzCoords_data[b_k] = ((float)(out + b_k) + 1.0F) - 1.0F;
      }
    }
    out = vec->size[1];
    n = vec->size[1];
    for (i = 0; i < out; i++) {
      out_tmp = roundf(packet[(int)xyzCoords_data[i] + 17]);
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
      x_data[i] = u;
    }
    if (n == 0) {
      i = 0;
    } else {
      i = n >> 2;
    }
    memcpy((void *)&int32Value_data[0], (void *)&x_data[0],
           (size_t)i * sizeof(int));
    y[k] = (float)int32Value_data[0] / 1000.0F;
    out = k * 14 + 9;
    n = k * 14 + 12;
    if (n < out) {
      vec->size[0] = 1;
      vec->size[1] = 0;
    } else {
      n -= out;
      i = vec->size[0] * vec->size[1];
      vec->size[0] = 1;
      vec->size[1] = (k * 14 - out) + 13;
      emxEnsureCapacity_real32_T(vec, i);
      xyzCoords_data = vec->data;
      for (b_k = 0; b_k <= n; b_k++) {
        xyzCoords_data[b_k] = ((float)(out + b_k) + 1.0F) - 1.0F;
      }
    }
    out = vec->size[1];
    n = vec->size[1];
    for (i = 0; i < out; i++) {
      out_tmp = roundf(packet[(int)xyzCoords_data[i] + 17]);
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
      x_data[i] = u;
    }
    if (n == 0) {
      i = 0;
    } else {
      i = n >> 2;
    }
    memcpy((void *)&int32Value_data[0], (void *)&x_data[0],
           (size_t)i * sizeof(int));
    z[k] = (float)int32Value_data[0] / 1000.0F;
    b_I[k] = packet[k * 14 + 30];
  }
  for (i = 0; i < 96; i++) {
    xyzPoints[i] = x[i];
    xyzPoints[i + 96] = y[i];
    xyzPoints[i + 192] = z[i];
  }
  if (b_i == 600.0F) {
    i = xyzCoords->size[0] * xyzCoords->size[1];
    xyzCoords->size[0] = 57600;
    xyzCoords->size[1] = 3;
    emxEnsureCapacity_real32_T(xyzCoords, i);
    xyzCoords_data = xyzCoords->data;
    for (i = 0; i < 172800; i++) {
      xyzCoords_data[i] = points[i];
    }
    *isValid = true;
    i = xyzIntensity->size[0] * xyzIntensity->size[1];
    xyzIntensity->size[0] = 57600;
    xyzIntensity->size[1] = 1;
    emxEnsureCapacity_real32_T(xyzIntensity, i);
    xyzCoords_data = xyzIntensity->data;
    for (i = 0; i < 57600; i++) {
      xyzCoords_data[i] = Intensity[i];
    }
    /*  Reset parameters */
    memset(&points[0], 0, 172800U * sizeof(float));
    memset(&Intensity[0], 0, 57600U * sizeof(float));
    b_i = 1.0F;
  } else {
    xyzCoords->size[0] = 0;
    xyzCoords->size[1] = 0;
    xyzIntensity->size[0] = 0;
    xyzIntensity->size[1] = 0;
    *isValid = false;
    out_tmp = (b_i - 1.0F) * 96.0F;
    if (out_tmp + 96.0F < out_tmp + 1.0F) {
      vec->size[0] = 1;
      vec->size[1] = 0;
    } else if ((rtIsInfF(out_tmp + 1.0F) || rtIsInfF(out_tmp + 96.0F)) &&
               (out_tmp + 1.0F == out_tmp + 96.0F)) {
      i = vec->size[0] * vec->size[1];
      vec->size[0] = 1;
      vec->size[1] = 1;
      emxEnsureCapacity_real32_T(vec, i);
      xyzCoords_data = vec->data;
      xyzCoords_data[0] = rtNaNF;
    } else if (out_tmp + 1.0F == out_tmp + 1.0F) {
      if ((out_tmp + 1.0F >= 1.07374182E+9F) ||
          (out_tmp + 96.0F >= 1.07374182E+9F)) {
        i = vec->size[0] * vec->size[1];
        vec->size[0] = 1;
        out = (int)((double)(out_tmp + 96.0F) - (out_tmp + 1.0F));
        vec->size[1] = out + 1;
        emxEnsureCapacity_real32_T(vec, i);
        xyzCoords_data = vec->data;
        for (i = 0; i <= out; i++) {
          xyzCoords_data[i] = (float)((out_tmp + 1.0F) + (double)i);
        }
      } else {
        n = (int)floorf(out_tmp + 1.0F);
        out = (int)floorf(out_tmp + 96.0F) - n;
        i = vec->size[0] * vec->size[1];
        vec->size[0] = 1;
        vec->size[1] = out + 1;
        emxEnsureCapacity_real32_T(vec, i);
        xyzCoords_data = vec->data;
        for (k = 0; k <= out; k++) {
          xyzCoords_data[k] = (float)(n + k);
        }
      }
    } else {
      eml_float_colon(out_tmp + 1.0F, out_tmp + 96.0F, vec);
      xyzCoords_data = vec->data;
    }
    emxInit_uint16_T(&r);
    out = vec->size[1];
    i = r->size[0];
    r->size[0] = vec->size[1];
    emxEnsureCapacity_uint16_T(r, i);
    r1 = r->data;
    for (i = 0; i < out; i++) {
      r1[i] = (unsigned short)((unsigned short)xyzCoords_data[i] - 1U);
    }
    n = vec->size[1];
    for (i = 0; i < 3; i++) {
      for (b_k = 0; b_k < out; b_k++) {
        points[r1[b_k] + 57600 * i] = xyzPoints[b_k + n * i];
      }
    }
    if (out_tmp + 96.0F < out_tmp + 1.0F) {
      vec->size[0] = 1;
      vec->size[1] = 0;
    } else if ((rtIsInfF(out_tmp + 1.0F) || rtIsInfF(out_tmp + 96.0F)) &&
               (out_tmp + 1.0F == out_tmp + 96.0F)) {
      i = vec->size[0] * vec->size[1];
      vec->size[0] = 1;
      vec->size[1] = 1;
      emxEnsureCapacity_real32_T(vec, i);
      xyzCoords_data = vec->data;
      xyzCoords_data[0] = rtNaNF;
    } else if (out_tmp + 1.0F == out_tmp + 1.0F) {
      if ((out_tmp + 1.0F >= 1.07374182E+9F) ||
          (out_tmp + 96.0F >= 1.07374182E+9F)) {
        i = vec->size[0] * vec->size[1];
        vec->size[0] = 1;
        out = (int)((double)(out_tmp + 96.0F) - (out_tmp + 1.0F));
        vec->size[1] = out + 1;
        emxEnsureCapacity_real32_T(vec, i);
        xyzCoords_data = vec->data;
        for (i = 0; i <= out; i++) {
          xyzCoords_data[i] = (float)((out_tmp + 1.0F) + (double)i);
        }
      } else {
        n = (int)floorf(out_tmp + 1.0F);
        out = (int)floorf(out_tmp + 96.0F) - n;
        i = vec->size[0] * vec->size[1];
        vec->size[0] = 1;
        vec->size[1] = out + 1;
        emxEnsureCapacity_real32_T(vec, i);
        xyzCoords_data = vec->data;
        for (k = 0; k <= out; k++) {
          xyzCoords_data[k] = (float)(n + k);
        }
      }
    } else {
      eml_float_colon(out_tmp + 1.0F, out_tmp + 96.0F, vec);
      xyzCoords_data = vec->data;
    }
    out = vec->size[1];
    i = r->size[0];
    r->size[0] = vec->size[1];
    emxEnsureCapacity_uint16_T(r, i);
    r1 = r->data;
    for (i = 0; i < out; i++) {
      r1[i] = (unsigned short)((unsigned short)xyzCoords_data[i] - 1U);
    }
    for (i = 0; i < out; i++) {
      Intensity[r1[i]] = b_I[i];
    }
    emxFree_uint16_T(&r);
    b_i++;
  }
  emxFree_real32_T(&vec);
}

/*
 * Arguments    : void
 * Return Type  : void
 */
void Avia_parsing_single_init(void)
{
  points_not_empty = false;
}

/*
 * File trailer for Avia_parsing_single.c
 *
 * [EOF]
 */
