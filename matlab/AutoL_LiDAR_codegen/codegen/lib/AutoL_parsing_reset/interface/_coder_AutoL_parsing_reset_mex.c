/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_AutoL_parsing_reset_mex.c
 *
 * MATLAB Coder version            : 23.2
 * C/C++ source code generated on  : 06-May-2024 17:28:39
 */

/* Include Files */
#include "_coder_AutoL_parsing_reset_mex.h"
#include "_coder_AutoL_parsing_reset_api.h"

/* Function Definitions */
/*
 * Arguments    : int32_T nlhs
 *                mxArray *plhs[]
 *                int32_T nrhs
 *                const mxArray *prhs[]
 * Return Type  : void
 */
void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs,
                 const mxArray *prhs[])
{
  (void)plhs;
  (void)prhs;
  mexAtExit(&AutoL_parsing_reset_atexit);
  /* Module initialization. */
  AutoL_parsing_reset_initialize();
  /* Dispatch the entry-point. */
  unsafe_AutoL_parsing_reset_mexFunction(nlhs, nrhs);
  /* Module termination. */
  AutoL_parsing_reset_terminate();
}

/*
 * Arguments    : void
 * Return Type  : emlrtCTX
 */
emlrtCTX mexFunctionCreateRootTLS(void)
{
  emlrtCreateRootTLSR2022a(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1,
                           NULL, "UTF-8", true);
  return emlrtRootTLSGlobal;
}

/*
 * Arguments    : int32_T nlhs
 *                int32_T nrhs
 * Return Type  : void
 */
void unsafe_AutoL_parsing_reset_mexFunction(int32_T nlhs, int32_T nrhs)
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  st.tls = emlrtRootTLSGlobal;
  /* Check for proper number of arguments. */
  if (nrhs != 0) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 0, 4,
                        19, "AutoL_parsing_reset");
  }
  if (nlhs > 0) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 19,
                        "AutoL_parsing_reset");
  }
  /* Call the function. */
  AutoL_parsing_reset_api();
}

/*
 * File trailer for _coder_AutoL_parsing_reset_mex.c
 *
 * [EOF]
 */
