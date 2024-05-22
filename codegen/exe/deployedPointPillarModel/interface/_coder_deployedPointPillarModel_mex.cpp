//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: _coder_deployedPointPillarModel_mex.cpp
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "_coder_deployedPointPillarModel_mex.h"
#include "_coder_deployedPointPillarModel_api.h"

// Function Definitions
//
// Arguments    : int32_T nlhs
//                mxArray *plhs[]
//                int32_T nrhs
//                const mxArray *prhs[]
// Return Type  : void
//
void mexFunction(int32_T nlhs, mxArray *[], int32_T nrhs, const mxArray *[])
{
  mexAtExit(&deployedPointPillarModel_atexit);
  // Module initialization.
  deployedPointPillarModel_initialize();
  // Dispatch the entry-point.
  unsafe_deployedPointPillarModel_mexFunction(nlhs, nrhs);
  // Module termination.
  deployedPointPillarModel_terminate();
}

//
// Arguments    : void
// Return Type  : emlrtCTX
//
emlrtCTX mexFunctionCreateRootTLS()
{
  emlrtCreateRootTLSR2022a(&emlrtRootTLSGlobal, &emlrtContextGlobal, nullptr, 1,
                           nullptr, "UTF-8", true);
  return emlrtRootTLSGlobal;
}

//
// Arguments    : int32_T nlhs
//                int32_T nrhs
// Return Type  : void
//
void unsafe_deployedPointPillarModel_mexFunction(int32_T nlhs, int32_T nrhs)
{
  emlrtStack st{
      nullptr, // site
      nullptr, // tls
      nullptr  // prev
  };
  st.tls = emlrtRootTLSGlobal;
  // Check for proper number of arguments.
  if (nrhs != 0) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 0, 4,
                        24, "deployedPointPillarModel");
  }
  if (nlhs > 0) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 24,
                        "deployedPointPillarModel");
  }
  // Call the function.
  deployedPointPillarModel_api();
}

//
// File trailer for _coder_deployedPointPillarModel_mex.cpp
//
// [EOF]
//
