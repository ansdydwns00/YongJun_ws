/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: Avia_parsing.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 30-Jun-2024 15:39:37
 */

/* Include Files */
#include "Avia_parsing.h"
#include "Avia_parsing_data.h"
#include "Avia_parsing_emxutil.h"
#include "Avia_parsing_initialize.h"
#include "Avia_parsing_types.h"
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
 *                float xyzIntensity_data[]
 *                int xyzIntensity_size[2]
 *                bool *isValid
 * Return Type  : void
 */
void Avia_parsing(const float packet[1362], float reset_flag,
                  emxArray_real32_T *xyzCoords, float xyzIntensity_data[],
                  int xyzIntensity_size[2], bool *isValid)
{
  static float points[23616];
  static float Intensity[7872];
  static float b_i;
  emxArray_int16_T *r;
  emxArray_real32_T *vec;
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
  short *r1;
  if (!isInitialized_Avia_parsing) {
    Avia_parsing_initialize();
  }
  /*  In ros, 10hz -> 24000 points in 1 message -> 96*250 = 24000 */
  /*  In ros, 30hz -> 7872 points in 1 message -> 96*82 = 7872 */
  /*  numPacket = 250; */
  if ((!points_not_empty) || (reset_flag == 0.0F)) {
    memset(&points[0], 0, 23616U * sizeof(float));
    points_not_empty = true;
    memset(&Intensity[0], 0, 7872U * sizeof(float));
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
  if (b_i == 82.0F) {
    i = xyzCoords->size[0] * xyzCoords->size[1];
    xyzCoords->size[0] = 7872;
    xyzCoords->size[1] = 3;
    emxEnsureCapacity_real32_T(xyzCoords, i);
    xyzCoords_data = xyzCoords->data;
    for (i = 0; i < 23616; i++) {
      xyzCoords_data[i] = points[i];
    }
    *isValid = true;
    xyzIntensity_size[0] = 7872;
    xyzIntensity_size[1] = 1;
    memcpy(&xyzIntensity_data[0], &Intensity[0], 7872U * sizeof(float));
    /*  Reset parameters */
    memset(&points[0], 0, 23616U * sizeof(float));
    memset(&Intensity[0], 0, 7872U * sizeof(float));
    b_i = 1.0F;
  } else {
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
    emxInit_int16_T(&r);
    out = vec->size[1];
    i = r->size[0];
    r->size[0] = vec->size[1];
    emxEnsureCapacity_int16_T(r, i);
    r1 = r->data;
    for (i = 0; i < out; i++) {
      r1[i] = (short)((short)xyzCoords_data[i] - 1);
    }
    n = vec->size[1];
    for (i = 0; i < 3; i++) {
      for (b_k = 0; b_k < out; b_k++) {
        points[r1[b_k] + 7872 * i] = xyzPoints[b_k + n * i];
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
    emxEnsureCapacity_int16_T(r, i);
    r1 = r->data;
    for (i = 0; i < out; i++) {
      r1[i] = (short)((short)xyzCoords_data[i] - 1);
    }
    for (i = 0; i < out; i++) {
      Intensity[r1[i]] = b_I[i];
    }
    emxFree_int16_T(&r);
    b_i++;
    xyzCoords->size[0] = 0;
    xyzCoords->size[1] = 0;
    xyzIntensity_size[0] = 0;
    xyzIntensity_size[1] = 0;
    *isValid = false;
  }
  emxFree_real32_T(&vec);
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
