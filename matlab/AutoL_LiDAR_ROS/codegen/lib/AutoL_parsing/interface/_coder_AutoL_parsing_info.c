/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_AutoL_parsing_info.c
 *
 * MATLAB Coder version            : 23.2
 * C/C++ source code generated on  : 07-May-2024 13:08:27
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
      "789ced54d14ec23014ed0c181323f0e26fb8078df04a0628a8a8404463c81c5b6183b585"
      "ad13f80a3f433fc74f12d8186b930602b8c4601f767776da9db37b97"
      "03a4f29d040048017f7d1ffbf524c099a01e0076f1bcc4ed93d8ed200912ccb905ff1154"
      "9d600ac7d4075843303c691064610dd3c6640081035d62bf4363ce74",
      "2c1b362c04eb51509d21548a50219851b37bc5847abfee21e098eed2a11d05613fbe04df"
      "9b58b31f8aa01f198e7f2db6649320284f08eeca2fd34bc5c3eac895"
      "91466dad2de73d4a6ed55bab90afa93a316017e2e0d940735c0b77cf10e37bb0a5ef1487"
      "79dfa18ea6f72155a7a373349d2e9fbf6da97f28d4f71983786d1bee",
      "6e4e05a11ecb6f3227b647fea056f529bda66fbe2ef71fcdebe753ae13a7de62ed8bde58"
      "f0be75ffbb53815e86e36b4a369745c4b9b81916ee4be57eafd7b836"
      "233e1e56e8acf2010438aef7ef6bcea639ccfb5ef003aad8c433c2a0dd55ce2685fa3ee3"
      "5998e6c0eee65414eab1fc4639cbf6683ea9b872a1d5fccfd9dfd48b",
      "2b67dd8a418b8fe561ed7254359dabe7c979be59027f3f677f009a30c0c6", ""};
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
                emlrtMxCreateDoubleScalar(739379.5469907407));
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
