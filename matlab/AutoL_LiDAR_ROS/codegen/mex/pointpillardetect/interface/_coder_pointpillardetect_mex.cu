//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// _coder_pointpillardetect_mex.cu
//
// Code generation for function '_coder_pointpillardetect_mex'
//

// Include files
#include "_coder_pointpillardetect_mex.h"
#include "_coder_pointpillardetect_api.h"
#include "pointpillardetect_data.h"
#include "pointpillardetect_initialize.h"
#include "pointpillardetect_terminate.h"
#include "pointpillardetect_types.h"
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
  pointpillardetectStackData *c_pointpillardetectStackDataGlo{nullptr};
  c_pointpillardetectStackDataGlo =
      static_cast<pointpillardetectStackData *>(new pointpillardetectStackData);
  mexAtExit(&pointpillardetect_atexit);
  // Module initialization.
  pointpillardetect_initialize();
  try { // Dispatch the entry-point.
    unsafe_pointpillardetect_mexFunction(c_pointpillardetectStackDataGlo, nlhs,
                                         plhs, nrhs, prhs);
    // Module termination.
    pointpillardetect_terminate();
  } catch (...) {
    emlrtCleanupOnException((emlrtCTX *)emlrtRootTLSGlobal);
    throw;
  }
  delete c_pointpillardetectStackDataGlo;
}

emlrtCTX mexFunctionCreateRootTLS()
{
  emlrtCreateRootTLSR2022a(&emlrtRootTLSGlobal, &emlrtContextGlobal, nullptr, 1,
                           (void *)&emlrtExceptionBridge, "UTF-8", true);
  return emlrtRootTLSGlobal;
}

void unsafe_pointpillardetect_mexFunction(pointpillardetectStackData *SD,
                                          int32_T nlhs, mxArray *plhs[3],
                                          int32_T nrhs, const mxArray *prhs[4])
{
  const mxArray *outputs[3];
  int32_T b;
  // Check for proper number of arguments.
  if (nrhs < 4) {
    emlrtErrMsgIdAndTxt(emlrtRootTLSGlobal,
                        "EMLRT:runTime:TooFewInputsConstants", 9, 4, 17,
                        "pointpillardetect", 4, 17, "pointpillardetect", 4, 17,
                        "pointpillardetect");
  }
  if (nrhs != 4) {
    emlrtErrMsgIdAndTxt(emlrtRootTLSGlobal, "EMLRT:runTime:WrongNumberOfInputs",
                        5, 12, 4, 4, 17, "pointpillardetect");
  }
  if (nlhs > 3) {
    emlrtErrMsgIdAndTxt(emlrtRootTLSGlobal,
                        "EMLRT:runTime:TooManyOutputArguments", 3, 4, 17,
                        "pointpillardetect");
  }
  // Call the function.
  b_pointpillardetect_api(SD, prhs, nlhs, outputs);
  // Copy over outputs to the caller.
  if (nlhs < 1) {
    b = 1;
  } else {
    b = nlhs;
  }
  emlrtReturnArrays(b, &plhs[0], &outputs[0]);
}

// End of code generation (_coder_pointpillardetect_mex.cu)
