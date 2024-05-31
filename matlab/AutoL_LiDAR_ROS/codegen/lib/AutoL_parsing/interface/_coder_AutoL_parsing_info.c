/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_AutoL_parsing_info.c
 *
 * MATLAB Coder version            : 23.2
 * C/C++ source code generated on  : 20-May-2024 11:17:54
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
      "789cdd54cb4ec240141d0c181323b2f2135cdac410c3c605cf2822f27281c4d4b19d42d3"
      "ce4c6da708fc846bf72edc9818bfc8ad4bff40a094d2c60904480dde"
      "456f6fcfcc9c33f7360744ce2f2300803870e273d7c97b933a31c95bc01f413c125817f1"
      "2f073110f5ed73f1a749962861a8c79c82408ca63b658a5502096bf4",
      "0d044c6451bd8be431a2a83a6aa818d5678bf2a8c28519685a8ca0d17bb68324ad6e6360"
      "762c4fa13e5b4cfbf1cab96f74c17e6439fd4804f056fe56e8508c84"
      "3e256da1397c146d223e5a02864c87f742da66b42496d45cba264a54466d4426df0c685a"
      "2a691f619f6e6345ddf1401dd43de581928698381c9d0925e67dbf5b",
      "917f9bcbef20a32beb687d73ca71f9fcf83273f2f7c819d4bc3eed2fa83b98bdf53be3fc"
      "f275aa84c9f77d934d86c9e7c65ff1f538e72dfadf1d70f812013c53"
      "af96a0ac1d5fe40757d02aaa3857572a679e8eca1c9e793a00a70eebfc4df5d9b0e66fb0"
      "ac4e6dd93511b18b2446cdf5f96d8cabc3416c95b014f0f8de57e42b",
      "71f9fcf8527efb6bafc2f5ddea473154df7d6ebd1d86c9e7c67ff75d45b33252399992af"
      "1f4e7a831a6966286e1736df777f005b32ccac",
      ""};
  nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&data[0], 3064U, &nameCaptureInfo);
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
                emlrtMxCreateDoubleScalar(739388.63540509262));
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
                emlrtMxCreateString("MSel4MjOiol5VezHopdJdF"));
  emlrtSetField(xResult, 0, "EntryPoints", xEntryPoints);
  return xResult;
}

/*
 * File trailer for _coder_AutoL_parsing_info.c
 *
 * [EOF]
 */
