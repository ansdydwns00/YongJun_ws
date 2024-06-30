/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * planeModel.c
 *
 * Code generation for function 'planeModel'
 *
 */

/* Include files */
#include "planeModel.h"
#include "all.h"
#include "indexShapeCheck.h"
#include "preprocessing_data.h"
#include "rt_nonfinite.h"
#include "mwmathutil.h"

/* Variable Definitions */
static emlrtRSInfo gg_emlrtRSI = {
    20,                                                           /* lineNo */
    "planeModel/planeModel",                                      /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/planeModel.m" /* pathName */
};

static emlrtRSInfo hg_emlrtRSI = {
    25,                                                           /* lineNo */
    "planeModel/planeModel",                                      /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/planeModel.m" /* pathName */
};

static emlrtRSInfo ig_emlrtRSI = {
    28,                                                           /* lineNo */
    "planeModel/planeModel",                                      /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/planeModel.m" /* pathName */
};

static emlrtRSInfo jg_emlrtRSI = {
    29,                                                           /* lineNo */
    "planeModel/planeModel",                                      /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/planeModel.m" /* pathName */
};

static emlrtRTEInfo v_emlrtRTEI = {
    13,               /* lineNo */
    37,               /* colNo */
    "validatevector", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/+valattr/"
    "validatevector.m" /* pName */
};

static emlrtRTEInfo w_emlrtRTEI = {
    18,              /* lineNo */
    23,              /* colNo */
    "validatenumel", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/+valattr/"
    "validatenumel.m" /* pName */
};

/* Function Definitions */
void planeModel_planeModel(const emlrtStack *sp, const real32_T params_data[],
                           const int32_T params_size[2])
{
  emlrtStack b_st;
  emlrtStack st;
  int32_T k;
  int32_T params_idx_0;
  boolean_T b_params_data[4];
  boolean_T exitg1;
  boolean_T p;
  st.prev = sp;
  st.tls = sp->tls;
  st.site = &gg_emlrtRSI;
  b_st.prev = &st;
  b_st.tls = st.tls;
  st.site = &hg_emlrtRSI;
  b_st.site = &eb_emlrtRSI;
  p = true;
  params_idx_0 = params_size[0] * params_size[1];
  k = 0;
  exitg1 = false;
  while ((!exitg1) && (k <= params_idx_0 - 1)) {
    if ((!muSingleScalarIsInf(params_data[k])) &&
        (!muSingleScalarIsNaN(params_data[k]))) {
      k++;
    } else {
      p = false;
      exitg1 = true;
    }
  }
  if (!p) {
    emlrtErrorWithMessageIdR2018a(
        &b_st, &o_emlrtRTEI, "Coder:toolbox:ValidateattributesexpectedFinite",
        "MATLAB:planeModel:expectedFinite", 3, 4, 6, "params");
  }
  b_st.site = &eb_emlrtRSI;
  if ((params_size[0] != 1) && (params_size[1] != 1)) {
    emlrtErrorWithMessageIdR2018a(
        &b_st, &v_emlrtRTEI, "Coder:toolbox:ValidateattributesexpectedVector",
        "MATLAB:planeModel:expectedVector", 3, 4, 6, "params");
  }
  b_st.site = &eb_emlrtRSI;
  if (params_idx_0 != 4) {
    emlrtErrorWithMessageIdR2018a(
        &b_st, &w_emlrtRTEI, "Coder:toolbox:ValidateattributesincorrectNumel",
        "MATLAB:planeModel:incorrectNumel", 5, 4, 6, "params", 6, 4.0);
  }
  for (params_idx_0 = 0; params_idx_0 < 4; params_idx_0++) {
    b_params_data[params_idx_0] = (params_data[params_idx_0] == 0.0F);
  }
  st.site = &ig_emlrtRSI;
  if (!all(b_params_data, 4)) {
    st.site = &jg_emlrtRSI;
    b_indexShapeCheck(&st, params_size);
    st.site = &jg_emlrtRSI;
    b_st.site = &eb_emlrtRSI;
    p = false;
    k = 0;
    exitg1 = false;
    while ((!exitg1) && (k < 3)) {
      if ((params_data[k] == 0.0F) || muSingleScalarIsNaN(params_data[k])) {
        k++;
      } else {
        p = true;
        exitg1 = true;
      }
    }
    if (!p) {
      emlrtErrorWithMessageIdR2018a(
          &b_st, &q_emlrtRTEI,
          "Coder:toolbox:ValidateattributesexpectedNonZero",
          "MATLAB:planeModel:expectedNonZero", 3, 4, 20,
          "Normal, params(1:3),");
    }
  }
}

/* End of code generation (planeModel.c) */
