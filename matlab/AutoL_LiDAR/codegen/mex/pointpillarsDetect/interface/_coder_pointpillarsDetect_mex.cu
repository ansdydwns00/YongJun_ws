//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// _coder_pointpillarsDetect_mex.cu
//
// Code generation for function '_coder_pointpillarsDetect_mex'
//

// Include files
#include "_coder_pointpillarsDetect_mex.h"
#include "_coder_pointpillarsDetect_api.h"
#include "pointpillarsDetect_data.h"
#include "pointpillarsDetect_initialize.h"
#include "pointpillarsDetect_terminate.h"
#include "pointpillarsDetect_types.h"
#include "rt_nonfinite.h"
#include <stdexcept>

void emlrtExceptionBridge();
void emlrtExceptionBridge()
{
  throw std::runtime_error("");
}
// Function Definitions
void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs,
                 const mxArray *prhs[])
{
  pointpillarsDetectStackData *c_pointpillarsDetectStackDataGl{nullptr};
  c_pointpillarsDetectStackDataGl = static_cast<pointpillarsDetectStackData *>(
      new pointpillarsDetectStackData);
  mexAtExit(&pointpillarsDetect_atexit);
  // Module initialization.
  pointpillarsDetect_initialize();
  try { // Dispatch the entry-point.
    unsafe_pointpillarsDetect_mexFunction(c_pointpillarsDetectStackDataGl, nlhs,
                                          plhs, nrhs, prhs);
    // Module termination.
    pointpillarsDetect_terminate();
  } catch (...) {
    emlrtCleanupOnException((emlrtCTX *)emlrtRootTLSGlobal);
    throw;
  }
  delete c_pointpillarsDetectStackDataGl;
}

emlrtCTX mexFunctionCreateRootTLS()
{
  emlrtCreateRootTLSR2022a(&emlrtRootTLSGlobal, &emlrtContextGlobal, nullptr, 1,
                           (void *)&emlrtExceptionBridge, "UTF-8", true);
  return emlrtRootTLSGlobal;
}

void unsafe_pointpillarsDetect_mexFunction(pointpillarsDetectStackData *SD,
                                           int32_T nlhs, mxArray *plhs[3],
                                           int32_T nrhs, const mxArray *prhs[4])
{
  const mxArray *outputs[3];
  int32_T b;
  // Check for proper number of arguments.
  if (nrhs < 4) {
    emlrtErrMsgIdAndTxt(emlrtRootTLSGlobal,
                        "EMLRT:runTime:TooFewInputsConstants", 9, 4, 18,
                        "pointpillarsDetect", 4, 18, "pointpillarsDetect", 4,
                        18, "pointpillarsDetect");
  }
  if (nrhs != 4) {
    emlrtErrMsgIdAndTxt(emlrtRootTLSGlobal, "EMLRT:runTime:WrongNumberOfInputs",
                        5, 12, 4, 4, 18, "pointpillarsDetect");
  }
  if (nlhs > 3) {
    emlrtErrMsgIdAndTxt(emlrtRootTLSGlobal,
                        "EMLRT:runTime:TooManyOutputArguments", 3, 4, 18,
                        "pointpillarsDetect");
  }
  // Call the function.
  b_pointpillarsDetect_api(SD, prhs, nlhs, outputs);
  // Copy over outputs to the caller.
  if (nlhs < 1) {
    b = 1;
  } else {
    b = nlhs;
  }
  emlrtReturnArrays(b, &plhs[0], &outputs[0]);
}

// End of code generation (_coder_pointpillarsDetect_mex.cu)
