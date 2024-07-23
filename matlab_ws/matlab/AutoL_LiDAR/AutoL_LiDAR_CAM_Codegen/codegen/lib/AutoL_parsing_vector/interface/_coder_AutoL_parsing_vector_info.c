/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_AutoL_parsing_vector_info.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 28-May-2024 15:54:00
 */

/* Include Files */
#include "_coder_AutoL_parsing_vector_info.h"
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
      "789ced54dd4ec230182d068c898a5cf902265ebac418c32d0c50913f012f8831b36e059a"
      "ad2d6e1d2217be82894fe1a58fe623c8d8d8d86203018221a137df4e"
      "4fdb73fa7ddd076237e518002009dcf1b3efc6430fa7bcb803c223cac722eb62e1e52001"
      "e2a17d13fec38b2aa31c0db80b2824c8dfa9318229a4bcf9d643c044",
      "1633fa481b336d6ca02626a8310d2a0e228529ca070ee57ccb5da4ea0d9b00b36b050e8d"
      "69e0e7e35b70dff89cf9280bf2918af00ff947a9cb089220ee4b2d46"
      "3b459b2aaf96442037e0b394b1392b29259ccbd41539535664a6a10ea2de7c0f9a16a61d"
      "a58f54cecc3332e5bfb7a4ff640447fdfb3a50d51157462534a1ca83",
      "f9a725f57785fa2ee3dcdb4081ded7927a5742bd30bf60bdc2691a556a569e8ee6f41d8d"
      "c1fabd717c3f68b69db82ebdcf93ece93af526e3bff40682f3e67d77"
      "c702bd5484cf36ee4a50d3cf6ff3c32ab48a98e41aedda75e0a3364367960f20c0eb3a7f"
      "d3fbedbade418fcb06b3b54927f1acacaeef26843e5cc6c694a7c1ea",
      "ea5615ea85f945fbee9fe9daf6df6dfff5e2bcff5d5bb7b26ae522adddbf5c0e8675daca"
      "32d2296c7efffd05ca9ed286",
      ""};
  nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&data[0], 3080U, &nameCaptureInfo);
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
                emlrtMxCreateString("AutoL_parsing_vector"));
  emlrtSetField(xEntryPoints, 0, "NumberOfInputs",
                emlrtMxCreateDoubleScalar(2.0));
  emlrtSetField(xEntryPoints, 0, "NumberOfOutputs",
                emlrtMxCreateDoubleScalar(2.0));
  emlrtSetField(xEntryPoints, 0, "ConstantInputs", xInputs);
  emlrtSetField(
      xEntryPoints, 0, "FullPath",
      emlrtMxCreateString("/home/aiv/YongJun_ws/matlab/AutoL_LiDAR_CAM_Codegen/"
                          "AutoL_parsing_vector.m"));
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
 * File trailer for _coder_AutoL_parsing_vector_info.c
 *
 * [EOF]
 */
