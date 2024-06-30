/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_preprocessing_mex.c
 *
 * Code generation for function '_coder_preprocessing_mex'
 *
 */

/* Include files */
#include "_coder_preprocessing_mex.h"
#include "_coder_preprocessing_api.h"
#include "preprocessing_data.h"
#include "preprocessing_initialize.h"
#include "preprocessing_terminate.h"
#include "preprocessing_types.h"
#include "rt_nonfinite.h"

/* Function Definitions */
void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs,
                 const mxArray *prhs[])
{
  preprocessingStackData *preprocessingStackDataGlobal = NULL;
  preprocessingStackDataGlobal = (preprocessingStackData *)emlrtMxCalloc(
      (size_t)1, (size_t)1U * sizeof(preprocessingStackData));
  mexAtExit(&preprocessing_atexit);
  /* Module initialization. */
  preprocessing_initialize();
  /* Dispatch the entry-point. */
  preprocessing_mexFunction(preprocessingStackDataGlobal, nlhs, plhs, nrhs,
                            prhs);
  /* Module termination. */
  preprocessing_terminate();
  emlrtMxFree(preprocessingStackDataGlobal);
}

emlrtCTX mexFunctionCreateRootTLS(void)
{
  emlrtCreateRootTLSR2022a(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1,
                           NULL, "UTF-8", true);
  return emlrtRootTLSGlobal;
}

void preprocessing_mexFunction(preprocessingStackData *SD, int32_T nlhs,
                               mxArray *plhs[2], int32_T nrhs,
                               const mxArray *prhs[6])
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  const mxArray *outputs[2];
  int32_T i;
  st.tls = emlrtRootTLSGlobal;
  /* Check for proper number of arguments. */
  if (nrhs != 6) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 6, 4,
                        13, "preprocessing");
  }
  if (nlhs > 2) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 13,
                        "preprocessing");
  }
  /* Call the function. */
  preprocessing_api(SD, prhs, nlhs, outputs);
  /* Copy over outputs to the caller. */
  if (nlhs < 1) {
    i = 1;
  } else {
    i = nlhs;
  }
  emlrtReturnArrays(i, &plhs[0], &outputs[0]);
}

/* End of code generation (_coder_preprocessing_mex.c) */
