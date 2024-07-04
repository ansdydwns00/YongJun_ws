/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * preprocessing.c
 *
 * Code generation for function 'preprocessing'
 *
 */

/* Include files */
#include "preprocessing.h"
#include "eml_int_forloop_overflow_check.h"
#include "handle.h"
#include "pcfitplane.h"
#include "pointCloud.h"
#include "pointCloudBase.h"
#include "preprocessing_data.h"
#include "preprocessing_emxutil.h"
#include "preprocessing_types.h"
#include "rt_nonfinite.h"
#include "mwmathutil.h"

/* Variable Definitions */
static emlrtRSInfo emlrtRSI = {
    3,                                                        /* lineNo */
    "preprocessing",                                          /* fcnName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing.m" /* pathName */
};

static emlrtRSInfo b_emlrtRSI = {
    5,                                                        /* lineNo */
    "preprocessing",                                          /* fcnName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing.m" /* pathName */
};

static emlrtRSInfo c_emlrtRSI = {
    7,                                                        /* lineNo */
    "preprocessing",                                          /* fcnName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing.m" /* pathName */
};

static emlrtRSInfo d_emlrtRSI = {
    9,                                                        /* lineNo */
    "preprocessing",                                          /* fcnName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing.m" /* pathName */
};

static emlrtRSInfo e_emlrtRSI = {
    11,                                                       /* lineNo */
    "preprocessing",                                          /* fcnName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing.m" /* pathName */
};

static emlrtRSInfo f_emlrtRSI = {
    16,                                                       /* lineNo */
    "preprocessing",                                          /* fcnName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing.m" /* pathName */
};

static emlrtRSInfo u_emlrtRSI = {
    1,                       /* lineNo */
    "dts_cast_with_warning", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/coder/float2fixed/dtslib/"
    "dts_cast_with_warning.p" /* pathName */
};

static emlrtRSInfo v_emlrtRSI = {
    1,          /* lineNo */
    "dts_cast", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/coder/float2fixed/dtslib/dts_cast.p" /* pathName
                                                                            */
};

static emlrtRSInfo pb_emlrtRSI = {
    15,    /* lineNo */
    "min", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/min.m" /* pathName
                                                                     */
};

static emlrtRSInfo qb_emlrtRSI = {
    46,         /* lineNo */
    "minOrMax", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/minOrMax.m" /* pathName
                                                                            */
};

static emlrtRSInfo rb_emlrtRSI = {
    92,        /* lineNo */
    "minimum", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/minOrMax.m" /* pathName
                                                                            */
};

static emlrtRSInfo vb_emlrtRSI = {
    15,    /* lineNo */
    "max", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/max.m" /* pathName
                                                                     */
};

static emlrtRSInfo wb_emlrtRSI = {
    44,         /* lineNo */
    "minOrMax", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/minOrMax.m" /* pathName
                                                                            */
};

static emlrtRSInfo xb_emlrtRSI = {
    79,        /* lineNo */
    "maximum", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/minOrMax.m" /* pathName
                                                                            */
};

static emlrtRSInfo og_emlrtRSI = {
    162,                 /* lineNo */
    "pointCloud/select", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo pg_emlrtRSI =
    {
        208,             /* lineNo */
        "unaryMinOrMax", /* fcnName */
        "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
        "unaryMinOrMax.m" /* pathName */
};

static emlrtRSInfo qg_emlrtRSI =
    {
        897,                    /* lineNo */
        "minRealVectorOmitNaN", /* fcnName */
        "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
        "unaryMinOrMax.m" /* pathName */
};

static emlrtRSInfo rg_emlrtRSI = {
    73,                      /* lineNo */
    "vectorMinOrMaxInPlace", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
    "vectorMinOrMaxInPlace.m" /* pathName */
};

static emlrtRSInfo sg_emlrtRSI = {
    65,                      /* lineNo */
    "vectorMinOrMaxInPlace", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
    "vectorMinOrMaxInPlace.m" /* pathName */
};

static emlrtRSInfo tg_emlrtRSI = {
    114,         /* lineNo */
    "findFirst", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
    "vectorMinOrMaxInPlace.m" /* pathName */
};

static emlrtRSInfo ug_emlrtRSI = {
    131,                        /* lineNo */
    "minOrMaxRealVectorKernel", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
    "vectorMinOrMaxInPlace.m" /* pathName */
};

static emlrtRSInfo vg_emlrtRSI =
    {
        190,             /* lineNo */
        "unaryMinOrMax", /* fcnName */
        "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
        "unaryMinOrMax.m" /* pathName */
};

static emlrtRSInfo wg_emlrtRSI =
    {
        901,                    /* lineNo */
        "maxRealVectorOmitNaN", /* fcnName */
        "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
        "unaryMinOrMax.m" /* pathName */
};

static emlrtRTEInfo c_emlrtRTEI = {
    13,                /* lineNo */
    37,                /* colNo */
    "validateinteger", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/+valattr/"
    "validateinteger.m" /* pName */
};

static emlrtRTEInfo bb_emlrtRTEI = {
    9,                                                        /* lineNo */
    10,                                                       /* colNo */
    "preprocessing",                                          /* fName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing.m" /* pName */
};

static emlrtRTEInfo eb_emlrtRTEI = {
    13,                                                       /* lineNo */
    5,                                                        /* colNo */
    "preprocessing",                                          /* fName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing.m" /* pName */
};

static emlrtRTEInfo fb_emlrtRTEI = {
    14,                                                       /* lineNo */
    5,                                                        /* colNo */
    "preprocessing",                                          /* fName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing.m" /* pName */
};

static emlrtRTEInfo gb_emlrtRTEI = {
    11,                                                       /* lineNo */
    5,                                                        /* colNo */
    "preprocessing",                                          /* fName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing.m" /* pName */
};

static emlrtRTEInfo hb_emlrtRTEI = {
    7,                                                        /* lineNo */
    5,                                                        /* colNo */
    "preprocessing",                                          /* fName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing.m" /* pName */
};

static emlrtRTEInfo ib_emlrtRTEI = {
    3,                                                        /* lineNo */
    5,                                                        /* colNo */
    "preprocessing",                                          /* fName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing.m" /* pName */
};

static emlrtRTEInfo jb_emlrtRTEI = {
    5,                                                        /* lineNo */
    5,                                                        /* colNo */
    "preprocessing",                                          /* fName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing.m" /* pName */
};

static emlrtRTEInfo kb_emlrtRTEI = {
    1,                                                        /* lineNo */
    31,                                                       /* colNo */
    "preprocessing",                                          /* fName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing.m" /* pName */
};

/* Function Definitions */
void preprocessing(preprocessingStackData *SD, const emlrtStack *sp,
                   const real32_T points[172800],
                   const real32_T intensity[57600], const real32_T ROI[6],
                   real32_T GroundMaxDistance,
                   const real32_T GroundReferenceVector[3],
                   real32_T GroundMaxAngularDistance, emxArray_real32_T *Points,
                   emxArray_real32_T *Intensity)
{
  static const char_T functionName[6] = {'s', 'e', 'l', 'e', 'c', 't'};
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack e_st;
  emlrtStack f_st;
  emlrtStack g_st;
  emlrtStack h_st;
  emlrtStack i_st;
  emlrtStack j_st;
  emlrtStack k_st;
  emlrtStack st;
  emxArray_real32_T *b_intensity;
  emxArray_real32_T *loc;
  emxArray_real32_T *normal;
  emxArray_real32_T *nv;
  emxArray_real32_T *outliers;
  emxArray_real_T *auto_gen_tmp_1;
  emxArray_real_T *auto_gen_tmp_2;
  emxArray_uint32_T *indices;
  emxArray_uint8_T *c;
  pointCloud ptCld;
  pointCloud ptCloud_roi;
  pointCloud *fcnOutput;
  real_T *auto_gen_tmp_2_data;
  int32_T a;
  int32_T i;
  int32_T i1;
  int32_T i2;
  int32_T i3;
  int32_T idx;
  int32_T k;
  int32_T loop_ub;
  real32_T *Points_data;
  real32_T *normal_data;
  real32_T *outliers_data;
  uint8_T *c_data;
  boolean_T exitg1;
  boolean_T n;
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
  i_st.prev = &h_st;
  i_st.tls = h_st.tls;
  j_st.prev = &i_st;
  j_st.tls = i_st.tls;
  k_st.prev = &j_st;
  k_st.tls = j_st.tls;
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtConstCTX)sp);
  emxInitStruct_pointCloud(sp, &ptCld, &gb_emlrtRTEI);
  emxInitStruct_pointCloud(sp, &ptCloud_roi, &hb_emlrtRTEI);
  emxInitStruct_pointCloud1(sp, &SD->f0.ptCloud_tmp, &ib_emlrtRTEI);
  emxInit_uint32_T(sp, &indices, &jb_emlrtRTEI);
  emxInit_real32_T(sp, &outliers, 1, &bb_emlrtRTEI);
  emxInit_real_T(sp, &auto_gen_tmp_1, &kb_emlrtRTEI);
  emxInit_real_T(sp, &auto_gen_tmp_2, &kb_emlrtRTEI);
  emxInit_real32_T(sp, &loc, 2, &kb_emlrtRTEI);
  emxInit_uint8_T(sp, &c, &kb_emlrtRTEI);
  emxInit_real32_T(sp, &nv, 2, &kb_emlrtRTEI);
  emxInit_real32_T(sp, &b_intensity, 1, &kb_emlrtRTEI);
  emxInit_real32_T(sp, &normal, 2, &cb_emlrtRTEI);
  emlrtPushHeapReferenceStackR2021a((emlrtCTX)sp, true, &SD->f0.ptCloud_tmp,
                                    (void *)&handle_matlabCodegenDestructor,
                                    NULL, NULL, NULL);
  SD->f0.ptCloud_tmp.matlabCodegenIsDeleted = true;
  emlrtPushHeapReferenceStackR2021a((emlrtCTX)sp, true, &ptCld,
                                    (void *)&b_handle_matlabCodegenDestructo,
                                    NULL, NULL, NULL);
  ptCld.matlabCodegenIsDeleted = true;
  emlrtPushHeapReferenceStackR2021a((emlrtCTX)sp, true, &ptCloud_roi,
                                    (void *)&b_handle_matlabCodegenDestructo,
                                    NULL, NULL, NULL);
  ptCloud_roi.matlabCodegenIsDeleted = true;
  covrtLogFcn(&emlrtCoverageInstance, 0U, 0U);
  covrtLogBasicBlock(&emlrtCoverageInstance, 0U, 0U);
  st.site = &emlrtRSI;
  b_st.site = &emlrtRSI;
  pointCloud_pointCloud(&b_st, &SD->f0.ptCloud_tmp, points, intensity);
  b_st.site = &u_emlrtRSI;
  c_st.site = &v_emlrtRSI;
  st.site = &b_emlrtRSI;
  pointCloud_findPointsInROI(&st, &SD->f0.ptCloud_tmp, ROI, indices);
  st.site = &c_emlrtRSI;
  b_st.site = &c_emlrtRSI;
  pointCloud_select(&b_st, &SD->f0.ptCloud_tmp, indices, &ptCloud_roi);
  b_st.site = &u_emlrtRSI;
  c_st.site = &v_emlrtRSI;
  st.site = &d_emlrtRSI;
  pcfitplane(&st, &ptCloud_roi, GroundMaxDistance, GroundReferenceVector,
             GroundMaxAngularDistance, auto_gen_tmp_1, auto_gen_tmp_2);
  auto_gen_tmp_2_data = auto_gen_tmp_2->data;
  loop_ub = auto_gen_tmp_2->size[0];
  i = outliers->size[0];
  outliers->size[0] = auto_gen_tmp_2->size[0];
  emxEnsureCapacity_real32_T(sp, outliers, i, &bb_emlrtRTEI);
  outliers_data = outliers->data;
  for (i = 0; i < loop_ub; i++) {
    outliers_data[i] = (real32_T)auto_gen_tmp_2_data[i];
  }
  st.site = &d_emlrtRSI;
  b_st.site = &u_emlrtRSI;
  c_st.site = &v_emlrtRSI;
  st.site = &e_emlrtRSI;
  b_st.site = &e_emlrtRSI;
  c_st.site = &ob_emlrtRSI;
  d_st.site = &bb_emlrtRSI;
  n = (ptCloud_roi.PointCloudArrayData->size[0] *
           ptCloud_roi.PointCloudArrayData->size[1] ==
       1);
  if (!n) {
    emlrtErrorWithMessageIdR2018a(
        &c_st, &b_emlrtRTEI, "vision:pointcloud:arrayNotSupported",
        "vision:pointcloud:arrayNotSupported", 3, 4, 6, &functionName[0]);
  }
  c_st.site = &og_emlrtRSI;
  d_st.site = &eb_emlrtRSI;
  n = true;
  k = 0;
  exitg1 = false;
  while ((!exitg1) && (k <= outliers->size[0] - 1)) {
    if ((!muSingleScalarIsInf(outliers_data[k])) &&
        (!muSingleScalarIsNaN(outliers_data[k])) &&
        (outliers_data[k] == outliers_data[k])) {
      k++;
    } else {
      n = false;
      exitg1 = true;
    }
  }
  if (!n) {
    emlrtErrorWithMessageIdR2018a(
        &d_st, &c_emlrtRTEI, "Coder:toolbox:ValidateattributesexpectedInteger",
        "MATLAB:expectedInteger", 3, 4, 5, "input");
  }
  if (outliers->size[0] != 0) {
    real32_T ex;
    c_st.site = &nb_emlrtRSI;
    d_st.site = &pb_emlrtRSI;
    e_st.site = &qb_emlrtRSI;
    f_st.site = &rb_emlrtRSI;
    g_st.site = &pg_emlrtRSI;
    h_st.site = &qg_emlrtRSI;
    if (outliers->size[0] > 2) {
      i_st.site = &sg_emlrtRSI;
      if (!muSingleScalarIsNaN(outliers_data[0])) {
        idx = 1;
      } else {
        idx = 0;
        j_st.site = &tg_emlrtRSI;
        if (outliers->size[0] > 2147483646) {
          k_st.site = &r_emlrtRSI;
          check_forloop_overflow_error(&k_st);
        }
        k = 2;
        exitg1 = false;
        while ((!exitg1) && (k <= outliers->size[0])) {
          if (!muSingleScalarIsNaN(outliers_data[k - 1])) {
            idx = k;
            exitg1 = true;
          } else {
            k++;
          }
        }
      }
      if (idx != 0) {
        i_st.site = &rg_emlrtRSI;
        j_st.site = &ug_emlrtRSI;
        if ((idx + 1 <= outliers->size[0]) &&
            (outliers->size[0] > 2147483646)) {
          k_st.site = &r_emlrtRSI;
          check_forloop_overflow_error(&k_st);
        }
      }
    }
    c_st.site = &nb_emlrtRSI;
    d_st.site = &vb_emlrtRSI;
    e_st.site = &wb_emlrtRSI;
    f_st.site = &xb_emlrtRSI;
    g_st.site = &vg_emlrtRSI;
    h_st.site = &wg_emlrtRSI;
    if (outliers->size[0] <= 2) {
      if (outliers->size[0] == 1) {
        ex = outliers_data[0];
      } else if ((outliers_data[0] < outliers_data[1]) ||
                 (muSingleScalarIsNaN(outliers_data[0]) &&
                  (!muSingleScalarIsNaN(outliers_data[1])))) {
        ex = outliers_data[1];
      } else {
        ex = outliers_data[0];
      }
    } else {
      i_st.site = &sg_emlrtRSI;
      if (!muSingleScalarIsNaN(outliers_data[0])) {
        idx = 1;
      } else {
        idx = 0;
        j_st.site = &tg_emlrtRSI;
        if (outliers->size[0] > 2147483646) {
          k_st.site = &r_emlrtRSI;
          check_forloop_overflow_error(&k_st);
        }
        k = 2;
        exitg1 = false;
        while ((!exitg1) && (k <= loop_ub)) {
          if (!muSingleScalarIsNaN(outliers_data[k - 1])) {
            idx = k;
            exitg1 = true;
          } else {
            k++;
          }
        }
      }
      if (idx == 0) {
        ex = outliers_data[0];
      } else {
        i_st.site = &rg_emlrtRSI;
        ex = outliers_data[idx - 1];
        a = idx + 1;
        j_st.site = &ug_emlrtRSI;
        if ((idx + 1 <= outliers->size[0]) &&
            (outliers->size[0] > 2147483646)) {
          k_st.site = &r_emlrtRSI;
          check_forloop_overflow_error(&k_st);
        }
        for (k = a; k <= loop_ub; k++) {
          real32_T f;
          f = outliers_data[k - 1];
          if (ex < f) {
            ex = f;
          }
        }
      }
    }
    c_st.site = &nb_emlrtRSI;
    idx = ptCloud_roi.Location->size[0];
    if ((real_T)ex > idx) {
      emlrtErrorWithMessageIdR2018a(
          &b_st, &emlrtRTEI, "vision:pointcloud:indicesOutofRangeForSelect",
          "vision:pointcloud:indicesOutofRangeForSelect", 0);
    }
  }
  c_st.site = &mb_emlrtRSI;
  d_st.site = &yb_emlrtRSI;
  i = ptCloud_roi.Normal->size[0];
  i1 = normal->size[0] * normal->size[1];
  normal->size[0] = i;
  idx = ptCloud_roi.Normal->size[1];
  normal->size[1] = idx;
  emxEnsureCapacity_real32_T(&d_st, normal, i1, &cb_emlrtRTEI);
  normal_data = normal->data;
  a = ptCloud_roi.Normal->size[0] * ptCloud_roi.Normal->size[1];
  for (i1 = 0; i1 < a; i1++) {
    normal_data[i1] = ptCloud_roi.Normal->data[i1];
  }
  if (ptCloud_roi.Location->size[0] != 0) {
    k = ptCloud_roi.Location->size[0];
    i1 = loc->size[0] * loc->size[1];
    loc->size[0] = auto_gen_tmp_2->size[0];
    loc->size[1] = 3;
    emxEnsureCapacity_real32_T(&d_st, loc, i1, &db_emlrtRTEI);
    Points_data = loc->data;
    for (i1 = 0; i1 < 3; i1++) {
      for (i2 = 0; i2 < loop_ub; i2++) {
        i3 = (int32_T)outliers_data[i2];
        if ((i3 < 1) || (i3 > k)) {
          emlrtDynamicBoundsCheckR2012b(i3, 1, k, &emlrtBCI, &d_st);
        }
        Points_data[i2 + loc->size[0] * i1] =
            ptCloud_roi.Location->data[((int32_T)(real32_T)i3 +
                                        ptCloud_roi.Location->size[0] * i1) -
                                       1];
      }
    }
  } else {
    loc->size[0] = 0;
    loc->size[1] = 3;
  }
  if ((ptCloud_roi.Color->size[0] != 0) && (ptCloud_roi.Color->size[1] != 0)) {
    k = ptCloud_roi.Color->size[0];
    i1 = c->size[0] * c->size[1];
    c->size[0] = auto_gen_tmp_2->size[0];
    c->size[1] = ptCloud_roi.Color->size[1];
    emxEnsureCapacity_uint8_T(&d_st, c, i1, &db_emlrtRTEI);
    c_data = c->data;
    a = ptCloud_roi.Color->size[1];
    for (i1 = 0; i1 < a; i1++) {
      for (i2 = 0; i2 < loop_ub; i2++) {
        i3 = (int32_T)outliers_data[i2];
        if ((i3 < 1) || (i3 > k)) {
          emlrtDynamicBoundsCheckR2012b(i3, 1, k, &emlrtBCI, &d_st);
        }
        c_data[i2 + c->size[0] * i1] =
            ptCloud_roi.Color->data[((int32_T)(real32_T)i3 +
                                     ptCloud_roi.Color->size[0] * i1) -
                                    1];
      }
    }
  } else {
    c->size[0] = 0;
    c->size[1] = 0;
  }
  if ((normal->size[0] != 0) && (normal->size[1] != 0)) {
    i1 = nv->size[0] * nv->size[1];
    nv->size[0] = auto_gen_tmp_2->size[0];
    nv->size[1] = idx;
    emxEnsureCapacity_real32_T(&d_st, nv, i1, &db_emlrtRTEI);
    Points_data = nv->data;
    for (i1 = 0; i1 < idx; i1++) {
      for (i2 = 0; i2 < loop_ub; i2++) {
        i3 = (int32_T)outliers_data[i2];
        if ((i3 < 1) || (i3 > i)) {
          emlrtDynamicBoundsCheckR2012b(i3, 1, i, &emlrtBCI, &d_st);
        }
        Points_data[i2 + nv->size[0] * i1] =
            normal_data[((int32_T)(real32_T)i3 + normal->size[0] * i1) - 1];
      }
    }
  } else {
    nv->size[0] = 0;
    nv->size[1] = 0;
  }
  if (ptCloud_roi.Intensity->size[0] != 0) {
    k = ptCloud_roi.Intensity->size[0];
    i = b_intensity->size[0];
    b_intensity->size[0] = auto_gen_tmp_2->size[0];
    emxEnsureCapacity_real32_T(&d_st, b_intensity, i, &db_emlrtRTEI);
    Points_data = b_intensity->data;
    for (i = 0; i < loop_ub; i++) {
      i1 = (int32_T)outliers_data[i];
      if ((i1 < 1) || (i1 > k)) {
        emlrtDynamicBoundsCheckR2012b(i1, 1, k, &emlrtBCI, &d_st);
      }
      Points_data[i] = ptCloud_roi.Intensity->data[(int32_T)(real32_T)i1 - 1];
    }
  } else {
    b_intensity->size[0] = 0;
  }
  if ((ptCloud_roi.RangeData->size[0] != 0) &&
      (ptCloud_roi.RangeData->size[1] != 0)) {
    k = ptCloud_roi.RangeData->size[0];
    i = normal->size[0] * normal->size[1];
    normal->size[0] = auto_gen_tmp_2->size[0];
    normal->size[1] = ptCloud_roi.RangeData->size[1];
    emxEnsureCapacity_real32_T(&d_st, normal, i, &db_emlrtRTEI);
    normal_data = normal->data;
    idx = ptCloud_roi.RangeData->size[1];
    for (i = 0; i < idx; i++) {
      for (i1 = 0; i1 < loop_ub; i1++) {
        i2 = (int32_T)outliers_data[i1];
        if ((i2 < 1) || (i2 > k)) {
          emlrtDynamicBoundsCheckR2012b(i2, 1, k, &emlrtBCI, &d_st);
        }
        normal_data[i1 + normal->size[0] * i] =
            ptCloud_roi.RangeData->data[((int32_T)(real32_T)i2 +
                                         ptCloud_roi.RangeData->size[0] * i) -
                                        1];
      }
    }
  } else {
    normal->size[0] = 0;
    normal->size[1] = 0;
  }
  c_st.site = &lb_emlrtRSI;
  fcnOutput = b_pointCloud_pointCloud(&c_st, &ptCld, loc, c, nv, b_intensity);
  c_st.site = &kb_emlrtRSI;
  pointCloudBase_set_RangeData(&c_st, fcnOutput, normal);
  b_st.site = &u_emlrtRSI;
  c_st.site = &v_emlrtRSI;
  i = Points->size[0] * Points->size[1];
  Points->size[0] = ptCld.Location->size[0];
  Points->size[1] = 3;
  emxEnsureCapacity_real32_T(sp, Points, i, &eb_emlrtRTEI);
  Points_data = Points->data;
  loop_ub = ptCld.Location->size[0] * 3;
  for (i = 0; i < loop_ub; i++) {
    Points_data[i] = ptCld.Location->data[i];
  }
  i = Intensity->size[0];
  Intensity->size[0] = ptCld.Intensity->size[0];
  emxEnsureCapacity_real32_T(sp, Intensity, i, &fb_emlrtRTEI);
  Points_data = Intensity->data;
  loop_ub = ptCld.Intensity->size[0];
  for (i = 0; i < loop_ub; i++) {
    Points_data[i] = ptCld.Intensity->data[i];
  }
  st.site = &f_emlrtRSI;
  b_handle_matlabCodegenDestructo(&st, &ptCloud_roi);
  st.site = &f_emlrtRSI;
  b_handle_matlabCodegenDestructo(&st, &ptCld);
  st.site = &f_emlrtRSI;
  handle_matlabCodegenDestructor(&st, &SD->f0.ptCloud_tmp);
  emxFree_real32_T(sp, &normal);
  emxFree_real32_T(sp, &b_intensity);
  emxFree_real32_T(sp, &nv);
  emxFree_uint8_T(sp, &c);
  emxFree_real32_T(sp, &loc);
  emxFree_real_T(sp, &auto_gen_tmp_2);
  emxFree_real_T(sp, &auto_gen_tmp_1);
  emxFree_real32_T(sp, &outliers);
  emxFree_uint32_T(sp, &indices);
  emxFreeStruct_pointCloud1(sp, &SD->f0.ptCloud_tmp);
  emxFreeStruct_pointCloud(sp, &ptCloud_roi);
  emxFreeStruct_pointCloud(sp, &ptCld);
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtConstCTX)sp);
}

/* End of code generation (preprocessing.c) */
