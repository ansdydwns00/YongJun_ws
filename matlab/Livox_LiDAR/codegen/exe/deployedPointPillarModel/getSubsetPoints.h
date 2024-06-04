//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: getSubsetPoints.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

#ifndef GETSUBSETPOINTS_H
#define GETSUBSETPOINTS_H

// Include Files
#include "rtwtypes.h"
#include "coder_array.h"
#include "coder_gpu_array.h"
#include <cstddef>
#include <cstdlib>

// Function Declarations
namespace coder {
namespace vision {
namespace internal {
namespace codegen {
namespace gpu {
void getSubsetPoints_anonFcn2(
    array<float, 2U> &cpu_property, gpu_array<float, 2U> &gpu_property,
    bool *property_outdatedOnGpu, array<bool, 1U> &cpu_indices,
    bool *indices_outdatedOnCpu, gpu_array<bool, 1U> &gpu_indices,
    bool *indices_outdatedOnGpu, array<float, 2U> &cpu_varargout_1,
    bool *varargout_1_outdatedOnCpu, gpu_array<float, 2U> &gpu_varargout_1,
    bool *varargout_1_outdatedOnGpu);

}
} // namespace codegen
} // namespace internal
} // namespace vision
} // namespace coder

#endif
//
// File trailer for getSubsetPoints.h
//
// [EOF]
//
