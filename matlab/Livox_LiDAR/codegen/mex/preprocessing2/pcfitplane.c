/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * pcfitplane.c
 *
 * Code generation for function 'pcfitplane'
 *
 */

/* Include files */
#include "pcfitplane.h"
#include "assertValidSizeArg.h"
#include "eml_int_forloop_overflow_check.h"
#include "find.h"
#include "handle.h"
#include "indexShapeCheck.h"
#include "initializeRansacModel.h"
#include "msac.h"
#include "planeModel.h"
#include "preprocessing2_data.h"
#include "preprocessing2_emxutil.h"
#include "preprocessing2_types.h"
#include "rt_nonfinite.h"
#include "validateAndParseRansacInputs.h"
#include "warning.h"
#include "blas.h"
#include "mwmathutil.h"
#include <stddef.h>
#include <xmmintrin.h>

/* Variable Definitions */
static emlrtRSInfo mb_emlrtRSI = {
    20,                                                           /* lineNo */
    "pcfitplane",                                                 /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m" /* pathName */
};

static emlrtRSInfo nb_emlrtRSI = {
    1,                                                            /* lineNo */
    "pcfitplane",                                                 /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m" /* pathName */
};

static emlrtRSInfo ob_emlrtRSI = {
    102,                                                          /* lineNo */
    "pcfitplane",                                                 /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m" /* pathName */
};

static emlrtRSInfo pb_emlrtRSI = {
    100,                                                          /* lineNo */
    "pcfitplane",                                                 /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m" /* pathName */
};

static emlrtRSInfo qb_emlrtRSI = {
    91,                                                           /* lineNo */
    "pcfitplane",                                                 /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m" /* pathName */
};

static emlrtRSInfo rb_emlrtRSI = {
    78,                                                           /* lineNo */
    "pcfitplane",                                                 /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m" /* pathName */
};

static emlrtRSInfo sb_emlrtRSI = {
    75,                                                           /* lineNo */
    "pcfitplane",                                                 /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m" /* pathName */
};

static emlrtRSInfo tb_emlrtRSI = {
    60,                                                           /* lineNo */
    "pcfitplane",                                                 /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m" /* pathName */
};

static emlrtRSInfo ub_emlrtRSI = {
    59,                                                           /* lineNo */
    "pcfitplane",                                                 /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m" /* pathName */
};

static emlrtRSInfo vb_emlrtRSI = {
    58,                                                           /* lineNo */
    "pcfitplane",                                                 /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m" /* pathName */
};

static emlrtRSInfo wb_emlrtRSI = {
    51,                                                           /* lineNo */
    "pcfitplane",                                                 /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m" /* pathName */
};

static emlrtRSInfo xb_emlrtRSI = {
    49,                                                           /* lineNo */
    "pcfitplane",                                                 /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m" /* pathName */
};

static emlrtRSInfo yb_emlrtRSI = {
    48,                                                           /* lineNo */
    "pcfitplane",                                                 /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m" /* pathName */
};

static emlrtRSInfo ac_emlrtRSI = {
    9,                                                            /* lineNo */
    "pcfitplane",                                                 /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m" /* pathName */
};

static emlrtRSInfo bc_emlrtRSI = {
    29,                             /* lineNo */
    "validateAndParseRansacInputs", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "validateAndParseRansacInputs.m" /* pathName */
};

static emlrtRSInfo cc_emlrtRSI = {
    87,                            /* lineNo */
    "parseAndValidateArgsCodegen", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "validateAndParseRansacInputs.m" /* pathName */
};

static emlrtRSInfo dc_emlrtRSI = {
    89,                            /* lineNo */
    "parseAndValidateArgsCodegen", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "validateAndParseRansacInputs.m" /* pathName */
};

static emlrtRSInfo ec_emlrtRSI = {
    126,                           /* lineNo */
    "parseAndValidateArgsCodegen", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "validateAndParseRansacInputs.m" /* pathName */
};

static emlrtRSInfo fc_emlrtRSI = {
    127,                           /* lineNo */
    "parseAndValidateArgsCodegen", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "validateAndParseRansacInputs.m" /* pathName */
};

static emlrtRSInfo gc_emlrtRSI = {
    232,                       /* lineNo */
    "validatePointCloudInput", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "validateAndParseRansacInputs.m" /* pathName */
};

static emlrtRSInfo yd_emlrtRSI = {
    148,                                                          /* lineNo */
    "evalPlane",                                                  /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m" /* pathName */
};

static emlrtRSInfo be_emlrtRSI =
    {
        94,                  /* lineNo */
        "eml_mtimes_helper", /* fcnName */
        "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/ops/"
        "eml_mtimes_helper.m" /* pathName */
};

static emlrtRSInfo ce_emlrtRSI =
    {
        142,      /* lineNo */
        "mtimes", /* fcnName */
        "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/+blas/"
        "mtimes.m" /* pathName */
};

static emlrtRSInfo de_emlrtRSI =
    {
        178,           /* lineNo */
        "mtimes_blas", /* fcnName */
        "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/+blas/"
        "mtimes.m" /* pathName */
};

static emlrtRSInfo ee_emlrtRSI = {
    19,                                                           /* lineNo */
    "abs",                                                        /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elfun/abs.m" /* pathName */
};

static emlrtRSInfo fe_emlrtRSI = {
    74,                    /* lineNo */
    "applyScalarFunction", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
    "applyScalarFunction.m" /* pathName */
};

static emlrtRSInfo af_emlrtRSI = {
    16,                                                            /* lineNo */
    "sqrt",                                                        /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elfun/sqrt.m" /* pathName
                                                                    */
};

static emlrtRSInfo bf_emlrtRSI = {
    33,                           /* lineNo */
    "applyScalarFunctionInPlace", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
    "applyScalarFunctionInPlace.m" /* pathName */
};

static emlrtRSInfo cf_emlrtRSI = {
    74,       /* lineNo */
    "repmat", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repmat.m" /* pathName
                                                                      */
};

static emlrtRSInfo df_emlrtRSI =
    {
        34,               /* lineNo */
        "rdivide_helper", /* fcnName */
        "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
        "rdivide_helper.m" /* pathName */
};

static emlrtRSInfo ef_emlrtRSI = {
    53,    /* lineNo */
    "div", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/div.m" /* pathName
                                                                       */
};

static emlrtRSInfo hf_emlrtRSI = {
    25,    /* lineNo */
    "dot", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/specfun/dot.m" /* pathName
                                                                     */
};

static emlrtRSInfo if_emlrtRSI = {
    104,     /* lineNo */
    "vdotp", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/specfun/dot.m" /* pathName
                                                                     */
};

static emlrtRSInfo jf_emlrtRSI = {
    89,     /* lineNo */
    "vdot", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/specfun/dot.m" /* pathName
                                                                     */
};

static emlrtRSInfo mf_emlrtRSI = {
    17,                                                            /* lineNo */
    "acos",                                                        /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elfun/acos.m" /* pathName
                                                                    */
};

static emlrtRSInfo nf_emlrtRSI =
    {
        18,            /* lineNo */
        "ifWhileCond", /* fcnName */
        "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
        "ifWhileCond.m" /* pathName */
};

static emlrtRSInfo of_emlrtRSI =
    {
        31,            /* lineNo */
        "checkNoNaNs", /* fcnName */
        "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
        "ifWhileCond.m" /* pathName */
};

static emlrtRSInfo vf_emlrtRSI = {
    11,                         /* lineNo */
    "checkRansacRuntimeStatus", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "checkRansacRuntimeStatus.m" /* pathName */
};

static emlrtRSInfo wf_emlrtRSI = {
    13,                         /* lineNo */
    "checkRansacRuntimeStatus", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "checkRansacRuntimeStatus.m" /* pathName */
};

static emlrtRTEInfo i_emlrtRTEI = {
    13,                                                            /* lineNo */
    9,                                                             /* colNo */
    "sqrt",                                                        /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elfun/sqrt.m" /* pName */
};

static emlrtRTEInfo j_emlrtRTEI = {
    14,               /* lineNo */
    37,               /* colNo */
    "validatescalar", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/+valattr/"
    "validatescalar.m" /* pName */
};

static emlrtBCInfo b_emlrtBCI = {
    -1,                                                            /* iFirst */
    -1,                                                            /* iLast */
    101,                                                           /* lineNo */
    18,                                                            /* colNo */
    "",                                                            /* aName */
    "pcfitplane",                                                  /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m", /* pName */
    0 /* checkKind */
};

static emlrtBCInfo c_emlrtBCI = {
    -1,                                                            /* iFirst */
    -1,                                                            /* iLast */
    92,                                                            /* lineNo */
    49,                                                            /* colNo */
    "",                                                            /* aName */
    "pcfitplane",                                                  /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m", /* pName */
    0 /* checkKind */
};

static emlrtBCInfo d_emlrtBCI = {
    -1,                                                            /* iFirst */
    -1,                                                            /* iLast */
    58,                                                            /* lineNo */
    62,                                                            /* colNo */
    "",                                                            /* aName */
    "pcfitplane",                                                  /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m", /* pName */
    0 /* checkKind */
};

static emlrtBCInfo e_emlrtBCI = {
    -1,                                                            /* iFirst */
    -1,                                                            /* iLast */
    148,                                                           /* lineNo */
    40,                                                            /* colNo */
    "",                                                            /* aName */
    "evalPlane",                                                   /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m", /* pName */
    0 /* checkKind */
};

static emlrtBCInfo f_emlrtBCI = {
    -1,                                                            /* iFirst */
    -1,                                                            /* iLast */
    148,                                                           /* lineNo */
    26,                                                            /* colNo */
    "",                                                            /* aName */
    "evalPlane",                                                   /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m", /* pName */
    0 /* checkKind */
};

static emlrtRTEInfo ub_emlrtRTEI = {
    1,                                                            /* lineNo */
    62,                                                           /* colNo */
    "pcfitplane",                                                 /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m" /* pName */
};

static emlrtRTEInfo vb_emlrtRTEI = {
    100,                                                          /* lineNo */
    13,                                                           /* colNo */
    "pcfitplane",                                                 /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m" /* pName */
};

static emlrtRTEInfo wb_emlrtRTEI = {
    102,                                                          /* lineNo */
    13,                                                           /* colNo */
    "pcfitplane",                                                 /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m" /* pName */
};

static emlrtRTEInfo xb_emlrtRTEI = {
    30,                    /* lineNo */
    21,                    /* colNo */
    "applyScalarFunction", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
    "applyScalarFunction.m" /* pName */
};

static emlrtRTEInfo yb_emlrtRTEI = {
    20,                                                           /* lineNo */
    26,                                                           /* colNo */
    "pcfitplane",                                                 /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m" /* pName */
};

static emlrtRTEInfo ac_emlrtRTEI = {
    91,                                                           /* lineNo */
    13,                                                           /* colNo */
    "pcfitplane",                                                 /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m" /* pName */
};

static emlrtRTEInfo oc_emlrtRTEI =
    {
        218,      /* lineNo */
        20,       /* colNo */
        "mtimes", /* fName */
        "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/+blas/"
        "mtimes.m" /* pName */
};

static emlrtRTEInfo pc_emlrtRTEI = {
    148,                                                          /* lineNo */
    11,                                                           /* colNo */
    "pcfitplane",                                                 /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m" /* pName */
};

/* Function Definitions */
void evalPlane(const emlrtStack *sp, const real32_T model_data[],
               const int32_T model_size[2], const emxArray_real32_T *points,
               emxArray_real32_T *dis)
{
  ptrdiff_t k_t;
  ptrdiff_t lda_t;
  ptrdiff_t ldb_t;
  ptrdiff_t ldc_t;
  ptrdiff_t m_t;
  ptrdiff_t n_t;
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack st;
  emxArray_real32_T *y;
  int32_T i;
  int32_T model_tmp;
  int32_T scalarLB;
  int32_T vectorUB;
  real32_T fv[3];
  const real32_T *points_data;
  real32_T alpha1;
  real32_T beta1;
  real32_T *dis_data;
  real32_T *y_data;
  char_T TRANSA1;
  char_T TRANSB1;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  d_st.prev = &c_st;
  d_st.tls = c_st.tls;
  points_data = points->data;
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtConstCTX)sp);
  st.site = &yd_emlrtRSI;
  b_indexShapeCheck(&st, model_size);
  model_tmp = model_size[0] * model_size[1];
  if (model_tmp < 1) {
    emlrtDynamicBoundsCheckR2012b(1, 1, model_tmp, &f_emlrtBCI,
                                  (emlrtConstCTX)sp);
  }
  fv[0] = model_data[0];
  if (model_tmp < 2) {
    emlrtDynamicBoundsCheckR2012b(2, 1, 1, &f_emlrtBCI, (emlrtConstCTX)sp);
  }
  fv[1] = model_data[1];
  if (model_tmp < 3) {
    emlrtDynamicBoundsCheckR2012b(3, 1, 2, &f_emlrtBCI, (emlrtConstCTX)sp);
  }
  fv[2] = model_data[2];
  if (model_tmp < 4) {
    emlrtDynamicBoundsCheckR2012b(4, 1, 3, &e_emlrtBCI, (emlrtConstCTX)sp);
  }
  emxInit_real32_T(sp, &y, 1, &pc_emlrtRTEI);
  y_data = y->data;
  st.site = &yd_emlrtRSI;
  b_st.site = &be_emlrtRSI;
  if (points->size[0] == 0) {
    y->size[0] = 0;
  } else {
    c_st.site = &ce_emlrtRSI;
    d_st.site = &de_emlrtRSI;
    TRANSB1 = 'T';
    TRANSA1 = 'N';
    alpha1 = 1.0F;
    beta1 = 0.0F;
    m_t = (ptrdiff_t)points->size[0];
    n_t = (ptrdiff_t)1;
    k_t = (ptrdiff_t)3;
    lda_t = (ptrdiff_t)points->size[0];
    ldb_t = (ptrdiff_t)1;
    ldc_t = (ptrdiff_t)points->size[0];
    i = y->size[0];
    y->size[0] = points->size[0];
    emxEnsureCapacity_real32_T(&d_st, y, i, &oc_emlrtRTEI);
    y_data = y->data;
    sgemm(&TRANSA1, &TRANSB1, &m_t, &n_t, &k_t, &alpha1,
          (real32_T *)&points_data[0], &lda_t, &fv[0], &ldb_t, &beta1,
          &y_data[0], &ldc_t);
  }
  st.site = &yd_emlrtRSI;
  alpha1 = model_data[3];
  model_tmp = y->size[0];
  scalarLB = (y->size[0] / 4) << 2;
  vectorUB = scalarLB - 4;
  for (i = 0; i <= vectorUB; i += 4) {
    __m128 r;
    r = _mm_loadu_ps(&y_data[i]);
    _mm_storeu_ps(&y_data[i], _mm_add_ps(r, _mm_set1_ps(alpha1)));
  }
  for (i = scalarLB; i < model_tmp; i++) {
    y_data[i] += alpha1;
  }
  b_st.site = &ee_emlrtRSI;
  model_tmp = y->size[0];
  i = dis->size[0];
  dis->size[0] = y->size[0];
  emxEnsureCapacity_real32_T(&b_st, dis, i, &xb_emlrtRTEI);
  dis_data = dis->data;
  c_st.site = &fe_emlrtRSI;
  if (y->size[0] > 2147483646) {
    d_st.site = &q_emlrtRSI;
    check_forloop_overflow_error(&d_st);
  }
  for (scalarLB = 0; scalarLB < model_tmp; scalarLB++) {
    dis_data[scalarLB] = muSingleScalarAbs(y_data[scalarLB]);
  }
  emxFree_real32_T(&b_st, &y);
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtConstCTX)sp);
}

void pcfitplane(const emlrtStack *sp, pointCloud *varargin_1,
                real32_T varargin_2, const real32_T varargin_3[3],
                real32_T varargin_4, emxArray_real_T *inlierIndices,
                emxArray_real_T *outlierIndices)
{
  ptrdiff_t incx_t;
  ptrdiff_t incy_t;
  ptrdiff_t n_t;
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack e_st;
  emlrtStack st;
  emxArray_boolean_T *flag;
  emxArray_int32_T *ii;
  emxArray_real32_T *distances;
  emxArray_real_T *validPtCloudIndices;
  pointCloud pc;
  pointCloud *b_pc;
  real_T normAxis_data[3];
  real_T *inlierIndices_data;
  real_T *outlierIndices_data;
  int32_T modelParams_size[2];
  int32_T i;
  int32_T k;
  int32_T scalarLB;
  int32_T status;
  int32_T vectorUB;
  int32_T *ii_data;
  real32_T modelParams_data[4];
  real32_T *distances_data;
  boolean_T n;
  boolean_T *flag_data;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  d_st.prev = &c_st;
  d_st.tls = c_st.tls;
  e_st.prev = &d_st;
  e_st.tls = d_st.tls;
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtConstCTX)sp);
  emxInitStruct_pointCloud(sp, &pc, &yb_emlrtRTEI);
  emxInit_boolean_T(sp, &flag, 1, &vb_emlrtRTEI);
  emxInit_real_T(sp, &validPtCloudIndices, &ub_emlrtRTEI);
  emxInit_real32_T(sp, &distances, 1, &ac_emlrtRTEI);
  emxInit_int32_T(sp, &ii, &mb_emlrtRTEI);
  emlrtPushHeapReferenceStackR2021a((emlrtCTX)sp, true, &pc,
                                    (void *)&b_handle_matlabCodegenDestructo,
                                    NULL, NULL, NULL);
  pc.matlabCodegenIsDeleted = true;
  st.site = &ac_emlrtRSI;
  b_st.site = &bc_emlrtRSI;
  c_st.site = &cc_emlrtRSI;
  d_st.site = &gc_emlrtRSI;
  e_st.site = &hc_emlrtRSI;
  n = (varargin_1->PointCloudArrayData->size[0] *
           varargin_1->PointCloudArrayData->size[1] ==
       1);
  if (!n) {
    emlrtErrorWithMessageIdR2018a(
        &e_st, &j_emlrtRTEI, "Coder:toolbox:ValidateattributesexpectedScalar",
        "MATLAB:expectedScalar", 3, 4, 7, "ptCloud");
  }
  c_st.site = &dc_emlrtRSI;
  checkMaxDistance(&c_st, varargin_2);
  c_st.site = &ec_emlrtRSI;
  checkReferenceVector(&c_st, varargin_3);
  c_st.site = &fc_emlrtRSI;
  checkMaxAngularDistance(&c_st, varargin_4);
  normAxis_data[0] = varargin_3[0];
  normAxis_data[1] = varargin_3[1];
  normAxis_data[2] = varargin_3[2];
  st.site = &mb_emlrtRSI;
  status =
      initializeRansacModel(&st, varargin_1, &pc, &b_pc, validPtCloudIndices);
  outlierIndices_data = validPtCloudIndices->data;
  modelParams_size[0] = 1;
  modelParams_size[1] = 4;
  modelParams_data[0] = 0.0F;
  modelParams_data[1] = 0.0F;
  modelParams_data[2] = 0.0F;
  modelParams_data[3] = 0.0F;
  if (status == 0) {
    real_T dv[2];
    real_T denorm_data_idx_0;
    st.site = &yb_emlrtRSI;
    n_t = (ptrdiff_t)3;
    incx_t = (ptrdiff_t)1;
    incy_t = (ptrdiff_t)1;
    denorm_data_idx_0 =
        ddot(&n_t, &normAxis_data[0], &incx_t, &normAxis_data[0], &incy_t);
    st.site = &yb_emlrtRSI;
    n = false;
    for (k = 0; k < 1; k++) {
      if (n || (denorm_data_idx_0 < 0.0)) {
        n = true;
      }
    }
    if (n) {
      emlrtErrorWithMessageIdR2018a(
          &st, &i_emlrtRTEI, "Coder:toolbox:ElFunDomainError",
          "Coder:toolbox:ElFunDomainError", 3, 4, 4, "sqrt");
    }
    b_st.site = &af_emlrtRSI;
    c_st.site = &bf_emlrtRSI;
    denorm_data_idx_0 = muDoubleScalarSqrt(denorm_data_idx_0);
    st.site = &xb_emlrtRSI;
    b_st.site = &xb_emlrtRSI;
    dv[0] = 1.0;
    dv[1] = 3.0;
    c_st.site = &hb_emlrtRSI;
    assertValidSizeArg(&c_st, dv);
    c_st.site = &cf_emlrtRSI;
    c_st.site = &p_emlrtRSI;
    c_st.site = &ib_emlrtRSI;
    c_st.site = &jb_emlrtRSI;
    c_st.site = &p_emlrtRSI;
    c_st.site = &ib_emlrtRSI;
    c_st.site = &jb_emlrtRSI;
    c_st.site = &p_emlrtRSI;
    c_st.site = &ib_emlrtRSI;
    c_st.site = &jb_emlrtRSI;
    b_st.site = &df_emlrtRSI;
    c_st.site = &ef_emlrtRSI;
    normAxis_data[0] = varargin_3[0] / denorm_data_idx_0;
    normAxis_data[1] = varargin_3[1] / denorm_data_idx_0;
    normAxis_data[2] = varargin_3[2] / denorm_data_idx_0;
    st.site = &wb_emlrtRSI;
    n = msac(&st, pc.Location, varargin_2, normAxis_data,
             varargin_4 * 3.1415926535897931 / 180.0, modelParams_data,
             modelParams_size);
    if (n) {
      st.site = &vb_emlrtRSI;
      b_indexShapeCheck(&st, modelParams_size);
      st.site = &vb_emlrtRSI;
      k = modelParams_size[0] * modelParams_size[1];
      if (k < 1) {
        emlrtDynamicBoundsCheckR2012b(1, 1, k, &d_emlrtBCI, &st);
      }
      if (k < 2) {
        emlrtDynamicBoundsCheckR2012b(2, 1, 1, &d_emlrtBCI, &st);
      }
      if (k < 3) {
        emlrtDynamicBoundsCheckR2012b(3, 1, 2, &d_emlrtBCI, &st);
      }
      b_st.site = &hf_emlrtRSI;
      c_st.site = &if_emlrtRSI;
      d_st.site = &jf_emlrtRSI;
      st.site = &ub_emlrtRSI;
      b_st.site = &mf_emlrtRSI;
      c_st.site = &bf_emlrtRSI;
      st.site = &ub_emlrtRSI;
      b_st.site = &ee_emlrtRSI;
      c_st.site = &fe_emlrtRSI;
      st.site = &tb_emlrtRSI;
      b_st.site = &nf_emlrtRSI;
      c_st.site = &of_emlrtRSI;
      n = (muSingleScalarAbs(muSingleScalarAcos(muSingleScalarMin(
               1.0F,
               muSingleScalarMax(
                   -1.0F, ((real32_T)normAxis_data[0] * modelParams_data[0] +
                           (real32_T)normAxis_data[1] * modelParams_data[1]) +
                              (real32_T)normAxis_data[2] *
                                  modelParams_data[2])))) > 1.5707963267948966);
      if (n) {
        scalarLB = (k / 4) << 2;
        vectorUB = scalarLB - 4;
        for (i = 0; i <= vectorUB; i += 4) {
          __m128 r;
          r = _mm_loadu_ps(&modelParams_data[0]);
          _mm_storeu_ps(&modelParams_data[0],
                        _mm_mul_ps(r, _mm_set1_ps(-1.0F)));
        }
        for (i = scalarLB; i < k; i++) {
          modelParams_data[i] = -modelParams_data[i];
        }
      }
    } else {
      status = 2;
    }
  }
  if ((modelParams_size[0] == 0) || (modelParams_size[1] == 0)) {
    modelParams_size[0] = 1;
    modelParams_size[1] = 4;
    modelParams_data[0] = 0.0F;
    modelParams_data[1] = 0.0F;
    modelParams_data[2] = 0.0F;
    modelParams_data[3] = 0.0F;
  }
  st.site = &sb_emlrtRSI;
  planeModel_planeModel(&st, modelParams_data, modelParams_size);
  st.site = &rb_emlrtRSI;
  if (status == 1) {
    b_st.site = &vf_emlrtRSI;
    b_warning(&b_st);
  } else if (status == 2) {
    b_st.site = &wf_emlrtRSI;
    c_warning(&b_st);
  }
  if (status == 0) {
    st.site = &qb_emlrtRSI;
    evalPlane(&st, modelParams_data, modelParams_size, pc.Location, distances);
    distances_data = distances->data;
    scalarLB = distances->size[0] - 1;
    k = 0;
    for (status = 0; status <= scalarLB; status++) {
      if (distances_data[status] < varargin_2) {
        k++;
      }
    }
    i = inlierIndices->size[0];
    inlierIndices->size[0] = k;
    emxEnsureCapacity_real_T(sp, inlierIndices, i, &ub_emlrtRTEI);
    inlierIndices_data = inlierIndices->data;
    k = 0;
    for (status = 0; status <= scalarLB; status++) {
      if (distances_data[status] < varargin_2) {
        if (status > validPtCloudIndices->size[0] - 1) {
          emlrtDynamicBoundsCheckR2012b(status, 0,
                                        validPtCloudIndices->size[0] - 1,
                                        &c_emlrtBCI, (emlrtConstCTX)sp);
        }
        inlierIndices_data[k] = outlierIndices_data[status];
        k++;
      }
    }
    st.site = &pb_emlrtRSI;
    vectorUB = varargin_1->Location->size[0];
    i = flag->size[0];
    flag->size[0] = vectorUB;
    emxEnsureCapacity_boolean_T(sp, flag, i, &vb_emlrtRTEI);
    flag_data = flag->data;
    for (i = 0; i < vectorUB; i++) {
      flag_data[i] = true;
    }
    k = 0;
    for (status = 0; status <= scalarLB; status++) {
      if (distances_data[status] < varargin_2) {
        k++;
      }
    }
    i = ii->size[0];
    ii->size[0] = k;
    emxEnsureCapacity_int32_T(sp, ii, i, &ub_emlrtRTEI);
    ii_data = ii->data;
    k = 0;
    for (status = 0; status <= scalarLB; status++) {
      if (distances_data[status] < varargin_2) {
        i = (int32_T)outlierIndices_data[status];
        if ((i < 1) || (i > vectorUB)) {
          emlrtDynamicBoundsCheckR2012b(i, 1, vectorUB, &b_emlrtBCI,
                                        (emlrtConstCTX)sp);
        }
        ii_data[k] = i;
        k++;
      }
    }
    k = ii->size[0];
    for (i = 0; i < k; i++) {
      flag_data[ii_data[i] - 1] = false;
    }
    st.site = &ob_emlrtRSI;
    b_st.site = &cb_emlrtRSI;
    eml_find(&b_st, flag, ii);
    ii_data = ii->data;
    k = ii->size[0];
    i = outlierIndices->size[0];
    outlierIndices->size[0] = ii->size[0];
    emxEnsureCapacity_real_T(&st, outlierIndices, i, &wb_emlrtRTEI);
    outlierIndices_data = outlierIndices->data;
    for (i = 0; i < k; i++) {
      outlierIndices_data[i] = ii_data[i];
    }
  } else {
    inlierIndices->size[0] = 0;
    outlierIndices->size[0] = 0;
  }
  st.site = &nb_emlrtRSI;
  b_handle_matlabCodegenDestructo(&st, &pc);
  emxFree_int32_T(sp, &ii);
  emxFree_real32_T(sp, &distances);
  emxFree_real_T(sp, &validPtCloudIndices);
  emxFree_boolean_T(sp, &flag);
  emxFreeStruct_pointCloud(sp, &pc);
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtConstCTX)sp);
}

/* End of code generation (pcfitplane.c) */
