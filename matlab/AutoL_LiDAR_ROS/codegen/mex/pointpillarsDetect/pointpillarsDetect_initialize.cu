//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// pointpillarsDetect_initialize.cu
//
// Code generation for function 'pointpillarsDetect_initialize'
//

// Include files
#include "pointpillarsDetect_initialize.h"
#include "_coder_pointpillarsDetect_mex.h"
#include "pointpillarsDetect.h"
#include "pointpillarsDetect_data.h"
#include "pointpillarsDetect_mexutil.h"
#include "rt_nonfinite.h"
#include "MWCudaMemoryFunctions.hpp"

// Function Declarations
static void pointpillarsDetect_once();

// Function Definitions
static void pointpillarsDetect_once()
{
  mex_InitInfAndNan();
  pointpillarsDetect_emx_init();
  pointpillarsDetect_new();
  pointpillarsDetect_init();
  checkCudaError(mwCudaMalloc(&global_gpu_dv2, sizeof(real_T[248])), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&global_gpu_xq, sizeof(real_T[216])), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&b_global_gpu_xq, sizeof(real_T[248])), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&c_global_gpu_xq, sizeof(real_T[216])), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&d_global_gpu_xq, sizeof(real_T[248])), __FILE__,
                 __LINE__);
}

void pointpillarsDetect_initialize()
{
  emlrtInitGPU(emlrtRootTLSGlobal);
  cudaGetLastError();
  mexFunctionCreateRootTLS();
  emlrtClearAllocCountR2012b(emlrtRootTLSGlobal, false, 0U, nullptr);
  emlrtEnterRtStackR2012b(emlrtRootTLSGlobal);
  emlrtLicenseCheckR2022a(emlrtRootTLSGlobal,
                          "EMLRT:runTime:MexFunctionNeedsLicense",
                          "distrib_computing_toolbox", 2);
  emlrtLicenseCheckR2022a(emlrtRootTLSGlobal,
                          "EMLRT:runTime:MexFunctionNeedsLicense",
                          "neural_network_toolbox", 2);
  emlrtLicenseCheckR2022a(emlrtRootTLSGlobal,
                          "EMLRT:runTime:MexFunctionNeedsLicense",
                          "lidar_toolbox", 2);
  emlrtLicenseCheckR2022a(emlrtRootTLSGlobal,
                          "EMLRT:runTime:MexFunctionNeedsLicense",
                          "video_and_image_blockset", 2);
  if (emlrtFirstTimeR2012b(emlrtRootTLSGlobal)) {
    pointpillarsDetect_once();
  }
}

// End of code generation (pointpillarsDetect_initialize.cu)
