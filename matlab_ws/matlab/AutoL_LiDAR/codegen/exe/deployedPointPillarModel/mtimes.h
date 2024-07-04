//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: mtimes.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

#ifndef MTIMES_H
#define MTIMES_H

// Include Files
#include "rtwtypes.h"
#include "coder_array.h"
#include "coder_gpu_array.h"
#include <cstddef>
#include <cstdlib>

// Function Declarations
namespace coder {
namespace internal {
namespace blas {
void mtimes(const float A[2], array<float, 2U> &cpu_B, bool *B_outdatedOnCpu,
            gpu_array<float, 2U> &gpu_B, bool *B_outdatedOnGpu,
            array<float, 2U> &cpu_C, bool *C_outdatedOnCpu,
            gpu_array<float, 2U> &gpu_C, bool *C_outdatedOnGpu);

}
} // namespace internal
} // namespace coder

#endif
//
// File trailer for mtimes.h
//
// [EOF]
//
