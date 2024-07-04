/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * pointCloud.c
 *
 * Code generation for function 'pointCloud'
 *
 */

/* Include files */
#include "pointCloud.h"
#include "assertValidSizeArg.h"
#include "eml_int_forloop_overflow_check.h"
#include "indexShapeCheck.h"
#include "pointCloudBase.h"
#include "preprocessing2_data.h"
#include "preprocessing2_emxutil.h"
#include "preprocessing2_types.h"
#include "rt_nonfinite.h"
#include "mwmathutil.h"

/* Variable Definitions */
static emlrtRSInfo i_emlrtRSI = {
    75,                              /* lineNo */
    "pointCloudBase/pointCloudBase", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo j_emlrtRSI = {
    87,                              /* lineNo */
    "pointCloudBase/pointCloudBase", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo k_emlrtRSI = {
    88,                              /* lineNo */
    "pointCloudBase/pointCloudBase", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo m_emlrtRSI = {
    90,                              /* lineNo */
    "pointCloudBase/pointCloudBase", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo n_emlrtRSI = {
    134,                        /* lineNo */
    "pointCloudBase/set.Color", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo o_emlrtRSI = {
    770,                            /* lineNo */
    "pointCloudBase/validateColor", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo r_emlrtRSI = {
    139,                         /* lineNo */
    "pointCloudBase/set.Normal", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo v_emlrtRSI = {
    154,                 /* lineNo */
    "pointCloud/select", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo w_emlrtRSI = {
    175,                 /* lineNo */
    "pointCloud/select", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo x_emlrtRSI = {
    220,                 /* lineNo */
    "pointCloud/select", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo y_emlrtRSI = {
    228,                 /* lineNo */
    "pointCloud/select", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo ab_emlrtRSI = {
    230,                 /* lineNo */
    "pointCloud/select", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo kb_emlrtRSI = {
    144,                            /* lineNo */
    "pointCloudBase/set.Intensity", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo xf_emlrtRSI = {
    166,                 /* lineNo */
    "pointCloud/select", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo yf_emlrtRSI = {
    162,                 /* lineNo */
    "pointCloud/select", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo ag_emlrtRSI = {
    15,    /* lineNo */
    "min", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/min.m" /* pathName
                                                                     */
};

static emlrtRSInfo bg_emlrtRSI = {
    46,         /* lineNo */
    "minOrMax", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/minOrMax.m" /* pathName
                                                                            */
};

static emlrtRSInfo cg_emlrtRSI = {
    92,        /* lineNo */
    "minimum", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/minOrMax.m" /* pathName
                                                                            */
};

static emlrtRSInfo dg_emlrtRSI =
    {
        208,             /* lineNo */
        "unaryMinOrMax", /* fcnName */
        "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
        "unaryMinOrMax.m" /* pathName */
};

static emlrtRSInfo eg_emlrtRSI =
    {
        897,                    /* lineNo */
        "minRealVectorOmitNaN", /* fcnName */
        "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
        "unaryMinOrMax.m" /* pathName */
};

static emlrtRSInfo fg_emlrtRSI = {
    73,                      /* lineNo */
    "vectorMinOrMaxInPlace", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
    "vectorMinOrMaxInPlace.m" /* pathName */
};

static emlrtRSInfo gg_emlrtRSI = {
    65,                      /* lineNo */
    "vectorMinOrMaxInPlace", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
    "vectorMinOrMaxInPlace.m" /* pathName */
};

static emlrtRSInfo hg_emlrtRSI = {
    114,         /* lineNo */
    "findFirst", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
    "vectorMinOrMaxInPlace.m" /* pathName */
};

static emlrtRSInfo ig_emlrtRSI = {
    131,                        /* lineNo */
    "minOrMaxRealVectorKernel", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
    "vectorMinOrMaxInPlace.m" /* pathName */
};

static emlrtRSInfo jg_emlrtRSI = {
    15,    /* lineNo */
    "max", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/max.m" /* pathName
                                                                     */
};

static emlrtRSInfo kg_emlrtRSI = {
    44,         /* lineNo */
    "minOrMax", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/minOrMax.m" /* pathName
                                                                            */
};

static emlrtRSInfo lg_emlrtRSI = {
    79,        /* lineNo */
    "maximum", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/minOrMax.m" /* pathName
                                                                            */
};

static emlrtRSInfo mg_emlrtRSI =
    {
        190,             /* lineNo */
        "unaryMinOrMax", /* fcnName */
        "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
        "unaryMinOrMax.m" /* pathName */
};

static emlrtRSInfo ng_emlrtRSI =
    {
        901,                    /* lineNo */
        "maxRealVectorOmitNaN", /* fcnName */
        "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
        "unaryMinOrMax.m" /* pathName */
};

static emlrtMCInfo emlrtMCI = {
    57,       /* lineNo */
    5,        /* colNo */
    "repmat", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repmat.m" /* pName */
};

static emlrtRTEInfo c_emlrtRTEI = {
    707,                                /* lineNo */
    21,                                 /* colNo */
    "pointCloudBase/validateIntensity", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo d_emlrtRTEI = {
    799,                             /* lineNo */
    13,                              /* colNo */
    "pointCloudBase/validateNormal", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo e_emlrtRTEI = {
    773,                            /* lineNo */
    17,                             /* colNo */
    "pointCloudBase/validateColor", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo u_emlrtRTEI = {
    166,                 /* lineNo */
    21,                  /* colNo */
    "pointCloud/select", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pName */
};

static emlrtRTEInfo v_emlrtRTEI = {
    13,                /* lineNo */
    37,                /* colNo */
    "validateinteger", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/+valattr/"
    "validateinteger.m" /* pName */
};

static emlrtRTEInfo jb_emlrtRTEI = {
    39,                                                            /* lineNo */
    5,                                                             /* colNo */
    "find",                                                        /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/find.m" /* pName */
};

static emlrtRTEInfo lb_emlrtRTEI = {
    149,          /* lineNo */
    31,           /* colNo */
    "pointCloud", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pName */
};

static emlrtRTEInfo nb_emlrtRTEI = {
    85,               /* lineNo */
    13,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo ob_emlrtRTEI = {
    778,              /* lineNo */
    17,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo pb_emlrtRTEI = {
    69,       /* lineNo */
    28,       /* colNo */
    "repmat", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repmat.m" /* pName */
};

static emlrtRTEInfo qb_emlrtRTEI = {
    134,              /* lineNo */
    13,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo rb_emlrtRTEI = {
    139,              /* lineNo */
    12,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo sb_emlrtRTEI = {
    770,              /* lineNo */
    17,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRSInfo rg_emlrtRSI = {
    57,       /* lineNo */
    "repmat", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repmat.m" /* pathName
                                                                      */
};

/* Function Declarations */
static void b_error(const emlrtStack *sp, const mxArray *m,
                    emlrtMCInfo *location);

/* Function Definitions */
static void b_error(const emlrtStack *sp, const mxArray *m,
                    emlrtMCInfo *location)
{
  const mxArray *pArray;
  pArray = m;
  emlrtCallMATLABR2012b((emlrtConstCTX)sp, 0, NULL, 1, &pArray, "error", true,
                        location);
}

pointCloud *b_pointCloud_select(const emlrtStack *sp, const pointCloud *b_this,
                                const emxArray_real32_T *varargin_1,
                                pointCloud *iobj_0)
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
  emlrtStack st;
  emxArray_real32_T *b_intensity;
  emxArray_real32_T *intensity;
  emxArray_real32_T *loc;
  emxArray_real32_T *location;
  emxArray_real32_T *normal;
  emxArray_real32_T *nv;
  emxArray_real32_T *rangeData;
  emxArray_uint8_T *c;
  emxArray_uint8_T *color;
  pointCloud *ptCloudOut;
  int32_T a;
  int32_T i;
  int32_T i1;
  int32_T i2;
  int32_T i3;
  int32_T i4;
  int32_T i5;
  int32_T i6;
  int32_T idx;
  int32_T k;
  int32_T last;
  const real32_T *varargin_1_data;
  real32_T *intensity_data;
  real32_T *loc_data;
  real32_T *location_data;
  real32_T *normal_data;
  real32_T *rangeData_data;
  uint8_T *c_data;
  uint8_T *color_data;
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
  varargin_1_data = varargin_1->data;
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtConstCTX)sp);
  st.site = &v_emlrtRSI;
  b_st.site = &bb_emlrtRSI;
  n = (b_this->PointCloudArrayData->size[0] *
           b_this->PointCloudArrayData->size[1] ==
       1);
  if (!n) {
    emlrtErrorWithMessageIdR2018a(
        &st, &emlrtRTEI, "vision:pointcloud:arrayNotSupported",
        "vision:pointcloud:arrayNotSupported", 3, 4, 6, &functionName[0]);
  }
  st.site = &yf_emlrtRSI;
  b_st.site = &hc_emlrtRSI;
  n = true;
  k = 0;
  exitg1 = false;
  while ((!exitg1) && (k <= varargin_1->size[0] - 1)) {
    if ((!muSingleScalarIsInf(varargin_1_data[k])) &&
        (!muSingleScalarIsNaN(varargin_1_data[k])) &&
        (varargin_1_data[k] == varargin_1_data[k])) {
      k++;
    } else {
      n = false;
      exitg1 = true;
    }
  }
  if (!n) {
    emlrtErrorWithMessageIdR2018a(
        &b_st, &v_emlrtRTEI, "Coder:toolbox:ValidateattributesexpectedInteger",
        "MATLAB:expectedInteger", 3, 4, 5, "input");
  }
  if (varargin_1->size[0] != 0) {
    real32_T ex;
    st.site = &xf_emlrtRSI;
    b_st.site = &ag_emlrtRSI;
    c_st.site = &bg_emlrtRSI;
    d_st.site = &cg_emlrtRSI;
    e_st.site = &dg_emlrtRSI;
    f_st.site = &eg_emlrtRSI;
    if (varargin_1->size[0] > 2) {
      g_st.site = &gg_emlrtRSI;
      if (!muSingleScalarIsNaN(varargin_1_data[0])) {
        idx = 1;
      } else {
        idx = 0;
        h_st.site = &hg_emlrtRSI;
        if (varargin_1->size[0] > 2147483646) {
          i_st.site = &q_emlrtRSI;
          check_forloop_overflow_error(&i_st);
        }
        k = 2;
        exitg1 = false;
        while ((!exitg1) && (k <= varargin_1->size[0])) {
          if (!muSingleScalarIsNaN(varargin_1_data[k - 1])) {
            idx = k;
            exitg1 = true;
          } else {
            k++;
          }
        }
      }
      if (idx != 0) {
        g_st.site = &fg_emlrtRSI;
        h_st.site = &ig_emlrtRSI;
        if ((idx + 1 <= varargin_1->size[0]) &&
            (varargin_1->size[0] > 2147483646)) {
          i_st.site = &q_emlrtRSI;
          check_forloop_overflow_error(&i_st);
        }
      }
    }
    st.site = &xf_emlrtRSI;
    b_st.site = &jg_emlrtRSI;
    c_st.site = &kg_emlrtRSI;
    d_st.site = &lg_emlrtRSI;
    e_st.site = &mg_emlrtRSI;
    f_st.site = &ng_emlrtRSI;
    last = varargin_1->size[0];
    if (varargin_1->size[0] <= 2) {
      if (varargin_1->size[0] == 1) {
        ex = varargin_1_data[0];
      } else if ((varargin_1_data[0] < varargin_1_data[1]) ||
                 (muSingleScalarIsNaN(varargin_1_data[0]) &&
                  (!muSingleScalarIsNaN(varargin_1_data[1])))) {
        ex = varargin_1_data[1];
      } else {
        ex = varargin_1_data[0];
      }
    } else {
      g_st.site = &gg_emlrtRSI;
      if (!muSingleScalarIsNaN(varargin_1_data[0])) {
        idx = 1;
      } else {
        idx = 0;
        h_st.site = &hg_emlrtRSI;
        if (varargin_1->size[0] > 2147483646) {
          i_st.site = &q_emlrtRSI;
          check_forloop_overflow_error(&i_st);
        }
        k = 2;
        exitg1 = false;
        while ((!exitg1) && (k <= last)) {
          if (!muSingleScalarIsNaN(varargin_1_data[k - 1])) {
            idx = k;
            exitg1 = true;
          } else {
            k++;
          }
        }
      }
      if (idx == 0) {
        ex = varargin_1_data[0];
      } else {
        g_st.site = &fg_emlrtRSI;
        ex = varargin_1_data[idx - 1];
        a = idx + 1;
        h_st.site = &ig_emlrtRSI;
        if ((idx + 1 <= varargin_1->size[0]) &&
            (varargin_1->size[0] > 2147483646)) {
          i_st.site = &q_emlrtRSI;
          check_forloop_overflow_error(&i_st);
        }
        for (k = a; k <= last; k++) {
          real32_T f;
          f = varargin_1_data[k - 1];
          if (ex < f) {
            ex = f;
          }
        }
      }
    }
    st.site = &xf_emlrtRSI;
    idx = b_this->Location->size[0];
    if ((real_T)ex > idx) {
      emlrtErrorWithMessageIdR2018a(
          sp, &u_emlrtRTEI, "vision:pointcloud:indicesOutofRangeForSelect",
          "vision:pointcloud:indicesOutofRangeForSelect", 0);
    }
  }
  st.site = &x_emlrtRSI;
  b_st.site = &gb_emlrtRSI;
  emxInit_real32_T(&b_st, &location, 2, &fc_emlrtRTEI);
  i = b_this->Location->size[0];
  i1 = location->size[0] * location->size[1];
  location->size[0] = i;
  location->size[1] = 3;
  emxEnsureCapacity_real32_T(&b_st, location, i1, &fc_emlrtRTEI);
  location_data = location->data;
  idx = b_this->Location->size[0] * 3;
  for (i1 = 0; i1 < idx; i1++) {
    location_data[i1] = b_this->Location->data[i1];
  }
  emxInit_uint8_T(&b_st, &color, &gc_emlrtRTEI);
  i1 = b_this->Color->size[0];
  i2 = color->size[0] * color->size[1];
  color->size[0] = i1;
  idx = b_this->Color->size[1];
  color->size[1] = idx;
  emxEnsureCapacity_uint8_T(&b_st, color, i2, &gc_emlrtRTEI);
  color_data = color->data;
  last = b_this->Color->size[0] * b_this->Color->size[1];
  for (i2 = 0; i2 < last; i2++) {
    color_data[i2] = b_this->Color->data[i2];
  }
  emxInit_real32_T(&b_st, &normal, 2, &hc_emlrtRTEI);
  i2 = b_this->Normal->size[0];
  i3 = normal->size[0] * normal->size[1];
  normal->size[0] = i2;
  last = b_this->Normal->size[1];
  normal->size[1] = last;
  emxEnsureCapacity_real32_T(&b_st, normal, i3, &hc_emlrtRTEI);
  normal_data = normal->data;
  a = b_this->Normal->size[0] * b_this->Normal->size[1];
  for (i3 = 0; i3 < a; i3++) {
    normal_data[i3] = b_this->Normal->data[i3];
  }
  emxInit_real32_T(&b_st, &intensity, 1, &ic_emlrtRTEI);
  i3 = b_this->Intensity->size[0];
  i4 = intensity->size[0];
  intensity->size[0] = i3;
  emxEnsureCapacity_real32_T(&b_st, intensity, i4, &ic_emlrtRTEI);
  intensity_data = intensity->data;
  a = b_this->Intensity->size[0];
  for (i4 = 0; i4 < a; i4++) {
    intensity_data[i4] = b_this->Intensity->data[i4];
  }
  emxInit_real32_T(&b_st, &rangeData, 2, &jc_emlrtRTEI);
  i4 = b_this->RangeData->size[0];
  i5 = rangeData->size[0] * rangeData->size[1];
  rangeData->size[0] = i4;
  a = b_this->RangeData->size[1];
  rangeData->size[1] = a;
  emxEnsureCapacity_real32_T(&b_st, rangeData, i5, &jc_emlrtRTEI);
  rangeData_data = rangeData->data;
  k = b_this->RangeData->size[0] * b_this->RangeData->size[1];
  for (i5 = 0; i5 < k; i5++) {
    rangeData_data[i5] = b_this->RangeData->data[i5];
  }
  emxInit_real32_T(&b_st, &loc, 2, &lb_emlrtRTEI);
  if (location->size[0] != 0) {
    k = varargin_1->size[0];
    i5 = loc->size[0] * loc->size[1];
    loc->size[0] = varargin_1->size[0];
    loc->size[1] = 3;
    emxEnsureCapacity_real32_T(&b_st, loc, i5, &kb_emlrtRTEI);
    loc_data = loc->data;
    for (i5 = 0; i5 < 3; i5++) {
      for (i6 = 0; i6 < k; i6++) {
        int32_T i7;
        i7 = (int32_T)varargin_1_data[i6];
        if ((i7 < 1) || (i7 > i)) {
          emlrtDynamicBoundsCheckR2012b(i7, 1, i, &emlrtBCI, &b_st);
        }
        loc_data[i6 + loc->size[0] * i5] =
            location_data[((int32_T)(real32_T)i7 + location->size[0] * i5) - 1];
      }
    }
  } else {
    loc->size[0] = 0;
    loc->size[1] = 3;
  }
  emxFree_real32_T(&b_st, &location);
  emxInit_uint8_T(&b_st, &c, &lb_emlrtRTEI);
  if ((color->size[0] != 0) && (color->size[1] != 0)) {
    k = varargin_1->size[0];
    i = c->size[0] * c->size[1];
    c->size[0] = varargin_1->size[0];
    c->size[1] = idx;
    emxEnsureCapacity_uint8_T(&b_st, c, i, &kb_emlrtRTEI);
    c_data = c->data;
    for (i = 0; i < idx; i++) {
      for (i5 = 0; i5 < k; i5++) {
        i6 = (int32_T)varargin_1_data[i5];
        if ((i6 < 1) || (i6 > i1)) {
          emlrtDynamicBoundsCheckR2012b(i6, 1, i1, &emlrtBCI, &b_st);
        }
        c_data[i5 + c->size[0] * i] =
            color_data[((int32_T)(real32_T)i6 + color->size[0] * i) - 1];
      }
    }
  } else {
    c->size[0] = 0;
    c->size[1] = 0;
  }
  emxFree_uint8_T(&b_st, &color);
  emxInit_real32_T(&b_st, &nv, 2, &lb_emlrtRTEI);
  if ((normal->size[0] != 0) && (normal->size[1] != 0)) {
    idx = varargin_1->size[0];
    i = nv->size[0] * nv->size[1];
    nv->size[0] = varargin_1->size[0];
    nv->size[1] = last;
    emxEnsureCapacity_real32_T(&b_st, nv, i, &kb_emlrtRTEI);
    location_data = nv->data;
    for (i = 0; i < last; i++) {
      for (i1 = 0; i1 < idx; i1++) {
        i5 = (int32_T)varargin_1_data[i1];
        if ((i5 < 1) || (i5 > i2)) {
          emlrtDynamicBoundsCheckR2012b(i5, 1, i2, &emlrtBCI, &b_st);
        }
        location_data[i1 + nv->size[0] * i] =
            normal_data[((int32_T)(real32_T)i5 + normal->size[0] * i) - 1];
      }
    }
  } else {
    nv->size[0] = 0;
    nv->size[1] = 0;
  }
  emxInit_real32_T(&b_st, &b_intensity, 1, &lb_emlrtRTEI);
  if (intensity->size[0] != 0) {
    idx = varargin_1->size[0];
    i = b_intensity->size[0];
    b_intensity->size[0] = varargin_1->size[0];
    emxEnsureCapacity_real32_T(&b_st, b_intensity, i, &kb_emlrtRTEI);
    location_data = b_intensity->data;
    for (i = 0; i < idx; i++) {
      i1 = (int32_T)varargin_1_data[i];
      if ((i1 < 1) || (i1 > i3)) {
        emlrtDynamicBoundsCheckR2012b(i1, 1, i3, &emlrtBCI, &b_st);
      }
      location_data[i] = intensity_data[(int32_T)(real32_T)i1 - 1];
    }
  } else {
    b_intensity->size[0] = 0;
  }
  emxFree_real32_T(&b_st, &intensity);
  if ((rangeData->size[0] != 0) && (rangeData->size[1] != 0)) {
    idx = varargin_1->size[0];
    i = normal->size[0] * normal->size[1];
    normal->size[0] = varargin_1->size[0];
    normal->size[1] = a;
    emxEnsureCapacity_real32_T(&b_st, normal, i, &kb_emlrtRTEI);
    normal_data = normal->data;
    for (i = 0; i < a; i++) {
      for (i1 = 0; i1 < idx; i1++) {
        i2 = (int32_T)varargin_1_data[i1];
        if ((i2 < 1) || (i2 > i4)) {
          emlrtDynamicBoundsCheckR2012b(i2, 1, i4, &emlrtBCI, &b_st);
        }
        normal_data[i1 + normal->size[0] * i] =
            rangeData_data[((int32_T)(real32_T)i2 + rangeData->size[0] * i) -
                           1];
      }
    }
  } else {
    normal->size[0] = 0;
    normal->size[1] = 0;
  }
  emxFree_real32_T(&b_st, &rangeData);
  st.site = &y_emlrtRSI;
  ptCloudOut = pointCloud_pointCloud(&st, iobj_0, loc, c, nv, b_intensity);
  emxFree_real32_T(sp, &b_intensity);
  emxFree_real32_T(sp, &nv);
  emxFree_uint8_T(sp, &c);
  emxFree_real32_T(sp, &loc);
  st.site = &ab_emlrtRSI;
  pointCloudBase_set_RangeData(&st, ptCloudOut, normal);
  emxFree_real32_T(sp, &normal);
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtConstCTX)sp);
  return ptCloudOut;
}

pointCloud *pointCloud_pointCloud(const emlrtStack *sp, pointCloud *b_this,
                                  const emxArray_real32_T *varargin_1,
                                  const emxArray_uint8_T *varargin_3,
                                  const emxArray_real32_T *varargin_5,
                                  const emxArray_real32_T *varargin_7)
{
  static const int32_T iv[2] = {1, 15};
  static const char_T u[15] = {'M', 'A', 'T', 'L', 'A', 'B', ':', 'p',
                               'm', 'a', 'x', 's', 'i', 'z', 'e'};
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack e_st;
  emlrtStack f_st;
  emlrtStack st;
  emxArray_real32_T tmp_data;
  emxArray_uint8_T *b_value;
  const mxArray *m;
  const mxArray *y;
  pointCloud *c_this;
  real_T numPoints[2];
  int32_T tmp_size[2];
  int32_T iacol;
  int32_T itilerow;
  int32_T jcol;
  int32_T k;
  int32_T nrows;
  int32_T xyzPoints_size_idx_0;
  const real32_T *varargin_1_data;
  const real32_T *varargin_5_data;
  const real32_T *varargin_7_data;
  uint32_T varargin_2[2];
  const uint8_T *varargin_3_data;
  uint8_T *value_data;
  boolean_T exitg1;
  boolean_T p;
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
  varargin_7_data = varargin_7->data;
  varargin_5_data = varargin_5->data;
  varargin_3_data = varargin_3->data;
  varargin_1_data = varargin_1->data;
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtConstCTX)sp);
  c_this = b_this;
  c_this->HasKdtreeConstructed = false;
  c_this->HasLocationHandleAllocated = false;
  st.site = &f_emlrtRSI;
  b_st.site = &i_emlrtRSI;
  iacol = c_this->Location->size[0] * c_this->Location->size[1];
  c_this->Location->size[0] = varargin_1->size[0];
  c_this->Location->size[1] = 3;
  emxEnsureCapacity_real32_T(&st, c_this->Location, iacol, &nb_emlrtRTEI);
  nrows = varargin_1->size[0] * 3;
  for (iacol = 0; iacol < nrows; iacol++) {
    c_this->Location->data[iacol] = varargin_1_data[iacol];
  }
  b_st.site = &j_emlrtRSI;
  emxInit_uint8_T(&b_st, &b_value, &sb_emlrtRTEI);
  c_st.site = &n_emlrtRSI;
  xyzPoints_size_idx_0 = c_this->Location->size[0];
  numPoints[0] = varargin_3->size[0];
  numPoints[1] = varargin_3->size[1];
  p = true;
  k = 0;
  exitg1 = false;
  while ((!exitg1) && (k < 2)) {
    if ((int32_T)numPoints[k] != (k << 1) + 1) {
      p = false;
      exitg1 = true;
    } else {
      k++;
    }
  }
  if (p) {
    int32_T i;
    int32_T outsize_idx_0_tmp;
    numPoints[0] = xyzPoints_size_idx_0;
    numPoints[1] = 1.0;
    d_st.site = &o_emlrtRSI;
    e_st.site = &hb_emlrtRSI;
    assertValidSizeArg(&e_st, numPoints);
    outsize_idx_0_tmp = varargin_3->size[0] * xyzPoints_size_idx_0;
    if (!(outsize_idx_0_tmp ==
          (real_T)varargin_3->size[0] * (real_T)xyzPoints_size_idx_0)) {
      y = NULL;
      m = emlrtCreateCharArray(2, &iv[0]);
      emlrtInitCharArrayR2013a(&d_st, 15, m, &u[0]);
      emlrtAssign(&y, m);
      e_st.site = &rg_emlrtRSI;
      b_error(&e_st, y, &emlrtMCI);
    }
    iacol = b_value->size[0] * b_value->size[1];
    b_value->size[0] = outsize_idx_0_tmp;
    i = varargin_3->size[1];
    b_value->size[1] = varargin_3->size[1];
    emxEnsureCapacity_uint8_T(&d_st, b_value, iacol, &pb_emlrtRTEI);
    value_data = b_value->data;
    nrows = varargin_3->size[0];
    e_st.site = &p_emlrtRSI;
    if (varargin_3->size[1] > 2147483646) {
      f_st.site = &q_emlrtRSI;
      check_forloop_overflow_error(&f_st);
    }
    for (jcol = 0; jcol < i; jcol++) {
      int32_T ibmat;
      iacol = jcol * nrows;
      ibmat = jcol * outsize_idx_0_tmp - 1;
      e_st.site = &ib_emlrtRSI;
      if (xyzPoints_size_idx_0 > 2147483646) {
        f_st.site = &q_emlrtRSI;
        check_forloop_overflow_error(&f_st);
      }
      for (itilerow = 0; itilerow < xyzPoints_size_idx_0; itilerow++) {
        int32_T ibcol;
        ibcol = ibmat + itilerow * nrows;
        e_st.site = &jb_emlrtRSI;
        if (nrows > 2147483646) {
          f_st.site = &q_emlrtRSI;
          check_forloop_overflow_error(&f_st);
        }
        for (k = 0; k < nrows; k++) {
          value_data[(ibcol + k) + 1] = varargin_3_data[iacol + k];
        }
      }
    }
  } else {
    if ((varargin_3->size[0] != 0) && (varargin_3->size[1] != 0)) {
      numPoints[0] = varargin_3->size[0];
      varargin_2[0] = (uint32_T)xyzPoints_size_idx_0;
      numPoints[1] = varargin_3->size[1];
      varargin_2[1] = 3U;
      p = true;
      k = 0;
      exitg1 = false;
      while ((!exitg1) && (k < 2)) {
        if ((int32_T)numPoints[k] != (int32_T)varargin_2[k]) {
          p = false;
          exitg1 = true;
        } else {
          k++;
        }
      }
      if (!p) {
        emlrtErrorWithMessageIdR2018a(&c_st, &e_emlrtRTEI,
                                      "vision:pointcloud:unmatchedXYZColor",
                                      "vision:pointcloud:unmatchedXYZColor", 0);
      }
    }
    iacol = b_value->size[0] * b_value->size[1];
    b_value->size[0] = varargin_3->size[0];
    b_value->size[1] = varargin_3->size[1];
    emxEnsureCapacity_uint8_T(&c_st, b_value, iacol, &ob_emlrtRTEI);
    value_data = b_value->data;
    nrows = varargin_3->size[0] * varargin_3->size[1];
    for (iacol = 0; iacol < nrows; iacol++) {
      value_data[iacol] = varargin_3_data[iacol];
    }
  }
  iacol = c_this->Color->size[0] * c_this->Color->size[1];
  c_this->Color->size[0] = b_value->size[0];
  c_this->Color->size[1] = b_value->size[1];
  emxEnsureCapacity_uint8_T(&b_st, c_this->Color, iacol, &qb_emlrtRTEI);
  nrows = b_value->size[0] * b_value->size[1];
  for (iacol = 0; iacol < nrows; iacol++) {
    c_this->Color->data[iacol] = value_data[iacol];
  }
  emxFree_uint8_T(&b_st, &b_value);
  b_st.site = &k_emlrtRSI;
  c_st.site = &r_emlrtRSI;
  xyzPoints_size_idx_0 = c_this->Location->size[0];
  if ((varargin_5->size[0] != 0) && (varargin_5->size[1] != 0)) {
    numPoints[0] = varargin_5->size[0];
    varargin_2[0] = (uint32_T)xyzPoints_size_idx_0;
    numPoints[1] = varargin_5->size[1];
    varargin_2[1] = 3U;
    p = true;
    k = 0;
    exitg1 = false;
    while ((!exitg1) && (k < 2)) {
      if ((int32_T)numPoints[k] != (int32_T)varargin_2[k]) {
        p = false;
        exitg1 = true;
      } else {
        k++;
      }
    }
    if (!p) {
      emlrtErrorWithMessageIdR2018a(&c_st, &d_emlrtRTEI,
                                    "vision:pointcloud:unmatchedXYZNormal",
                                    "vision:pointcloud:unmatchedXYZNormal", 0);
    }
  }
  iacol = c_this->Normal->size[0] * c_this->Normal->size[1];
  c_this->Normal->size[0] = varargin_5->size[0];
  c_this->Normal->size[1] = varargin_5->size[1];
  emxEnsureCapacity_real32_T(&b_st, c_this->Normal, iacol, &rb_emlrtRTEI);
  nrows = varargin_5->size[0] * varargin_5->size[1];
  for (iacol = 0; iacol < nrows; iacol++) {
    c_this->Normal->data[iacol] = varargin_5_data[iacol];
  }
  b_st.site = &l_emlrtRSI;
  c_st.site = &kb_emlrtRSI;
  xyzPoints_size_idx_0 = c_this->Location->size[0];
  if ((varargin_7->size[0] != 0) &&
      (varargin_7->size[0] != xyzPoints_size_idx_0)) {
    emlrtErrorWithMessageIdR2018a(&c_st, &c_emlrtRTEI,
                                  "vision:pointcloud:unmatchedXYZIntensity",
                                  "vision:pointcloud:unmatchedXYZIntensity", 0);
  }
  nrows = varargin_7->size[0];
  iacol = c_this->Intensity->size[0];
  c_this->Intensity->size[0] = varargin_7->size[0];
  emxEnsureCapacity_real32_T(&b_st, c_this->Intensity, iacol, &ab_emlrtRTEI);
  for (iacol = 0; iacol < nrows; iacol++) {
    c_this->Intensity->data[iacol] = varargin_7_data[iacol];
  }
  tmp_size[0] = 0;
  tmp_size[1] = 0;
  tmp_data.size = &tmp_size[0];
  tmp_data.allocatedSize = 0;
  tmp_data.numDimensions = 2;
  tmp_data.canFreeData = false;
  b_st.site = &m_emlrtRSI;
  pointCloudBase_set_RangeData(&b_st, c_this, &tmp_data);
  st.site = &g_emlrtRSI;
  c_this->PointCloudArrayData->size[0] = 1;
  c_this->PointCloudArrayData->size[1] = 1;
  st.site = &h_emlrtRSI;
  c_this->Kdtree = NULL;
  c_this->LocationHandle = NULL;
  c_this->matlabCodegenIsDeleted = false;
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtConstCTX)sp);
  return c_this;
}

pointCloud *pointCloud_select(const emlrtStack *sp, const b_pointCloud *b_this,
                              const boolean_T varargin_1[57600],
                              pointCloud *iobj_0)
{
  static const char_T functionName[6] = {'s', 'e', 'l', 'e', 'c', 't'};
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack st;
  emxArray_real32_T *intensity;
  emxArray_real32_T *loc;
  emxArray_real32_T *nv;
  emxArray_real32_T *r;
  emxArray_uint16_T *ii;
  emxArray_uint8_T *c;
  pointCloud *ptCloudOut;
  int32_T iv[2];
  int32_T b_ii;
  int32_T i;
  int32_T i1;
  int32_T idx;
  int32_T loop_ub;
  real32_T *loc_data;
  uint16_T *ii_data;
  uint8_T *c_data;
  boolean_T exitg1;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  d_st.prev = &c_st;
  d_st.tls = c_st.tls;
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtConstCTX)sp);
  st.site = &v_emlrtRSI;
  b_st.site = &bb_emlrtRSI;
  if (b_this->PointCloudArrayData->size[0] *
          b_this->PointCloudArrayData->size[1] !=
      1) {
    emlrtErrorWithMessageIdR2018a(
        &st, &emlrtRTEI, "vision:pointcloud:arrayNotSupported",
        "vision:pointcloud:arrayNotSupported", 3, 4, 6, &functionName[0]);
  }
  st.site = &w_emlrtRSI;
  b_st.site = &cb_emlrtRSI;
  c_st.site = &db_emlrtRSI;
  idx = 0;
  emxInit_uint16_T(&c_st, &ii, &mb_emlrtRTEI);
  i = ii->size[0];
  ii->size[0] = 57600;
  emxEnsureCapacity_uint16_T(&c_st, ii, i, &ib_emlrtRTEI);
  ii_data = ii->data;
  b_ii = 0;
  exitg1 = false;
  while ((!exitg1) && (b_ii < 57600)) {
    if (varargin_1[b_ii]) {
      idx++;
      ii_data[idx - 1] = (uint16_T)(b_ii + 1);
      if (idx >= 57600) {
        exitg1 = true;
      } else {
        b_ii++;
      }
    } else {
      b_ii++;
    }
  }
  if (idx < 1) {
    b_ii = 0;
  } else {
    b_ii = idx;
  }
  iv[0] = 1;
  iv[1] = b_ii;
  d_st.site = &eb_emlrtRSI;
  indexShapeCheck(&d_st, 57600, iv);
  i = ii->size[0];
  ii->size[0] = b_ii;
  emxEnsureCapacity_uint16_T(&c_st, ii, i, &jb_emlrtRTEI);
  ii_data = ii->data;
  st.site = &x_emlrtRSI;
  b_st.site = &gb_emlrtRSI;
  emxInit_real32_T(&b_st, &loc, 2, &lb_emlrtRTEI);
  i = loc->size[0] * loc->size[1];
  loc->size[0] = b_ii;
  loc->size[1] = 3;
  emxEnsureCapacity_real32_T(&b_st, loc, i, &kb_emlrtRTEI);
  loc_data = loc->data;
  for (i = 0; i < 3; i++) {
    for (i1 = 0; i1 < b_ii; i1++) {
      loc_data[i1 + loc->size[0] * i] =
          b_this->Location[(ii_data[i1] + 57600 * i) - 1];
    }
  }
  emxInit_uint8_T(&b_st, &c, &lb_emlrtRTEI);
  if ((b_this->Color->size[0] != 0) && (b_this->Color->size[1] != 0)) {
    idx = b_this->Color->size[0];
    i = c->size[0] * c->size[1];
    c->size[0] = b_ii;
    c->size[1] = b_this->Color->size[1];
    emxEnsureCapacity_uint8_T(&b_st, c, i, &kb_emlrtRTEI);
    c_data = c->data;
    loop_ub = b_this->Color->size[1];
    for (i = 0; i < loop_ub; i++) {
      for (i1 = 0; i1 < b_ii; i1++) {
        if (ii_data[i1] > idx) {
          emlrtDynamicBoundsCheckR2012b(ii_data[i1], 1, idx, &emlrtBCI, &b_st);
        }
        c_data[i1 + c->size[0] * i] =
            b_this->Color->data[(ii_data[i1] + b_this->Color->size[0] * i) - 1];
      }
    }
  } else {
    c->size[0] = 0;
    c->size[1] = 0;
  }
  emxInit_real32_T(&b_st, &nv, 2, &lb_emlrtRTEI);
  if ((b_this->Normal->size[0] != 0) && (b_this->Normal->size[1] != 0)) {
    idx = b_this->Normal->size[0];
    i = nv->size[0] * nv->size[1];
    nv->size[0] = b_ii;
    nv->size[1] = b_this->Normal->size[1];
    emxEnsureCapacity_real32_T(&b_st, nv, i, &kb_emlrtRTEI);
    loc_data = nv->data;
    loop_ub = b_this->Normal->size[1];
    for (i = 0; i < loop_ub; i++) {
      for (i1 = 0; i1 < b_ii; i1++) {
        if (ii_data[i1] > idx) {
          emlrtDynamicBoundsCheckR2012b(ii_data[i1], 1, idx, &emlrtBCI, &b_st);
        }
        loc_data[i1 + nv->size[0] * i] =
            b_this->Normal
                ->data[(ii_data[i1] + b_this->Normal->size[0] * i) - 1];
      }
    }
  } else {
    nv->size[0] = 0;
    nv->size[1] = 0;
  }
  emxInit_real32_T(&b_st, &intensity, 1, &lb_emlrtRTEI);
  if (b_this->Intensity->size[0] != 0) {
    idx = b_this->Intensity->size[0];
    i = intensity->size[0];
    intensity->size[0] = b_ii;
    emxEnsureCapacity_real32_T(&b_st, intensity, i, &kb_emlrtRTEI);
    loc_data = intensity->data;
    for (i = 0; i < b_ii; i++) {
      if (ii_data[i] > idx) {
        emlrtDynamicBoundsCheckR2012b(ii_data[i], 1, idx, &emlrtBCI, &b_st);
      }
      loc_data[i] = b_this->Intensity->data[ii_data[i] - 1];
    }
  } else {
    intensity->size[0] = 0;
  }
  emxInit_real32_T(&b_st, &r, 2, &lb_emlrtRTEI);
  if ((b_this->RangeData->size[0] != 0) && (b_this->RangeData->size[1] != 0)) {
    idx = b_this->RangeData->size[0];
    i = r->size[0] * r->size[1];
    r->size[0] = b_ii;
    r->size[1] = b_this->RangeData->size[1];
    emxEnsureCapacity_real32_T(&b_st, r, i, &kb_emlrtRTEI);
    loc_data = r->data;
    loop_ub = b_this->RangeData->size[1];
    for (i = 0; i < loop_ub; i++) {
      for (i1 = 0; i1 < b_ii; i1++) {
        if (ii_data[i1] > idx) {
          emlrtDynamicBoundsCheckR2012b(ii_data[i1], 1, idx, &emlrtBCI, &b_st);
        }
        loc_data[i1 + r->size[0] * i] =
            b_this->RangeData
                ->data[(ii_data[i1] + b_this->RangeData->size[0] * i) - 1];
      }
    }
  } else {
    r->size[0] = 0;
    r->size[1] = 0;
  }
  emxFree_uint16_T(&b_st, &ii);
  st.site = &y_emlrtRSI;
  ptCloudOut = pointCloud_pointCloud(&st, iobj_0, loc, c, nv, intensity);
  emxFree_real32_T(sp, &intensity);
  emxFree_real32_T(sp, &nv);
  emxFree_uint8_T(sp, &c);
  emxFree_real32_T(sp, &loc);
  st.site = &ab_emlrtRSI;
  pointCloudBase_set_RangeData(&st, ptCloudOut, r);
  emxFree_real32_T(sp, &r);
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtConstCTX)sp);
  return ptCloudOut;
}

/* End of code generation (pointCloud.c) */
