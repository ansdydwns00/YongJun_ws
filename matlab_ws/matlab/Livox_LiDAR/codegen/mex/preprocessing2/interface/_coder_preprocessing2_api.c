/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_preprocessing2_api.c
 *
 * Code generation for function '_coder_preprocessing2_api'
 *
 */

/* Include files */
#include "_coder_preprocessing2_api.h"
#include "preprocessing2.h"
#include "preprocessing2_data.h"
#include "preprocessing2_emxutil.h"
#include "preprocessing2_types.h"
#include "rt_nonfinite.h"

/* Variable Definitions */
static emlrtRTEInfo tc_emlrtRTEI = {
    1,                           /* lineNo */
    1,                           /* colNo */
    "_coder_preprocessing2_api", /* fName */
    ""                           /* pName */
};

/* Function Declarations */
static void b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               real32_T y[172800]);

static const mxArray *b_emlrt_marshallOut(const emxArray_real32_T *u);

static void c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *nullptr,
                               const char_T *identifier, real32_T y[57600]);

static void d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               real32_T y[57600]);

static void e_emlrt_marshallIn(const emlrtStack *sp, const mxArray *nullptr,
                               const char_T *identifier, real32_T y[6]);

static void emlrt_marshallIn(const emlrtStack *sp, const mxArray *nullptr,
                             const char_T *identifier, real32_T y[172800]);

static const mxArray *emlrt_marshallOut(const emxArray_real32_T *u);

static void f_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               real32_T y[6]);

static real32_T g_emlrt_marshallIn(const emlrtStack *sp, const mxArray *nullptr,
                                   const char_T *identifier);

static real32_T h_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                   const emlrtMsgIdentifier *parentId);

static void i_emlrt_marshallIn(const emlrtStack *sp, const mxArray *nullptr,
                               const char_T *identifier, real32_T y[3]);

static void j_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               real32_T y[3]);

static void k_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               real32_T ret[172800]);

static void l_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               real32_T ret[57600]);

static void m_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               real32_T ret[6]);

static real32_T n_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId);

static void o_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               real32_T ret[3]);

/* Function Definitions */
static void b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               real32_T y[172800])
{
  k_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static const mxArray *b_emlrt_marshallOut(const emxArray_real32_T *u)
{
  const mxArray *m;
  const mxArray *y;
  int32_T b_i;
  int32_T i;
  const real32_T *u_data;
  real32_T *pData;
  u_data = u->data;
  y = NULL;
  m = emlrtCreateNumericArray(1, &u->size[0], mxSINGLE_CLASS, mxREAL);
  pData = (real32_T *)emlrtMxGetData(m);
  i = 0;
  for (b_i = 0; b_i < u->size[0]; b_i++) {
    pData[i] = u_data[b_i];
    i++;
  }
  emlrtAssign(&y, m);
  return y;
}

static void c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *nullptr,
                               const char_T *identifier, real32_T y[57600])
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  d_emlrt_marshallIn(sp, emlrtAlias(nullptr), &thisId, y);
  emlrtDestroyArray(&nullptr);
}

static void d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               real32_T y[57600])
{
  l_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static void e_emlrt_marshallIn(const emlrtStack *sp, const mxArray *nullptr,
                               const char_T *identifier, real32_T y[6])
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  f_emlrt_marshallIn(sp, emlrtAlias(nullptr), &thisId, y);
  emlrtDestroyArray(&nullptr);
}

static void emlrt_marshallIn(const emlrtStack *sp, const mxArray *nullptr,
                             const char_T *identifier, real32_T y[172800])
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  b_emlrt_marshallIn(sp, emlrtAlias(nullptr), &thisId, y);
  emlrtDestroyArray(&nullptr);
}

static const mxArray *emlrt_marshallOut(const emxArray_real32_T *u)
{
  const mxArray *m;
  const mxArray *y;
  int32_T iv[2];
  int32_T b_i;
  int32_T i;
  const real32_T *u_data;
  real32_T *pData;
  u_data = u->data;
  y = NULL;
  iv[0] = u->size[0];
  iv[1] = 3;
  m = emlrtCreateNumericArray(2, &iv[0], mxSINGLE_CLASS, mxREAL);
  pData = (real32_T *)emlrtMxGetData(m);
  i = 0;
  for (b_i = 0; b_i < u->size[0]; b_i++) {
    pData[i] = u_data[b_i];
    i++;
  }
  for (b_i = 0; b_i < u->size[0]; b_i++) {
    pData[i] = u_data[b_i + u->size[0]];
    i++;
  }
  for (b_i = 0; b_i < u->size[0]; b_i++) {
    pData[i] = u_data[b_i + u->size[0] * 2];
    i++;
  }
  emlrtAssign(&y, m);
  return y;
}

static void f_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               real32_T y[6])
{
  m_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static real32_T g_emlrt_marshallIn(const emlrtStack *sp, const mxArray *nullptr,
                                   const char_T *identifier)
{
  emlrtMsgIdentifier thisId;
  real32_T y;
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = h_emlrt_marshallIn(sp, emlrtAlias(nullptr), &thisId);
  emlrtDestroyArray(&nullptr);
  return y;
}

static real32_T h_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                   const emlrtMsgIdentifier *parentId)
{
  real32_T y;
  y = n_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static void i_emlrt_marshallIn(const emlrtStack *sp, const mxArray *nullptr,
                               const char_T *identifier, real32_T y[3])
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  j_emlrt_marshallIn(sp, emlrtAlias(nullptr), &thisId, y);
  emlrtDestroyArray(&nullptr);
}

static void j_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               real32_T y[3])
{
  o_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static void k_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               real32_T ret[172800])
{
  static const int32_T dims[2] = {57600, 3};
  emlrtCheckBuiltInR2012b((emlrtConstCTX)sp, msgId, src, "single|double", false,
                          2U, (const void *)&dims[0]);
  emlrtImportArrayR2015b((emlrtConstCTX)sp, src, &ret[0], 4, false);
  emlrtDestroyArray(&src);
}

static void l_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               real32_T ret[57600])
{
  static const int32_T dims = 57600;
  emlrtCheckBuiltInR2012b((emlrtConstCTX)sp, msgId, src, "single|double", false,
                          1U, (const void *)&dims);
  emlrtImportArrayR2015b((emlrtConstCTX)sp, src, &ret[0], 4, false);
  emlrtDestroyArray(&src);
}

static void m_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId, real32_T ret[6])
{
  static const int32_T dims[2] = {1, 6};
  emlrtCheckBuiltInR2012b((emlrtConstCTX)sp, msgId, src, "single|double", false,
                          2U, (const void *)&dims[0]);
  emlrtImportArrayR2015b((emlrtConstCTX)sp, src, &ret[0], 4, false);
  emlrtDestroyArray(&src);
}

static real32_T n_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId)
{
  static const int32_T dims = 0;
  real32_T ret;
  emlrtCheckBuiltInR2012b((emlrtConstCTX)sp, msgId, src, "single|double", false,
                          0U, (const void *)&dims);
  emlrtImportArrayR2015b((emlrtConstCTX)sp, src, &ret, 4, false);
  emlrtDestroyArray(&src);
  return ret;
}

static void o_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId, real32_T ret[3])
{
  static const int32_T dims[2] = {1, 3};
  emlrtCheckBuiltInR2012b((emlrtConstCTX)sp, msgId, src, "single|double", false,
                          2U, (const void *)&dims[0]);
  emlrtImportArrayR2015b((emlrtConstCTX)sp, src, &ret[0], 4, false);
  emlrtDestroyArray(&src);
}

void preprocessing2_api(preprocessing2StackData *SD,
                        const mxArray *const prhs[6], int32_T nlhs,
                        const mxArray *plhs[2])
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  emxArray_real32_T *Intensity;
  emxArray_real32_T *Points;
  real32_T ROI[6];
  real32_T GroundReferenceVector[3];
  real32_T GroundMaxAngularDistance;
  real32_T GroundMaxDistance;
  st.tls = emlrtRootTLSGlobal;
  emlrtHeapReferenceStackEnterFcnR2012b(&st);
  /* Marshall function inputs */
  emlrt_marshallIn(&st, emlrtAliasP(prhs[0]), "points", SD->f1.points);
  c_emlrt_marshallIn(&st, emlrtAliasP(prhs[1]), "intensity", SD->f1.intensity);
  e_emlrt_marshallIn(&st, emlrtAliasP(prhs[2]), "ROI", ROI);
  GroundMaxDistance =
      g_emlrt_marshallIn(&st, emlrtAliasP(prhs[3]), "GroundMaxDistance");
  i_emlrt_marshallIn(&st, emlrtAliasP(prhs[4]), "GroundReferenceVector",
                     GroundReferenceVector);
  GroundMaxAngularDistance =
      g_emlrt_marshallIn(&st, emlrtAliasP(prhs[5]), "GroundMaxAngularDistance");
  /* Invoke the target function */
  emxInit_real32_T(&st, &Points, 2, &tc_emlrtRTEI);
  emxInit_real32_T(&st, &Intensity, 1, &tc_emlrtRTEI);
  preprocessing2(SD, &st, SD->f1.points, SD->f1.intensity, ROI,
                 GroundMaxDistance, GroundReferenceVector,
                 GroundMaxAngularDistance, Points, Intensity);
  /* Marshall function outputs */
  plhs[0] = emlrt_marshallOut(Points);
  emxFree_real32_T(&st, &Points);
  if (nlhs > 1) {
    plhs[1] = b_emlrt_marshallOut(Intensity);
  }
  emxFree_real32_T(&st, &Intensity);
  emlrtHeapReferenceStackLeaveFcnR2012b(&st);
}

/* End of code generation (_coder_preprocessing2_api.c) */
