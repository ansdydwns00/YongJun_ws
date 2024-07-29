/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_G32_parsing_info.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 29-Jul-2024 12:55:51
 */

/* Include Files */
#include "_coder_G32_parsing_info.h"
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
      "789c6360f4f465646060e06380800fdc109a17ca1780d24c0ca8005d9e114d1d23aa7206"
      "560616147d30f97e289d9c9f57925a5102e1e425e6a6c275a6e4e766"
      "e625e695845416a43214a516e7e794a5a68065d2327352433273538391397e205eae1b92"
      "149c039202b19d335293b3834b73198a328a112ecc41e6c0c363050e",
      "ffb210191e1e38c243004d3eda35563f233f37553f31b34c3f323f2fddab342fbebc583f"
      "37b124273109c1d2772c2dc9f789f7c974710c82b0f5dd8d8de20b12"
      "8b8a33f3d2f57261eeaea0d0dd4204dc0d9387589e9c9d5a120f8cbea2c4646814c2dc91"
      "40a13bd870ba032203f2754e2ac2be0d14dae78fd33e54798ae30b39",
      "c8f4720986173f91ee47a711ea39c0f42ba6e569209a5ef6edde9969424ffb6060a0eca3"
      "34df89e1b04f004dded720d2ddd33230bcdc3fa2b0cc323429d1383d"
      "cacf19e18e0002f6107207030e3ebdcc1fa9e5ae300177c3e4c1969738e7e497a6a014bc"
      "d42a775971ba0322539a995762c140bd7237008dcf80a60e264f697c",
      "a1061922de1270b88f5ae5c4173a97bbeb232789d3d33e1818eee56e529457864bb18f49"
      "496e5180ab798eaf47b077a5a7fbd02f77014009d197",
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
  emlrtSetField(xEntryPoints, 0, "Name", emlrtMxCreateString("G32_parsing"));
  emlrtSetField(xEntryPoints, 0, "NumberOfInputs",
                emlrtMxCreateDoubleScalar(2.0));
  emlrtSetField(xEntryPoints, 0, "NumberOfOutputs",
                emlrtMxCreateDoubleScalar(3.0));
  emlrtSetField(xEntryPoints, 0, "ConstantInputs", xInputs);
  emlrtSetField(xEntryPoints, 0, "FullPath",
                emlrtMxCreateString("/home/aiv/YongJun_ws/matlab_ws/matlab/"
                                    "AutoL_LiDAR/AutoL/G32_parsing.m"));
  emlrtSetField(xEntryPoints, 0, "TimeStamp",
                emlrtMxCreateDoubleScalar(739462.49167824071));
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
                emlrtMxCreateString("Ot9aFbrPoWo2n9DkZ9gNgG"));
  emlrtSetField(xResult, 0, "EntryPoints", xEntryPoints);
  return xResult;
}

/*
 * File trailer for _coder_G32_parsing_info.c
 *
 * [EOF]
 */
