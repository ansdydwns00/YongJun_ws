/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_AutoL_parsing_info.c
 *
 * MATLAB Coder version            : 23.2
 * C/C++ source code generated on  : 06-May-2024 17:18:15
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
      "789ced54db4ec24010dd1a302646e0c58f5013fba0115e0982e2051588680cc1da2eb4d0"
      "dd2ded56e12bf42ffc4d2dbdee262b2460132ffbd0e9e999dd733ad3"
      "0e90ea9712002007fc656dfa712bc08520ae0176f1bcc4e5496c3ac8820cb32fe45f83a8"
      "124ce184fa002b08463b35820cac60da9e5a10d8d021e633d4664cdf",
      "3061db40b095040d0fa15a828a804779f7151daaa3968b80ad3bb1433309a27abc09de37"
      "b3603d7604f52870fc43b52beb0441794af040bef72e9452e850b9ec"
      "5272d1b314db31f0601f71feac25fde538ccfb8b7414750469efb345b6a2d2f8f9e392fa"
      "eb427d9fd188fb64c2d5f56357a8c7f2e27eb095081b32af1ef905fd",
      "f131cedf98c5f7db523f4dbd70fd15bd89e0bc45bfaf6d815e81e39b9562a988887d783e"
      "3ebeaad547c361fb544ff8b89ea333cf0710e0b4ceffed7333cf61de"
      "5fc85bb46212578b06e7aae66656a8ef33ae816909acae1f7b423d96ff626eb295083a92"
      "d67fdeedfccfcdefd44b6b6e3a671aadded4c7cda397866e9fdc4d0f",
      "ca9d1af8f973f3031491996e", ""};
  nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&data[0], 2952U, &nameCaptureInfo);
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
  xInputs = emlrtCreateLogicalMatrix(1, 1);
  emlrtSetField(xEntryPoints, 0, "Name", emlrtMxCreateString("AutoL_parsing"));
  emlrtSetField(xEntryPoints, 0, "NumberOfInputs",
                emlrtMxCreateDoubleScalar(1.0));
  emlrtSetField(xEntryPoints, 0, "NumberOfOutputs",
                emlrtMxCreateDoubleScalar(2.0));
  emlrtSetField(xEntryPoints, 0, "ConstantInputs", xInputs);
  emlrtSetField(xEntryPoints, 0, "FullPath",
                emlrtMxCreateString("/home/yong/Yong/tttest/AutoL_parsing.m"));
  emlrtSetField(xEntryPoints, 0, "TimeStamp",
                emlrtMxCreateDoubleScalar(739378.71814814815));
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
                emlrtMxCreateString("gzOF7WtC3byZLVPRnViNWG"));
  emlrtSetField(xResult, 0, "EntryPoints", xEntryPoints);
  return xResult;
}

/*
 * File trailer for _coder_AutoL_parsing_info.c
 *
 * [EOF]
 */
