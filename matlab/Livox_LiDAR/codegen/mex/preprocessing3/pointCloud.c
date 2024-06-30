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
#include "eml_int_forloop_overflow_check.h"
#include "indexShapeCheck.h"
#include "pointCloudBase.h"
#include "preprocessing3_data.h"
#include "preprocessing3_emxutil.h"
#include "preprocessing3_types.h"
#include "rt_nonfinite.h"
#include "warning.h"
#include "mwmathutil.h"

/* Variable Definitions */
static emlrtRSInfo h_emlrtRSI = {
    75,                              /* lineNo */
    "pointCloudBase/pointCloudBase", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo i_emlrtRSI = {
    87,                              /* lineNo */
    "pointCloudBase/pointCloudBase", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo j_emlrtRSI = {
    88,                              /* lineNo */
    "pointCloudBase/pointCloudBase", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo l_emlrtRSI = {
    90,                              /* lineNo */
    "pointCloudBase/pointCloudBase", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo m_emlrtRSI = {
    134,                        /* lineNo */
    "pointCloudBase/set.Color", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo n_emlrtRSI = {
    139,                         /* lineNo */
    "pointCloudBase/set.Normal", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo o_emlrtRSI = {
    144,                            /* lineNo */
    "pointCloudBase/set.Intensity", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo ab_emlrtRSI = {
    154,                 /* lineNo */
    "pointCloud/select", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo bb_emlrtRSI = {
    172,                 /* lineNo */
    "pointCloud/select", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo cb_emlrtRSI = {
    175,                 /* lineNo */
    "pointCloud/select", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo db_emlrtRSI = {
    220,                 /* lineNo */
    "pointCloud/select", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo eb_emlrtRSI = {
    228,                 /* lineNo */
    "pointCloud/select", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo fb_emlrtRSI = {
    230,                 /* lineNo */
    "pointCloud/select", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo gb_emlrtRSI = {
    509,                                /* lineNo */
    "pointCloudBase/arrayNotSupported", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo hb_emlrtRSI = {
    39,                                                            /* lineNo */
    "find",                                                        /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/find.m" /* pathName
                                                                    */
};

static emlrtRSInfo ib_emlrtRSI = {
    158,                                                           /* lineNo */
    "eml_find",                                                    /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/find.m" /* pathName
                                                                    */
};

static emlrtRSInfo jb_emlrtRSI = {
    144,                                                           /* lineNo */
    "eml_find",                                                    /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/find.m" /* pathName
                                                                    */
};

static emlrtRSInfo kb_emlrtRSI = {
    382,                                                           /* lineNo */
    "find_first_indices",                                          /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/find.m" /* pathName
                                                                    */
};

static emlrtRSInfo lb_emlrtRSI = {
    402,                                                           /* lineNo */
    "find_first_indices",                                          /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/find.m" /* pathName
                                                                    */
};

static emlrtRSInfo mb_emlrtRSI = {
    20,                               /* lineNo */
    "eml_int_forloop_overflow_check", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/eml/"
    "eml_int_forloop_overflow_check.m" /* pathName */
};

static emlrtRSInfo ob_emlrtRSI = {
    207,                         /* lineNo */
    "pointCloudBase/subsetImpl", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo pb_emlrtRSI = {
    1,           /* lineNo */
    "getSubset", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+pc/getSubset.p" /* pathName */
};

static emlrtRSInfo qb_emlrtRSI = {
    51,                  /* lineNo */
    "reshapeSizeChecks", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
    "reshapeSizeChecks.m" /* pathName */
};

static emlrtRSInfo sb_emlrtRSI = {
    770,                            /* lineNo */
    "pointCloudBase/validateColor", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRSInfo tb_emlrtRSI = {
    38,       /* lineNo */
    "repmat", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repmat.m" /* pathName
                                                                      */
};

static emlrtRSInfo ub_emlrtRSI = {
    76,       /* lineNo */
    "repmat", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repmat.m" /* pathName
                                                                      */
};

static emlrtRSInfo vb_emlrtRSI = {
    79,       /* lineNo */
    "repmat", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repmat.m" /* pathName
                                                                      */
};

static emlrtRSInfo wb_emlrtRSI = {
    81,       /* lineNo */
    "repmat", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repmat.m" /* pathName
                                                                      */
};

static emlrtMCInfo c_emlrtMCI = {
    57,       /* lineNo */
    5,        /* colNo */
    "repmat", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repmat.m" /* pName */
};

static emlrtRTEInfo d_emlrtRTEI = {
    510,                                /* lineNo */
    17,                                 /* colNo */
    "pointCloudBase/arrayNotSupported", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo e_emlrtRTEI = {
    392,                                                           /* lineNo */
    1,                                                             /* colNo */
    "find_first_indices",                                          /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/find.m" /* pName */
};

static emlrtRTEInfo f_emlrtRTEI = {
    15,             /* lineNo */
    19,             /* colNo */
    "validatesize", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/+valattr/"
    "validatesize.m" /* pName */
};

static emlrtRTEInfo g_emlrtRTEI = {
    74,                  /* lineNo */
    13,                  /* colNo */
    "reshapeSizeChecks", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
    "reshapeSizeChecks.m" /* pName */
};

static emlrtRTEInfo h_emlrtRTEI = {
    81,                  /* lineNo */
    23,                  /* colNo */
    "reshapeSizeChecks", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
    "reshapeSizeChecks.m" /* pName */
};

static emlrtRTEInfo i_emlrtRTEI = {
    126,               /* lineNo */
    9,                 /* colNo */
    "computeDimsData", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/"
    "reshapeSizeChecks.m" /* pName */
};

static emlrtBCInfo emlrtBCI = {
    1,           /* iFirst */
    57600,       /* iLast */
    1,           /* lineNo */
    1,           /* colNo */
    "",          /* aName */
    "getSubset", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+pc/getSubset.p", /* pName */
    0                            /* checkKind */
};

static emlrtBCInfo b_emlrtBCI = {
    -1,          /* iFirst */
    -1,          /* iLast */
    1,           /* lineNo */
    1,           /* colNo */
    "",          /* aName */
    "getSubset", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+pc/getSubset.p", /* pName */
    0                            /* checkKind */
};

static emlrtRTEInfo k_emlrtRTEI = {
    707,                                /* lineNo */
    21,                                 /* colNo */
    "pointCloudBase/validateIntensity", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo l_emlrtRTEI = {
    799,                             /* lineNo */
    13,                              /* colNo */
    "pointCloudBase/validateNormal", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo m_emlrtRTEI = {
    773,                            /* lineNo */
    17,                             /* colNo */
    "pointCloudBase/validateColor", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo db_emlrtRTEI = {
    369,                                                           /* lineNo */
    24,                                                            /* colNo */
    "find",                                                        /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/find.m" /* pName */
};

static emlrtRTEInfo eb_emlrtRTEI = {
    39,                                                            /* lineNo */
    5,                                                             /* colNo */
    "find",                                                        /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/find.m" /* pName */
};

static emlrtRTEInfo fb_emlrtRTEI = {
    1,           /* lineNo */
    1,           /* colNo */
    "getSubset", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+pc/getSubset.p" /* pName */
};

static emlrtRTEInfo gb_emlrtRTEI = {
    31,                                                            /* lineNo */
    6,                                                             /* colNo */
    "find",                                                        /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/find.m" /* pName */
};

static emlrtRTEInfo hb_emlrtRTEI = {
    149,          /* lineNo */
    31,           /* colNo */
    "pointCloud", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pName */
};

static emlrtRTEInfo ib_emlrtRTEI = {
    85,               /* lineNo */
    13,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo jb_emlrtRTEI = {
    778,              /* lineNo */
    17,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo kb_emlrtRTEI = {
    69,       /* lineNo */
    28,       /* colNo */
    "repmat", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repmat.m" /* pName */
};

static emlrtRTEInfo lb_emlrtRTEI = {
    134,              /* lineNo */
    13,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo mb_emlrtRTEI = {
    139,              /* lineNo */
    12,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo nb_emlrtRTEI = {
    770,              /* lineNo */
    17,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRSInfo cc_emlrtRSI = {
    57,       /* lineNo */
    "repmat", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repmat.m" /* pathName
                                                                      */
};

/* Function Declarations */
static void b_error(const emlrtStack *sp, const mxArray *m,
                    emlrtMCInfo *location);

static pointCloud *pointCloud_pointCloud(const emlrtStack *sp,
                                         pointCloud *b_this,
                                         const emxArray_real32_T *varargin_1,
                                         const emxArray_uint8_T *varargin_3,
                                         const emxArray_real32_T *varargin_5,
                                         const emxArray_real32_T *varargin_7);

/* Function Definitions */
static void b_error(const emlrtStack *sp, const mxArray *m,
                    emlrtMCInfo *location)
{
  const mxArray *pArray;
  pArray = m;
  emlrtCallMATLABR2012b((emlrtConstCTX)sp, 0, NULL, 1, &pArray, "error", true,
                        location);
}

static pointCloud *pointCloud_pointCloud(const emlrtStack *sp,
                                         pointCloud *b_this,
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
  uint32_T numPoints[2];
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
  st.site = &e_emlrtRSI;
  b_st.site = &h_emlrtRSI;
  iacol = c_this->Location->size[0] * c_this->Location->size[1];
  c_this->Location->size[0] = varargin_1->size[0];
  c_this->Location->size[1] = 3;
  emxEnsureCapacity_real32_T(&st, c_this->Location, iacol, &ib_emlrtRTEI);
  nrows = varargin_1->size[0] * 3;
  for (iacol = 0; iacol < nrows; iacol++) {
    c_this->Location->data[iacol] = varargin_1_data[iacol];
  }
  b_st.site = &i_emlrtRSI;
  emxInit_uint8_T(&b_st, &b_value, 2, &nb_emlrtRTEI);
  c_st.site = &m_emlrtRSI;
  xyzPoints_size_idx_0 = c_this->Location->size[0];
  numPoints[0] = (uint32_T)varargin_3->size[0];
  numPoints[1] = (uint32_T)varargin_3->size[1];
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
    d_st.site = &sb_emlrtRSI;
    e_st.site = &tb_emlrtRSI;
    outsize_idx_0_tmp = varargin_3->size[0] * xyzPoints_size_idx_0;
    if (!(outsize_idx_0_tmp ==
          (real_T)varargin_3->size[0] * (real_T)xyzPoints_size_idx_0)) {
      y = NULL;
      m = emlrtCreateCharArray(2, &iv[0]);
      emlrtInitCharArrayR2013a(&d_st, 15, m, &u[0]);
      emlrtAssign(&y, m);
      e_st.site = &cc_emlrtRSI;
      b_error(&e_st, y, &c_emlrtMCI);
    }
    iacol = b_value->size[0] * b_value->size[1];
    b_value->size[0] = outsize_idx_0_tmp;
    i = varargin_3->size[1];
    b_value->size[1] = varargin_3->size[1];
    emxEnsureCapacity_uint8_T(&d_st, b_value, iacol, &kb_emlrtRTEI);
    value_data = b_value->data;
    nrows = varargin_3->size[0];
    e_st.site = &ub_emlrtRSI;
    for (jcol = 0; jcol < i; jcol++) {
      int32_T ibmat;
      iacol = jcol * nrows;
      ibmat = jcol * outsize_idx_0_tmp - 1;
      e_st.site = &vb_emlrtRSI;
      if (xyzPoints_size_idx_0 > 2147483646) {
        f_st.site = &mb_emlrtRSI;
        check_forloop_overflow_error(&f_st);
      }
      for (itilerow = 0; itilerow < xyzPoints_size_idx_0; itilerow++) {
        int32_T ibcol;
        ibcol = ibmat + itilerow * nrows;
        e_st.site = &wb_emlrtRSI;
        if (nrows > 2147483646) {
          f_st.site = &mb_emlrtRSI;
          check_forloop_overflow_error(&f_st);
        }
        for (k = 0; k < nrows; k++) {
          value_data[(ibcol + k) + 1] = varargin_3_data[iacol + k];
        }
      }
    }
  } else {
    if ((varargin_3->size[0] != 0) && (varargin_3->size[1] != 0)) {
      numPoints[0] = (uint32_T)varargin_3->size[0];
      varargin_2[0] = (uint32_T)xyzPoints_size_idx_0;
      numPoints[1] = (uint32_T)varargin_3->size[1];
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
        emlrtErrorWithMessageIdR2018a(&c_st, &m_emlrtRTEI,
                                      "vision:pointcloud:unmatchedXYZColor",
                                      "vision:pointcloud:unmatchedXYZColor", 0);
      }
    }
    iacol = b_value->size[0] * b_value->size[1];
    b_value->size[0] = varargin_3->size[0];
    b_value->size[1] = varargin_3->size[1];
    emxEnsureCapacity_uint8_T(&c_st, b_value, iacol, &jb_emlrtRTEI);
    value_data = b_value->data;
    nrows = varargin_3->size[0] * varargin_3->size[1];
    for (iacol = 0; iacol < nrows; iacol++) {
      value_data[iacol] = varargin_3_data[iacol];
    }
  }
  iacol = c_this->Color->size[0] * c_this->Color->size[1];
  c_this->Color->size[0] = b_value->size[0];
  c_this->Color->size[1] = b_value->size[1];
  emxEnsureCapacity_uint8_T(&b_st, c_this->Color, iacol, &lb_emlrtRTEI);
  nrows = b_value->size[0] * b_value->size[1];
  for (iacol = 0; iacol < nrows; iacol++) {
    c_this->Color->data[iacol] = value_data[iacol];
  }
  emxFree_uint8_T(&b_st, &b_value);
  b_st.site = &j_emlrtRSI;
  c_st.site = &n_emlrtRSI;
  xyzPoints_size_idx_0 = c_this->Location->size[0];
  if ((varargin_5->size[0] != 0) && (varargin_5->size[1] != 0)) {
    numPoints[0] = (uint32_T)varargin_5->size[0];
    varargin_2[0] = (uint32_T)xyzPoints_size_idx_0;
    numPoints[1] = (uint32_T)varargin_5->size[1];
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
      emlrtErrorWithMessageIdR2018a(&c_st, &l_emlrtRTEI,
                                    "vision:pointcloud:unmatchedXYZNormal",
                                    "vision:pointcloud:unmatchedXYZNormal", 0);
    }
  }
  iacol = c_this->Normal->size[0] * c_this->Normal->size[1];
  c_this->Normal->size[0] = varargin_5->size[0];
  c_this->Normal->size[1] = varargin_5->size[1];
  emxEnsureCapacity_real32_T(&b_st, c_this->Normal, iacol, &mb_emlrtRTEI);
  nrows = varargin_5->size[0] * varargin_5->size[1];
  for (iacol = 0; iacol < nrows; iacol++) {
    c_this->Normal->data[iacol] = varargin_5_data[iacol];
  }
  b_st.site = &k_emlrtRSI;
  c_st.site = &o_emlrtRSI;
  xyzPoints_size_idx_0 = c_this->Location->size[0];
  if ((varargin_7->size[0] != 0) && (varargin_7->size[1] != 0) &&
      ((varargin_7->size[1] != 1) ||
       (varargin_7->size[0] != xyzPoints_size_idx_0))) {
    emlrtErrorWithMessageIdR2018a(&c_st, &k_emlrtRTEI,
                                  "vision:pointcloud:unmatchedXYZIntensity",
                                  "vision:pointcloud:unmatchedXYZIntensity", 0);
  }
  iacol = c_this->Intensity->size[0] * c_this->Intensity->size[1];
  c_this->Intensity->size[0] = varargin_7->size[0];
  c_this->Intensity->size[1] = varargin_7->size[1];
  emxEnsureCapacity_real32_T(&b_st, c_this->Intensity, iacol, &p_emlrtRTEI);
  nrows = varargin_7->size[0] * varargin_7->size[1];
  for (iacol = 0; iacol < nrows; iacol++) {
    c_this->Intensity->data[iacol] = varargin_7_data[iacol];
  }
  tmp_size[0] = 0;
  tmp_size[1] = 0;
  tmp_data.size = &tmp_size[0];
  tmp_data.allocatedSize = 0;
  tmp_data.numDimensions = 2;
  tmp_data.canFreeData = false;
  b_st.site = &l_emlrtRSI;
  pointCloudBase_set_RangeData(&b_st, c_this, &tmp_data);
  st.site = &g_emlrtRSI;
  c_this->Kdtree = NULL;
  c_this->LocationHandle = NULL;
  c_this->matlabCodegenIsDeleted = false;
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtConstCTX)sp);
  return c_this;
}

pointCloud *pointCloud_select(const emlrtStack *sp, const b_pointCloud *b_this,
                              const emxArray_boolean_T *varargin_1,
                              pointCloud *iobj_0)
{
  static const int16_T iv[3] = {32, 1800, 1};
  static const char_T functionName[6] = {'s', 'e', 'l', 'e', 'c', 't'};
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack e_st;
  emlrtStack st;
  emxArray_int32_T *ii;
  emxArray_real32_T *c_this;
  emxArray_real32_T *intensity;
  emxArray_real32_T *nv;
  emxArray_real32_T *r;
  emxArray_real32_T *tempIntens;
  emxArray_uint8_T *c;
  pointCloud *ptCloudOut;
  int32_T i;
  int32_T idx;
  int32_T loop_ub_tmp;
  int32_T maxdimlen;
  int32_T nx;
  int32_T *ii_data;
  real32_T *intensity_data;
  real32_T *tempIntens_data;
  uint8_T *c_data;
  const boolean_T *varargin_1_data;
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
  varargin_1_data = varargin_1->data;
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtConstCTX)sp);
  st.site = &ab_emlrtRSI;
  b_st.site = &gb_emlrtRSI;
  if (b_this->PointCloudArrayData->size[0] *
          b_this->PointCloudArrayData->size[1] !=
      1) {
    emlrtErrorWithMessageIdR2018a(
        &st, &d_emlrtRTEI, "vision:pointcloud:arrayNotSupported",
        "vision:pointcloud:arrayNotSupported", 3, 4, 6, &functionName[0]);
  }
  st.site = &bb_emlrtRSI;
  b_st.site = &v_emlrtRSI;
  p = true;
  for (idx = 0; idx < 3; idx++) {
    if (p) {
      if (idx + 1 <= 2) {
        i = varargin_1->size[idx];
      } else {
        i = 1;
      }
      if (iv[idx] != i) {
        p = false;
      }
    } else {
      p = false;
    }
  }
  if (!p) {
    emlrtErrorWithMessageIdR2018a(
        &b_st, &f_emlrtRTEI, "Coder:toolbox:ValidateattributesincorrectSize",
        "MATLAB:incorrectSize", 3, 4, 5, "Input");
  }
  st.site = &cb_emlrtRSI;
  b_st.site = &hb_emlrtRSI;
  nx = varargin_1->size[0] * varargin_1->size[1];
  c_st.site = &jb_emlrtRSI;
  idx = 0;
  emxInit_int32_T(&c_st, &ii, &gb_emlrtRTEI);
  i = ii->size[0];
  ii->size[0] = nx;
  emxEnsureCapacity_int32_T(&c_st, ii, i, &db_emlrtRTEI);
  ii_data = ii->data;
  d_st.site = &kb_emlrtRSI;
  if (nx > 2147483646) {
    e_st.site = &mb_emlrtRSI;
    check_forloop_overflow_error(&e_st);
  }
  maxdimlen = 0;
  exitg1 = false;
  while ((!exitg1) && (maxdimlen <= nx - 1)) {
    if (varargin_1_data[maxdimlen]) {
      idx++;
      ii_data[idx - 1] = maxdimlen + 1;
      if (idx >= nx) {
        exitg1 = true;
      } else {
        maxdimlen++;
      }
    } else {
      maxdimlen++;
    }
  }
  if (idx > nx) {
    emlrtErrorWithMessageIdR2018a(&c_st, &e_emlrtRTEI,
                                  "Coder:builtins:AssertionFailed",
                                  "Coder:builtins:AssertionFailed", 0);
  }
  if (nx == 1) {
    if (idx == 0) {
      ii->size[0] = 0;
    }
  } else {
    int32_T emptyDimValue[2];
    if (idx < 1) {
      i = 0;
    } else {
      i = idx;
    }
    emptyDimValue[0] = 1;
    emptyDimValue[1] = i;
    d_st.site = &lb_emlrtRSI;
    indexShapeCheck(&d_st, ii->size[0], emptyDimValue);
    maxdimlen = ii->size[0];
    ii->size[0] = i;
    emxEnsureCapacity_int32_T(&c_st, ii, maxdimlen, &eb_emlrtRTEI);
    ii_data = ii->data;
  }
  if ((varargin_1->size[0] == 1) && (ii->size[0] != 1) &&
      (varargin_1->size[1] >= 2)) {
    c_st.site = &ib_emlrtRSI;
    warning(&c_st);
  }
  st.site = &db_emlrtRSI;
  b_st.site = &ob_emlrtRSI;
  loop_ub_tmp = ii->size[0];
  for (i = 0; i < loop_ub_tmp; i++) {
    maxdimlen = ii_data[i];
    if ((maxdimlen < 1) || (maxdimlen > 57600)) {
      emlrtDynamicBoundsCheckR2012b(maxdimlen, 1, 57600, &emlrtBCI, &b_st);
    }
  }
  emxInit_uint8_T(&b_st, &c, 2, &hb_emlrtRTEI);
  if ((b_this->Color->size[0] != 0) && (b_this->Color->size[1] != 0) &&
      (b_this->Color->size[2] != 0)) {
    c_st.site = &pb_emlrtRSI;
    nx = b_this->Color->size[0] * b_this->Color->size[1] *
         b_this->Color->size[2];
    d_st.site = &qb_emlrtRSI;
    idx = (int32_T)((uint32_T)nx / 3U);
    if (idx > nx) {
      emlrtErrorWithMessageIdR2018a(&d_st, &i_emlrtRTEI,
                                    "Coder:builtins:AssertionFailed",
                                    "Coder:builtins:AssertionFailed", 0);
    }
    maxdimlen = b_this->Color->size[0];
    if (b_this->Color->size[1] > b_this->Color->size[0]) {
      maxdimlen = b_this->Color->size[1];
    }
    if (b_this->Color->size[2] > maxdimlen) {
      maxdimlen = b_this->Color->size[2];
    }
    maxdimlen = muIntScalarMax_sint32(nx, maxdimlen);
    if (idx > maxdimlen) {
      emlrtErrorWithMessageIdR2018a(
          &c_st, &g_emlrtRTEI, "Coder:toolbox:reshape_emptyReshapeLimit",
          "Coder:toolbox:reshape_emptyReshapeLimit", 0);
    }
    if (maxdimlen < 3) {
      emlrtErrorWithMessageIdR2018a(
          &c_st, &g_emlrtRTEI, "Coder:toolbox:reshape_emptyReshapeLimit",
          "Coder:toolbox:reshape_emptyReshapeLimit", 0);
    }
    if (idx * 3 != nx) {
      emlrtErrorWithMessageIdR2018a(
          &c_st, &h_emlrtRTEI, "Coder:MATLAB:getReshapeDims_notSameNumel",
          "Coder:MATLAB:getReshapeDims_notSameNumel", 0);
    }
    i = c->size[0] * c->size[1];
    c->size[0] = ii->size[0];
    c->size[1] = 3;
    emxEnsureCapacity_uint8_T(&b_st, c, i, &fb_emlrtRTEI);
    c_data = c->data;
    for (i = 0; i < 3; i++) {
      for (maxdimlen = 0; maxdimlen < loop_ub_tmp; maxdimlen++) {
        if ((ii_data[maxdimlen] < 1) || (ii_data[maxdimlen] > idx)) {
          emlrtDynamicBoundsCheckR2012b(ii_data[maxdimlen], 1, idx, &b_emlrtBCI,
                                        &b_st);
        }
        c_data[maxdimlen + c->size[0] * i] =
            b_this->Color->data[(ii_data[maxdimlen] + idx * i) - 1];
      }
    }
  } else {
    c->size[0] = 0;
    c->size[1] = 0;
  }
  emxInit_real32_T(&b_st, &nv, 2, &hb_emlrtRTEI);
  if ((b_this->Normal->size[0] != 0) && (b_this->Normal->size[1] != 0) &&
      (b_this->Normal->size[2] != 0)) {
    c_st.site = &pb_emlrtRSI;
    nx = b_this->Normal->size[0] * b_this->Normal->size[1] *
         b_this->Normal->size[2];
    d_st.site = &qb_emlrtRSI;
    idx = (int32_T)((uint32_T)nx / 3U);
    if (idx > nx) {
      emlrtErrorWithMessageIdR2018a(&d_st, &i_emlrtRTEI,
                                    "Coder:builtins:AssertionFailed",
                                    "Coder:builtins:AssertionFailed", 0);
    }
    maxdimlen = b_this->Normal->size[0];
    if (b_this->Normal->size[1] > b_this->Normal->size[0]) {
      maxdimlen = b_this->Normal->size[1];
    }
    if (b_this->Normal->size[2] > maxdimlen) {
      maxdimlen = b_this->Normal->size[2];
    }
    maxdimlen = muIntScalarMax_sint32(nx, maxdimlen);
    if (idx > maxdimlen) {
      emlrtErrorWithMessageIdR2018a(
          &c_st, &g_emlrtRTEI, "Coder:toolbox:reshape_emptyReshapeLimit",
          "Coder:toolbox:reshape_emptyReshapeLimit", 0);
    }
    if (maxdimlen < 3) {
      emlrtErrorWithMessageIdR2018a(
          &c_st, &g_emlrtRTEI, "Coder:toolbox:reshape_emptyReshapeLimit",
          "Coder:toolbox:reshape_emptyReshapeLimit", 0);
    }
    if (idx * 3 != nx) {
      emlrtErrorWithMessageIdR2018a(
          &c_st, &h_emlrtRTEI, "Coder:MATLAB:getReshapeDims_notSameNumel",
          "Coder:MATLAB:getReshapeDims_notSameNumel", 0);
    }
    i = nv->size[0] * nv->size[1];
    nv->size[0] = ii->size[0];
    nv->size[1] = 3;
    emxEnsureCapacity_real32_T(&b_st, nv, i, &fb_emlrtRTEI);
    tempIntens_data = nv->data;
    for (i = 0; i < 3; i++) {
      for (maxdimlen = 0; maxdimlen < loop_ub_tmp; maxdimlen++) {
        if ((ii_data[maxdimlen] < 1) || (ii_data[maxdimlen] > idx)) {
          emlrtDynamicBoundsCheckR2012b(ii_data[maxdimlen], 1, idx, &b_emlrtBCI,
                                        &b_st);
        }
        tempIntens_data[maxdimlen + nv->size[0] * i] =
            b_this->Normal->data[(ii_data[maxdimlen] + idx * i) - 1];
      }
    }
  } else {
    nv->size[0] = 0;
    nv->size[1] = 0;
  }
  emxInit_real32_T(&b_st, &intensity, 2, &hb_emlrtRTEI);
  if ((b_this->Intensity->size[0] != 0) && (b_this->Intensity->size[1] != 0)) {
    c_st.site = &pb_emlrtRSI;
    b_indexShapeCheck(&c_st, b_this->Intensity->size, ii->size[0]);
    maxdimlen = b_this->Intensity->size[0] * b_this->Intensity->size[1];
    emxInit_real32_T(&b_st, &tempIntens, 1, &fb_emlrtRTEI);
    i = tempIntens->size[0];
    tempIntens->size[0] = ii->size[0];
    emxEnsureCapacity_real32_T(&b_st, tempIntens, i, &fb_emlrtRTEI);
    tempIntens_data = tempIntens->data;
    for (i = 0; i < loop_ub_tmp; i++) {
      if ((ii_data[i] < 1) || (ii_data[i] > maxdimlen)) {
        emlrtDynamicBoundsCheckR2012b(ii_data[i], 1, maxdimlen, &b_emlrtBCI,
                                      &b_st);
      }
      tempIntens_data[i] = b_this->Intensity->data[ii_data[i] - 1];
    }
    if (ii->size[0] == 1) {
      i = intensity->size[0] * intensity->size[1];
      intensity->size[0] = 1;
      maxdimlen = tempIntens->size[0];
      intensity->size[1] = tempIntens->size[0];
      emxEnsureCapacity_real32_T(&b_st, intensity, i, &fb_emlrtRTEI);
      intensity_data = intensity->data;
      for (i = 0; i < maxdimlen; i++) {
        intensity_data[intensity->size[0] * i] = tempIntens_data[i];
      }
    } else {
      i = intensity->size[0] * intensity->size[1];
      intensity->size[0] = ii->size[0];
      intensity->size[1] = 1;
      emxEnsureCapacity_real32_T(&b_st, intensity, i, &fb_emlrtRTEI);
      intensity_data = intensity->data;
      for (i = 0; i < loop_ub_tmp; i++) {
        intensity_data[i] = tempIntens_data[i];
      }
    }
    emxFree_real32_T(&b_st, &tempIntens);
  } else {
    intensity->size[0] = 0;
    intensity->size[1] = 0;
  }
  emxInit_real32_T(&b_st, &r, 2, &hb_emlrtRTEI);
  if ((b_this->RangeData->size[0] != 0) && (b_this->RangeData->size[1] != 0) &&
      (b_this->RangeData->size[2] != 0)) {
    c_st.site = &pb_emlrtRSI;
    nx = b_this->RangeData->size[0] * b_this->RangeData->size[1] *
         b_this->RangeData->size[2];
    d_st.site = &qb_emlrtRSI;
    idx = (int32_T)((uint32_T)nx / 3U);
    if (idx > nx) {
      emlrtErrorWithMessageIdR2018a(&d_st, &i_emlrtRTEI,
                                    "Coder:builtins:AssertionFailed",
                                    "Coder:builtins:AssertionFailed", 0);
    }
    maxdimlen = b_this->RangeData->size[0];
    if (b_this->RangeData->size[1] > b_this->RangeData->size[0]) {
      maxdimlen = b_this->RangeData->size[1];
    }
    if (b_this->RangeData->size[2] > maxdimlen) {
      maxdimlen = b_this->RangeData->size[2];
    }
    maxdimlen = muIntScalarMax_sint32(nx, maxdimlen);
    if (idx > maxdimlen) {
      emlrtErrorWithMessageIdR2018a(
          &c_st, &g_emlrtRTEI, "Coder:toolbox:reshape_emptyReshapeLimit",
          "Coder:toolbox:reshape_emptyReshapeLimit", 0);
    }
    if (maxdimlen < 3) {
      emlrtErrorWithMessageIdR2018a(
          &c_st, &g_emlrtRTEI, "Coder:toolbox:reshape_emptyReshapeLimit",
          "Coder:toolbox:reshape_emptyReshapeLimit", 0);
    }
    if (idx * 3 != nx) {
      emlrtErrorWithMessageIdR2018a(
          &c_st, &h_emlrtRTEI, "Coder:MATLAB:getReshapeDims_notSameNumel",
          "Coder:MATLAB:getReshapeDims_notSameNumel", 0);
    }
    i = r->size[0] * r->size[1];
    r->size[0] = ii->size[0];
    r->size[1] = 3;
    emxEnsureCapacity_real32_T(&b_st, r, i, &fb_emlrtRTEI);
    tempIntens_data = r->data;
    for (i = 0; i < 3; i++) {
      for (maxdimlen = 0; maxdimlen < loop_ub_tmp; maxdimlen++) {
        if ((ii_data[maxdimlen] < 1) || (ii_data[maxdimlen] > idx)) {
          emlrtDynamicBoundsCheckR2012b(ii_data[maxdimlen], 1, idx, &b_emlrtBCI,
                                        &b_st);
        }
        tempIntens_data[maxdimlen + r->size[0] * i] =
            b_this->RangeData->data[(ii_data[maxdimlen] + idx * i) - 1];
      }
    }
  } else {
    r->size[0] = 0;
    r->size[1] = 0;
  }
  emxInit_real32_T(sp, &c_this, 2, &fb_emlrtRTEI);
  i = c_this->size[0] * c_this->size[1];
  c_this->size[0] = ii->size[0];
  c_this->size[1] = 3;
  emxEnsureCapacity_real32_T(sp, c_this, i, &fb_emlrtRTEI);
  tempIntens_data = c_this->data;
  for (i = 0; i < 3; i++) {
    for (maxdimlen = 0; maxdimlen < loop_ub_tmp; maxdimlen++) {
      tempIntens_data[maxdimlen + c_this->size[0] * i] =
          b_this->Location[(ii_data[maxdimlen] + 57600 * i) - 1];
    }
  }
  emxFree_int32_T(sp, &ii);
  st.site = &eb_emlrtRSI;
  ptCloudOut = pointCloud_pointCloud(&st, iobj_0, c_this, c, nv, intensity);
  emxFree_real32_T(sp, &c_this);
  emxFree_real32_T(sp, &intensity);
  emxFree_real32_T(sp, &nv);
  emxFree_uint8_T(sp, &c);
  st.site = &fb_emlrtRSI;
  pointCloudBase_set_RangeData(&st, ptCloudOut, r);
  emxFree_real32_T(sp, &r);
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtConstCTX)sp);
  return ptCloudOut;
}

/* End of code generation (pointCloud.c) */
