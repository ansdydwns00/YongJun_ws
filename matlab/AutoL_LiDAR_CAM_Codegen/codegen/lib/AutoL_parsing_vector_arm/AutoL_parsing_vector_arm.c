/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: AutoL_parsing_vector_arm.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 28-May-2024 16:56:56
 */

/* Include Files */
#include "AutoL_parsing_vector_arm.h"
#include "AutoL_parsing_vector_arm_data.h"
#include "AutoL_parsing_vector_arm_emxutil.h"
#include "AutoL_parsing_vector_arm_initialize.h"
#include "AutoL_parsing_vector_arm_types.h"
#include "rt_nonfinite.h"
#include "rt_nonfinite.h"
#include <math.h>
#include <string.h>

/* Variable Definitions */
static bool points_not_empty;

/* Function Definitions */
/*
 * Initialize of persistent parameters
 *
 * Arguments    : const float packetData[1330]
 *                float reset_flag
 *                emxArray_real32_T *xyzCoords
 *                bool *isValid
 * Return Type  : void
 */
void AutoL_parsing_vector_arm(const float packetData[1330], float reset_flag,
                              emxArray_real32_T *xyzCoords, bool *isValid)
{
  static const float fv[128] = {
      -0.0383887924F, -0.0383887924F, -0.0383887924F, -0.0383887924F,
      -0.104694694F,  -0.104694694F,  -0.104694694F,  -0.104694694F,
      -0.00523584F,   -0.00523584F,   -0.00523584F,   -0.00523584F,
      -0.0715417415F, -0.0715417415F, -0.0715417415F, -0.0715417415F,
      -0.0383887924F, -0.0383887924F, -0.0383887924F, -0.0383887924F,
      -0.104694694F,  -0.104694694F,  -0.104694694F,  -0.104694694F,
      -0.00523584F,   -0.00523584F,   -0.00523584F,   -0.00523584F,
      -0.0715417415F, -0.0715417415F, -0.0715417415F, -0.0715417415F,
      -0.0383887924F, -0.0383887924F, -0.0383887924F, -0.0383887924F,
      -0.104694694F,  -0.104694694F,  -0.104694694F,  -0.104694694F,
      -0.00523584F,   -0.00523584F,   -0.00523584F,   -0.00523584F,
      -0.0715417415F, -0.0715417415F, -0.0715417415F, -0.0715417415F,
      -0.0383887924F, -0.0383887924F, -0.0383887924F, -0.0383887924F,
      -0.104694694F,  -0.104694694F,  -0.104694694F,  -0.104694694F,
      -0.00523584F,   -0.00523584F,   -0.00523584F,   -0.00523584F,
      -0.0715417415F, -0.0715417415F, -0.0715417415F, -0.0715417415F,
      -0.0383887924F, -0.0383887924F, -0.0383887924F, -0.0383887924F,
      -0.104694694F,  -0.104694694F,  -0.104694694F,  -0.104694694F,
      -0.00523584F,   -0.00523584F,   -0.00523584F,   -0.00523584F,
      -0.0715417415F, -0.0715417415F, -0.0715417415F, -0.0715417415F,
      -0.0383887924F, -0.0383887924F, -0.0383887924F, -0.0383887924F,
      -0.104694694F,  -0.104694694F,  -0.104694694F,  -0.104694694F,
      -0.00523584F,   -0.00523584F,   -0.00523584F,   -0.00523584F,
      -0.0715417415F, -0.0715417415F, -0.0715417415F, -0.0715417415F,
      -0.0383887924F, -0.0383887924F, -0.0383887924F, -0.0383887924F,
      -0.104694694F,  -0.104694694F,  -0.104694694F,  -0.104694694F,
      -0.00523584F,   -0.00523584F,   -0.00523584F,   -0.00523584F,
      -0.0715417415F, -0.0715417415F, -0.0715417415F, -0.0715417415F,
      -0.0383887924F, -0.0383887924F, -0.0383887924F, -0.0383887924F,
      -0.104694694F,  -0.104694694F,  -0.104694694F,  -0.104694694F,
      -0.00523584F,   -0.00523584F,   -0.00523584F,   -0.00523584F,
      -0.0715417415F, -0.0715417415F, -0.0715417415F, -0.0715417415F};
  static float points[115200];
  static float b_i;
  static const short iv[128] = {
      6,    9,    12,   15,   18,   21,   24,   27,   30,   33,   36,   39,
      42,   45,   48,   51,   168,  171,  174,  177,  180,  183,  186,  189,
      192,  195,  198,  201,  204,  207,  210,  213,  330,  333,  336,  339,
      342,  345,  348,  351,  354,  357,  360,  363,  366,  369,  372,  375,
      492,  495,  498,  501,  504,  507,  510,  513,  516,  519,  522,  525,
      528,  531,  534,  537,  654,  657,  660,  663,  666,  669,  672,  675,
      678,  681,  684,  687,  690,  693,  696,  699,  816,  819,  822,  825,
      828,  831,  834,  837,  840,  843,  846,  849,  852,  855,  858,  861,
      978,  981,  984,  987,  990,  993,  996,  999,  1002, 1005, 1008, 1011,
      1014, 1017, 1020, 1023, 1140, 1143, 1146, 1149, 1152, 1155, 1158, 1161,
      1164, 1167, 1170, 1173, 1176, 1179, 1182, 1185};
  static const short iv1[128] = {
      7,    10,   13,   16,   19,   22,   25,   28,   31,   34,   37,   40,
      43,   46,   49,   52,   169,  172,  175,  178,  181,  184,  187,  190,
      193,  196,  199,  202,  205,  208,  211,  214,  331,  334,  337,  340,
      343,  346,  349,  352,  355,  358,  361,  364,  367,  370,  373,  376,
      493,  496,  499,  502,  505,  508,  511,  514,  517,  520,  523,  526,
      529,  532,  535,  538,  655,  658,  661,  664,  667,  670,  673,  676,
      679,  682,  685,  688,  691,  694,  697,  700,  817,  820,  823,  826,
      829,  832,  835,  838,  841,  844,  847,  850,  853,  856,  859,  862,
      979,  982,  985,  988,  991,  994,  997,  1000, 1003, 1006, 1009, 1012,
      1015, 1018, 1021, 1024, 1141, 1144, 1147, 1150, 1153, 1156, 1159, 1162,
      1165, 1168, 1171, 1174, 1177, 1180, 1183, 1186};
  static const signed char iv2[128] = {
      0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
      0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
      0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
      0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
      0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
      0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
      0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
      0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
  static const signed char iv3[128] = {
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
      2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4,
      4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5,
      5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
      6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7};
  emxArray_real32_T *vec;
  emxArray_uint16_T *r;
  float ToF[128];
  float ang[128];
  float b_fcnOutput[128];
  float c_fcnOutput[128];
  float xy[128];
  float azimuth[32];
  float elevation[16];
  float azimuth_data[8];
  float fcnOutput[8];
  float fcnOutput_data[8];
  float b1;
  float out_tmp;
  float *xyzCoords_data;
  int i;
  int k;
  int trueCount;
  int xj;
  int xoffset;
  unsigned short *r1;
  signed char b_tmp_data[8];
  signed char tmp_data[8];
  unsigned char top_bottom_flag;
  bool guard1;
  if (!isInitialized_AutoL_parsing_vector_arm) {
    AutoL_parsing_vector_arm_initialize();
  }
  if ((!points_not_empty) || (reset_flag == 0.0F)) {
    memset(&points[0], 0, 115200U * sizeof(float));
    points_not_empty = true;
    b_i = 1.0F;
  }
  /*  Extract one packet */
  /*  Split into "Payload Header" and "Payload" (UDP Header is received
   * truncated.) */
  /*  [1 x 28] */
  /*  [1 x 1296] (Except for Timestamp, ProductID)   */
  out_tmp = roundf(packetData[4]);
  if (out_tmp < 256.0F) {
    if (out_tmp >= 0.0F) {
      top_bottom_flag = (unsigned char)out_tmp;
    } else {
      top_bottom_flag = 0U;
    }
  } else if (out_tmp >= 256.0F) {
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
      elevation[i] = 0.625F * (float)i - 4.84375F;
    }
  } else {
    for (i = 0; i < 16; i++) {
      elevation[i] = 0.625F * (float)i - 4.53125F;
    }
  }
  /*  Apply azimuth offset to calculate precise azimuth */
  /*  Values for azimuth (3 echo mode) */
  for (xj = 0; xj < 8; xj++) {
    azimuth_data[xj] = 0.0F;
    out_tmp = packetData[162 * xj + 30];
    azimuth[xj] = out_tmp;
    azimuth[xj + 8] = 256.0F * packetData[162 * xj + 31];
    azimuth[xj + 16] = 65536.0F * packetData[162 * xj + 32];
    azimuth[xj + 24] = 1.6777216E+7F * packetData[162 * xj + 33];
    fcnOutput[xj] = out_tmp;
  }
  for (k = 0; k < 3; k++) {
    xoffset = (k + 1) << 3;
    for (xj = 0; xj < 8; xj++) {
      fcnOutput[xj] += azimuth[xoffset + xj];
    }
  }
  trueCount = 0;
  xoffset = 0;
  for (xj = 0; xj < 8; xj++) {
    if (!(fcnOutput[xj] <= 2.147483647E+9)) {
      trueCount++;
      tmp_data[xoffset] = (signed char)xj;
      xoffset++;
    }
  }
  if (trueCount == 0) {
    trueCount = 0;
  } else {
    for (xj = 0; xj < trueCount; xj++) {
      i = trueCount + xj;
      fcnOutput_data[xj] =
          azimuth[tmp_data[xj % trueCount] + ((xj / trueCount) << 3)] +
          azimuth[tmp_data[i % trueCount] + ((i / trueCount) << 3)];
    }
  }
  for (i = 0; i < trueCount; i++) {
    azimuth_data[tmp_data[i]] = (fcnOutput_data[i] - 65535.0F) / 1000.0F;
  }
  trueCount = 0;
  xoffset = 0;
  for (xj = 0; xj < 8; xj++) {
    if (fcnOutput[xj] <= 2.147483647E+9) {
      trueCount++;
      b_tmp_data[xoffset] = (signed char)xj;
      xoffset++;
    }
  }
  if (trueCount == 0) {
    trueCount = 0;
  } else {
    for (xj = 0; xj < trueCount; xj++) {
      fcnOutput_data[xj] =
          azimuth[b_tmp_data[xj % trueCount] + ((xj / trueCount) << 3)];
    }
    for (k = 0; k < 3; k++) {
      xoffset = (k + 1) * trueCount;
      for (xj = 0; xj < trueCount; xj++) {
        i = xoffset + xj;
        fcnOutput_data[xj] +=
            azimuth[b_tmp_data[i % trueCount] + ((i / trueCount) << 3)];
      }
    }
  }
  for (i = 0; i < trueCount; i++) {
    azimuth_data[b_tmp_data[i]] = fcnOutput_data[i] / 1000.0F;
  }
  /*  ToF for azimuth [24*16] */
  /*  Intensity = payload(9+i*3+(floor(i/16)*114)); */
  /*  Finding coordinates [x,y,z] */
  for (k = 0; k < 128; k++) {
    out_tmp =
        (packetData[iv[k] + 28] + 256.0F * packetData[iv1[k] + 28]) / 256.0F;
    ToF[k] = out_tmp;
    b1 = 0.0174532924F * elevation[iv2[k]];
    b_fcnOutput[k] = sinf(b1);
    b1 = cosf(b1);
    b1 *= out_tmp;
    xy[k] = b1;
    out_tmp = 0.0174532924F * (azimuth_data[iv3[k]] + fv[k]);
    c_fcnOutput[k] = cosf(out_tmp);
    out_tmp = sinf(out_tmp);
    ang[k] = out_tmp;
  }
  /*  Check End frame packet */
  emxInit_uint16_T(&r);
  emxInit_real32_T(&vec, 2);
  xyzCoords_data = vec->data;
  guard1 = false;
  if (top_bottom_flag == 1) {
    unsigned int u;
    out_tmp = roundf(packetData[5]);
    if (out_tmp < 4.2949673E+9F) {
      if (out_tmp >= 0.0F) {
        u = (unsigned int)out_tmp;
      } else {
        u = 0U;
      }
    } else if (out_tmp >= 4.2949673E+9F) {
      u = MAX_uint32_T;
    } else {
      u = 0U;
    }
    if (u == 170U) {
      /*  Return [x,y,z] coordinates for 1 frame and set the return flag to true
       */
      i = xyzCoords->size[0] * xyzCoords->size[1];
      xyzCoords->size[0] = 38400;
      xyzCoords->size[1] = 3;
      emxEnsureCapacity_real32_T(xyzCoords, i);
      xyzCoords_data = xyzCoords->data;
      for (i = 0; i < 115200; i++) {
        xyzCoords_data[i] = points[i];
      }
      *isValid = true;
      /*  Initialize of parameters */
      memset(&points[0], 0, 115200U * sizeof(float));
      b_i = 1.0F;
    } else {
      guard1 = true;
    }
  } else {
    guard1 = true;
  }
  if (guard1) {
    float b_xy[384];
    /*  Save [x,y,z] coordinates in packet unless it's an end frame */
    out_tmp = (b_i - 1.0F) * 128.0F;
    if (out_tmp + 128.0F < out_tmp + 1.0F) {
      vec->size[0] = 1;
      vec->size[1] = 0;
    } else if ((rtIsInfF(out_tmp + 1.0F) || rtIsInfF(out_tmp + 128.0F)) &&
               (out_tmp + 1.0F == out_tmp + 128.0F)) {
      i = vec->size[0] * vec->size[1];
      vec->size[0] = 1;
      vec->size[1] = 1;
      emxEnsureCapacity_real32_T(vec, i);
      xyzCoords_data = vec->data;
      xyzCoords_data[0] = rtNaNF;
    } else if (out_tmp + 1.0F == out_tmp + 1.0F) {
      if ((out_tmp + 1.0F >= 1.07374182E+9F) ||
          (out_tmp + 128.0F >= 1.07374182E+9F)) {
        i = vec->size[0] * vec->size[1];
        vec->size[0] = 1;
        xoffset = (int)((double)(out_tmp + 128.0F) - (out_tmp + 1.0F));
        vec->size[1] = xoffset + 1;
        emxEnsureCapacity_real32_T(vec, i);
        xyzCoords_data = vec->data;
        for (i = 0; i <= xoffset; i++) {
          xyzCoords_data[i] = (float)((out_tmp + 1.0F) + (double)i);
        }
      } else {
        xoffset = (int)floorf(out_tmp + 1.0F);
        trueCount = (int)floorf(out_tmp + 128.0F) - xoffset;
        i = vec->size[0] * vec->size[1];
        vec->size[0] = 1;
        vec->size[1] = trueCount + 1;
        emxEnsureCapacity_real32_T(vec, i);
        xyzCoords_data = vec->data;
        for (k = 0; k <= trueCount; k++) {
          xyzCoords_data[k] = (float)(xoffset + k);
        }
      }
    } else {
      double apnd;
      double cdiff;
      double ndbl;
      ndbl = floor(((double)(out_tmp + 128.0F) - (out_tmp + 1.0F)) + 0.5);
      apnd = (out_tmp + 1.0F) + ndbl;
      cdiff = apnd - (out_tmp + 128.0F);
      if (fabs(cdiff) < 2.384185791015625E-7 * fmax(fabs(out_tmp + 1.0F),
                                                    fabs(out_tmp + 128.0F))) {
        ndbl++;
        b1 = out_tmp + 128.0F;
      } else if (cdiff > 0.0) {
        b1 = (float)((out_tmp + 1.0F) + (ndbl - 1.0));
      } else {
        ndbl++;
        b1 = (float)apnd;
      }
      if (ndbl >= 0.0) {
        trueCount = (int)ndbl;
      } else {
        trueCount = 0;
      }
      i = vec->size[0] * vec->size[1];
      vec->size[0] = 1;
      vec->size[1] = trueCount;
      emxEnsureCapacity_real32_T(vec, i);
      xyzCoords_data = vec->data;
      if (trueCount > 0) {
        xyzCoords_data[0] = out_tmp + 1.0F;
        if (trueCount > 1) {
          xyzCoords_data[trueCount - 1] = b1;
          xoffset = (trueCount - 1) / 2;
          for (k = 0; k <= xoffset - 2; k++) {
            xyzCoords_data[k + 1] = (out_tmp + 1.0F) + (float)(k + 1);
            xyzCoords_data[(trueCount - k) - 2] = b1 - (float)(k + 1);
          }
          if (xoffset << 1 == trueCount - 1) {
            xyzCoords_data[xoffset] = ((out_tmp + 1.0F) + b1) / 2.0F;
          } else {
            xyzCoords_data[xoffset] = (out_tmp + 1.0F) + (float)xoffset;
            xyzCoords_data[xoffset + 1] = b1 - (float)xoffset;
          }
        }
      }
    }
    xoffset = vec->size[1];
    i = r->size[0];
    r->size[0] = vec->size[1];
    emxEnsureCapacity_uint16_T(r, i);
    r1 = r->data;
    for (i = 0; i < xoffset; i++) {
      r1[i] = (unsigned short)((unsigned short)xyzCoords_data[i] - 1U);
    }
    for (i = 0; i < 128; i++) {
      out_tmp = xy[i];
      b_xy[i] = out_tmp * c_fcnOutput[i];
      b_xy[i + 128] = out_tmp * ang[i];
      b_xy[i + 256] = ToF[i] * b_fcnOutput[i];
    }
    trueCount = vec->size[1];
    for (i = 0; i < 3; i++) {
      for (xj = 0; xj < xoffset; xj++) {
        points[r1[xj] + 38400 * i] = b_xy[xj + trueCount * i];
      }
    }
    b_i++;
    /*  disp(i) */
    /*  Return empty matrix for 1 frame and set the return flag to false */
    xyzCoords->size[0] = 0;
    xyzCoords->size[1] = 0;
    *isValid = false;
  }
  emxFree_real32_T(&vec);
  emxFree_uint16_T(&r);
}

/*
 * Arguments    : void
 * Return Type  : void
 */
void AutoL_parsing_vector_arm_init(void)
{
  points_not_empty = false;
}

/*
 * File trailer for AutoL_parsing_vector_arm.c
 *
 * [EOF]
 */
