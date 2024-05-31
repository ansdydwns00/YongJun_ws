//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// _coder_pointpillardetect_api.cu
//
// Code generation for function '_coder_pointpillardetect_api'
//

// Include files
#include "_coder_pointpillardetect_api.h"
#include "pointpillardetect.h"
#include "pointpillardetect_data.h"
#include "pointpillardetect_emxutil.h"
#include "pointpillardetect_types.h"
#include "rt_nonfinite.h"

// Variable Definitions
static emlrtRTEInfo db_emlrtRTEI{
    1,                              // lineNo
    1,                              // colNo
    "_coder_pointpillardetect_api", // fName
    ""                              // pName
};

// Function Declarations
static void b_emlrt_marshallIn(const mxArray *b_nullptr,
                               const char_T *identifier, emxArray_real32_T *y);

static void b_emlrt_marshallIn(const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               emxArray_real32_T *y);

static real_T b_emlrt_marshallIn(const mxArray *src,
                                 const emlrtMsgIdentifier *msgId);

static void c_emlrt_marshallIn(const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               emxArray_real32_T *ret);

static void d_emlrt_marshallIn(const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               emxArray_real32_T *ret);

static void emlrt_marshallIn(const mxArray *b_nullptr, const char_T *identifier,
                             emxArray_real32_T *y);

static void emlrt_marshallIn(const mxArray *u,
                             const emlrtMsgIdentifier *parentId,
                             emxArray_real32_T *y);

static real_T emlrt_marshallIn(const mxArray *b_nullptr,
                               const char_T *identifier);

static real_T emlrt_marshallIn(const mxArray *u,
                               const emlrtMsgIdentifier *parentId);

static const mxArray *emlrt_marshallOut(const real_T u_data[],
                                        const int32_T u_size[2]);

static const mxArray *emlrt_marshallOut(const real32_T u_data[],
                                        const int32_T u_size[1]);

static const mxArray *emlrt_marshallOut(const coder::categorical *u);

// Function Definitions
static void b_emlrt_marshallIn(const mxArray *b_nullptr,
                               const char_T *identifier, emxArray_real32_T *y)
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = const_cast<const char_T *>(identifier);
  thisId.fParent = nullptr;
  thisId.bParentIsCell = false;
  b_emlrt_marshallIn(emlrtAlias(b_nullptr), &thisId, y);
  emlrtDestroyArray(&b_nullptr);
}

static void b_emlrt_marshallIn(const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               emxArray_real32_T *y)
{
  d_emlrt_marshallIn(emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static real_T b_emlrt_marshallIn(const mxArray *src,
                                 const emlrtMsgIdentifier *msgId)
{
  static const int32_T dims{0};
  real_T ret;
  emlrtCheckBuiltInR2012b(emlrtRootTLSGlobal, msgId, src, "double", false, 0U,
                          (const void *)&dims);
  ret = *static_cast<real_T *>(emlrtMxGetData(src));
  emlrtDestroyArray(&src);
  return ret;
}

static void c_emlrt_marshallIn(const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               emxArray_real32_T *ret)
{
  static const int32_T dims[2]{-1, 3};
  int32_T iv[2];
  int32_T i;
  boolean_T b_bv[2]{true, false};
  emlrtCheckVsBuiltInR2012b(emlrtRootTLSGlobal, msgId, src, "single", false, 2U,
                            (const void *)&dims[0], &b_bv[0], &iv[0]);
  ret->allocatedSize = iv[0] * iv[1];
  i = ret->size[0] * ret->size[1];
  ret->size[0] = iv[0];
  ret->size[1] = iv[1];
  emxEnsureCapacity_real32_T(ret, i, static_cast<emlrtRTEInfo *>(nullptr));
  ret->data = static_cast<real32_T *>(emlrtMxGetData(src));
  ret->canFreeData = false;
  emlrtDestroyArray(&src);
}

static void d_emlrt_marshallIn(const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               emxArray_real32_T *ret)
{
  static const int32_T dims[1]{-1};
  int32_T iv[1];
  int32_T i;
  boolean_T b_bv[1]{true};
  emlrtCheckVsBuiltInR2012b(emlrtRootTLSGlobal, msgId, src, "single", false, 1U,
                            (const void *)&dims[0], &b_bv[0], &iv[0]);
  ret->allocatedSize = iv[0];
  i = ret->size[0];
  ret->size[0] = iv[0];
  emxEnsureCapacity_real32_T(ret, i, static_cast<emlrtRTEInfo *>(nullptr));
  ret->data = static_cast<real32_T *>(emlrtMxGetData(src));
  ret->canFreeData = false;
  emlrtDestroyArray(&src);
}

static void emlrt_marshallIn(const mxArray *b_nullptr, const char_T *identifier,
                             emxArray_real32_T *y)
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = const_cast<const char_T *>(identifier);
  thisId.fParent = nullptr;
  thisId.bParentIsCell = false;
  emlrt_marshallIn(emlrtAlias(b_nullptr), &thisId, y);
  emlrtDestroyArray(&b_nullptr);
}

static void emlrt_marshallIn(const mxArray *u,
                             const emlrtMsgIdentifier *parentId,
                             emxArray_real32_T *y)
{
  c_emlrt_marshallIn(emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static real_T emlrt_marshallIn(const mxArray *b_nullptr,
                               const char_T *identifier)
{
  emlrtMsgIdentifier thisId;
  real_T y;
  thisId.fIdentifier = const_cast<const char_T *>(identifier);
  thisId.fParent = nullptr;
  thisId.bParentIsCell = false;
  y = emlrt_marshallIn(emlrtAlias(b_nullptr), &thisId);
  emlrtDestroyArray(&b_nullptr);
  return y;
}

static real_T emlrt_marshallIn(const mxArray *u,
                               const emlrtMsgIdentifier *parentId)
{
  real_T y;
  y = b_emlrt_marshallIn(emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static const mxArray *emlrt_marshallOut(const real_T u_data[],
                                        const int32_T u_size[2])
{
  static const int32_T iv[2]{0, 0};
  const mxArray *m;
  const mxArray *y;
  y = nullptr;
  m = emlrtCreateNumericArray(2, (const void *)&iv[0], mxDOUBLE_CLASS, mxREAL);
  emlrtMxSetData((mxArray *)m, (void *)&u_data[0]);
  emlrtSetDimensions((mxArray *)m, &u_size[0], 2);
  emlrtAssign(&y, m);
  return y;
}

static const mxArray *emlrt_marshallOut(const real32_T u_data[],
                                        const int32_T u_size[1])
{
  static const int32_T iv[1]{0};
  const mxArray *m;
  const mxArray *y;
  y = nullptr;
  m = emlrtCreateNumericArray(1, (const void *)&iv[0], mxSINGLE_CLASS, mxREAL);
  emlrtMxSetData((mxArray *)m, (void *)&u_data[0]);
  emlrtSetDimensions((mxArray *)m, &u_size[0], 1);
  emlrtAssign(&y, m);
  return y;
}

static const mxArray *emlrt_marshallOut(const coder::categorical *u)
{
  const mxArray *propValues[5];
  const mxArray *b_y;
  const mxArray *c_y;
  const mxArray *d_y;
  const mxArray *e_y;
  const mxArray *f_y;
  const mxArray *g_y;
  const mxArray *m;
  const mxArray *m1;
  const mxArray *m2;
  const mxArray *m3;
  const mxArray *m4;
  const mxArray *m5;
  const mxArray *m6;
  const mxArray *m7;
  const mxArray *m8;
  const mxArray *m9;
  const mxArray *y;
  int32_T iv[2];
  int32_T loopUpperBound;
  uint32_T *pData;
  const char_T *propClasses[5]{
      "matlab.internal.coder.categorical", "matlab.internal.coder.categorical",
      "matlab.internal.coder.categorical", "matlab.internal.coder.categorical",
      "matlab.internal.coder.categorical"};
  const char_T *propNames[5]{"codes", "categoryNames", "isProtected",
                             "isOrdinal", "numCategoriesUpperBound"};
  y = nullptr;
  emlrtAssign(&y, emlrtCreateClassInstance2022a(
                      emlrtRootTLSGlobal, "matlab.internal.coder.categorical"));
  m = nullptr;
  b_y = nullptr;
  iv[0] = 1;
  iv[1] = u->codes.size[1];
  m5 = emlrtCreateNumericArray(2, &iv[0], mxUINT32_CLASS, mxREAL);
  pData = static_cast<uint32_T *>(emlrtMxGetData(m5));
  loopUpperBound = u->codes.size[1];
  for (int32_T i{0}; i < loopUpperBound; i++) {
    pData[i] = u->codes.data[i];
  }
  emlrtAssign(&b_y, m5);
  emlrtAssign(&m, b_y);
  propValues[0] = m;
  m1 = nullptr;
  c_y = nullptr;
  emlrtAssign(&c_y, emlrtCreateCellArrayR2014a(1, &u->categoryNames.size[0]));
  loopUpperBound = u->categoryNames.size[0];
  if (u->categoryNames.size[0] - 1 >= 0) {
    iv[0] = 1;
  }
  for (int32_T i{0}; i < loopUpperBound; i++) {
    d_y = nullptr;
    iv[1] = u->categoryNames.data[i].f1.size[1];
    m6 = emlrtCreateCharArray(2, &iv[0]);
    emlrtInitCharArrayR2013a(emlrtRootTLSGlobal,
                             u->categoryNames.data[i].f1.size[1], m6,
                             &u->categoryNames.data[i].f1.data[0]);
    emlrtAssign(&d_y, m6);
    emlrtSetCell(c_y, i, d_y);
  }
  emlrtAssign(&m1, c_y);
  propValues[1] = m1;
  m2 = nullptr;
  e_y = nullptr;
  m7 = emlrtCreateLogicalScalar(false);
  emlrtAssign(&e_y, m7);
  emlrtAssign(&m2, e_y);
  propValues[2] = m2;
  m3 = nullptr;
  f_y = nullptr;
  m8 = emlrtCreateLogicalScalar(false);
  emlrtAssign(&f_y, m8);
  emlrtAssign(&m3, f_y);
  propValues[3] = m3;
  m4 = nullptr;
  g_y = nullptr;
  m9 = emlrtCreateNumericMatrix(1, 1, mxINT32_CLASS, mxREAL);
  *static_cast<int32_T *>(emlrtMxGetData(m9)) = 2147483646;
  emlrtAssign(&g_y, m9);
  emlrtAssign(&m4, g_y);
  propValues[4] = m4;
  emlrtSetAllProperties(emlrtRootTLSGlobal, &y, 0, 5,
                        (const char_T **)&propNames[0],
                        (const char_T **)&propClasses[0], &propValues[0]);
  emlrtAssign(
      &y, emlrtConvertInstanceToRedirectSource(
              emlrtRootTLSGlobal, y, 0, "matlab.internal.coder.categorical"));
  return y;
}

void b_pointpillardetect_api(pointpillardetectStackData *SD,
                             const mxArray *const prhs[4], int32_T nlhs,
                             const mxArray *plhs[3])
{
  static const uint32_T uv1[4]{221515896U, 3007340337U, 1215096759U,
                               4276574891U};
  static const char_T *sv1[1]{"matFile"};
  emxArray_real32_T *dataInt;
  emxArray_real32_T *dataLoc;
  real_T(*bboxes_data)[1928448];
  real_T threshold;
  int32_T bboxes_size[2];
  int32_T iv[1];
  int32_T scores_size[1];
  real32_T(*scores_data)[214272];
  bboxes_data = (real_T(*)[1928448])mxMalloc(sizeof(real_T[1928448]));
  scores_data = (real32_T(*)[214272])mxMalloc(sizeof(real32_T[214272]));
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);
  // Check constant function inputs
  iv[0] = 4;
  emlrtCheckArrayChecksumR2018b(emlrtRootTLSGlobal, prhs[0], false, &iv[0],
                                (const char_T **)&sv1[0], &uv1[0]);
  // Marshall function inputs
  emxInit_real32_T(&dataLoc, 2, &db_emlrtRTEI, true);
  dataLoc->canFreeData = false;
  emlrt_marshallIn(emlrtAlias(prhs[1]), "dataLoc", dataLoc);
  emxInit_real32_T(&dataInt, 1, &db_emlrtRTEI, true);
  dataInt->canFreeData = false;
  b_emlrt_marshallIn(emlrtAlias(prhs[2]), "dataInt", dataInt);
  threshold = emlrt_marshallIn(emlrtAliasP(prhs[3]), "threshold");
  // Invoke the target function
  pointpillardetect(SD, dataLoc, dataInt, threshold, *bboxes_data, bboxes_size,
                    *scores_data, scores_size, &SD->f4.labels);
  emxFree_real32_T(&dataInt);
  emxFree_real32_T(&dataLoc);
  // Marshall function outputs
  plhs[0] = emlrt_marshallOut(*bboxes_data, bboxes_size);
  if (nlhs > 1) {
    plhs[1] = emlrt_marshallOut(*scores_data, scores_size);
  }
  if (nlhs > 2) {
    plhs[2] = emlrt_marshallOut(&SD->f4.labels);
  }
  emlrtHeapReferenceStackLeaveFcnR2012b(emlrtRootTLSGlobal);
}

// End of code generation (_coder_pointpillardetect_api.cu)
