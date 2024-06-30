/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * validateAndParseRansacInputs.c
 *
 * Code generation for function 'validateAndParseRansacInputs'
 *
 */

/* Include files */
#include "validateAndParseRansacInputs.h"
#include "preprocessing2_data.h"
#include "rt_nonfinite.h"
#include "mwmathutil.h"

/* Variable Definitions */
static emlrtRSInfo jc_emlrtRSI = {
    188,                /* lineNo */
    "checkMaxDistance", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "validateAndParseRansacInputs.m" /* pathName */
};

static emlrtRSInfo kc_emlrtRSI = {
    194,                    /* lineNo */
    "checkReferenceVector", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "validateAndParseRansacInputs.m" /* pathName */
};

static emlrtRSInfo lc_emlrtRSI = {
    196,                    /* lineNo */
    "checkReferenceVector", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "validateAndParseRansacInputs.m" /* pathName */
};

static emlrtRSInfo mc_emlrtRSI = {
    202,                       /* lineNo */
    "checkMaxAngularDistance", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "validateAndParseRansacInputs.m" /* pathName */
};

static emlrtRTEInfo k_emlrtRTEI = {
    14,               /* lineNo */
    37,               /* colNo */
    "validatenonnan", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/+valattr/"
    "validatenonnan.m" /* pName */
};

static emlrtRTEInfo m_emlrtRTEI = {
    14,                    /* lineNo */
    37,                    /* colNo */
    "validatenonnegative", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/+valattr/"
    "validatenonnegative.m" /* pName */
};

/* Function Definitions */
void checkMaxAngularDistance(const emlrtStack *sp, real32_T b_value)
{
  emlrtStack b_st;
  emlrtStack st;
  st.prev = sp;
  st.tls = sp->tls;
  st.site = &mc_emlrtRSI;
  b_st.prev = &st;
  b_st.tls = st.tls;
  b_st.site = &hc_emlrtRSI;
  if (muSingleScalarIsNaN(b_value)) {
    emlrtErrorWithMessageIdR2018a(
        &b_st, &k_emlrtRTEI, "Coder:toolbox:ValidateattributesexpectedNonNaN",
        "MATLAB:pcfitplane:expectedNonNaN", 3, 4, 18, "maxAngularDistance");
  }
  b_st.site = &hc_emlrtRSI;
  if (muSingleScalarIsInf(b_value)) {
    emlrtErrorWithMessageIdR2018a(
        &b_st, &l_emlrtRTEI, "Coder:toolbox:ValidateattributesexpectedFinite",
        "MATLAB:pcfitplane:expectedFinite", 3, 4, 18, "maxAngularDistance");
  }
  b_st.site = &hc_emlrtRSI;
  if (b_value < 0.0F) {
    emlrtErrorWithMessageIdR2018a(
        &b_st, &m_emlrtRTEI,
        "Coder:toolbox:ValidateattributesexpectedNonnegative",
        "MATLAB:pcfitplane:expectedNonnegative", 3, 4, 18,
        "maxAngularDistance");
  }
}

void checkMaxDistance(const emlrtStack *sp, real32_T b_value)
{
  emlrtStack b_st;
  emlrtStack st;
  st.prev = sp;
  st.tls = sp->tls;
  st.site = &jc_emlrtRSI;
  b_st.prev = &st;
  b_st.tls = st.tls;
  b_st.site = &hc_emlrtRSI;
  if (muSingleScalarIsNaN(b_value)) {
    emlrtErrorWithMessageIdR2018a(
        &b_st, &k_emlrtRTEI, "Coder:toolbox:ValidateattributesexpectedNonNaN",
        "MATLAB:pcfitplane:expectedNonNaN", 3, 4, 11, "maxDistance");
  }
  b_st.site = &hc_emlrtRSI;
  if (muSingleScalarIsInf(b_value)) {
    emlrtErrorWithMessageIdR2018a(
        &b_st, &l_emlrtRTEI, "Coder:toolbox:ValidateattributesexpectedFinite",
        "MATLAB:pcfitplane:expectedFinite", 3, 4, 11, "maxDistance");
  }
  b_st.site = &hc_emlrtRSI;
  if (b_value < 0.0F) {
    emlrtErrorWithMessageIdR2018a(
        &b_st, &m_emlrtRTEI,
        "Coder:toolbox:ValidateattributesexpectedNonnegative",
        "MATLAB:pcfitplane:expectedNonnegative", 3, 4, 11, "maxDistance");
  }
}

void checkReferenceVector(const emlrtStack *sp, const real32_T b_value[3])
{
  emlrtStack b_st;
  emlrtStack st;
  int32_T k;
  boolean_T exitg1;
  boolean_T p;
  st.prev = sp;
  st.tls = sp->tls;
  st.site = &kc_emlrtRSI;
  b_st.prev = &st;
  b_st.tls = st.tls;
  b_st.site = &hc_emlrtRSI;
  p = true;
  k = 0;
  exitg1 = false;
  while ((!exitg1) && (k < 3)) {
    if (!muSingleScalarIsNaN(b_value[k])) {
      k++;
    } else {
      p = false;
      exitg1 = true;
    }
  }
  if (!p) {
    emlrtErrorWithMessageIdR2018a(
        &b_st, &k_emlrtRTEI, "Coder:toolbox:ValidateattributesexpectedNonNaN",
        "MATLAB:pcfitplane:expectedNonNaN", 3, 4, 15, "referenceVector");
  }
  b_st.site = &hc_emlrtRSI;
  p = true;
  k = 0;
  exitg1 = false;
  while ((!exitg1) && (k < 3)) {
    if ((!muSingleScalarIsInf(b_value[k])) &&
        (!muSingleScalarIsNaN(b_value[k]))) {
      k++;
    } else {
      p = false;
      exitg1 = true;
    }
  }
  if (!p) {
    emlrtErrorWithMessageIdR2018a(
        &b_st, &l_emlrtRTEI, "Coder:toolbox:ValidateattributesexpectedFinite",
        "MATLAB:pcfitplane:expectedFinite", 3, 4, 15, "referenceVector");
  }
  st.site = &lc_emlrtRSI;
  b_st.site = &hc_emlrtRSI;
  p = false;
  k = 0;
  exitg1 = false;
  while ((!exitg1) && (k < 3)) {
    if ((b_value[k] == 0.0F) || muSingleScalarIsNaN(b_value[k])) {
      k++;
    } else {
      p = true;
      exitg1 = true;
    }
  }
  if (!p) {
    emlrtErrorWithMessageIdR2018a(
        &b_st, &n_emlrtRTEI, "Coder:toolbox:ValidateattributesexpectedNonZero",
        "MATLAB:pcfitplane:expectedNonZero", 3, 4, 15, "referenceVector");
  }
}

/* End of code generation (validateAndParseRansacInputs.c) */
