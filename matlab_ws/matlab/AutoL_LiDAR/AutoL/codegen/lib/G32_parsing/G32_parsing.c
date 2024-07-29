/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: G32_parsing.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 29-Jul-2024 12:55:51
 */

/* Include Files */
#include "G32_parsing.h"
#include "G32_parsing_data.h"
#include "G32_parsing_emxutil.h"
#include "G32_parsing_initialize.h"
#include "G32_parsing_types.h"
#include "colon.h"
#include "rt_nonfinite.h"
#include "rt_nonfinite.h"
#include <math.h>
#include <string.h>

/* Variable Definitions */
static bool points_not_empty;

/* Function Definitions */
/*
 * Use persistent variables to store point cloud values ​​for one frame
 *
 * Arguments    : const float packetData[1330]
 *                float reset_flag
 *                emxArray_real32_T *xyzCoords
 *                emxArray_real32_T *xyzIntensity
 *                bool *isValid
 * Return Type  : void
 */
void G32_parsing(const float packetData[1330], float reset_flag,
                 emxArray_real32_T *xyzCoords, emxArray_real32_T *xyzIntensity,
                 bool *isValid)
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
  static float points[68352];
  static float Intensity[22784];
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
  static const short iv4[128] = {
      8,    11,   14,   17,   20,   23,   26,   29,   32,   35,   38,   41,
      44,   47,   50,   53,   170,  173,  176,  179,  182,  185,  188,  191,
      194,  197,  200,  203,  206,  209,  212,  215,  332,  335,  338,  341,
      344,  347,  350,  353,  356,  359,  362,  365,  368,  371,  374,  377,
      494,  497,  500,  503,  506,  509,  512,  515,  518,  521,  524,  527,
      530,  533,  536,  539,  656,  659,  662,  665,  668,  671,  674,  677,
      680,  683,  686,  689,  692,  695,  698,  701,  818,  821,  824,  827,
      830,  833,  836,  839,  842,  845,  848,  851,  854,  857,  860,  863,
      980,  983,  986,  989,  992,  995,  998,  1001, 1004, 1007, 1010, 1013,
      1016, 1019, 1022, 1025, 1142, 1145, 1148, 1151, 1154, 1157, 1160, 1163,
      1166, 1169, 1172, 1175, 1178, 1181, 1184, 1187};
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
  emxArray_int16_T *r;
  emxArray_real32_T *vec;
  float ToF[128];
  float ang[128];
  float b_fcnOutput[128];
  float xy[128];
  float xy_tmp[128];
  float azimuth[32];
  float elevation[16];
  float azimuth_data[8];
  float fcnOutput[8];
  float fcnOutput_data[8];
  float f;
  float out_tmp;
  float *xyzCoords_data;
  int i;
  int k;
  int trueCount;
  int xj;
  int xoffset;
  short *r1;
  signed char b_tmp_data[8];
  signed char tmp_data[8];
  unsigned char top_bottom_flag;
  bool guard1;
  if (!isInitialized_G32_parsing) {
    G32_parsing_initialize();
  }
  /*  Initialize of persistent parameters */
  /*  1 frame = 178 packets */
  /*  First starting(isempty(points)) and Restarting(reset_flag == 0) */
  if ((!points_not_empty) || (reset_flag == 0.0F)) {
    memset(&points[0], 0, 68352U * sizeof(float));
    points_not_empty = true;
    memset(&Intensity[0], 0, 22784U * sizeof(float));
    b_i = 1.0F;
  }
  /*  Extract one packet */
  /* ---------------------------------------------------------------------% */
  /*  LOWER FRAME(0): 1~16 channels */
  /*  UPPER FRAME(1): 17~32 channels */
  /*  Split into "Payload Header(28 btyes)" and "Payload(1302 bytes)" (UDP
   * Header(42 bytes)is received truncated.) */
  /*  Extracts distinction flags for upper/lower frames and data type
   * information of packets */
  /* ---------------------------------------------------------------------% */
  /*  [1 x 28] */
  /*  [1 x 1296], Except for Timestamp(4 bytes), ProductID(2 bytes)   */
  /*  To check the UPPER(1) and LOWER frames(0) */
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
  /*  [01(1) = continue OR AA(170) = terminate OR CC(204) = error, A5(165),
   * B3(179), C2(194)] */
  /*  Extract [x,y,z] coordinates for one packet  */
  /* ---------------------------------------------------------------------- */
  /*  Azimuth(4 bytes):  */
  /*  - Basically set to 3echo mode (3 of the 24 data blocks included in the
   * packet are configured with the same azimuth) */
  /*  - Raw Data [-67500,67500], and dividing this value by 1000 converts it
   * into azimuth (degree) */
  /*  ToF(2 bytes):  */
  /*  - Raw Data [0,65535], and dividing this value by 256 and replace it with
   * the distance value (m). */
  /* ---------------------------------------------------------------------- */
  /*  Lower Frame(0, 1~16ch) */
  /*  Upper Frame(1, 17~32ch) */
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
  /*  Azimuth calculation (3 echo mode) */
  for (xj = 0; xj < 8; xj++) {
    azimuth_data[xj] = 0.0F;
    f = packetData[162 * xj + 30];
    azimuth[xj] = f;
    azimuth[xj + 8] = 256.0F * packetData[162 * xj + 31];
    azimuth[xj + 16] = 65536.0F * packetData[162 * xj + 32];
    azimuth[xj + 24] = 1.6777216E+7F * packetData[162 * xj + 33];
    fcnOutput[xj] = f;
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
  /*  ToF calculation for azimuth [8*16] */
  /*  Intensity calculation */
  /*  Finding coordinates [x,y,z] */
  for (k = 0; k < 128; k++) {
    f = (packetData[iv[k] + 28] + 256.0F * packetData[iv1[k] + 28]) / 256.0F;
    ToF[k] = f;
    out_tmp = 0.0174532924F * elevation[iv2[k]];
    xy[k] = f * cosf(out_tmp);
    f = 0.0174532924F * (azimuth_data[iv3[k]] + fv[k]);
    b_fcnOutput[k] = cosf(f);
    f = sinf(f);
    ang[k] = f;
    out_tmp = sinf(out_tmp);
    xy_tmp[k] = out_tmp;
  }
  /*  Check End frame packet */
  emxInit_int16_T(&r);
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
      i = xyzCoords->size[0] * xyzCoords->size[1];
      xyzCoords->size[0] = 22784;
      xyzCoords->size[1] = 3;
      emxEnsureCapacity_real32_T(xyzCoords, i);
      xyzCoords_data = xyzCoords->data;
      for (i = 0; i < 68352; i++) {
        xyzCoords_data[i] = points[i];
      }
      i = xyzIntensity->size[0] * xyzIntensity->size[1];
      xyzIntensity->size[0] = 22784;
      xyzIntensity->size[1] = 1;
      emxEnsureCapacity_real32_T(xyzIntensity, i);
      xyzCoords_data = xyzIntensity->data;
      for (i = 0; i < 22784; i++) {
        xyzCoords_data[i] = Intensity[i];
      }
      *isValid = true;
      /*  Initialize of parameters */
      memset(&points[0], 0, 68352U * sizeof(float));
      memset(&Intensity[0], 0, 22784U * sizeof(float));
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
      eml_float_colon(out_tmp + 1.0F, out_tmp + 128.0F, vec);
      xyzCoords_data = vec->data;
    }
    xoffset = vec->size[1];
    i = r->size[0];
    r->size[0] = vec->size[1];
    emxEnsureCapacity_int16_T(r, i);
    r1 = r->data;
    for (i = 0; i < xoffset; i++) {
      r1[i] = (short)((short)xyzCoords_data[i] - 1);
    }
    for (i = 0; i < 128; i++) {
      f = xy[i];
      b_xy[i] = f * b_fcnOutput[i];
      b_xy[i + 128] = f * ang[i];
      b_xy[i + 256] = ToF[i] * xy_tmp[i];
    }
    trueCount = vec->size[1];
    for (i = 0; i < 3; i++) {
      for (xj = 0; xj < xoffset; xj++) {
        points[r1[xj] + 22784 * i] = b_xy[xj + trueCount * i];
      }
    }
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
      eml_float_colon(out_tmp + 1.0F, out_tmp + 128.0F, vec);
      xyzCoords_data = vec->data;
    }
    xoffset = vec->size[1];
    i = r->size[0];
    r->size[0] = vec->size[1];
    emxEnsureCapacity_int16_T(r, i);
    r1 = r->data;
    for (i = 0; i < xoffset; i++) {
      r1[i] = (short)((short)xyzCoords_data[i] - 1);
    }
    for (i = 0; i < xoffset; i++) {
      Intensity[r1[i]] = packetData[iv4[i] + 28];
    }
    b_i++;
    /*  Return empty matrix for 1 frame and set the return flag to false */
    xyzCoords->size[0] = 0;
    xyzCoords->size[1] = 0;
    xyzIntensity->size[0] = 0;
    xyzIntensity->size[1] = 0;
    *isValid = false;
  }
  emxFree_real32_T(&vec);
  emxFree_int16_T(&r);
}

/*
 * Arguments    : void
 * Return Type  : void
 */
void G32_parsing_init(void)
{
  points_not_empty = false;
}

/*
 * File trailer for G32_parsing.c
 *
 * [EOF]
 */
