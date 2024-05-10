/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_AutoL_parsing_info.c
 *
 * MATLAB Coder version            : 23.2
 * C/C++ source code generated on  : 09-May-2024 15:08:27
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
      "789ce554d14ec230142d068c890a3cf9e047384d54343ee1060405a302216a0ccead8ce1"
      "da2e5b27e04ff8e637f8e647e8934f7e928c8dc19a341020336a1f76"
      "777ada9ed37bb70b62c5720c009004def85af5e2ba8fd37e5c02e1c1f231665d2cbc1c24"
      "403cb46fc83ffb512198c22ef50096110c76aa04e958c6b4da3321b0",
      "a04d8c47a80e98a66ec0aa8e60651c9cb908e5c7a800b894fb2eb6a0f2507110b05af6c8"
      "a1310e827cbc72ee1b9f321f22271f6986bfc9dd0a2d82a0d0235813"
      "aefa8f1307373ab680646ac8f742d6a1a4d428e952f6b2a110156a10fb73a66cd93ad6b6"
      "50c8b739a7ef248359df818eac3c40dae897ce92153a9abf9b537f99",
      "abef31ee950db8b83a495cbd303f4b9dc239f20a35294fa9297db371b47e6510df778f9a"
      "51eaa9f5b78328f586e3a7f4ba9cf3a6fdee36387a69867f2ac892a8"
      "9550b193c968fa4ea14c9a35313ff2713e4167920fc0c1519dff5ffb6c8ac1acef216f52"
      "d1208e1a34da45f5d90457df631c1d53f7875e549d725cbd303f539f",
      "0de76850a9a8fac2da5eb47df6e3e573334abde1f8eb7df634bfddb9968aed0aacd5db7a"
      "eff062bf6de78e7f7f9ffd066a74c4c7",
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
                emlrtMxCreateDoubleScalar(739381.6306828704));
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
                emlrtMxCreateString("EEDS5RNGc6m3Isbwp0hu2E"));
  emlrtSetField(xResult, 0, "EntryPoints", xEntryPoints);
  return xResult;
}

/*
 * File trailer for _coder_AutoL_parsing_info.c
 *
 * [EOF]
 */
