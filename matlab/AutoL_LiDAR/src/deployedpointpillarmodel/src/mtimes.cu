//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: mtimes.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "mtimes.h"
#include "rt_nonfinite.h"
#include "MWCUBLASUtils.hpp"
#include "coder_array.h"
#include "coder_gpu_array.h"

// Function Definitions
//
// Arguments    : const float A[2]
//                array<float, 2U> &cpu_B
//                bool *B_outdatedOnCpu
//                gpu_array<float, 2U> &gpu_B
//                bool *B_outdatedOnGpu
//                array<float, 2U> &cpu_C
//                bool *C_outdatedOnCpu
//                gpu_array<float, 2U> &gpu_C
//                bool *C_outdatedOnGpu
// Return Type  : void
//
namespace coder {
namespace internal {
namespace blas {
void mtimes(const float A[2], array<float, 2U> &cpu_B, bool *B_outdatedOnCpu,
            gpu_array<float, 2U> &gpu_B, bool *B_outdatedOnGpu,
            array<float, 2U> &cpu_C, bool *C_outdatedOnCpu,
            gpu_array<float, 2U> &gpu_C, bool *C_outdatedOnGpu)
{
  if (cpu_B.size(1) == 0) {
    cpu_C.set_size(1, 0);
    if (!*C_outdatedOnGpu) {
      gpu_C.set_size(&cpu_C);
    }
  } else {
    float alpha1;
    float beta1;
    cpu_C.set_size(1, cpu_B.size(1));
    if (!*C_outdatedOnGpu) {
      gpu_C.set_size(&cpu_C);
    }
    alpha1 = 1.0F;
    beta1 = 0.0F;
    if (*B_outdatedOnGpu) {
      arrayCopyCpuToGpu(gpu_B, cpu_B);
    }
    if (*C_outdatedOnGpu) {
      arrayCopyCpuToGpu(gpu_C, cpu_C);
    }
    cublasSgemm(getCublasGlobalHandle(), CUBLAS_OP_N, CUBLAS_OP_N, 1,
                cpu_B.size(1), 2, (float *)&alpha1, (float *)&A[0], 1,
                (float *)&(gpu_B.data())[0], 2, (float *)&beta1,
                (float *)&gpu_C[0], 1);
    *C_outdatedOnGpu = false;
    *C_outdatedOnCpu = true;
    *B_outdatedOnGpu = false;
    *B_outdatedOnCpu = true;
  }
}

} // namespace blas
} // namespace internal
} // namespace coder

//
// File trailer for mtimes.cu
//
// [EOF]
//
