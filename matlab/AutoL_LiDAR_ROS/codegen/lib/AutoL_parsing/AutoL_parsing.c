/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: AutoL_parsing.c
 *
 * MATLAB Coder version            : 23.2
 * C/C++ source code generated on  : 09-May-2024 15:08:27
 */

/* Include Files */
#include "AutoL_parsing.h"
#include "AutoL_parsing_data.h"
#include "AutoL_parsing_emxutil.h"
#include "AutoL_parsing_initialize.h"
#include "AutoL_parsing_types.h"
#include "rt_nonfinite.h"
#include "rt_nonfinite.h"
#include <math.h>
#include <string.h>

/* Variable Definitions */
static boolean_T points_not_empty;

/* Function Definitions */
/*
 * Initialize of persistent parameters
 *
 * Arguments    : const float packetData[1330]
 *                float reset_flag
 *                emxArray_real32_T *xyzCoords
 *                boolean_T *isValid
 * Return Type  : void
 */
void AutoL_parsing(const float packetData[1330], float reset_flag,
                   emxArray_real32_T *xyzCoords, boolean_T *isValid)
{
  static const float fv[4] = {-0.0383887924F, -0.104694694F, -0.00523584F,
                              -0.0715417415F};
  static float points[115200];
  static float c_i;
  emxArray_real32_T *vec;
  emxArray_uint16_T *r;
  float xyzPoints[384];
  float ToF[128];
  float elevation[16];
  float azimuth_data[8];
  float delta_tmp_tmp;
  float f;
  float xy;
  float *xyzCoords_data;
  int ToF_tmp;
  int b_i;
  int i;
  int j;
  int nm1d2;
  unsigned short *r1;
  unsigned char top_bottom_flag;
  boolean_T guard1;
  if (!isInitialized_AutoL_parsing) {
    AutoL_parsing_initialize();
  }
  if ((!points_not_empty) || (reset_flag == 0.0F)) {
    memset(&points[0], 0, 115200U * sizeof(float));
    points_not_empty = true;
    c_i = 1.0F;
  }
  /*  Extract one packet */
  /*  Split into "Payload Header" and "Payload" (UDP Header is received
   * truncated.) */
  /*  [1 x 28] */
  /*  [1 x 1296] (Except for Timestamp, ProductID)   */
  f = roundf(packetData[4]);
  if (f < 256.0F) {
    if (f >= 0.0F) {
      top_bottom_flag = (unsigned char)f;
    } else {
      top_bottom_flag = 0U;
    }
  } else if (f >= 256.0F) {
    top_bottom_flag = MAX_uint8_T;
  } else {
    top_bottom_flag = 0U;
  }
  /*  To check the upper(1) and lower frames(0) */
  /*  [01 = 1(continue) or AA(terminate) = 170 or CC(error) = 204, A5 = 165, B3
   * = 179, C2 = 194]  */
  /*  Extract [x,y,z] coordinates for one packet  */
  /*  Lower Frame */
  /*  Upper Frame */
  /*  To check the Upper(1) or Lower frames(0) */
  if (top_bottom_flag == 0) {
    for (j = 0; j < 16; j++) {
      elevation[j] = 0.625F * (float)j - 4.84375F;
    }
  } else {
    for (j = 0; j < 16; j++) {
      elevation[j] = 0.625F * (float)j - 4.53125F;
    }
  }
  /*  Apply azimuth offset to calculate precise azimuth */
  /*  Values for azimuth (3 echo mode) */
  for (j = 0; j < 8; j++) {
    azimuth_data[j] = 0.0F;
  }
  for (i = 0; i < 8; i++) {
    b_i = i * 3;
    nm1d2 = b_i * 54;
    delta_tmp_tmp = packetData[nm1d2 + 30] + 256.0F * packetData[nm1d2 + 31];
    xy = (delta_tmp_tmp + 65536.0F * packetData[nm1d2 + 32]) +
         1.6777216E+7F * packetData[nm1d2 + 33];
    if (xy > 2.147483647E+9) {
      azimuth_data[(int)((float)b_i / 3.0F + 1.0F) - 1] =
          (delta_tmp_tmp - 65535.0F) / 1000.0F;
    } else {
      azimuth_data[(int)((float)b_i / 3.0F + 1.0F) - 1] = xy / 1000.0F;
    }
  }
  /*  ToF for azimuth [8*16] */
  memset(&ToF[0], 0, 128U * sizeof(float));
  for (i = 0; i < 8; i++) {
    nm1d2 = i * 54 * 3;
    for (j = 0; j < 16; j++) {
      b_i = j * 3;
      ToF_tmp = nm1d2 + b_i;
      ToF[(int)(((float)i * 16.0F + (float)b_i / 3.0F) + 1.0F) - 1] =
          (packetData[ToF_tmp + 34] + 256.0F * packetData[ToF_tmp + 35]) /
          256.0F;
    }
  }
  /*  Rearrangement ToF [16 x 8]  */
  /*  Finding coordinates [x,y,z] */
  for (i = 0; i < 8; i++) {
    for (j = 0; j < 16; j++) {
      float x_tmp;
      delta_tmp_tmp = 0.0174532924F * elevation[j];
      b_i = j + (i << 4);
      f = ToF[b_i];
      xy = f * cosf(delta_tmp_tmp);
      x_tmp =
          0.0174532924F * (azimuth_data[i] + fv[(int)floorf((float)j / 4.0F)]);
      xyzPoints[b_i] = xy * cosf(x_tmp);
      xyzPoints[b_i + 128] = xy * sinf(x_tmp);
      xyzPoints[b_i + 256] = f * sinf(delta_tmp_tmp);
    }
  }
  /*  Check End frame packet */
  emxInit_uint16_T(&r);
  emxInit_real32_T(&vec, 2);
  xyzCoords_data = vec->data;
  guard1 = false;
  if (top_bottom_flag == 1) {
    unsigned int u;
    f = roundf(packetData[5]);
    if (f < 4.2949673E+9F) {
      if (f >= 0.0F) {
        u = (unsigned int)f;
      } else {
        u = 0U;
      }
    } else if (f >= 4.2949673E+9F) {
      u = MAX_uint32_T;
    } else {
      u = 0U;
    }
    if (u == 170U) {
      /*  Return [x,y,z] coordinates for 1 frame and set the return flag to true
       */
      j = xyzCoords->size[0] * xyzCoords->size[1];
      xyzCoords->size[0] = 38400;
      xyzCoords->size[1] = 3;
      emxEnsureCapacity_real32_T(xyzCoords, j);
      xyzCoords_data = xyzCoords->data;
      for (j = 0; j < 115200; j++) {
        xyzCoords_data[j] = points[j];
      }
      *isValid = true;
      /*  Initialize of parameters */
      memset(&points[0], 0, 115200U * sizeof(float));
      c_i = 1.0F;
    } else {
      guard1 = true;
    }
  } else {
    guard1 = true;
  }
  if (guard1) {
    /*  Save [x,y,z] coordinates in packet unless it's an end frame */
    xy = (c_i - 1.0F) * 128.0F;
    if (rtIsNaNF(xy + 1.0F) || rtIsNaNF(xy + 128.0F)) {
      j = vec->size[0] * vec->size[1];
      vec->size[0] = 1;
      vec->size[1] = 1;
      emxEnsureCapacity_real32_T(vec, j);
      xyzCoords_data = vec->data;
      xyzCoords_data[0] = rtNaNF;
    } else if (xy + 128.0F < xy + 1.0F) {
      vec->size[0] = 1;
      vec->size[1] = 0;
    } else if ((rtIsInfF(xy + 1.0F) || rtIsInfF(xy + 128.0F)) &&
               (xy + 1.0F == xy + 128.0F)) {
      j = vec->size[0] * vec->size[1];
      vec->size[0] = 1;
      vec->size[1] = 1;
      emxEnsureCapacity_real32_T(vec, j);
      xyzCoords_data = vec->data;
      xyzCoords_data[0] = rtNaNF;
    } else {
      f = floorf(xy + 1.0F);
      if (f == xy + 1.0F) {
        if ((fabsf(xy + 1.0F) >= 1.07374182E+9F) ||
            (fabsf(xy + 128.0F) >= 1.07374182E+9F)) {
          j = vec->size[0] * vec->size[1];
          vec->size[0] = 1;
          nm1d2 = (int)((double)(xy + 128.0F) - (xy + 1.0F));
          vec->size[1] = nm1d2 + 1;
          emxEnsureCapacity_real32_T(vec, j);
          xyzCoords_data = vec->data;
          for (j = 0; j <= nm1d2; j++) {
            xyzCoords_data[j] = (float)((xy + 1.0F) + (double)j);
          }
        } else {
          nm1d2 = (int)truncf(xy + 128.0F) - (int)f;
          j = vec->size[0] * vec->size[1];
          vec->size[0] = 1;
          vec->size[1] = nm1d2 + 1;
          emxEnsureCapacity_real32_T(vec, j);
          xyzCoords_data = vec->data;
          for (ToF_tmp = 0; ToF_tmp <= nm1d2; ToF_tmp++) {
            xyzCoords_data[ToF_tmp] = (float)((int)f + ToF_tmp);
          }
        }
      } else {
        double apnd;
        double cdiff;
        double ndbl;
        ndbl = floor(((double)(xy + 128.0F) - (xy + 1.0F)) + 0.5);
        apnd = (xy + 1.0F) + ndbl;
        cdiff = apnd - (xy + 128.0F);
        if (fabs(cdiff) <
            2.384185791015625E-7 * fmax(fabs(xy + 1.0F), fabs(xy + 128.0F))) {
          ndbl++;
          delta_tmp_tmp = xy + 128.0F;
        } else if (cdiff > 0.0) {
          delta_tmp_tmp = (float)((xy + 1.0F) + (ndbl - 1.0));
        } else {
          ndbl++;
          delta_tmp_tmp = (float)apnd;
        }
        if (ndbl >= 0.0) {
          b_i = (int)ndbl;
        } else {
          b_i = 0;
        }
        j = vec->size[0] * vec->size[1];
        vec->size[0] = 1;
        vec->size[1] = b_i;
        emxEnsureCapacity_real32_T(vec, j);
        xyzCoords_data = vec->data;
        if (b_i > 0) {
          xyzCoords_data[0] = xy + 1.0F;
          if (b_i > 1) {
            xyzCoords_data[b_i - 1] = delta_tmp_tmp;
            nm1d2 = (b_i - 1) / 2;
            for (ToF_tmp = 0; ToF_tmp <= nm1d2 - 2; ToF_tmp++) {
              xyzCoords_data[ToF_tmp + 1] = (xy + 1.0F) + (float)(ToF_tmp + 1);
              xyzCoords_data[(b_i - ToF_tmp) - 2] =
                  delta_tmp_tmp - (float)(ToF_tmp + 1);
            }
            if (nm1d2 << 1 == b_i - 1) {
              xyzCoords_data[nm1d2] = ((xy + 1.0F) + delta_tmp_tmp) / 2.0F;
            } else {
              xyzCoords_data[nm1d2] = (xy + 1.0F) + (float)nm1d2;
              xyzCoords_data[nm1d2 + 1] = delta_tmp_tmp - (float)nm1d2;
            }
          }
        }
      }
    }
    j = r->size[0];
    r->size[0] = vec->size[1];
    emxEnsureCapacity_uint16_T(r, j);
    r1 = r->data;
    nm1d2 = vec->size[1];
    for (j = 0; j < nm1d2; j++) {
      r1[j] = (unsigned short)((unsigned short)xyzCoords_data[j] - 1U);
    }
    b_i = r->size[0];
    nm1d2 = r->size[0];
    for (j = 0; j < 3; j++) {
      for (ToF_tmp = 0; ToF_tmp < nm1d2; ToF_tmp++) {
        points[r1[ToF_tmp] + 38400 * j] = xyzPoints[ToF_tmp + b_i * j];
      }
    }
    c_i++;
    /*  Return empty matrix for 1 frame and set the return flag to false */
    xyzCoords->size[0] = 0;
    xyzCoords->size[1] = 0;
    *isValid = false;
  }
  emxFree_real32_T(&vec);
  emxFree_uint16_T(&r);
}

/*
 * Initialize of persistent parameters
 *
 * Arguments    : void
 * Return Type  : void
 */
void AutoL_parsing_init(void)
{
  points_not_empty = false;
}

/*
 * File trailer for AutoL_parsing.c
 *
 * [EOF]
 */
