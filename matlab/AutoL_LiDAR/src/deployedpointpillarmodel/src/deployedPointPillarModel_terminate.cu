//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: deployedPointPillarModel_terminate.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "deployedPointPillarModel_terminate.h"
#include "deployedPointPillarModel_data.h"
#include "rt_nonfinite.h"
#include "MWCUBLASUtils.hpp"
#include "stdio.h"

// Function Definitions
//
// Arguments    : void
// Return Type  : void
//
void deployedPointPillarModel_terminate()
{
  cudaError_t errCode;
  errCode = cudaGetLastError();
  if (errCode != cudaSuccess) {
    fprintf(stderr, "ERR[%d] %s:%s\n", errCode, cudaGetErrorName(errCode),
            cudaGetErrorString(errCode));
    exit(errCode);
  }
  cublasEnsureDestruction();
  cudaFree(*global_gpu_dv);
  cudaFree(*global_gpu_xq);
  cudaFree(*b_global_gpu_dv);
  cudaFree(*b_global_gpu_xq);
  isInitialized_deployedPointPillarModel = false;
}

//
// File trailer for deployedPointPillarModel_terminate.cu
//
// [EOF]
//
