/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_preprocessing3_mex.c
 *
 * Code generation for function '_coder_preprocessing3_mex'
 *
 */

/* Include files */
#include "_coder_preprocessing3_mex.h"
#include "_coder_preprocessing3_api.h"
#include "preprocessing3_data.h"
#include "preprocessing3_initialize.h"
#include "preprocessing3_terminate.h"
#include "preprocessing3_types.h"
#include "rt_nonfinite.h"

/* Function Definitions */
void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs,
                 const mxArray *prhs[])
{
  preprocessing3StackData *preprocessing3StackDataGlobal = NULL;
  preprocessing3StackDataGlobal = (preprocessing3StackData *)emlrtMxCalloc(
      (size_t)1, (size_t)1U * sizeof(preprocessing3StackData));
  mexAtExit(&preprocessing3_atexit);
  /* Module initialization. */
  preprocessing3_initialize();
  /* Dispatch the entry-point. */
  preprocessing3_mexFunction(preprocessing3StackDataGlobal, nlhs, plhs, nrhs,
                             prhs);
  /* Module termination. */
  preprocessing3_terminate();
  emlrtMxFree(preprocessing3StackDataGlobal);
}

emlrtCTX mexFunctionCreateRootTLS(void)
{
  emlrtCreateRootTLSR2022a(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1,
                           NULL, "UTF-8", true);
  return emlrtRootTLSGlobal;
}

void preprocessing3_mexFunction(preprocessing3StackData *SD, int32_T nlhs,
                                mxArray *plhs[2], int32_T nrhs,
                                const mxArray *prhs[2])
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
  if (nrhs != 2) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 2, 4,
                        14, "preprocessing3");
  }
  if (nlhs > 2) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 14,
                        "preprocessing3");
  }
  /* Call the function. */
  preprocessing3_api(SD, prhs, nlhs, outputs);
  /* Copy over outputs to the caller. */
  if (nlhs < 1) {
    i = 1;
  } else {
    i = nlhs;
  }
  emlrtReturnArrays(i, &plhs[0], &outputs[0]);
}

/* End of code generation (_coder_preprocessing3_mex.c) */
