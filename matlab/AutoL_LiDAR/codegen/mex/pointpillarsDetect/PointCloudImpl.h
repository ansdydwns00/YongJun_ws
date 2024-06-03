//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// PointCloudImpl.h
//
// Code generation for function 'PointCloudImpl'
//

#pragma once

// Include files
#include "rtwtypes.h"
#include "emlrt.h"
#include "mex.h"
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>

// Custom Header Code

#ifdef __CUDA_ARCH__
#undef printf
#endif

// Type Declarations
struct emxArray_real32_T;

struct emxArray_boolean_T;

struct emxArray_uint8_T;

// Function Declarations
namespace coder {
namespace vision {
namespace internal {
namespace codegen {
namespace gpu {
void PointCloudImpl_subsetImpl(
    const emxArray_real32_T *cpu_location, const emxArray_uint8_T *cpu_color,
    const emxArray_real32_T *cpu_normal, const emxArray_real32_T *cpu_intensity,
    const emxArray_real32_T *cpu_rangeData, emxArray_boolean_T *cpu_indices,
    emxArray_boolean_T *gpu_indices, boolean_T *indices_outdatedOnGpu,
    emxArray_real32_T *cpu_outLoc, boolean_T *outLoc_outdatedOnCpu,
    emxArray_real32_T *gpu_outLoc, boolean_T *outLoc_outdatedOnGpu,
    emxArray_uint8_T *cpu_outCol, boolean_T *outCol_outdatedOnCpu,
    emxArray_uint8_T *gpu_outCol, boolean_T *outCol_outdatedOnGpu,
    emxArray_real32_T *cpu_outNorm, boolean_T *outNorm_outdatedOnCpu,
    emxArray_real32_T *gpu_outNorm, boolean_T *outNorm_outdatedOnGpu,
    emxArray_real32_T *cpu_outIntensity, boolean_T *outIntensity_outdatedOnCpu,
    emxArray_real32_T *gpu_outIntensity, boolean_T *outIntensity_outdatedOnGpu,
    emxArray_real32_T *cpu_outRangeData, boolean_T *outRangeData_outdatedOnCpu,
    emxArray_real32_T *gpu_outRangeData, boolean_T *outRangeData_outdatedOnGpu);

void d_PointCloudImpl_extractValidPo(const emxArray_real32_T *cpu_ptCloudCoords,
                                     emxArray_boolean_T *cpu_validCoords,
                                     boolean_T *validCoords_outdatedOnCpu,
                                     emxArray_boolean_T *gpu_validCoords,
                                     boolean_T *validCoords_outdatedOnGpu);

} // namespace gpu
} // namespace codegen
} // namespace internal
} // namespace vision
} // namespace coder

// End of code generation (PointCloudImpl.h)
