/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_AutoL_parsing_info.c
 *
 * MATLAB Coder version            : 23.2
 * C/C++ source code generated on  : 16-May-2024 15:16:24
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
      "789cdd54cb4ec240141d0c181323b2d2bfb0893111172eb0c5070f05c1851a53c776681b"
      "3a334d3b45f003dcf2016e59b8f493dcbaf40b1468a1b471020152a3"
      "77d1dbdb3333e7ccbdcd0189b372020090065ebcaf7b79c3af337e5e01e188e289c8ba44"
      "783948816468df08effa59a184a136f30a02311aef5429360824acde",
      "b110b09143cd16528748c33051ddc0a836599c0f2a7c3c018d8b0134781775a4346b2e06"
      "b6ee040acdc962dc8f57ce7d9333f643e4f42313c16ff377824e3112"
      "3a9468c275ff517089fce8081832133e083997d1925c32a4dca5ac50156988f8df2c683b"
      "06d1767048b7b5a0ee74a48eea1ef340a58998dc1f9d0d15167cbf5f",
      "907f95cbef21832b9b68797392b87c617c9e39857be40d6a5a9f3667d41dcdc1fab561ee"
      "7d1c36e2e4fbbc11f7e2e41bc56ff1b539e7cdfadf6d71f83211fca8"
      "562d41b5b95bcc3f5d40a76060a9d6a89c063a2a5378a6e9009c3aaef3ffaacfc6357f8b"
      "892675d59189c82da4306a2fcf6f535c1d1ee21a846541c0f7b6205f",
      "89cb17c6e7f2db1f7b15afef3ef7f2b1faeecb57773b4ebe51fc77dfb5ac2b432a4afa49"
      "b9aa28596dffc061d8fe07befb0d90b4cd0f",
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
                emlrtMxCreateString("wXDY9Gn620aakWvFmz2BiE"));
  emlrtSetField(xResult, 0, "EntryPoints", xEntryPoints);
  return xResult;
}

/*
 * File trailer for _coder_AutoL_parsing_info.c
 *
 * [EOF]
 */
