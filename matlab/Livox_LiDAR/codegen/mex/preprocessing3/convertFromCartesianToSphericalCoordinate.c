/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * convertFromCartesianToSphericalCoordinate.c
 *
 * Code generation for function 'convertFromCartesianToSphericalCoordinate'
 *
 */

/* Include files */
#include "convertFromCartesianToSphericalCoordinate.h"
#include "preprocessing3_data.h"
#include "preprocessing3_emxutil.h"
#include "preprocessing3_types.h"
#include "rt_nonfinite.h"
#include "mwmathutil.h"
#include <xmmintrin.h>

/* Variable Definitions */
static emlrtRSInfo x_emlrtRSI = {
    15,                                          /* lineNo */
    "convertFromCartesianToSphericalCoordinate", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/"
    "convertFromCartesianToSphericalCoordinate.m" /* pathName */
};

static emlrtRSInfo y_emlrtRSI = {
    16,                                          /* lineNo */
    "convertFromCartesianToSphericalCoordinate", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/"
    "convertFromCartesianToSphericalCoordinate.m" /* pathName */
};

static emlrtRTEInfo b_emlrtRTEI = {
    13,                                                            /* lineNo */
    9,                                                             /* colNo */
    "sqrt",                                                        /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elfun/sqrt.m" /* pName */
};

static emlrtRTEInfo c_emlrtRTEI = {
    14,                                                            /* lineNo */
    9,                                                             /* colNo */
    "asin",                                                        /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elfun/asin.m" /* pName */
};

static emlrtRTEInfo ab_emlrtRTEI = {
    1,                                           /* lineNo */
    22,                                          /* colNo */
    "convertFromCartesianToSphericalCoordinate", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/"
    "convertFromCartesianToSphericalCoordinate.m" /* pName */
};

static emlrtRTEInfo bb_emlrtRTEI = {
    18,                                          /* lineNo */
    20,                                          /* colNo */
    "convertFromCartesianToSphericalCoordinate", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/"
    "convertFromCartesianToSphericalCoordinate.m" /* pName */
};

static emlrtRTEInfo cb_emlrtRTEI = {
    18,                                          /* lineNo */
    9,                                           /* colNo */
    "convertFromCartesianToSphericalCoordinate", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/"
    "convertFromCartesianToSphericalCoordinate.m" /* pName */
};

/* Function Definitions */
void c_convertFromCartesianToSpheric(preprocessing3StackData *SD,
                                     const emlrtStack *sp,
                                     const real32_T xyzData[172800],
                                     real32_T rangeData[172800])
{
  __m128 r;
  emlrtStack st;
  emxArray_real32_T *yaw;
  emxArray_uint16_T *r1;
  int32_T i;
  int32_T k;
  int32_T trueCount;
  real32_T f;
  real32_T *yaw_data;
  uint16_T *r2;
  boolean_T p;
  st.prev = sp;
  st.tls = sp->tls;
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtConstCTX)sp);
  for (k = 0; k <= 57596; k += 4) {
    r = _mm_loadu_ps(&xyzData[k]);
    _mm_storeu_ps(&SD->f0.range[k], _mm_mul_ps(r, r));
    r = _mm_loadu_ps(&xyzData[k + 57600]);
    _mm_storeu_ps(&SD->f0.pitch[k], _mm_mul_ps(r, r));
    r = _mm_loadu_ps(&xyzData[k + 115200]);
    _mm_storeu_ps(&SD->f0.yaw[k], _mm_mul_ps(r, r));
  }
  st.site = &x_emlrtRSI;
  p = false;
  for (k = 0; k < 57600; k++) {
    f = (SD->f0.range[k] + SD->f0.pitch[k]) + SD->f0.yaw[k];
    SD->f0.range[k] = f;
    if (p || (f < 0.0F)) {
      p = true;
    }
  }
  if (p) {
    emlrtErrorWithMessageIdR2018a(
        &st, &b_emlrtRTEI, "Coder:toolbox:ElFunDomainError",
        "Coder:toolbox:ElFunDomainError", 3, 4, 4, "sqrt");
  }
  for (k = 0; k <= 57596; k += 4) {
    r = _mm_loadu_ps(&SD->f0.range[k]);
    _mm_storeu_ps(&SD->f0.range[k], _mm_sqrt_ps(r));
  }
  for (i = 0; i < 1800; i++) {
    for (k = 0; k <= 28; k += 4) {
      trueCount = k + (i << 5);
      r = _mm_loadu_ps(&SD->f0.range[trueCount]);
      _mm_storeu_ps(&SD->f0.pitch[trueCount],
                    _mm_div_ps(_mm_loadu_ps(&xyzData[trueCount + 115200]), r));
    }
  }
  st.site = &y_emlrtRSI;
  p = false;
  for (k = 0; k < 57600; k++) {
    if (p) {
      p = true;
    } else {
      f = SD->f0.pitch[k];
      if ((f < -1.0F) || (f > 1.0F)) {
        p = true;
      }
    }
  }
  if (p) {
    emlrtErrorWithMessageIdR2018a(
        &st, &c_emlrtRTEI, "Coder:toolbox:ElFunDomainError",
        "Coder:toolbox:ElFunDomainError", 3, 4, 4, "asin");
  }
  for (k = 0; k < 57600; k++) {
    SD->f0.pitch[k] = muSingleScalarAsin(SD->f0.pitch[k]);
  }
  trueCount = 0;
  for (k = 0; k < 57600; k++) {
    f = muSingleScalarAtan2(xyzData[k], xyzData[k + 57600]);
    SD->f0.yaw[k] = f;
    if (f < 0.0F) {
      trueCount++;
    }
  }
  emxInit_uint16_T(sp, &r1, &cb_emlrtRTEI);
  i = r1->size[0];
  r1->size[0] = trueCount;
  emxEnsureCapacity_uint16_T(sp, r1, i, &ab_emlrtRTEI);
  r2 = r1->data;
  trueCount = 0;
  for (k = 0; k < 57600; k++) {
    if (SD->f0.yaw[k] < 0.0F) {
      r2[trueCount] = (uint16_T)k;
      trueCount++;
    }
  }
  trueCount = r1->size[0];
  emxInit_real32_T(sp, &yaw, 1, &bb_emlrtRTEI);
  i = yaw->size[0];
  yaw->size[0] = r1->size[0];
  emxEnsureCapacity_real32_T(sp, yaw, i, &bb_emlrtRTEI);
  yaw_data = yaw->data;
  for (i = 0; i < trueCount; i++) {
    yaw_data[i] = SD->f0.yaw[r2[i]] + 6.28318548F;
  }
  for (i = 0; i < trueCount; i++) {
    SD->f0.yaw[r2[i]] = yaw_data[i];
  }
  emxFree_real32_T(sp, &yaw);
  emxFree_uint16_T(sp, &r1);
  for (trueCount = 0; trueCount < 57600; trueCount++) {
    rangeData[trueCount] = SD->f0.range[trueCount];
    rangeData[trueCount + 57600] = SD->f0.pitch[trueCount];
    rangeData[trueCount + 115200] = SD->f0.yaw[trueCount];
  }
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtConstCTX)sp);
}

/* End of code generation (convertFromCartesianToSphericalCoordinate.c) */
