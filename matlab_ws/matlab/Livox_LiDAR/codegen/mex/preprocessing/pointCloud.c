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
#include "preprocessing_data.h"
#include "preprocessing_emxutil.h"
#include "preprocessing_types.h"
#include "rt_nonfinite.h"
#include "mwmathutil.h"

/* Variable Definitions */
static emlrtRSInfo g_emlrtRSI = {
    33,                      /* lineNo */
    "pointCloud/pointCloud", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo h_emlrtRSI = {
    34,                      /* lineNo */
    "pointCloud/pointCloud", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo i_emlrtRSI = {
    43,                      /* lineNo */
    "pointCloud/pointCloud", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo j_emlrtRSI = {
    75,                              /* lineNo */
    "pointCloudBase/pointCloudBase", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo k_emlrtRSI = {
    87,                              /* lineNo */
    "pointCloudBase/pointCloudBase", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo l_emlrtRSI = {
    88,                              /* lineNo */
    "pointCloudBase/pointCloudBase", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo m_emlrtRSI = {
    89,                              /* lineNo */
    "pointCloudBase/pointCloudBase", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo n_emlrtRSI = {
    90,                              /* lineNo */
    "pointCloudBase/pointCloudBase", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo o_emlrtRSI = {
    134,                        /* lineNo */
    "pointCloudBase/set.Color", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo p_emlrtRSI = {
    770,                            /* lineNo */
    "pointCloudBase/validateColor", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo s_emlrtRSI = {
    139,                         /* lineNo */
    "pointCloudBase/set.Normal", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo w_emlrtRSI = {
    119,                          /* lineNo */
    "pointCloud/findPointsInROI", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo x_emlrtRSI = {
    309,                                  /* lineNo */
    "pointCloudBase/findPointsInROIImpl", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo y_emlrtRSI = {
    311,                                  /* lineNo */
    "pointCloudBase/findPointsInROIImpl", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo ab_emlrtRSI = {
    321,                                  /* lineNo */
    "pointCloudBase/findPointsInROIImpl", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo cb_emlrtRSI = {
    1200,                                         /* lineNo */
    "pointCloud/validateAndParseBoxSearchOption", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo db_emlrtRSI = {
    680,                          /* lineNo */
    "pointCloudBase/validateROI", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo fb_emlrtRSI = {
    599,                                  /* lineNo */
    "pointCloudBase/bruteForceBoxSearch", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo dc_emlrtRSI = {
    144,                            /* lineNo */
    "pointCloudBase/set.Intensity", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtMCInfo emlrtMCI = {
    57,       /* lineNo */
    5,        /* colNo */
    "repmat", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repmat.m" /* pName */
};

static emlrtRTEInfo d_emlrtRTEI = {
    1227,                                         /* lineNo */
    17,                                           /* colNo */
    "pointCloud/validateAndParseBoxSearchOption", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pName */
};

static emlrtRTEInfo g_emlrtRTEI = {
    707,                                /* lineNo */
    21,                                 /* colNo */
    "pointCloudBase/validateIntensity", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo h_emlrtRTEI = {
    799,                             /* lineNo */
    13,                              /* colNo */
    "pointCloudBase/validateNormal", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo i_emlrtRTEI = {
    773,                            /* lineNo */
    17,                             /* colNo */
    "pointCloudBase/validateColor", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo lb_emlrtRTEI = {
    144,              /* lineNo */
    13,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo nb_emlrtRTEI = {
    39,                                                            /* lineNo */
    5,                                                             /* colNo */
    "find",                                                        /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/find.m" /* pName */
};

static emlrtRTEInfo ob_emlrtRTEI = {
    119,          /* lineNo */
    17,           /* colNo */
    "pointCloud", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pName */
};

static emlrtRTEInfo qb_emlrtRTEI = {
    149,          /* lineNo */
    31,           /* colNo */
    "pointCloud", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pName */
};

static emlrtRTEInfo rb_emlrtRTEI = {
    85,               /* lineNo */
    13,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo sb_emlrtRTEI = {
    778,              /* lineNo */
    17,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo tb_emlrtRTEI = {
    69,       /* lineNo */
    28,       /* colNo */
    "repmat", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repmat.m" /* pName */
};

static emlrtRTEInfo ub_emlrtRTEI = {
    134,              /* lineNo */
    13,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo vb_emlrtRTEI = {
    139,              /* lineNo */
    12,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo wb_emlrtRTEI = {
    770,              /* lineNo */
    17,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRSInfo bh_emlrtRSI = {
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

pointCloud *b_pointCloud_pointCloud(const emlrtStack *sp, pointCloud *b_this,
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
  st.site = &g_emlrtRSI;
  b_st.site = &j_emlrtRSI;
  iacol = c_this->Location->size[0] * c_this->Location->size[1];
  c_this->Location->size[0] = varargin_1->size[0];
  c_this->Location->size[1] = 3;
  emxEnsureCapacity_real32_T(&st, c_this->Location, iacol, &rb_emlrtRTEI);
  nrows = varargin_1->size[0] * 3;
  for (iacol = 0; iacol < nrows; iacol++) {
    c_this->Location->data[iacol] = varargin_1_data[iacol];
  }
  b_st.site = &k_emlrtRSI;
  emxInit_uint8_T(&b_st, &b_value, &wb_emlrtRTEI);
  c_st.site = &o_emlrtRSI;
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
    d_st.site = &p_emlrtRSI;
    e_st.site = &ac_emlrtRSI;
    assertValidSizeArg(&e_st, numPoints);
    outsize_idx_0_tmp = varargin_3->size[0] * xyzPoints_size_idx_0;
    if (!(outsize_idx_0_tmp ==
          (real_T)varargin_3->size[0] * (real_T)xyzPoints_size_idx_0)) {
      y = NULL;
      m = emlrtCreateCharArray(2, &iv[0]);
      emlrtInitCharArrayR2013a(&d_st, 15, m, &u[0]);
      emlrtAssign(&y, m);
      e_st.site = &bh_emlrtRSI;
      b_error(&e_st, y, &emlrtMCI);
    }
    iacol = b_value->size[0] * b_value->size[1];
    b_value->size[0] = outsize_idx_0_tmp;
    i = varargin_3->size[1];
    b_value->size[1] = varargin_3->size[1];
    emxEnsureCapacity_uint8_T(&d_st, b_value, iacol, &tb_emlrtRTEI);
    value_data = b_value->data;
    nrows = varargin_3->size[0];
    e_st.site = &q_emlrtRSI;
    if (varargin_3->size[1] > 2147483646) {
      f_st.site = &r_emlrtRSI;
      check_forloop_overflow_error(&f_st);
    }
    for (jcol = 0; jcol < i; jcol++) {
      int32_T ibmat;
      iacol = jcol * nrows;
      ibmat = jcol * outsize_idx_0_tmp - 1;
      e_st.site = &bc_emlrtRSI;
      if (xyzPoints_size_idx_0 > 2147483646) {
        f_st.site = &r_emlrtRSI;
        check_forloop_overflow_error(&f_st);
      }
      for (itilerow = 0; itilerow < xyzPoints_size_idx_0; itilerow++) {
        int32_T ibcol;
        ibcol = ibmat + itilerow * nrows;
        e_st.site = &cc_emlrtRSI;
        if (nrows > 2147483646) {
          f_st.site = &r_emlrtRSI;
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
        emlrtErrorWithMessageIdR2018a(&c_st, &i_emlrtRTEI,
                                      "vision:pointcloud:unmatchedXYZColor",
                                      "vision:pointcloud:unmatchedXYZColor", 0);
      }
    }
    iacol = b_value->size[0] * b_value->size[1];
    b_value->size[0] = varargin_3->size[0];
    b_value->size[1] = varargin_3->size[1];
    emxEnsureCapacity_uint8_T(&c_st, b_value, iacol, &sb_emlrtRTEI);
    value_data = b_value->data;
    nrows = varargin_3->size[0] * varargin_3->size[1];
    for (iacol = 0; iacol < nrows; iacol++) {
      value_data[iacol] = varargin_3_data[iacol];
    }
  }
  iacol = c_this->Color->size[0] * c_this->Color->size[1];
  c_this->Color->size[0] = b_value->size[0];
  c_this->Color->size[1] = b_value->size[1];
  emxEnsureCapacity_uint8_T(&b_st, c_this->Color, iacol, &ub_emlrtRTEI);
  nrows = b_value->size[0] * b_value->size[1];
  for (iacol = 0; iacol < nrows; iacol++) {
    c_this->Color->data[iacol] = value_data[iacol];
  }
  emxFree_uint8_T(&b_st, &b_value);
  b_st.site = &l_emlrtRSI;
  c_st.site = &s_emlrtRSI;
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
      emlrtErrorWithMessageIdR2018a(&c_st, &h_emlrtRTEI,
                                    "vision:pointcloud:unmatchedXYZNormal",
                                    "vision:pointcloud:unmatchedXYZNormal", 0);
    }
  }
  iacol = c_this->Normal->size[0] * c_this->Normal->size[1];
  c_this->Normal->size[0] = varargin_5->size[0];
  c_this->Normal->size[1] = varargin_5->size[1];
  emxEnsureCapacity_real32_T(&b_st, c_this->Normal, iacol, &vb_emlrtRTEI);
  nrows = varargin_5->size[0] * varargin_5->size[1];
  for (iacol = 0; iacol < nrows; iacol++) {
    c_this->Normal->data[iacol] = varargin_5_data[iacol];
  }
  b_st.site = &m_emlrtRSI;
  c_st.site = &dc_emlrtRSI;
  xyzPoints_size_idx_0 = c_this->Location->size[0];
  if ((varargin_7->size[0] != 0) &&
      (varargin_7->size[0] != xyzPoints_size_idx_0)) {
    emlrtErrorWithMessageIdR2018a(&c_st, &g_emlrtRTEI,
                                  "vision:pointcloud:unmatchedXYZIntensity",
                                  "vision:pointcloud:unmatchedXYZIntensity", 0);
  }
  nrows = varargin_7->size[0];
  iacol = c_this->Intensity->size[0];
  c_this->Intensity->size[0] = varargin_7->size[0];
  emxEnsureCapacity_real32_T(&b_st, c_this->Intensity, iacol, &lb_emlrtRTEI);
  for (iacol = 0; iacol < nrows; iacol++) {
    c_this->Intensity->data[iacol] = varargin_7_data[iacol];
  }
  tmp_size[0] = 0;
  tmp_size[1] = 0;
  tmp_data.size = &tmp_size[0];
  tmp_data.allocatedSize = 0;
  tmp_data.numDimensions = 2;
  tmp_data.canFreeData = false;
  b_st.site = &n_emlrtRSI;
  pointCloudBase_set_RangeData(&b_st, c_this, &tmp_data);
  st.site = &h_emlrtRSI;
  c_this->PointCloudArrayData->size[0] = 1;
  c_this->PointCloudArrayData->size[1] = 1;
  st.site = &i_emlrtRSI;
  c_this->Kdtree = NULL;
  c_this->LocationHandle = NULL;
  c_this->matlabCodegenIsDeleted = false;
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtConstCTX)sp);
  return c_this;
}

void pointCloud_findPointsInROI(const emlrtStack *sp,
                                const b_pointCloud *b_this,
                                const real32_T varargin_1[6],
                                emxArray_uint32_T *indices)
{
  static const char_T functionName[15] = {'f', 'i', 'n', 'd', 'P',
                                          'o', 'i', 'n', 't', 's',
                                          'I', 'n', 'R', 'O', 'I'};
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack e_st;
  emlrtStack f_st;
  emlrtStack st;
  emxArray_uint16_T *ii;
  real_T b_roi[6];
  real_T d;
  real_T d1;
  real_T d2;
  real_T d3;
  real_T d4;
  real_T d5;
  int32_T iv[2];
  int32_T i;
  int32_T idx;
  int32_T k;
  real32_T roi[6];
  uint32_T *indices_data;
  uint16_T *ii_data;
  boolean_T inROI[57600];
  boolean_T x[3];
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
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtConstCTX)sp);
  st.site = &w_emlrtRSI;
  b_st.site = &x_emlrtRSI;
  c_st.site = &bb_emlrtRSI;
  if (b_this->PointCloudArrayData->size[0] *
          b_this->PointCloudArrayData->size[1] !=
      1) {
    emlrtErrorWithMessageIdR2018a(
        &b_st, &b_emlrtRTEI, "vision:pointcloud:arrayNotSupported",
        "vision:pointcloud:arrayNotSupported", 3, 4, 15, &functionName[0]);
  }
  b_st.site = &y_emlrtRSI;
  c_st.site = &cb_emlrtRSI;
  d_st.site = &db_emlrtRSI;
  e_st.site = &eb_emlrtRSI;
  p = true;
  k = 0;
  exitg1 = false;
  while ((!exitg1) && (k < 6)) {
    if (!muSingleScalarIsNaN(varargin_1[k])) {
      k++;
    } else {
      p = false;
      exitg1 = true;
    }
  }
  if (!p) {
    emlrtErrorWithMessageIdR2018a(
        &e_st, &e_emlrtRTEI, "Coder:toolbox:ValidateattributesexpectedNonNaN",
        "MATLAB:expectedNonNaN", 3, 4, 3, "roi");
  }
  for (i = 0; i < 2; i++) {
    roi[3 * i] = varargin_1[i];
    roi[3 * i + 1] = varargin_1[i + 2];
    roi[3 * i + 2] = varargin_1[i + 4];
  }
  x[0] = (roi[0] > roi[3]);
  x[1] = (roi[1] > roi[4]);
  x[2] = (roi[2] > roi[5]);
  p = false;
  k = 0;
  exitg1 = false;
  while ((!exitg1) && (k < 3)) {
    if (x[k]) {
      p = true;
      exitg1 = true;
    } else {
      k++;
    }
  }
  if (p) {
    emlrtErrorWithMessageIdR2018a(&b_st, &d_emlrtRTEI,
                                  "vision:pointcloud:invalidROI",
                                  "vision:pointcloud:invalidROI", 0);
  }
  for (i = 0; i < 6; i++) {
    b_roi[i] = roi[i];
  }
  b_st.site = &ab_emlrtRSI;
  d = b_roi[0];
  d1 = b_roi[3];
  d2 = b_roi[1];
  d3 = b_roi[4];
  d4 = b_roi[2];
  d5 = b_roi[5];
  for (k = 0; k < 57600; k++) {
    real_T b_inROI_tmp;
    real_T inROI_tmp;
    real32_T f;
    inROI_tmp = b_this->Location[k + 57600];
    b_inROI_tmp = b_this->Location[k + 115200];
    f = b_this->Location[k];
    inROI[k] =
        ((f >= d) && (f <= d1) && (inROI_tmp >= d2) && (inROI_tmp <= d3) &&
         (b_inROI_tmp >= d4) && (b_inROI_tmp <= d5));
  }
  c_st.site = &fb_emlrtRSI;
  d_st.site = &gb_emlrtRSI;
  e_st.site = &hb_emlrtRSI;
  idx = 0;
  emxInit_uint16_T(&e_st, &ii, &pb_emlrtRTEI);
  i = ii->size[0];
  ii->size[0] = 57600;
  emxEnsureCapacity_uint16_T(&e_st, ii, i, &mb_emlrtRTEI);
  ii_data = ii->data;
  k = 0;
  exitg1 = false;
  while ((!exitg1) && (k < 57600)) {
    if (inROI[k]) {
      idx++;
      ii_data[idx - 1] = (uint16_T)(k + 1);
      if (idx >= 57600) {
        exitg1 = true;
      } else {
        k++;
      }
    } else {
      k++;
    }
  }
  if (idx < 1) {
    k = 0;
  } else {
    k = idx;
  }
  iv[0] = 1;
  iv[1] = k;
  f_st.site = &ib_emlrtRSI;
  indexShapeCheck(&f_st, 57600, iv);
  i = ii->size[0];
  ii->size[0] = k;
  emxEnsureCapacity_uint16_T(&e_st, ii, i, &nb_emlrtRTEI);
  ii_data = ii->data;
  i = indices->size[0];
  indices->size[0] = k;
  emxEnsureCapacity_uint32_T(&b_st, indices, i, &ob_emlrtRTEI);
  indices_data = indices->data;
  for (i = 0; i < k; i++) {
    indices_data[i] = ii_data[i];
  }
  emxFree_uint16_T(&b_st, &ii);
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtConstCTX)sp);
}

b_pointCloud *pointCloud_pointCloud(const emlrtStack *sp, b_pointCloud *b_this,
                                    const real32_T varargin_1[172800],
                                    const real32_T varargin_3[57600])
{
  b_pointCloud *c_this;
  emlrtStack b_st;
  emlrtStack st;
  int32_T i;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_this = b_this;
  c_this->HasKdtreeConstructed = false;
  c_this->HasLocationHandleAllocated = false;
  st.site = &g_emlrtRSI;
  for (i = 0; i < 172800; i++) {
    c_this->Location[i] = varargin_1[i];
  }
  c_this->Color->size[0] = 0;
  c_this->Color->size[1] = 0;
  c_this->Normal->size[0] = 0;
  c_this->Normal->size[1] = 0;
  b_st.site = &m_emlrtRSI;
  i = c_this->Intensity->size[0];
  c_this->Intensity->size[0] = 57600;
  emxEnsureCapacity_real32_T(&b_st, c_this->Intensity, i, &lb_emlrtRTEI);
  for (i = 0; i < 57600; i++) {
    c_this->Intensity->data[i] = varargin_3[i];
  }
  c_this->RangeData->size[0] = 0;
  c_this->RangeData->size[1] = 0;
  st.site = &h_emlrtRSI;
  c_this->PointCloudArrayData->size[0] = 1;
  c_this->PointCloudArrayData->size[1] = 1;
  st.site = &i_emlrtRSI;
  c_this->Kdtree = NULL;
  c_this->LocationHandle = NULL;
  c_this->matlabCodegenIsDeleted = false;
  return c_this;
}

pointCloud *pointCloud_select(const emlrtStack *sp, const b_pointCloud *b_this,
                              const emxArray_uint32_T *varargin_1,
                              pointCloud *iobj_0)
{
  static const char_T functionName[6] = {'s', 'e', 'l', 'e', 'c', 't'};
  emlrtStack b_st;
  emlrtStack st;
  emxArray_real32_T *intensity;
  emxArray_real32_T *loc;
  emxArray_real32_T *nv;
  emxArray_real32_T *r;
  emxArray_uint8_T *c;
  pointCloud *ptCloudOut;
  int32_T i;
  int32_T i1;
  int32_T istop;
  int32_T k;
  int32_T loop_ub;
  real32_T *loc_data;
  const uint32_T *varargin_1_data;
  uint8_T *c_data;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  varargin_1_data = varargin_1->data;
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtConstCTX)sp);
  st.site = &ob_emlrtRSI;
  if (b_this->PointCloudArrayData->size[0] *
          b_this->PointCloudArrayData->size[1] !=
      1) {
    emlrtErrorWithMessageIdR2018a(
        &st, &b_emlrtRTEI, "vision:pointcloud:arrayNotSupported",
        "vision:pointcloud:arrayNotSupported", 3, 4, 6, &functionName[0]);
  }
  if (varargin_1->size[0] != 0) {
    uint32_T minval;
    st.site = &nb_emlrtRSI;
    istop = varargin_1->size[0];
    minval = varargin_1_data[0];
    for (k = 2; k <= istop; k++) {
      uint32_T u;
      u = varargin_1_data[k - 1];
      if (minval > u) {
        minval = u;
      }
    }
    if (minval < 1U) {
      emlrtErrorWithMessageIdR2018a(
          sp, &emlrtRTEI, "vision:pointcloud:indicesOutofRangeForSelect",
          "vision:pointcloud:indicesOutofRangeForSelect", 0);
    } else {
      st.site = &nb_emlrtRSI;
    }
  }
  st.site = &mb_emlrtRSI;
  b_st.site = &yb_emlrtRSI;
  emxInit_real32_T(&b_st, &loc, 2, &qb_emlrtRTEI);
  istop = varargin_1->size[0];
  i = loc->size[0] * loc->size[1];
  loc->size[0] = varargin_1->size[0];
  loc->size[1] = 3;
  emxEnsureCapacity_real32_T(&b_st, loc, i, &db_emlrtRTEI);
  loc_data = loc->data;
  for (i = 0; i < 3; i++) {
    for (i1 = 0; i1 < istop; i1++) {
      loc_data[i1 + loc->size[0] * i] =
          b_this->Location[((int32_T)varargin_1_data[i1] + 57600 * i) - 1];
    }
  }
  emxInit_uint8_T(&b_st, &c, &qb_emlrtRTEI);
  if ((b_this->Color->size[0] != 0) && (b_this->Color->size[1] != 0)) {
    k = b_this->Color->size[0];
    i = c->size[0] * c->size[1];
    c->size[0] = varargin_1->size[0];
    c->size[1] = b_this->Color->size[1];
    emxEnsureCapacity_uint8_T(&b_st, c, i, &db_emlrtRTEI);
    c_data = c->data;
    loop_ub = b_this->Color->size[1];
    for (i = 0; i < loop_ub; i++) {
      for (i1 = 0; i1 < istop; i1++) {
        if (((int32_T)varargin_1_data[i1] < 1) ||
            ((int32_T)varargin_1_data[i1] > k)) {
          emlrtDynamicBoundsCheckR2012b((int32_T)varargin_1_data[i1], 1, k,
                                        &emlrtBCI, &b_st);
        }
        c_data[i1 + c->size[0] * i] =
            b_this->Color->data[((int32_T)varargin_1_data[i1] +
                                 b_this->Color->size[0] * i) -
                                1];
      }
    }
  } else {
    c->size[0] = 0;
    c->size[1] = 0;
  }
  emxInit_real32_T(&b_st, &nv, 2, &qb_emlrtRTEI);
  if ((b_this->Normal->size[0] != 0) && (b_this->Normal->size[1] != 0)) {
    k = b_this->Normal->size[0];
    i = nv->size[0] * nv->size[1];
    nv->size[0] = varargin_1->size[0];
    nv->size[1] = b_this->Normal->size[1];
    emxEnsureCapacity_real32_T(&b_st, nv, i, &db_emlrtRTEI);
    loc_data = nv->data;
    loop_ub = b_this->Normal->size[1];
    for (i = 0; i < loop_ub; i++) {
      for (i1 = 0; i1 < istop; i1++) {
        if (((int32_T)varargin_1_data[i1] < 1) ||
            ((int32_T)varargin_1_data[i1] > k)) {
          emlrtDynamicBoundsCheckR2012b((int32_T)varargin_1_data[i1], 1, k,
                                        &emlrtBCI, &b_st);
        }
        loc_data[i1 + nv->size[0] * i] =
            b_this->Normal->data[((int32_T)varargin_1_data[i1] +
                                  b_this->Normal->size[0] * i) -
                                 1];
      }
    }
  } else {
    nv->size[0] = 0;
    nv->size[1] = 0;
  }
  emxInit_real32_T(&b_st, &intensity, 1, &qb_emlrtRTEI);
  if (b_this->Intensity->size[0] != 0) {
    k = b_this->Intensity->size[0];
    i = intensity->size[0];
    intensity->size[0] = varargin_1->size[0];
    emxEnsureCapacity_real32_T(&b_st, intensity, i, &db_emlrtRTEI);
    loc_data = intensity->data;
    for (i = 0; i < istop; i++) {
      if (((int32_T)varargin_1_data[i] < 1) ||
          ((int32_T)varargin_1_data[i] > k)) {
        emlrtDynamicBoundsCheckR2012b((int32_T)varargin_1_data[i], 1, k,
                                      &emlrtBCI, &b_st);
      }
      loc_data[i] = b_this->Intensity->data[(int32_T)varargin_1_data[i] - 1];
    }
  } else {
    intensity->size[0] = 0;
  }
  emxInit_real32_T(&b_st, &r, 2, &qb_emlrtRTEI);
  if ((b_this->RangeData->size[0] != 0) && (b_this->RangeData->size[1] != 0)) {
    k = b_this->RangeData->size[0];
    i = r->size[0] * r->size[1];
    r->size[0] = varargin_1->size[0];
    r->size[1] = b_this->RangeData->size[1];
    emxEnsureCapacity_real32_T(&b_st, r, i, &db_emlrtRTEI);
    loc_data = r->data;
    loop_ub = b_this->RangeData->size[1];
    for (i = 0; i < loop_ub; i++) {
      for (i1 = 0; i1 < istop; i1++) {
        if (((int32_T)varargin_1_data[i1] < 1) ||
            ((int32_T)varargin_1_data[i1] > k)) {
          emlrtDynamicBoundsCheckR2012b((int32_T)varargin_1_data[i1], 1, k,
                                        &emlrtBCI, &b_st);
        }
        loc_data[i1 + r->size[0] * i] =
            b_this->RangeData->data[((int32_T)varargin_1_data[i1] +
                                     b_this->RangeData->size[0] * i) -
                                    1];
      }
    }
  } else {
    r->size[0] = 0;
    r->size[1] = 0;
  }
  st.site = &lb_emlrtRSI;
  ptCloudOut = b_pointCloud_pointCloud(&st, iobj_0, loc, c, nv, intensity);
  emxFree_real32_T(sp, &intensity);
  emxFree_real32_T(sp, &nv);
  emxFree_uint8_T(sp, &c);
  emxFree_real32_T(sp, &loc);
  st.site = &kb_emlrtRSI;
  pointCloudBase_set_RangeData(&st, ptCloudOut, r);
  emxFree_real32_T(sp, &r);
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtConstCTX)sp);
  return ptCloudOut;
}

/* End of code generation (pointCloud.c) */
