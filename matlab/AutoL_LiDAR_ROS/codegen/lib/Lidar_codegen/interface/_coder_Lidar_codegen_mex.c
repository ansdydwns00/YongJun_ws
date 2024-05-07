/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_Lidar_codegen_mex.c
 *
 * MATLAB Coder version            : 23.2
 * C/C++ source code generated on  : 03-May-2024 21:18:42
 */

/* Include Files */
#include "_coder_Lidar_codegen_mex.h"
#include "_coder_Lidar_codegen_api.h"

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
  (void)prhs;
  mexAtExit(&Lidar_codegen_atexit);
  /* Module initialization. */
  Lidar_codegen_initialize();
  /* Dispatch the entry-point. */
  unsafe_Lidar_codegen_mexFunction(nlhs, plhs, nrhs);
  /* Module termination. */
  Lidar_codegen_terminate();
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
 *                mxArray *plhs[1]
 *                int32_T nrhs
 * Return Type  : void
 */
void unsafe_Lidar_codegen_mexFunction(int32_T nlhs, mxArray *plhs[1],
                                      int32_T nrhs)
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  const mxArray *outputs;
  st.tls = emlrtRootTLSGlobal;
  /* Check for proper number of arguments. */
  if (nrhs != 0) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 0, 4,
                        13, "Lidar_codegen");
  }
  if (nlhs > 1) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 13,
                        "Lidar_codegen");
  }
  /* Call the function. */
  Lidar_codegen_api(&outputs);
  /* Copy over outputs to the caller. */
  emlrtReturnArrays(1, &plhs[0], &outputs);
}

/*
 * File trailer for _coder_Lidar_codegen_mex.c
 *
 * [EOF]
 */
