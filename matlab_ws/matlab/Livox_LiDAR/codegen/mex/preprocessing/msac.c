/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * msac.c
 *
 * Code generation for function 'msac'
 *
 */

/* Include files */
#include "msac.h"
#include "all.h"
#include "combineVectorElements.h"
#include "pcfitplane.h"
#include "preprocessing_data.h"
#include "preprocessing_emxutil.h"
#include "preprocessing_types.h"
#include "randperm.h"
#include "rt_nonfinite.h"
#include "sumMatrixIncludeNaN.h"
#include "warning.h"
#include "mwmathutil.h"
#include <string.h>

/* Variable Definitions */
static emlrtRSInfo ud_emlrtRSI = {
    67,     /* lineNo */
    "msac", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "msac.m" /* pathName */
};

static emlrtRSInfo vd_emlrtRSI = {
    71,     /* lineNo */
    "msac", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "msac.m" /* pathName */
};

static emlrtRSInfo wd_emlrtRSI = {
    74,     /* lineNo */
    "msac", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "msac.m" /* pathName */
};

static emlrtRSInfo xd_emlrtRSI = {
    78,     /* lineNo */
    "msac", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "msac.m" /* pathName */
};

static emlrtRSInfo yd_emlrtRSI = {
    86,     /* lineNo */
    "msac", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "msac.m" /* pathName */
};

static emlrtRSInfo ae_emlrtRSI = {
    87,     /* lineNo */
    "msac", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "msac.m" /* pathName */
};

static emlrtRSInfo be_emlrtRSI = {
    104,    /* lineNo */
    "msac", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "msac.m" /* pathName */
};

static emlrtRSInfo ce_emlrtRSI = {
    105,    /* lineNo */
    "msac", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "msac.m" /* pathName */
};

static emlrtRSInfo de_emlrtRSI = {
    129,    /* lineNo */
    "msac", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "msac.m" /* pathName */
};

static emlrtRSInfo ke_emlrtRSI = {
    137,                                                          /* lineNo */
    "fitPlane",                                                   /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m" /* pathName */
};

static emlrtRSInfo le_emlrtRSI = {
    154,                                                          /* lineNo */
    "checkPlane",                                                 /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m" /* pathName */
};

static emlrtRSInfo ne_emlrtRSI = {
    140,             /* lineNo */
    "evaluateModel", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "msac.m" /* pathName */
};

static emlrtRSInfo oe_emlrtRSI = {
    142,             /* lineNo */
    "evaluateModel", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "msac.m" /* pathName */
};

static emlrtRSInfo we_emlrtRSI = {
    20,    /* lineNo */
    "sum", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/sum.m" /* pathName
                                                                     */
};

static emlrtRSInfo xe_emlrtRSI = {
    86,                      /* lineNo */
    "combineVectorElements", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/private/"
    "combineVectorElements.m" /* pathName */
};

static emlrtRSInfo ye_emlrtRSI = {
    107,                /* lineNo */
    "blockedSummation", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pathName */
};

static emlrtRSInfo af_emlrtRSI = {
    22,                    /* lineNo */
    "sumMatrixIncludeNaN", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/private/"
    "sumMatrixIncludeNaN.m" /* pathName */
};

static emlrtRSInfo bf_emlrtRSI = {
    42,                 /* lineNo */
    "sumMatrixColumns", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/private/"
    "sumMatrixIncludeNaN.m" /* pathName */
};

static emlrtRSInfo df_emlrtRSI = {
    57,                 /* lineNo */
    "sumMatrixColumns", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/private/"
    "sumMatrixIncludeNaN.m" /* pathName */
};

static emlrtRSInfo jf_emlrtRSI = {
    11,                  /* lineNo */
    "computeLoopNumber", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "computeLoopNumber.m" /* pathName */
};

static emlrtRSInfo kf_emlrtRSI = {
    18,                  /* lineNo */
    "computeLoopNumber", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "computeLoopNumber.m" /* pathName */
};

static emlrtRSInfo lf_emlrtRSI = {
    19,                  /* lineNo */
    "computeLoopNumber", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "computeLoopNumber.m" /* pathName */
};

static emlrtRSInfo mf_emlrtRSI = {
    44,       /* lineNo */
    "mpower", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/matfun/mpower.m" /* pathName
                                                                       */
};

static emlrtRSInfo nf_emlrtRSI = {
    71,                                                           /* lineNo */
    "power",                                                      /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/ops/power.m" /* pathName */
};

static emlrtRSInfo vf_emlrtRSI = {
    160,                                                          /* lineNo */
    "checkPerpendicularPlane",                                    /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m" /* pathName */
};

static emlrtRSInfo wf_emlrtRSI = {
    163,                                                          /* lineNo */
    "checkPerpendicularPlane",                                    /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m" /* pathName */
};

static emlrtRTEInfo t_emlrtRTEI = {
    14,                                                             /* lineNo */
    9,                                                              /* colNo */
    "log10",                                                        /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elfun/log10.m" /* pName */
};

static emlrtBCInfo g_emlrtBCI = {
    -1,                                                            /* iFirst */
    -1,                                                            /* iLast */
    162,                                                           /* lineNo */
    89,                                                            /* colNo */
    "",                                                            /* aName */
    "checkPerpendicularPlane",                                     /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m", /* pName */
    0 /* checkKind */
};

static emlrtBCInfo h_emlrtBCI = {
    -1,                                                            /* iFirst */
    -1,                                                            /* iLast */
    162,                                                           /* lineNo */
    66,                                                            /* colNo */
    "",                                                            /* aName */
    "checkPerpendicularPlane",                                     /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m", /* pName */
    0 /* checkKind */
};

static emlrtBCInfo i_emlrtBCI = {
    -1,                                                            /* iFirst */
    -1,                                                            /* iLast */
    162,                                                           /* lineNo */
    43,                                                            /* colNo */
    "",                                                            /* aName */
    "checkPerpendicularPlane",                                     /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/pcfitplane.m", /* pName */
    0 /* checkKind */
};

static emlrtBCInfo j_emlrtBCI = {
    -1,              /* iFirst */
    -1,              /* iLast */
    141,             /* lineNo */
    5,               /* colNo */
    "",              /* aName */
    "evaluateModel", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "msac.m", /* pName */
    0         /* checkKind */
};

static emlrtBCInfo k_emlrtBCI = {
    -1,     /* iFirst */
    -1,     /* iLast */
    70,     /* lineNo */
    30,     /* colNo */
    "",     /* aName */
    "msac", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "msac.m", /* pName */
    0         /* checkKind */
};

static emlrtDCInfo emlrtDCI = {
    70,     /* lineNo */
    30,     /* colNo */
    "msac", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "msac.m", /* pName */
    1         /* checkKind */
};

static emlrtRTEInfo tc_emlrtRTEI = {
    55,     /* lineNo */
    1,      /* colNo */
    "msac", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "msac.m" /* pName */
};

static emlrtRTEInfo uc_emlrtRTEI = {
    84,     /* lineNo */
    27,     /* colNo */
    "msac", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "msac.m" /* pName */
};

static emlrtRTEInfo vc_emlrtRTEI = {
    140,    /* lineNo */
    1,      /* colNo */
    "msac", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "msac.m" /* pName */
};

/* Function Definitions */
boolean_T msac(const emlrtStack *sp, const emxArray_real32_T *allPoints,
               real32_T params_maxDistance, const real_T varargin_1_data[],
               real_T varargin_2, real32_T bestModelParams_data[],
               int32_T bestModelParams_size[2])
{
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack e_st;
  emlrtStack f_st;
  emlrtStack g_st;
  emlrtStack h_st;
  emlrtStack st;
  emxArray_boolean_T *bestInliers;
  emxArray_real32_T *dis;
  real_T indices_data[3];
  int32_T modelParams_size[2];
  int32_T bestModelParams_idx_0_tmp;
  int32_T ib;
  int32_T idxTrial;
  int32_T inb;
  int32_T numPts_tmp;
  int32_T numTrials;
  int32_T nz;
  int32_T skipTrials;
  real32_T modelParams_data[4];
  const real32_T *allPoints_data;
  real32_T angle;
  real32_T bestDis;
  real32_T *dis_data;
  boolean_T tmp_data[4];
  boolean_T isFound;
  boolean_T isValidModel;
  boolean_T *bestInliers_data;
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
  f_st.prev = &e_st;
  f_st.tls = e_st.tls;
  g_st.prev = &f_st;
  g_st.tls = f_st.tls;
  h_st.prev = &g_st;
  h_st.tls = g_st.tls;
  allPoints_data = allPoints->data;
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtConstCTX)sp);
  numPts_tmp = allPoints->size[0];
  idxTrial = 1;
  numTrials = 1000;
  bestDis = params_maxDistance * (real32_T)allPoints->size[0];
  bestModelParams_size[0] = 0;
  bestModelParams_size[1] = 0;
  skipTrials = 0;
  emxInit_boolean_T(sp, &bestInliers, 1, &tc_emlrtRTEI);
  inb = bestInliers->size[0];
  bestInliers->size[0] = allPoints->size[0];
  emxEnsureCapacity_boolean_T(sp, bestInliers, inb, &tc_emlrtRTEI);
  bestInliers_data = bestInliers->data;
  for (inb = 0; inb < numPts_tmp; inb++) {
    bestInliers_data[inb] = false;
  }
  emxInit_real32_T(sp, &dis, 1, &vc_emlrtRTEI);
  while ((idxTrial <= numTrials) && (skipTrials < 10000)) {
    real_T d;
    real_T d1;
    real_T d2;
    int32_T indices_size[2];
    real32_T samplePoints_data[9];
    real32_T b_idx_0;
    real32_T b_idx_1;
    real32_T normal_idx_0;
    real32_T normal_idx_1;
    real32_T normal_idx_2;
    st.site = &ud_emlrtRSI;
    randperm(&st, numPts_tmp, indices_data, indices_size);
    d = indices_data[0];
    d1 = indices_data[1];
    d2 = indices_data[2];
    for (inb = 0; inb < 3; inb++) {
      if (d != (int32_T)muDoubleScalarFloor(d)) {
        emlrtIntegerCheckR2012b(d, &emlrtDCI, (emlrtConstCTX)sp);
      }
      if (((int32_T)d < 1) || ((int32_T)d > numPts_tmp)) {
        emlrtDynamicBoundsCheckR2012b((int32_T)d, 1, numPts_tmp, &k_emlrtBCI,
                                      (emlrtConstCTX)sp);
      }
      samplePoints_data[3 * inb] =
          allPoints_data[((int32_T)d + allPoints->size[0] * inb) - 1];
      if (d1 != (int32_T)muDoubleScalarFloor(d1)) {
        emlrtIntegerCheckR2012b(d1, &emlrtDCI, (emlrtConstCTX)sp);
      }
      if (((int32_T)d1 < 1) || ((int32_T)d1 > numPts_tmp)) {
        emlrtDynamicBoundsCheckR2012b((int32_T)d1, 1, numPts_tmp, &k_emlrtBCI,
                                      (emlrtConstCTX)sp);
      }
      samplePoints_data[3 * inb + 1] =
          allPoints_data[((int32_T)d1 + allPoints->size[0] * inb) - 1];
      if (d2 != (int32_T)muDoubleScalarFloor(d2)) {
        emlrtIntegerCheckR2012b(d2, &emlrtDCI, (emlrtConstCTX)sp);
      }
      if (((int32_T)d2 < 1) || ((int32_T)d2 > numPts_tmp)) {
        emlrtDynamicBoundsCheckR2012b((int32_T)d2, 1, numPts_tmp, &k_emlrtBCI,
                                      (emlrtConstCTX)sp);
      }
      samplePoints_data[3 * inb + 2] =
          allPoints_data[((int32_T)d2 + allPoints->size[0] * inb) - 1];
    }
    real32_T a[3];
    st.site = &vd_emlrtRSI;
    a[0] = samplePoints_data[1] - samplePoints_data[0];
    b_idx_0 = samplePoints_data[2] - samplePoints_data[0];
    a[1] = samplePoints_data[4] - samplePoints_data[3];
    b_idx_1 = samplePoints_data[5] - samplePoints_data[3];
    a[2] = samplePoints_data[7] - samplePoints_data[6];
    angle = samplePoints_data[8] - samplePoints_data[6];
    normal_idx_0 = a[1] * angle - b_idx_1 * a[2];
    normal_idx_1 = b_idx_0 * a[2] - a[0] * angle;
    normal_idx_2 = a[0] * b_idx_1 - b_idx_0 * a[1];
    a[0] = normal_idx_0 * normal_idx_0;
    a[1] = normal_idx_1 * normal_idx_1;
    a[2] = normal_idx_2 * normal_idx_2;
    angle = c_sumColumnB(a);
    if (angle < 1.1920929E-7F) {
      modelParams_size[0] = 0;
      modelParams_size[1] = 0;
    } else {
      b_st.site = &ke_emlrtRSI;
      angle = muSingleScalarSqrt(angle);
      b_idx_0 = normal_idx_0 / angle;
      b_idx_1 = -samplePoints_data[0] * b_idx_0;
      normal_idx_0 = b_idx_0;
      b_idx_0 = normal_idx_1 / angle;
      b_idx_1 += -samplePoints_data[3] * b_idx_0;
      normal_idx_1 = b_idx_0;
      b_idx_0 = normal_idx_2 / angle;
      b_idx_1 += -samplePoints_data[6] * b_idx_0;
      modelParams_size[0] = 1;
      modelParams_size[1] = 4;
      modelParams_data[0] = normal_idx_0;
      modelParams_data[1] = normal_idx_1;
      modelParams_data[2] = b_idx_0;
      modelParams_data[3] = b_idx_1;
    }
    st.site = &wd_emlrtRSI;
    b_st.site = &vf_emlrtRSI;
    bestModelParams_idx_0_tmp = modelParams_size[0] * modelParams_size[1];
    for (inb = 0; inb < bestModelParams_idx_0_tmp; inb++) {
      angle = modelParams_data[inb];
      tmp_data[inb] =
          ((!muSingleScalarIsInf(angle)) && (!muSingleScalarIsNaN(angle)));
    }
    c_st.site = &le_emlrtRSI;
    isValidModel = all(tmp_data, bestModelParams_idx_0_tmp);
    isValidModel = ((bestModelParams_idx_0_tmp == 4) && isValidModel);
    if (isValidModel) {
      if (bestModelParams_idx_0_tmp < 1) {
        emlrtDynamicBoundsCheckR2012b(1, 1, 0, &i_emlrtBCI, &st);
      }
      if (bestModelParams_idx_0_tmp < 2) {
        emlrtDynamicBoundsCheckR2012b(2, 1, 1, &h_emlrtBCI, &st);
      }
      if (bestModelParams_idx_0_tmp < 3) {
        emlrtDynamicBoundsCheckR2012b(3, 1, 2, &g_emlrtBCI, &st);
      }
      b_st.site = &wf_emlrtRSI;
      angle = muSingleScalarAbs(muSingleScalarAcos(muSingleScalarMin(
          1.0F,
          muSingleScalarMax(
              -1.0F, ((real32_T)varargin_1_data[0] * modelParams_data[0] +
                      (real32_T)varargin_1_data[1] * modelParams_data[1]) +
                         (real32_T)varargin_1_data[2] * modelParams_data[2]))));
      angle = muSingleScalarMin(angle, 3.14159274F - angle);
      isValidModel = (angle < varargin_2);
    }
    if (isValidModel) {
      st.site = &xd_emlrtRSI;
      b_st.site = &ne_emlrtRSI;
      evalPlane(&b_st, modelParams_data, modelParams_size, allPoints, dis);
      dis_data = dis->data;
      nz = dis->size[0] - 1;
      for (inb = 0; inb <= nz; inb++) {
        if (dis_data[inb] > params_maxDistance) {
          if (inb > dis->size[0] - 1) {
            emlrtDynamicBoundsCheckR2012b(inb, 0, dis->size[0] - 1, &j_emlrtBCI,
                                          &st);
          }
          dis_data[inb] = params_maxDistance;
        }
      }
      b_st.site = &oe_emlrtRSI;
      c_st.site = &we_emlrtRSI;
      d_st.site = &pd_emlrtRSI;
      e_st.site = &xe_emlrtRSI;
      if (dis->size[0] == 0) {
        angle = 0.0F;
      } else {
        f_st.site = &ye_emlrtRSI;
        g_st.site = &af_emlrtRSI;
        if (dis->size[0] < 4096) {
          h_st.site = &bf_emlrtRSI;
          angle = sumColumnB(&h_st, dis, dis->size[0]);
        } else {
          int32_T nleft;
          nz = (int32_T)((uint32_T)dis->size[0] >> 12);
          inb = nz << 12;
          nleft = dis->size[0] - inb;
          angle = sumColumnB4(dis, 1);
          for (ib = 2; ib <= nz; ib++) {
            angle += sumColumnB4(dis, ((ib - 1) << 12) + 1);
          }
          if (nleft > 0) {
            h_st.site = &df_emlrtRSI;
            angle += b_sumColumnB(&h_st, dis, nleft, inb + 1);
          }
        }
      }
      if (angle < bestDis) {
        bestDis = angle;
        nz = dis->size[0];
        inb = bestInliers->size[0];
        bestInliers->size[0] = dis->size[0];
        emxEnsureCapacity_boolean_T(sp, bestInliers, inb, &uc_emlrtRTEI);
        bestInliers_data = bestInliers->data;
        for (inb = 0; inb < nz; inb++) {
          bestInliers_data[inb] = (dis_data[inb] < params_maxDistance);
        }
        bestModelParams_size[0] = modelParams_size[0];
        bestModelParams_size[1] = modelParams_size[1];
        if (bestModelParams_idx_0_tmp - 1 >= 0) {
          memcpy(&bestModelParams_data[0], &modelParams_data[0],
                 (uint32_T)bestModelParams_idx_0_tmp * sizeof(real32_T));
        }
        st.site = &yd_emlrtRSI;
        b_st.site = &od_emlrtRSI;
        c_st.site = &pd_emlrtRSI;
        nz = combineVectorElements(&c_st, bestInliers);
        st.site = &ae_emlrtRSI;
        b_st.site = &jf_emlrtRSI;
        c_st.site = &mf_emlrtRSI;
        d_st.site = &nf_emlrtRSI;
        angle = muSingleScalarPower((real32_T)nz / (real32_T)numPts_tmp, 3.0F);
        if (angle < 1.1920929E-7F) {
          nz = MAX_int32_T;
        } else {
          b_st.site = &kf_emlrtRSI;
          b_st.site = &lf_emlrtRSI;
          if (1.0F - angle < 0.0F) {
            emlrtErrorWithMessageIdR2018a(
                &b_st, &t_emlrtRTEI, "Coder:toolbox:ElFunDomainError",
                "Coder:toolbox:ElFunDomainError", 3, 4, 5, "log10");
          }
          angle = muSingleScalarCeil(-2.00000048F /
                                     muSingleScalarLog10(1.0F - angle));
          if (angle < 2.14748365E+9F) {
            nz = (int32_T)angle;
          } else {
            nz = 0;
          }
        }
        numTrials = muIntScalarMin_sint32(numTrials, nz);
      }
      idxTrial++;
    } else {
      skipTrials++;
    }
  }
  emxFree_real32_T(sp, &dis);
  st.site = &be_emlrtRSI;
  b_st.site = &vf_emlrtRSI;
  bestModelParams_idx_0_tmp = bestModelParams_size[0] * bestModelParams_size[1];
  for (inb = 0; inb < bestModelParams_idx_0_tmp; inb++) {
    angle = bestModelParams_data[inb];
    tmp_data[inb] =
        ((!muSingleScalarIsInf(angle)) && (!muSingleScalarIsNaN(angle)));
  }
  c_st.site = &le_emlrtRSI;
  isValidModel = all(tmp_data, bestModelParams_idx_0_tmp);
  isValidModel = ((bestModelParams_idx_0_tmp == 4) && isValidModel);
  if (isValidModel) {
    if (bestModelParams_idx_0_tmp < 1) {
      emlrtDynamicBoundsCheckR2012b(1, 1, 0, &i_emlrtBCI, &st);
    }
    if (bestModelParams_idx_0_tmp < 2) {
      emlrtDynamicBoundsCheckR2012b(2, 1, 1, &h_emlrtBCI, &st);
    }
    if (bestModelParams_idx_0_tmp < 3) {
      emlrtDynamicBoundsCheckR2012b(3, 1, 2, &g_emlrtBCI, &st);
    }
    b_st.site = &wf_emlrtRSI;
    angle = muSingleScalarAbs(muSingleScalarAcos(muSingleScalarMin(
        1.0F,
        muSingleScalarMax(
            -1.0F,
            ((real32_T)varargin_1_data[0] * bestModelParams_data[0] +
             (real32_T)varargin_1_data[1] * bestModelParams_data[1]) +
                (real32_T)varargin_1_data[2] * bestModelParams_data[2]))));
    angle = muSingleScalarMin(angle, 3.14159274F - angle);
    isValidModel = (angle < varargin_2);
  }
  if (isValidModel && (bestInliers->size[0] != 0)) {
    st.site = &ce_emlrtRSI;
    b_st.site = &od_emlrtRSI;
    c_st.site = &pd_emlrtRSI;
    nz = combineVectorElements(&c_st, bestInliers);
    if (nz >= 3) {
      isFound = true;
    } else {
      isFound = false;
    }
  } else {
    isFound = false;
  }
  emxFree_boolean_T(sp, &bestInliers);
  if (isFound && (numTrials >= 1000)) {
    st.site = &de_emlrtRSI;
    warning(&st);
  }
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtConstCTX)sp);
  return isFound;
}

/* End of code generation (msac.c) */
