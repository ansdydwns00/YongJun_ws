/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_preprocessing2_mex.c
 *
 * Code generation for function '_coder_preprocessing2_mex'
 *
 */

/* Include files */
#include "_coder_preprocessing2_mex.h"
#include "_coder_preprocessing2_api.h"
#include "preprocessing2_data.h"
#include "preprocessing2_initialize.h"
#include "preprocessing2_terminate.h"
#include "preprocessing2_types.h"
#include "rt_nonfinite.h"

/* Function Definitions */
void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs,
                 const mxArray *prhs[])
{
  preprocessing2StackData *preprocessing2StackDataGlobal = NULL;
  preprocessing2StackDataGlobal = (preprocessing2StackData *)emlrtMxCalloc(
      (size_t)1, (size_t)1U * sizeof(preprocessing2StackData));
  mexAtExit(&preprocessing2_atexit);
  /* Module initialization. */
  preprocessing2_initialize();
  /* Dispatch the entry-point. */
  preprocessing2_mexFunction(preprocessing2StackDataGlobal, nlhs, plhs, nrhs,
                             prhs);
  /* Module termination. */
  preprocessing2_terminate();
  emlrtMxFree(preprocessing2StackDataGlobal);
}

emlrtCTX mexFunctionCreateRootTLS(void)
{
  emlrtCreateRootTLSR2022a(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1,
                           NULL, "UTF-8", true);
  return emlrtRootTLSGlobal;
}

void preprocessing2_mexFunction(preprocessing2StackData *SD, int32_T nlhs,
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
                        14, "preprocessing2");
  }
  if (nlhs > 2) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 14,
                        "preprocessing2");
  }
  /* Call the function. */
  preprocessing2_api(SD, prhs, nlhs, outputs);
  /* Copy over outputs to the caller. */
  if (nlhs < 1) {
    i = 1;
  } else {
    i = nlhs;
  }
  emlrtReturnArrays(i, &plhs[0], &outputs[0]);
}

/* End of code generation (_coder_preprocessing2_mex.c) */
