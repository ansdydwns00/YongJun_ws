//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: PointCloudImpl.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

#ifndef POINTCLOUDIMPL_H
#define POINTCLOUDIMPL_H

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
void PointCloudImpl_extractValidPoints(
    const array<float, 2U> &cpu_ptCloudCoords, array<bool, 1U> &cpu_validCoords,
    bool *validCoords_outdatedOnCpu, gpu_array<bool, 1U> &gpu_validCoords,
    bool *validCoords_outdatedOnGpu);

void PointCloudImpl_subsetImpl(
    const array<float, 2U> &cpu_location,
    const array<unsigned char, 2U> &cpu_color,
    const array<float, 2U> &cpu_normal, const array<float, 2U> &cpu_intensity,
    const array<float, 2U> &cpu_rangeData, array<bool, 1U> &cpu_indices,
    bool *indices_outdatedOnCpu, gpu_array<bool, 1U> &gpu_indices,
    bool *indices_outdatedOnGpu, array<float, 2U> &cpu_outLoc,
    array<unsigned char, 2U> &cpu_outCol, bool *outCol_outdatedOnCpu,
    gpu_array<unsigned char, 2U> &gpu_outCol, bool *outCol_outdatedOnGpu,
    array<float, 2U> &cpu_outNorm, bool *outNorm_outdatedOnCpu,
    gpu_array<float, 2U> &gpu_outNorm, bool *outNorm_outdatedOnGpu,
    array<float, 2U> &cpu_outIntensity, bool *outIntensity_outdatedOnCpu,
    gpu_array<float, 2U> &gpu_outIntensity, bool *outIntensity_outdatedOnGpu,
    array<float, 2U> &cpu_outRangeData, bool *outRangeData_outdatedOnCpu,
    gpu_array<float, 2U> &gpu_outRangeData, bool *outRangeData_outdatedOnGpu);

} // namespace gpu
} // namespace codegen
} // namespace internal
} // namespace vision
} // namespace coder

#endif
//
// File trailer for PointCloudImpl.h
//
// [EOF]
//
