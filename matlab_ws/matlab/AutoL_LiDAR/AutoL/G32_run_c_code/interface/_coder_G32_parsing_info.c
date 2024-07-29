/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_G32_parsing_info.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 29-Jul-2024 11:53:30
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
      "789ce554cb4ec240149d1a342e7c104df42fac111375492a224a1105a3684c2dedd03676"
      "a6da4e11bec2c49f70e9dab861e9b7b8f603b494a18f64522358a3de"
      "cd9dcb99e9b9e7de700057123900c01cf0a33ae3e7d9419d1de409108d38cec5ee71d1eb"
      "60126422ef287e37c88a8509ec10bfc03282c397aa850c2c6352ef5e",
      "436043c732db50ed232dc3847503c15ab8a87815da0941c3c283bcb3a043e5aae62260eb"
      "4ed0a1192e86f3e831f4663e398f4bc63cb231fcbc70c1eb1682bc6c"
      "b4f98685b53d174bb70e8f6462cacde0c4e75d6295a5b2b19d3f0a9f25212f4a82a5420d"
      "62ff77be985b93ae65db31b0b682a89ece887a1612f450dc2757ae20",
      "913ed66acbca60b5b40faafbab7d4c31fbf0114fb50903be9711f934265f14ffb63d8647"
      "b98212e738ff495df11cdc9feee7d789879697d3e27b7e32d6d3e4a3"
      "f1537ca3fe1f97187cd9182eae368aa5adc393db83d39bf6d67153ce69671521e4fb093c"
      "497d00469dd6f77b8cf7ffd5a71713f450bc4f4e04d372d588518fcb",
      "a727997df8886b60b209c6e7d33a932f8a7fd71ea3a30cf679c9e87b5cbef296b24f3f36"
      "ee97d3e4a3f1d77dba79b6a76f3be57582ec6a61c314776bfbdd52f1"
      "f7fbf43b74b2f324",
      ""};
  nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&data[0], 3176U, &nameCaptureInfo);
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
  emlrtSetField(
      xEntryPoints, 0, "FullPath",
      emlrtMxCreateString("/home/aiv/YongJun_ws/matlab_ws/matlab/AutoL_LiDAR/"
                          "AutoL_LiDAR_CAM_Codegen/AutoL/G32_parsing.m"));
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
