/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: AutoL_parsing.c
 *
 * MATLAB Coder version            : 23.2
 * C/C++ source code generated on  : 07-May-2024 13:08:27
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

/* Function Declarations */
static double rt_roundd_snf(double u);

/* Function Definitions */
/*
 * Arguments    : double u
 * Return Type  : double
 */
static double rt_roundd_snf(double u)
{
  double y;
  if (fabs(u) < 4.503599627370496E+15) {
    if (u >= 0.5) {
      y = floor(u + 0.5);
    } else if (u > -0.5) {
      y = u * 0.0;
    } else {
      y = ceil(u - 0.5);
    }
  } else {
    y = u;
  }
  return y;
}

/*
 * Initialize of persistent parameters
 *
 * Arguments    : const double packetData[1330]
 *                double reset_flag
 *                emxArray_real_T *xyzCoords
 *                boolean_T *isValid
 * Return Type  : void
 */
void AutoL_parsing(const double packetData[1330], double reset_flag,
                   emxArray_real_T *xyzCoords, boolean_T *isValid)
{
  static const double dv[4] = {-0.038388791, -0.104694693, -0.00523584,
                               -0.071541742};
  static double points[68352];
  static double c_i;
  double xyzPoints[384];
  double ToF[128];
  double elevation[16];
  double azimuth_data[8];
  double d;
  double z_tmp;
  double *xyzCoords_data;
  int ToF_tmp;
  int b_i;
  int i;
  int j;
  unsigned char top_bottom_flag;
  boolean_T guard1;
  if (!isInitialized_AutoL_parsing) {
    AutoL_parsing_initialize();
  }
  if ((!points_not_empty) || (reset_flag == 0.0)) {
    memset(&points[0], 0, 68352U * sizeof(double));
    points_not_empty = true;
    c_i = 1.0;
  }
  /*  Extract one packet */
  /*  Split into "Payload Header" and "Payload" (UDP Header is received
   * truncated.) */
  /*  [1 x 28] */
  /*  [1 x 1296] (Except for Timestamp, ProductID)   */
  d = rt_roundd_snf(packetData[4]);
  if (d < 256.0) {
    if (d >= 0.0) {
      top_bottom_flag = (unsigned char)d;
    } else {
      top_bottom_flag = 0U;
    }
  } else if (d >= 256.0) {
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
  memset(&azimuth_data[0], 0, 8U * sizeof(double));
  for (b_i = 0; b_i < 8; b_i++) {
    i = b_i * 3;
    d = packetData[i * 54 + 30] + 256.0 * packetData[i * 54 + 31];
    z_tmp = (d + 65536.0 * packetData[i * 54 + 32]) +
            1.6777216E+7 * packetData[i * 54 + 33];
    if (z_tmp > 2.147483647E+9) {
      azimuth_data[(int)((double)i / 3.0 + 1.0) - 1] = (d - 65535.0) / 1000.0;
    } else {
      azimuth_data[(int)((double)i / 3.0 + 1.0) - 1] = z_tmp / 1000.0;
    }
  }
  /*  ToF for azimuth [8*16] */
  memset(&ToF[0], 0, 128U * sizeof(double));
  for (b_i = 0; b_i < 8; b_i++) {
    for (j = 0; j < 16; j++) {
      i = j * 3;
      ToF_tmp = b_i * 54 * 3 + i;
      ToF[(int)(((double)b_i * 16.0 + (double)i / 3.0) + 1.0) - 1] =
          (packetData[ToF_tmp + 34] + 256.0 * packetData[ToF_tmp + 35]) / 256.0;
    }
  }
  /*  Rearrangement ToF [16 x 8]  */
  /*  Finding coordinates [x,y,z] */
  for (b_i = 0; b_i < 8; b_i++) {
    for (j = 0; j < 16; j++) {
      double x_tmp;
      double xy;
      z_tmp = 0.017453292519943295 * elevation[j];
      i = j + (b_i << 4);
      d = ToF[i];
      xy = d * cos(z_tmp);
      x_tmp = 0.017453292519943295 *
              (azimuth_data[b_i] + dv[(int)floor((double)j / 4.0)]);
      xyzPoints[i] = xy * cos(x_tmp);
      xyzPoints[i + 128] = xy * sin(x_tmp);
      xyzPoints[i + 256] = d * sin(z_tmp);
    }
  }
  /*  Check End frame packet */
  guard1 = false;
  if (top_bottom_flag == 1) {
    unsigned int u;
    d = rt_roundd_snf(packetData[5]);
    if (d < 4.294967296E+9) {
      if (d >= 0.0) {
        u = (unsigned int)d;
      } else {
        u = 0U;
      }
    } else if (d >= 4.294967296E+9) {
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
      emxEnsureCapacity_real_T(xyzCoords, i);
      xyzCoords_data = xyzCoords->data;
      for (i = 0; i < 68352; i++) {
        xyzCoords_data[i] = points[i];
      }
      *isValid = true;
      /*  Initialize of parameters */
      c_i = 1.0;
      memset(&points[0], 0, 68352U * sizeof(double));
    } else {
      guard1 = true;
    }
  } else {
    guard1 = true;
  }
  if (guard1) {
    /*  Save [x,y,z] coordinates in packet unless it's an end frame */
    d = (c_i - 1.0) * 128.0 + 1.0;
    for (i = 0; i < 3; i++) {
      for (ToF_tmp = 0; ToF_tmp < 128; ToF_tmp++) {
        points[((int)(d + (double)ToF_tmp) + 22784 * i) - 1] =
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
