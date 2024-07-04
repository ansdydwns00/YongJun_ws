/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_AutoL_parsing_vector_arm_info.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 28-May-2024 16:56:56
 */

/* Include Files */
#include "_coder_AutoL_parsing_vector_arm_info.h"
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
      "789ced544d4fc23018ee0c180f889cfc03261e5d628ce1ca06a8c8f7f0408c99752b6361"
      "6d71eb1039f8174cfc151e3dfaf3643036b6d840c06034f4f2ece9d3"
      "f679dfb7dd0b84ab8a000048037fa4a6b0efd38c8f3b203ae2ba105b27449783244844f6"
      "cdf4571f354a181ab2292110a360a74eb1492061ade73e023672a835",
      "40fa44e998166a991829f3a4ea315c9c9302e249deb7dc455a4f7131b0bb4e18a1354f82"
      "7a7c72f24d2c598f06a71e99987e5bb813bb1423119a03b14d895172"
      "89fae48818320b3e883997d1b25a36f3b9a62ae72aaa4c756420e2cff7a1ed98c4500748"
      "63d456a18d4f702c8ffe9a79a4633c9e47e003b51e62eaf82a6da8b1",
      "70fe7e4dff5daeff54f1f2b750e8f7bea6df05d72faaaf786fd1328d6f6b519d0e968c3b"
      "8ee1fabd09bea45a1d0f37e5f776241d6fd26f367ecb6fc8396fd977"
      "77c8f1cbc474496994a1de3bbd2e8c6ad0299938af74ea97611cf5053e8be2001cbea9f3"
      "ff4bdfddd47be833d9a2ae3eeb287e483fd77f93dc38a68a6b129605",
      "a1dfc79a7e35ae5f545fb5ff7e5bae6d1fdef6611f97fdef3a3d47d2aa6759fde6f17c38"
      "6a92b644b151fcfb7df80bce26d4f5",
      ""};
  nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&data[0], 3096U, &nameCaptureInfo);
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
  emlrtSetField(xEntryPoints, 0, "Name",
                emlrtMxCreateString("AutoL_parsing_vector_arm"));
  emlrtSetField(xEntryPoints, 0, "NumberOfInputs",
                emlrtMxCreateDoubleScalar(2.0));
  emlrtSetField(xEntryPoints, 0, "NumberOfOutputs",
                emlrtMxCreateDoubleScalar(2.0));
  emlrtSetField(xEntryPoints, 0, "ConstantInputs", xInputs);
  emlrtSetField(
      xEntryPoints, 0, "FullPath",
      emlrtMxCreateString("/home/aiv/YongJun_ws/matlab/AutoL_LiDAR_CAM_Codegen/"
                          "AutoL_parsing_vector_arm.m"));
  emlrtSetField(xEntryPoints, 0, "TimeStamp",
                emlrtMxCreateDoubleScalar(739400.63553240744));
  emlrtSetField(xEntryPoints, 0, "Constructor",
                emlrtMxCreateLogicalScalar(false));
  emlrtSetField(xEntryPoints, 0, "Visible", emlrtMxCreateLogicalScalar(true));
  xResult =
      emlrtCreateStructMatrix(1, 1, 9, (const char_T **)&propFieldName[0]);
  emlrtSetField(xResult, 0, "Version",
                emlrtMxCreateString("24.1.0.2603908 (R2024a) Update 3"));
  emlrtSetField(xResult, 0, "ResolvedFunctions",
                (mxArray *)c_emlrtMexFcnResolvedFunctionsI());
  emlrtSetField(xResult, 0, "Checksum",
                emlrtMxCreateString("MSel4MjOiol5VezHopdJdF"));
  emlrtSetField(xResult, 0, "EntryPoints", xEntryPoints);
  return xResult;
}

/*
 * File trailer for _coder_AutoL_parsing_vector_arm_info.c
 *
 * [EOF]
 */
