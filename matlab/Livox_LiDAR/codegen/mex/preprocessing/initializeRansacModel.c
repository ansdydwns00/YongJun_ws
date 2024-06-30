/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * initializeRansacModel.c
 *
 * Code generation for function 'initializeRansacModel'
 *
 */

/* Include files */
#include "initializeRansacModel.h"
#include "eml_int_forloop_overflow_check.h"
#include "find.h"
#include "pointCloud.h"
#include "pointCloudBase.h"
#include "preprocessing_data.h"
#include "preprocessing_emxutil.h"
#include "preprocessing_types.h"
#include "rt_nonfinite.h"
#include "mwmathutil.h"

/* Variable Definitions */
static emlrtRSInfo ed_emlrtRSI = {
    26,                      /* lineNo */
    "initializeRansacModel", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "initializeRansacModel.m" /* pathName */
};

static emlrtRSInfo fd_emlrtRSI = {
    23,                      /* lineNo */
    "initializeRansacModel", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "initializeRansacModel.m" /* pathName */
};

static emlrtRSInfo gd_emlrtRSI = {
    236,                              /* lineNo */
    "pointCloud/removeInvalidPoints", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo hd_emlrtRSI = {
    239,                              /* lineNo */
    "pointCloud/removeInvalidPoints", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo id_emlrtRSI = {
    241,                              /* lineNo */
    "pointCloud/removeInvalidPoints", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo jd_emlrtRSI = {
    245,                              /* lineNo */
    "pointCloud/removeInvalidPoints", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo kd_emlrtRSI = {
    308,                             /* lineNo */
    "pointCloud/extractValidPoints", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo ld_emlrtRSI = {
    311,                             /* lineNo */
    "pointCloud/extractValidPoints", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo md_emlrtRSI = {
    312,                             /* lineNo */
    "pointCloud/extractValidPoints", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo nd_emlrtRSI = {
    430,                                     /* lineNo */
    "pointCloudBase/extractValidPointsImpl", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo rd_emlrtRSI = {
    193,                /* lineNo */
    "colMajorFlatIter", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/private/"
    "combineVectorElements.m" /* pathName */
};

static emlrtRSInfo sd_emlrtRSI = {
    211,                /* lineNo */
    "colMajorFlatIter", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/private/"
    "combineVectorElements.m" /* pathName */
};

static emlrtRTEInfo fc_emlrtRTEI = {
    427,              /* lineNo */
    27,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo gc_emlrtRTEI = {
    427,              /* lineNo */
    13,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo hc_emlrtRTEI = {
    181,                     /* lineNo */
    24,                      /* colNo */
    "combineVectorElements", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/private/"
    "combineVectorElements.m" /* pName */
};

static emlrtRTEInfo ic_emlrtRTEI = {
    311,          /* lineNo */
    17,           /* colNo */
    "pointCloud", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pName */
};

static emlrtRTEInfo jc_emlrtRTEI = {
    208,              /* lineNo */
    17,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo kc_emlrtRTEI = {
    208,              /* lineNo */
    32,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo lc_emlrtRTEI = {
    209,              /* lineNo */
    17,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo mc_emlrtRTEI = {
    209,              /* lineNo */
    33,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo nc_emlrtRTEI = {
    5,                       /* lineNo */
    5,                       /* colNo */
    "initializeRansacModel", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+ransac/"
    "initializeRansacModel.m" /* pName */
};

static emlrtRTEInfo oc_emlrtRTEI = {
    245,          /* lineNo */
    21,           /* colNo */
    "pointCloud", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pName */
};

static emlrtRTEInfo pc_emlrtRTEI = {
    15,                                                             /* lineNo */
    9,                                                              /* colNo */
    "sum",                                                          /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/sum.m" /* pName */
};

/* Function Definitions */
int32_T initializeRansacModel(const emlrtStack *sp, const pointCloud *ptCloud,
                              pointCloud *iobj_0, pointCloud **pc,
                              emxArray_real_T *validPtCloudIndices)
{
  static const char_T functionName[19] = {'r', 'e', 'm', 'o', 'v', 'e', 'I',
                                          'n', 'v', 'a', 'l', 'i', 'd', 'P',
                                          'o', 'i', 'n', 't', 's'};
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack e_st;
  emlrtStack f_st;
  emlrtStack g_st;
  emlrtStack h_st;
  emlrtStack i_st;
  emlrtStack st;
  emxArray_boolean_T *indices;
  emxArray_boolean_T *tf;
  emxArray_int32_T *nz;
  emxArray_int32_T *r;
  emxArray_int32_T *r1;
  emxArray_int32_T *r2;
  emxArray_int32_T *r3;
  emxArray_real32_T *b_intensity;
  emxArray_real32_T *intensity;
  emxArray_real32_T *loc;
  emxArray_real32_T *normal;
  emxArray_real32_T *nv;
  emxArray_real32_T *rangeData;
  emxArray_real32_T *x;
  emxArray_uint8_T *c;
  emxArray_uint8_T *color;
  pointCloud *b_pc;
  real_T *validPtCloudIndices_data;
  int32_T b_loop_ub;
  int32_T c_loop_ub;
  int32_T i;
  int32_T j;
  int32_T loop_ub;
  int32_T status;
  int32_T xoffset;
  int32_T *nz_data;
  real32_T *intensity_data;
  real32_T *loc_data;
  real32_T *normal_data;
  real32_T *rangeData_data;
  real32_T *x_data;
  uint8_T *c_data;
  uint8_T *color_data;
  boolean_T n;
  boolean_T *tf_data;
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
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtConstCTX)sp);
  st.site = &fd_emlrtRSI;
  b_st.site = &gd_emlrtRSI;
  c_st.site = &kd_emlrtRSI;
  d_st.site = &bb_emlrtRSI;
  n = (ptCloud->PointCloudArrayData->size[0] *
           ptCloud->PointCloudArrayData->size[1] ==
       1);
  if (!n) {
    emlrtErrorWithMessageIdR2018a(
        &c_st, &b_emlrtRTEI, "vision:pointcloud:arrayNotSupported",
        "vision:pointcloud:arrayNotSupported", 3, 4, 19, &functionName[0]);
  }
  c_st.site = &ld_emlrtRSI;
  emxInit_real32_T(&c_st, &x, 2, &fc_emlrtRTEI);
  i = ptCloud->Location->size[0];
  j = x->size[0] * x->size[1];
  x->size[0] = i;
  x->size[1] = 3;
  emxEnsureCapacity_real32_T(&c_st, x, j, &fc_emlrtRTEI);
  x_data = x->data;
  loop_ub = ptCloud->Location->size[0] * 3;
  for (j = 0; j < loop_ub; j++) {
    x_data[j] = ptCloud->Location->data[j];
  }
  emxInit_boolean_T(&c_st, &tf, 2, &gc_emlrtRTEI);
  j = tf->size[0] * tf->size[1];
  tf->size[0] = i;
  tf->size[1] = 3;
  emxEnsureCapacity_boolean_T(&c_st, tf, j, &gc_emlrtRTEI);
  tf_data = tf->data;
  xoffset = x->size[0] * 3;
  for (j = 0; j < xoffset; j++) {
    tf_data[j] = ((!muSingleScalarIsInf(x_data[j])) &&
                  (!muSingleScalarIsNaN(x_data[j])));
  }
  d_st.site = &nd_emlrtRSI;
  e_st.site = &od_emlrtRSI;
  f_st.site = &pd_emlrtRSI;
  emxInit_int32_T(&f_st, &nz, &pc_emlrtRTEI);
  nz_data = nz->data;
  if (tf->size[0] == 0) {
    nz->size[0] = 0;
  } else {
    g_st.site = &qd_emlrtRSI;
    j = nz->size[0];
    nz->size[0] = i;
    emxEnsureCapacity_int32_T(&g_st, nz, j, &hc_emlrtRTEI);
    nz_data = nz->data;
    h_st.site = &rd_emlrtRSI;
    if (tf->size[0] > 2147483646) {
      i_st.site = &r_emlrtRSI;
      check_forloop_overflow_error(&i_st);
    }
    for (j = 0; j < i; j++) {
      nz_data[j] = tf_data[j];
    }
    for (loop_ub = 0; loop_ub < 2; loop_ub++) {
      xoffset = (loop_ub + 1) * i;
      h_st.site = &sd_emlrtRSI;
      for (j = 0; j < i; j++) {
        nz_data[j] += tf_data[xoffset + j];
      }
    }
  }
  emxFree_boolean_T(&f_st, &tf);
  emxInit_boolean_T(&c_st, &indices, 1, &nc_emlrtRTEI);
  loop_ub = nz->size[0];
  i = indices->size[0];
  indices->size[0] = nz->size[0];
  emxEnsureCapacity_boolean_T(&c_st, indices, i, &ic_emlrtRTEI);
  tf_data = indices->data;
  for (i = 0; i < loop_ub; i++) {
    tf_data[i] = (nz_data[i] == 3);
  }
  c_st.site = &md_emlrtRSI;
  d_st.site = &yb_emlrtRSI;
  i = x->size[0] * x->size[1];
  x->size[0] = ptCloud->Location->size[0];
  x->size[1] = 3;
  emxEnsureCapacity_real32_T(&d_st, x, i, &jc_emlrtRTEI);
  x_data = x->data;
  loop_ub = ptCloud->Location->size[0] * 3;
  for (i = 0; i < loop_ub; i++) {
    x_data[i] = ptCloud->Location->data[i];
  }
  emxInit_uint8_T(&d_st, &color, &kc_emlrtRTEI);
  i = color->size[0] * color->size[1];
  color->size[0] = ptCloud->Color->size[0];
  loop_ub = ptCloud->Color->size[1];
  color->size[1] = loop_ub;
  emxEnsureCapacity_uint8_T(&d_st, color, i, &kc_emlrtRTEI);
  color_data = color->data;
  b_loop_ub = ptCloud->Color->size[0] * ptCloud->Color->size[1];
  for (i = 0; i < b_loop_ub; i++) {
    color_data[i] = ptCloud->Color->data[i];
  }
  emxInit_real32_T(&d_st, &normal, 2, &cb_emlrtRTEI);
  i = normal->size[0] * normal->size[1];
  normal->size[0] = ptCloud->Normal->size[0];
  b_loop_ub = ptCloud->Normal->size[1];
  normal->size[1] = b_loop_ub;
  emxEnsureCapacity_real32_T(&d_st, normal, i, &cb_emlrtRTEI);
  normal_data = normal->data;
  c_loop_ub = ptCloud->Normal->size[0] * ptCloud->Normal->size[1];
  for (i = 0; i < c_loop_ub; i++) {
    normal_data[i] = ptCloud->Normal->data[i];
  }
  emxInit_real32_T(&d_st, &intensity, 1, &lc_emlrtRTEI);
  i = intensity->size[0];
  intensity->size[0] = ptCloud->Intensity->size[0];
  emxEnsureCapacity_real32_T(&d_st, intensity, i, &lc_emlrtRTEI);
  intensity_data = intensity->data;
  c_loop_ub = ptCloud->Intensity->size[0];
  for (i = 0; i < c_loop_ub; i++) {
    intensity_data[i] = ptCloud->Intensity->data[i];
  }
  emxInit_real32_T(&d_st, &rangeData, 2, &mc_emlrtRTEI);
  i = rangeData->size[0] * rangeData->size[1];
  rangeData->size[0] = ptCloud->RangeData->size[0];
  c_loop_ub = ptCloud->RangeData->size[1];
  rangeData->size[1] = c_loop_ub;
  emxEnsureCapacity_real32_T(&d_st, rangeData, i, &mc_emlrtRTEI);
  rangeData_data = rangeData->data;
  xoffset = ptCloud->RangeData->size[0] * ptCloud->RangeData->size[1];
  for (i = 0; i < xoffset; i++) {
    rangeData_data[i] = ptCloud->RangeData->data[i];
  }
  emxInit_real32_T(&d_st, &loc, 2, &nc_emlrtRTEI);
  if (x->size[0] != 0) {
    j = indices->size[0] - 1;
    xoffset = 0;
    for (i = 0; i <= j; i++) {
      if (tf_data[i]) {
        xoffset++;
      }
    }
    emxInit_int32_T(&d_st, &r, &db_emlrtRTEI);
    i = r->size[0];
    r->size[0] = xoffset;
    emxEnsureCapacity_int32_T(&d_st, r, i, &nc_emlrtRTEI);
    nz_data = r->data;
    xoffset = 0;
    for (i = 0; i <= j; i++) {
      if (tf_data[i]) {
        nz_data[xoffset] = i;
        xoffset++;
      }
    }
    xoffset = r->size[0];
    i = loc->size[0] * loc->size[1];
    loc->size[0] = r->size[0];
    loc->size[1] = 3;
    emxEnsureCapacity_real32_T(&d_st, loc, i, &db_emlrtRTEI);
    loc_data = loc->data;
    for (i = 0; i < 3; i++) {
      for (j = 0; j < xoffset; j++) {
        if (nz_data[j] > x->size[0] - 1) {
          emlrtDynamicBoundsCheckR2012b(nz_data[j], 0, x->size[0] - 1,
                                        &emlrtBCI, &d_st);
        }
        loc_data[j + loc->size[0] * i] = x_data[nz_data[j] + x->size[0] * i];
      }
    }
    emxFree_int32_T(&d_st, &r);
  } else {
    loc->size[0] = 0;
    loc->size[1] = 3;
  }
  emxFree_real32_T(&d_st, &x);
  emxInit_uint8_T(&d_st, &c, &nc_emlrtRTEI);
  if ((color->size[0] != 0) && (color->size[1] != 0)) {
    j = indices->size[0] - 1;
    xoffset = 0;
    for (i = 0; i <= j; i++) {
      if (tf_data[i]) {
        xoffset++;
      }
    }
    emxInit_int32_T(&d_st, &r1, &db_emlrtRTEI);
    i = r1->size[0];
    r1->size[0] = xoffset;
    emxEnsureCapacity_int32_T(&d_st, r1, i, &nc_emlrtRTEI);
    nz_data = r1->data;
    xoffset = 0;
    for (i = 0; i <= j; i++) {
      if (tf_data[i]) {
        nz_data[xoffset] = i;
        xoffset++;
      }
    }
    xoffset = r1->size[0];
    i = c->size[0] * c->size[1];
    c->size[0] = r1->size[0];
    c->size[1] = loop_ub;
    emxEnsureCapacity_uint8_T(&d_st, c, i, &db_emlrtRTEI);
    c_data = c->data;
    for (i = 0; i < loop_ub; i++) {
      for (j = 0; j < xoffset; j++) {
        if (nz_data[j] > color->size[0] - 1) {
          emlrtDynamicBoundsCheckR2012b(nz_data[j], 0, color->size[0] - 1,
                                        &emlrtBCI, &d_st);
        }
        c_data[j + c->size[0] * i] =
            color_data[nz_data[j] + color->size[0] * i];
      }
    }
    emxFree_int32_T(&d_st, &r1);
  } else {
    c->size[0] = 0;
    c->size[1] = 0;
  }
  emxFree_uint8_T(&d_st, &color);
  emxInit_real32_T(&d_st, &nv, 2, &nc_emlrtRTEI);
  if ((normal->size[0] != 0) && (normal->size[1] != 0)) {
    j = indices->size[0] - 1;
    xoffset = 0;
    for (i = 0; i <= j; i++) {
      if (tf_data[i]) {
        xoffset++;
      }
    }
    emxInit_int32_T(&d_st, &r2, &db_emlrtRTEI);
    i = r2->size[0];
    r2->size[0] = xoffset;
    emxEnsureCapacity_int32_T(&d_st, r2, i, &nc_emlrtRTEI);
    nz_data = r2->data;
    xoffset = 0;
    for (i = 0; i <= j; i++) {
      if (tf_data[i]) {
        nz_data[xoffset] = i;
        xoffset++;
      }
    }
    loop_ub = r2->size[0];
    i = nv->size[0] * nv->size[1];
    nv->size[0] = r2->size[0];
    nv->size[1] = b_loop_ub;
    emxEnsureCapacity_real32_T(&d_st, nv, i, &db_emlrtRTEI);
    x_data = nv->data;
    for (i = 0; i < b_loop_ub; i++) {
      for (j = 0; j < loop_ub; j++) {
        if (nz_data[j] > normal->size[0] - 1) {
          emlrtDynamicBoundsCheckR2012b(nz_data[j], 0, normal->size[0] - 1,
                                        &emlrtBCI, &d_st);
        }
        x_data[j + nv->size[0] * i] =
            normal_data[nz_data[j] + normal->size[0] * i];
      }
    }
    emxFree_int32_T(&d_st, &r2);
  } else {
    nv->size[0] = 0;
    nv->size[1] = 0;
  }
  emxInit_real32_T(&d_st, &b_intensity, 1, &nc_emlrtRTEI);
  if (intensity->size[0] != 0) {
    j = indices->size[0] - 1;
    xoffset = 0;
    for (i = 0; i <= j; i++) {
      if (tf_data[i]) {
        xoffset++;
      }
    }
    i = b_intensity->size[0];
    b_intensity->size[0] = xoffset;
    emxEnsureCapacity_real32_T(&d_st, b_intensity, i, &nc_emlrtRTEI);
    x_data = b_intensity->data;
    xoffset = 0;
    for (i = 0; i <= j; i++) {
      if (tf_data[i]) {
        if (i > intensity->size[0] - 1) {
          emlrtDynamicBoundsCheckR2012b(i, 0, intensity->size[0] - 1, &emlrtBCI,
                                        &d_st);
        }
        x_data[xoffset] = intensity_data[i];
        xoffset++;
      }
    }
  } else {
    b_intensity->size[0] = 0;
  }
  emxFree_real32_T(&d_st, &intensity);
  if ((rangeData->size[0] != 0) && (rangeData->size[1] != 0)) {
    j = indices->size[0] - 1;
    xoffset = 0;
    for (i = 0; i <= j; i++) {
      if (tf_data[i]) {
        xoffset++;
      }
    }
    emxInit_int32_T(&d_st, &r3, &db_emlrtRTEI);
    i = r3->size[0];
    r3->size[0] = xoffset;
    emxEnsureCapacity_int32_T(&d_st, r3, i, &nc_emlrtRTEI);
    nz_data = r3->data;
    xoffset = 0;
    for (i = 0; i <= j; i++) {
      if (tf_data[i]) {
        nz_data[xoffset] = i;
        xoffset++;
      }
    }
    loop_ub = r3->size[0];
    i = normal->size[0] * normal->size[1];
    normal->size[0] = r3->size[0];
    normal->size[1] = c_loop_ub;
    emxEnsureCapacity_real32_T(&d_st, normal, i, &db_emlrtRTEI);
    normal_data = normal->data;
    for (i = 0; i < c_loop_ub; i++) {
      for (j = 0; j < loop_ub; j++) {
        if (nz_data[j] > rangeData->size[0] - 1) {
          emlrtDynamicBoundsCheckR2012b(nz_data[j], 0, rangeData->size[0] - 1,
                                        &emlrtBCI, &d_st);
        }
        normal_data[j + normal->size[0] * i] =
            rangeData_data[nz_data[j] + rangeData->size[0] * i];
      }
    }
    emxFree_int32_T(&d_st, &r3);
  } else {
    normal->size[0] = 0;
    normal->size[1] = 0;
  }
  emxFree_real32_T(&d_st, &rangeData);
  b_st.site = &hd_emlrtRSI;
  b_pc = b_pointCloud_pointCloud(&b_st, iobj_0, loc, c, nv, b_intensity);
  emxFree_real32_T(&st, &b_intensity);
  emxFree_real32_T(&st, &nv);
  emxFree_uint8_T(&st, &c);
  emxFree_real32_T(&st, &loc);
  b_st.site = &id_emlrtRSI;
  pointCloudBase_set_RangeData(&b_st, b_pc, normal);
  emxFree_real32_T(&st, &normal);
  b_st.site = &jd_emlrtRSI;
  c_st.site = &gb_emlrtRSI;
  eml_find(&c_st, indices, nz);
  nz_data = nz->data;
  emxFree_boolean_T(&b_st, &indices);
  loop_ub = nz->size[0];
  i = validPtCloudIndices->size[0];
  validPtCloudIndices->size[0] = nz->size[0];
  emxEnsureCapacity_real_T(&b_st, validPtCloudIndices, i, &oc_emlrtRTEI);
  validPtCloudIndices_data = validPtCloudIndices->data;
  for (i = 0; i < loop_ub; i++) {
    validPtCloudIndices_data[i] = nz_data[i];
  }
  emxFree_int32_T(&b_st, &nz);
  *pc = b_pc;
  st.site = &ed_emlrtRSI;
  xoffset = b_pc->Location->size[0];
  status = (xoffset < 3);
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtConstCTX)sp);
  return status;
}

/* End of code generation (initializeRansacModel.c) */
