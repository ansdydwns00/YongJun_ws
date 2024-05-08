/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: AutoL_parsing.c
 *
 * MATLAB Coder version            : 23.2
 * C/C++ source code generated on  : 08-May-2024 17:20:00
 */

/* Include Files */
#include "AutoL_parsing.h"
#include "AutoL_parsing_data.h"
#include "AutoL_parsing_emxutil.h"
#include "AutoL_parsing_initialize.h"
#include "AutoL_parsing_types.h"
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
  static const double dv[4] = {-0.038388791, -0.104694693, -0.00523584,
                               -0.071541742};
  static double c_i;
  static float points[68352];
  double elevation[16];
  double z_tmp;
  float xyzPoints[384];
  float ToF[128];
  float azimuth_data[8];
  float f;
  float xy;
  float *xyzCoords_data;
  int ToF_tmp;
  int b_i;
  int i;
  int j;
  unsigned char top_bottom_flag;
  boolean_T guard1;
  if (!isInitialized_AutoL_parsing) {
    AutoL_parsing_initialize();
  }
  if ((!points_not_empty) || (reset_flag == 0.0F)) {
    memset(&points[0], 0, 68352U * sizeof(float));
    points_not_empty = true;
    c_i = 1.0;
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
    for (i = 0; i < 16; i++) {
      elevation[i] = 0.625 * (double)i - 4.84375;
    }
  } else {
    for (i = 0; i < 16; i++) {
      elevation[i] = 0.625 * (double)i - 4.53125;
    }
  }
  /*  Apply azimuth offset to calculate precise azimuth */
  /*  Values for azimuth (3 echo mode) */
  for (i = 0; i < 8; i++) {
    azimuth_data[i] = 0.0F;
  }
  for (b_i = 0; b_i < 8; b_i++) {
    i = b_i * 3;
    f = packetData[i * 54 + 30] + 256.0F * packetData[i * 54 + 31];
    xy = (f + 65536.0F * packetData[i * 54 + 32]) +
         1.6777216E+7F * packetData[i * 54 + 33];
    if (xy > 2.147483647E+9) {
      azimuth_data[(int)((double)i / 3.0 + 1.0) - 1] = (f - 65535.0F) / 1000.0F;
    } else {
      azimuth_data[(int)((double)i / 3.0 + 1.0) - 1] = xy / 1000.0F;
    }
  }
  /*  ToF for azimuth [8*16] */
  memset(&ToF[0], 0, 128U * sizeof(float));
  for (b_i = 0; b_i < 8; b_i++) {
    for (j = 0; j < 16; j++) {
      i = j * 3;
      ToF_tmp = b_i * 54 * 3 + i;
      ToF[(int)(((double)b_i * 16.0 + (double)i / 3.0) + 1.0) - 1] =
          (packetData[ToF_tmp + 34] + 256.0F * packetData[ToF_tmp + 35]) /
          256.0F;
    }
  }
  /*  Rearrangement ToF [16 x 8]  */
  /*  Finding coordinates [x,y,z] */
  for (b_i = 0; b_i < 8; b_i++) {
    for (j = 0; j < 16; j++) {
      float x_tmp;
      z_tmp = 0.017453292519943295 * elevation[j];
      i = j + (b_i << 4);
      f = ToF[i];
      xy = f * (float)cos(z_tmp);
      x_tmp = 0.0174532924F *
              (azimuth_data[b_i] + (float)dv[(int)floor((double)j / 4.0)]);
      xyzPoints[i] = xy * cosf(x_tmp);
      xyzPoints[i + 128] = xy * sinf(x_tmp);
      xyzPoints[i + 256] = f * (float)sin(z_tmp);
    }
  }
  /*  Check End frame packet */
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
      i = xyzCoords->size[0] * xyzCoords->size[1];
      xyzCoords->size[0] = 22784;
      xyzCoords->size[1] = 3;
      emxEnsureCapacity_real32_T(xyzCoords, i);
      xyzCoords_data = xyzCoords->data;
      for (i = 0; i < 68352; i++) {
        xyzCoords_data[i] = points[i];
      }
      *isValid = true;
      /*  Initialize of parameters */
      c_i = 1.0;
      memset(&points[0], 0, 68352U * sizeof(float));
    } else {
      guard1 = true;
    }
  } else {
    guard1 = true;
  }
  if (guard1) {
    /*  Save [x,y,z] coordinates in packet unless it's an end frame */
    z_tmp = (c_i - 1.0) * 128.0 + 1.0;
    for (i = 0; i < 3; i++) {
      for (ToF_tmp = 0; ToF_tmp < 128; ToF_tmp++) {
        points[((int)(z_tmp + (double)ToF_tmp) + 22784 * i) - 1] =
            xyzPoints[ToF_tmp + (i << 7)];
      }
    }
    c_i++;
    /*  Return empty matrix for 1 frame and set the return flag to false */
    xyzCoords->size[0] = 0;
    xyzCoords->size[1] = 0;
    *isValid = false;
  }
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
