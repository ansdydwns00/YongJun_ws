//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// pointpillardetect_terminate.cu
//
// Code generation for function 'pointpillardetect_terminate'
//

// Include files
#include "pointpillardetect_terminate.h"
#include "_coder_pointpillardetect_mex.h"
#include "pointpillardetect.h"
#include "pointpillardetect_data.h"
#include "rt_nonfinite.h"
#include "MWCudaMemoryFunctions.hpp"

// Function Declarations
static void c_pointpillardetect_emx_free_dt(const void *r);

static void emlrtExitTimeCleanupDtorFcn(const void *r);

// Function Definitions
static void c_pointpillardetect_emx_free_dt(const void *r)
{
  pointpillardetect_emx_free();
}

static void emlrtExitTimeCleanupDtorFcn(const void *r)
{
  emlrtExitTimeCleanup(&emlrtContextGlobal);
}

void pointpillardetect_atexit()
{
  mexFunctionCreateRootTLS();
  try {
    emlrtPushHeapReferenceStackR2021a(emlrtRootTLSGlobal, false, nullptr,
                                      (void *)&emlrtExitTimeCleanupDtorFcn,
                                      nullptr, nullptr, nullptr);
    emlrtEnterRtStackR2012b(emlrtRootTLSGlobal);
    emlrtPushHeapReferenceStackR2021a(emlrtRootTLSGlobal, false, nullptr,
                                      (void *)&c_pointpillardetect_emx_free_dt,
                                      nullptr, nullptr, nullptr);
    pointpillardetect_delete();
    pointpillardetect_emx_free();
    emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
    emlrtExitTimeCleanup(&emlrtContextGlobal);
  } catch (...) {
    emlrtCleanupOnException((emlrtCTX *)emlrtRootTLSGlobal);
    throw;
  }
  mwCudaFree(*global_gpu_dv3);
  mwCudaFree(*global_gpu_xq);
  mwCudaFree(*b_global_gpu_xq);
  mwCudaFree(*c_global_gpu_xq);
  mwCudaFree(*d_global_gpu_xq);
}

void pointpillardetect_terminate()
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

// End of code generation (pointpillardetect_terminate.cu)
