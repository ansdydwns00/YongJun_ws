/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_AutoL_parsing_Intensity_info.c
 *
 * MATLAB Coder version            : 23.2
 * C/C++ source code generated on  : 20-May-2024 11:17:09
 */

/* Include Files */
#include "_coder_AutoL_parsing_Intensity_info.h"
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
      "789cdd54314fc240143e0c18074506e3ece26a13647071408a510445202462483dda031a"
      "7a774d7b4570f21ff8271c1c8d937fc9d17f208596d22697126a6af0"
      "0d7d7dfdeeeefbeebde60389cb4a020090064e6ccfd28e53669cbc01fc11c413817509ff"
      "72900249df3e177f71b24c094323362b08c468be53a1582590b0c658",
      "47c04026d5864899225d55430d15a3fa62716d57f87c019a173664bf17fa481ed42d0c8c"
      "bee929d4168b793fde39f74d2ed98f0aa71f99007e5f6c0b7d8a9130"
      "a6a427dc4d1e258b488fa68021d36047c85b8c96a5b22ae66b924c15d443c4f9a643c354"
      "494fba9c3490982a1b1fe105fd7a44fde9401dd43fe781f200316932",
      "4203caccfbfe10917f93cb3f43ecab6bc8e37b8bc82772f9fcf82af3f2f7683aa6d03eed"
      "2ea93b98bdf55bd3fcfa75da8d93efbb55c8c5c9e7c65ff18d38e72d"
      "fbdfed73f83201fcac7e5b86ca207b557cba816649c562bd5bbdf074544378c274004e1d"
      "d7f9ebeeb7cf11f51f84e877719d15346a29ae99484324336a78a27e",
      "cb7f535c3d33c452093b01defd3f23f235b97c7e7c25ff0de9993dc8b8fca3fd518ad58f"
      "b37be2619c7c6efc773f1e14f4664b948fad6caea6346ab52229758c"
      "e2fafbf10f3e3bdb37",
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
                emlrtMxCreateString("AutoL_parsing_Intensity"));
  emlrtSetField(xEntryPoints, 0, "NumberOfInputs",
                emlrtMxCreateDoubleScalar(2.0));
  emlrtSetField(xEntryPoints, 0, "NumberOfOutputs",
                emlrtMxCreateDoubleScalar(3.0));
  emlrtSetField(xEntryPoints, 0, "ConstantInputs", xInputs);
  emlrtSetField(
      xEntryPoints, 0, "FullPath",
      emlrtMxCreateString("/home/yong/YongJun_ws/matlab/AutoL_LiDAR_codegen/"
                          "AutoL_parsing_Intensity.m"));
  emlrtSetField(xEntryPoints, 0, "TimeStamp",
                emlrtMxCreateDoubleScalar(739392.4696180555));
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
                emlrtMxCreateString("Hf1Hb6uMZAxNi0S8Rhyw4B"));
  emlrtSetField(xResult, 0, "EntryPoints", xEntryPoints);
  return xResult;
}

/*
 * File trailer for _coder_AutoL_parsing_Intensity_info.c
 *
 * [EOF]
 */
