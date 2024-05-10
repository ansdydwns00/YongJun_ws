/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_AutoL_parsing_info.c
 *
 * MATLAB Coder version            : 23.2
 * C/C++ source code generated on  : 10-May-2024 19:22:11
 */

/* Include Files */
#include "_coder_AutoL_parsing_info.h"
#include "emlrt.h"
#include "tmwtypes.h"

/* Function Declarations */
static const mxArray *c_emlrtMexFcnResolvedFunctionsI(void);

/* Function Definitions */
/*
 * Arguments    : void
 * Return Type  : const mxArray *
 */
static const mxArray *c_emlrtMexFcnResolvedFunctionsI(void)
{
  const mxArray *nameCaptureInfo;
  const char_T *data[5] = {
      "789ce554414ec240141d0c181323b0d163d8c410e3c605168c02225862003538b6033474"
      "662a9d0a78092fc1c2e3b8f30c2e4d3c80404b4b27994080d4a87fd1"
      "dfd73733efcfffcd0391f38b0800200e9c78db76f28e8b936ede00c1e0f908b72e125c0e"
      "62201ad837e55fdcac52c2509f3980408cbc9d1ac53a818455062602",
      "5d6451e3096913a6a91ba8a263a4cc82e218e1d319ca03636afc2eb791da516c0cba6dcb"
      "afd098055e3f5e05f78d2ed80f59d08f24c7df64efa436c5481a50d2"
      "926aa347ce268d9e2561c80cf820a56d460b8d829e495f3554aaa11622ee3713762d9db4"
      "f671a06e73c5bae31ce6ebf674a0da41ac311a5d17aaccff7ebfa2fe",
      "a650df61c65736d0fae69411ea05f965e614ec9133a8797d4a2c58379ffdf55b933cfc38"
      "6e86a9f759975361ea4de3a7f4fa82f316fdeff6047a498e3f51ca05"
      "a8750ef2d9e74b68e5749c519aa533bf8ed21c9d797500010eebfcffeab3090ef3754f79"
      "93c906b535cf68d7e5b331a1bec3d83a6147607d73ca0af582fc523e",
      "1becd1645261f9c2fb57b83e3becdfee86a9378dbfeeb3f55eedd028f54c5a4dc985eb62"
      "aedcc93f56e5dfefb3df2c7dc6c2",
      ""};
  nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&data[0], 3048U, &nameCaptureInfo);
  return nameCaptureInfo;
}

/*
 * Arguments    : void
 * Return Type  : mxArray *
 */
mxArray *emlrtMexFcnProperties(void)
{
  mxArray *xEntryPoints;
  mxArray *xInputs;
  mxArray *xResult;
  const char_T *propFieldName[9] = {"Version",
                                    "ResolvedFunctions",
                                    "Checksum",
                                    "EntryPoints",
                                    "CoverageInfo",
                                    "IsPolymorphic",
                                    "PropertyList",
                                    "UUID",
                                    "ClassEntryPointIsHandle"};
  const char_T *epFieldName[8] = {
      "Name",     "NumberOfInputs", "NumberOfOutputs", "ConstantInputs",
      "FullPath", "TimeStamp",      "Constructor",     "Visible"};
  xEntryPoints =
      emlrtCreateStructMatrix(1, 1, 8, (const char_T **)&epFieldName[0]);
  xInputs = emlrtCreateLogicalMatrix(1, 2);
  emlrtSetField(xEntryPoints, 0, "Name", emlrtMxCreateString("AutoL_parsing"));
  emlrtSetField(xEntryPoints, 0, "NumberOfInputs",
                emlrtMxCreateDoubleScalar(2.0));
  emlrtSetField(xEntryPoints, 0, "NumberOfOutputs",
                emlrtMxCreateDoubleScalar(2.0));
  emlrtSetField(xEntryPoints, 0, "ConstantInputs", xInputs);
  emlrtSetField(
      xEntryPoints, 0, "FullPath",
      emlrtMxCreateString(
          "/home/yong/YongJun_ws/matlab/AutoL_LiDAR_codegen/AutoL_parsing.m"));
  emlrtSetField(xEntryPoints, 0, "TimeStamp",
                emlrtMxCreateDoubleScalar(739381.64525462966));
  emlrtSetField(xEntryPoints, 0, "Constructor",
                emlrtMxCreateLogicalScalar(false));
  emlrtSetField(xEntryPoints, 0, "Visible", emlrtMxCreateLogicalScalar(true));
  xResult =
      emlrtCreateStructMatrix(1, 1, 9, (const char_T **)&propFieldName[0]);
  emlrtSetField(xResult, 0, "Version",
                emlrtMxCreateString("23.2.0.2515942 (R2023b) Update 7"));
  emlrtSetField(xResult, 0, "ResolvedFunctions",
                (mxArray *)c_emlrtMexFcnResolvedFunctionsI());
  emlrtSetField(xResult, 0, "Checksum",
                emlrtMxCreateString("6tPTLFTibJzpnuy6ckUNKC"));
  emlrtSetField(xResult, 0, "EntryPoints", xEntryPoints);
  return xResult;
}

/*
 * File trailer for _coder_AutoL_parsing_info.c
 *
 * [EOF]
 */
