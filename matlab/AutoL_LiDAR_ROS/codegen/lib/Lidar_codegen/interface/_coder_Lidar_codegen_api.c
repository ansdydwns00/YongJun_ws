/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_Lidar_codegen_api.c
 *
 * MATLAB Coder version            : 23.2
 * C/C++ source code generated on  : 03-May-2024 21:18:42
 */

/* Include Files */
#include "_coder_Lidar_codegen_api.h"
#include "_coder_Lidar_codegen_mex.h"

/* Variable Definitions */
emlrtCTX emlrtRootTLSGlobal = NULL;

emlrtContext emlrtContextGlobal = {
    true,                                                 /* bFirstTime */
    false,                                                /* bInitialized */
    131643U,                                              /* fVersionInfo */
    NULL,                                                 /* fErrorFunction */
    "Lidar_codegen",                                      /* fFunctionName */
    NULL,                                                 /* fRTCallStack */
    false,                                                /* bDebugMode */
    {2045744189U, 2170104910U, 2743257031U, 4284093946U}, /* fSigWrd */
    NULL                                                  /* fSigMem */
};

/* Function Declarations */
static const mxArray *emlrt_marshallOut(const real_T u[68352]);

/* Function Definitions */
/*
 * Arguments    : const real_T u[68352]
 * Return Type  : const mxArray *
 */
static const mxArray *emlrt_marshallOut(const real_T u[68352])
{
  static const int32_T iv[2] = {0, 0};
  static const int32_T iv1[2] = {22784, 3};
  const mxArray *m;
  const mxArray *y;
  y = NULL;
  m = emlrtCreateNumericArray(2, (const void *)&iv[0], mxDOUBLE_CLASS, mxREAL);
  emlrtMxSetData((mxArray *)m, (void *)&u[0]);
  emlrtSetDimensions((mxArray *)m, &iv1[0], 2);
  emlrtAssign(&y, m);
  return y;
}

/*
 * Arguments    : const mxArray **plhs
 * Return Type  : void
 */
void Lidar_codegen_api(const mxArray **plhs)
{
  real_T(*points)[68352];
  points = (real_T(*)[68352])mxMalloc(sizeof(real_T[68352]));
  /* Invoke the target function */
  Lidar_codegen(*points);
  /* Marshall function outputs */
  *plhs = emlrt_marshallOut(*points);
}

/*
 * Arguments    : void
 * Return Type  : void
 */
void Lidar_codegen_atexit(void)
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  mexFunctionCreateRootTLS();
  st.tls = emlrtRootTLSGlobal;
  emlrtEnterRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
  Lidar_codegen_xil_terminate();
  Lidar_codegen_xil_shutdown();
  emlrtExitTimeCleanup(&emlrtContextGlobal);
}

/*
 * Arguments    : void
 * Return Type  : void
 */
void Lidar_codegen_initialize(void)
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  mexFunctionCreateRootTLS();
  st.tls = emlrtRootTLSGlobal;
  emlrtClearAllocCountR2012b(&st, false, 0U, NULL);
  emlrtEnterRtStackR2012b(&st);
  emlrtFirstTimeR2012b(emlrtRootTLSGlobal);
}

/*
 * Arguments    : void
 * Return Type  : void
 */
void Lidar_codegen_terminate(void)
{
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

/*
 * File trailer for _coder_Lidar_codegen_api.c
 *
 * [EOF]
 */
