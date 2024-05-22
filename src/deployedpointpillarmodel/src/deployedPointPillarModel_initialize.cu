//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: deployedPointPillarModel_initialize.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "deployedPointPillarModel_initialize.h"
#include "deployedPointPillarModel_data.h"
#include "pause.h"
#include "rt_nonfinite.h"
#include "MWCUBLASUtils.hpp"

// Function Definitions
//
// Arguments    : void
// Return Type  : void
//
void deployedPointPillarModel_initialize()
{
  cpause_init();
  cublasEnsureInitialization(CUBLAS_POINTER_MODE_HOST);
  cudaMalloc(&global_gpu_dv, sizeof(double[248]));
  cudaMalloc(&global_gpu_xq, sizeof(double[216]));
  cudaMalloc(&b_global_gpu_dv, sizeof(double[248]));
  cudaMalloc(&b_global_gpu_xq, sizeof(double[216]));
  cudaGetLastError();
  isInitialized_deployedPointPillarModel = true;
}

//
// File trailer for deployedPointPillarModel_initialize.cu
//
// [EOF]
//
