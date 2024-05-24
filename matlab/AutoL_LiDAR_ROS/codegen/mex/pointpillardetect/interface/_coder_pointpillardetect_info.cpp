//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// _coder_pointpillardetect_info.cpp
//
// Code generation for function 'pointpillardetect'
//

// Include files
#include "_coder_pointpillardetect_info.h"
#include "emlrt.h"
#include "tmwtypes.h"

// Function Declarations
static const mxArray *c_emlrtMexFcnResolvedFunctionsI();

// Function Definitions
static const mxArray *c_emlrtMexFcnResolvedFunctionsI()
{
  const mxArray *nameCaptureInfo;
  const char_T *data[4]{
      "789c6360f4f465646060e0638000093608cd0be50b4069260654802ecf88838601560616"
      "147d30f97e289d9c9f57925a5102e1e425e6a6c275a6e4e766e625e6"
      "95845416a43214a516e7e794a5a68065d2327352433273538391397e205eae1b92149c03"
      "9202b19d335293b3834b73198a328a112ecc41e6c0c32301877f5908",
      "84073a400f0f747523c5be0d64da0733df8b807d30f9e8d058fd8cfcdc54fdd2e2d422fd"
      "a2fc62a3f8f262fde2a264fdc8fcbc74afd23c103737b124273149df"
      "b1b424df27de27d3c531283ec83f58bfa028b5a42831332f35450fa802d5fd0938dcc74f"
      "a4fb71e50f5e060e307d81c53f8d9ef639f6342bd2d33e181828fb2a",
      "7098476cfa13c5619f009a7c6aa68f91876f987146a2b75b7664a099a96190b72f923b02"
      "08d843c81d0c38f8b4361f00f5fe5302",
      ""};
  nameCaptureInfo = nullptr;
  emlrtNameCaptureMxArrayR2016a(&data[0], 1584U, &nameCaptureInfo);
  return nameCaptureInfo;
}

mxArray *emlrtMexFcnProperties()
{
  mxArray *xEntryPoints;
  mxArray *xInputs;
  mxArray *xResult;
  const char_T *propFieldName[9]{"Version",
                                 "ResolvedFunctions",
                                 "Checksum",
                                 "EntryPoints",
                                 "CoverageInfo",
                                 "IsPolymorphic",
                                 "PropertyList",
                                 "UUID",
                                 "ClassEntryPointIsHandle"};
  const char_T *epFieldName[8]{
      "Name",     "NumberOfInputs", "NumberOfOutputs", "ConstantInputs",
      "FullPath", "TimeStamp",      "Constructor",     "Visible"};
  xEntryPoints =
      emlrtCreateStructMatrix(1, 1, 8, (const char_T **)&epFieldName[0]);
  xInputs = emlrtCreateLogicalMatrix(1, 4);
  emlrtSetField(xEntryPoints, 0, "Name",
                emlrtMxCreateString("pointpillardetect"));
  emlrtSetField(xEntryPoints, 0, "NumberOfInputs",
                emlrtMxCreateDoubleScalar(3.0));
  emlrtSetField(xEntryPoints, 0, "NumberOfOutputs",
                emlrtMxCreateDoubleScalar(3.0));
  emlrtSetField(xEntryPoints, 0, "ConstantInputs", xInputs);
  emlrtSetField(xEntryPoints, 0, "FullPath",
                emlrtMxCreateString("/home/user/ros2_ws/src/YongJun_ws/matlab/"
                                    "AutoL_LiDAR_ROS/pointpillardetect.m"));
  emlrtSetField(xEntryPoints, 0, "TimeStamp",
                emlrtMxCreateDoubleScalar(739395.74777777772));
  emlrtSetField(xEntryPoints, 0, "Constructor",
                emlrtMxCreateLogicalScalar(false));
  emlrtSetField(xEntryPoints, 0, "Visible", emlrtMxCreateLogicalScalar(true));
  xResult =
      emlrtCreateStructMatrix(1, 1, 9, (const char_T **)&propFieldName[0]);
  emlrtSetField(xResult, 0, "Version",
                emlrtMxCreateString("24.1.0.2578822 (R2024a) Update 2"));
  emlrtSetField(xResult, 0, "ResolvedFunctions",
                (mxArray *)c_emlrtMexFcnResolvedFunctionsI());
  emlrtSetField(xResult, 0, "Checksum",
                emlrtMxCreateString("eiL2HMV3haKFkYQ651RKM"));
  emlrtSetField(xResult, 0, "EntryPoints", xEntryPoints);
  return xResult;
}

// End of code generation (_coder_pointpillardetect_info.cpp)
