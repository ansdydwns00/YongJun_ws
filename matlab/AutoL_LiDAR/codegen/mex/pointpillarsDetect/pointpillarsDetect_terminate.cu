//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// pointpillarsDetect_terminate.cu
//
// Code generation for function 'pointpillarsDetect_terminate'
//

// Include files
#include "pointpillarsDetect_terminate.h"
#include "_coder_pointpillarsDetect_mex.h"
#include "pointpillarsDetect.h"
#include "pointpillarsDetect_data.h"
#include "rt_nonfinite.h"
#include "MWCudaMemoryFunctions.hpp"

// Function Declarations
static void c_pointpillarsDetect_emx_free_d(const void *r);

static void emlrtExitTimeCleanupDtorFcn(const void *r);

// Function Definitions
static void c_pointpillarsDetect_emx_free_d(const void *r)
{
}

static void emlrtExitTimeCleanupDtorFcn(const void *r)
{
  emlrtExitTimeCleanup(&emlrtContextGlobal);
}

void pointpillarsDetect_atexit()
{
  mexFunctionCreateRootTLS();
  try {
    emlrtPushHeapReferenceStackR2021a(emlrtRootTLSGlobal, false, nullptr,
                                      (void *)&emlrtExitTimeCleanupDtorFcn,
                                      nullptr, nullptr, nullptr);
    emlrtEnterRtStackR2012b(emlrtRootTLSGlobal);
    emlrtPushHeapReferenceStackR2021a(emlrtRootTLSGlobal, false, nullptr,
                                      (void *)&c_pointpillarsDetect_emx_free_d,
                                      nullptr, nullptr, nullptr);
    pointpillarsDetect_delete();
    emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
    emlrtExitTimeCleanup(&emlrtContextGlobal);
  } catch (...) {
    emlrtCleanupOnException((emlrtCTX *)emlrtRootTLSGlobal);
    throw;
  }
  mwCudaFree(*global_gpu_dv2);
  mwCudaFree(*global_gpu_xq);
  mwCudaFree(*b_global_gpu_xq);
  mwCudaFree(*c_global_gpu_xq);
  mwCudaFree(*d_global_gpu_xq);
}

void pointpillarsDetect_terminate()
{
  cudaError_t errCode;
  errCode = cudaGetLastError();
  if (errCode != cudaSuccess) {
    emlrtThinCUDAError(static_cast<uint32_T>(errCode),
                       (char_T *)cudaGetErrorName(errCode),
                       (char_T *)cudaGetErrorString(errCode),
                       (char_T *)"SafeBuild", emlrtRootTLSGlobal);
  }
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

// End of code generation (pointpillarsDetect_terminate.cu)
