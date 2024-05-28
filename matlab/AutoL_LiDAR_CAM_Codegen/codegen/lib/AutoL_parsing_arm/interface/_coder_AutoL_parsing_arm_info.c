/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_AutoL_parsing_arm_info.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 28-May-2024 17:15:30
 */

/* Include Files */
#include "_coder_AutoL_parsing_arm_info.h"
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
      "789ced54dd4ec230182d068c890a5cf902265eb2c418e32d4c14c78f20c480c6ccca0a2c"
      "aceddc3a402f7c05139fc24b1fc9479131d85893060204e34f6fbe9d"
      "9eb6e7f4eb7240e4a2180100c481373eb7bdba3bc6c971dd00e1c1f3116e5d24bc1cc440"
      "34b46fc2bf8e6b93128606cc030462e4efd428d60924acf664226021",
      "9b1a3da48d98966ea09a8e51751a945c84cfa6281fb894fb2d7750b35b7530b03a76e0d0"
      "98067e3f3e04f78dced90f45d08f24c7df66efa40ec548827a4f6a50"
      "d2561ca2f66d094366c00729ed305a500bfa69fa4a95d34555a61a6a23329e37a165eba4"
      "ad420ba770d8bfb9a4ff388779ffbe0e6c761153874f68c1260be6ef",
      "97d4df14ea7b8c7b6f03057aef4bea9d0bf5c2fc82ef156ed3f0b166f52931a76fbe06eb"
      "b746f565a7d672ebbaf4def63307ebd49b8cefd21b08ce9bf7bfdb13"
      "e825393e53ad14a0d63dcc679f2fa1ade8f8b4da2ae7021fe5193ab37c00015ed7f97f3d"
      "6f131ce6fd4f7893c90675343f705795b731a1bec7383a6127607579",
      "9b13ea85f945f336dca614fecfdbd5e84dc66fcfdb9b7ee3d828f74d5a3f920bd725a5d2"
      "cd3fd6e59f9fb75fc12fc969",
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
  emlrtSetField(xEntryPoints, 0, "Name",
                emlrtMxCreateString("AutoL_parsing_arm"));
  emlrtSetField(xEntryPoints, 0, "NumberOfInputs",
                emlrtMxCreateDoubleScalar(2.0));
  emlrtSetField(xEntryPoints, 0, "NumberOfOutputs",
                emlrtMxCreateDoubleScalar(2.0));
  emlrtSetField(xEntryPoints, 0, "ConstantInputs", xInputs);
  emlrtSetField(
      xEntryPoints, 0, "FullPath",
      emlrtMxCreateString("/home/aiv/YongJun_ws/matlab/AutoL_LiDAR_CAM_Codegen/"
                          "AutoL_parsing_arm.m"));
  emlrtSetField(xEntryPoints, 0, "TimeStamp",
                emlrtMxCreateDoubleScalar(739400.710462963));
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
                emlrtMxCreateString("6tPTLFTibJzpnuy6ckUNKC"));
  emlrtSetField(xResult, 0, "EntryPoints", xEntryPoints);
  return xResult;
}

/*
 * File trailer for _coder_AutoL_parsing_arm_info.c
 *
 * [EOF]
 */
