/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_AutoL_parsing_info.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 28-May-2024 16:51:43
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
      "789ced54dd4ec230142e068c890a5cf902265eb2c418e32d0c50f9131c31a031b36e0516"
      "d676b20ed00b5fc1c4a7f0717c2419838d3569204030fe9c9bb3af5f"
      "dbefeb39cb0191cb72040010075e7cee7a797f829393bc05c2c1f3116e5f24bc1dc44034"
      "746ecabf4db246094343e6010231f24fea141b0412567fb610e8219b",
      "9a7da48f999661a2ba8191320b2a2ec2f919ca072ee57ecb1da4751507835ec70e1c9ab3"
      "c0afc787e0bdd105eb9117d423c9f177b97ba9433192a0d1979a94b4"
      "0b0e5107b6842133e1a39476182da925239bbe56e5745995a98eda884cd62dd8b30dd24e"
      "e1c0b7b5a2ef388779dfbe0ed4ba88a9a3d6f5a0c682f58715f5b785",
      "fa1ee3bed744ebebd3b9502fcc2fd9a77099468d9a57a7c482bef91cecdf19e7d7bd7acb"
      "cd9bd27b3fcc1c6d526f1adfa53714dcb7e87f7720d04b727c46a995"
      "a0de3d2ee65eaea05d30705669552f021fd5393af37c0001ded4fd7f75ce2638ccfb9ef2"
      "16934deae8fea05dd79c8d09f53dc631083b03ebebd385502fcc2f3b",
      "67c3654ae1ff39bb1ebd69fcf6397b3b689e9ad581451b2772e9a652a8758b4f0df9e7cf"
      "d92f555fc5fb",
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
  emlrtSetField(xEntryPoints, 0, "FullPath",
                emlrtMxCreateString("/home/aiv/YongJun_ws/matlab/"
                                    "AutoL_LiDAR_CAM_Codegen/AutoL_parsing.m"));
  emlrtSetField(xEntryPoints, 0, "TimeStamp",
                emlrtMxCreateDoubleScalar(739400.63528935181));
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
 * File trailer for _coder_AutoL_parsing_info.c
 *
 * [EOF]
 */
