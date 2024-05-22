//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: PointCloudImpl.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "PointCloudImpl.h"
#include "getSubsetPoints.h"
#include "rt_nonfinite.h"
#include "MWCudaDimUtility.hpp"
#include "MWLaunchParametersUtilities.hpp"
#include "MWScanFunctors.h"
#include "MWScanUtility.h"
#include "MWShuffleUtility.h"
#include "coder_array.h"
#include "coder_gpu_array.h"

// Function Declarations
static __global__ void PointCloudImpl_extractValidPoints_kernel4(
    const double numPoints, const coder::gpu_array<float, 2U> ptCloudCoords,
    const int i, coder::gpu_array<bool, 1U> validCoords);

static __global__ void PointCloudImpl_subsetImpl_kernel10(
    const double numElements, const coder::gpu_array<unsigned char, 2U> color,
    const double outSize, const coder::gpu_array<double, 1U> outIndex,
    const coder::gpu_array<bool, 1U> indices, const int b_indices,
    coder::gpu_array<unsigned char, 2U> outCol);

static __global__ void
PointCloudImpl_subsetImpl_kernel11(const coder::gpu_array<bool, 1U> indices,
                                   const int b_indices,
                                   coder::gpu_array<double, 1U> outIndex);

static __global__ void
PointCloudImpl_subsetImpl_kernel12(const coder::gpu_array<double, 1U> outIndex,
                                   double *outSize);

static __global__ void PointCloudImpl_subsetImpl_kernel13(
    const coder::gpu_array<float, 2U> intensity, const double outSize,
    const coder::gpu_array<double, 1U> outIndex,
    const coder::gpu_array<bool, 1U> indices, const int i,
    coder::gpu_array<float, 1U> outIntensity);

static __global__ void PointCloudImpl_subsetImpl_kernel14(
    const coder::gpu_array<float, 1U> outIntensity, const int b_outIntensity,
    coder::gpu_array<float, 2U> c_outIntensity);

static __global__ void
PointCloudImpl_subsetImpl_kernel5(const coder::gpu_array<bool, 1U> indices,
                                  const int b_indices,
                                  coder::gpu_array<double, 1U> outIndex);

static __global__ void
PointCloudImpl_subsetImpl_kernel6(const coder::gpu_array<double, 1U> outIndex,
                                  double *outSize);

static __global__ void PointCloudImpl_subsetImpl_kernel7(
    const double numElements, const coder::gpu_array<float, 2U> location,
    const double outSize, const coder::gpu_array<double, 1U> outIndex,
    const coder::gpu_array<bool, 1U> indices, const int b_indices,
    coder::gpu_array<float, 2U> outLoc);

static __global__ void
PointCloudImpl_subsetImpl_kernel8(const coder::gpu_array<bool, 1U> indices,
                                  const int b_indices,
                                  coder::gpu_array<double, 1U> outIndex);

static __global__ void
PointCloudImpl_subsetImpl_kernel9(const coder::gpu_array<double, 1U> outIndex,
                                  double *outSize);

// Function Definitions
//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const double numPoints
//                const coder::gpu_array<float, 2U> ptCloudCoords
//                const int i
//                coder::gpu_array<bool, 1U> validCoords
// Return Type  : void
//
static __global__
    __launch_bounds__(1024, 1) void PointCloudImpl_extractValidPoints_kernel4(
        const double numPoints, const coder::gpu_array<float, 2U> ptCloudCoords,
        const int i, coder::gpu_array<bool, 1U> validCoords)
{
  unsigned long long loopEnd;
  unsigned long long threadId;
  unsigned long long threadStride;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<unsigned long long>(i) - 1ULL;
  for (unsigned long long idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int b_i;
    b_i = static_cast<int>(idx);
    if ((static_cast<bool>(!static_cast<int>(isinf(ptCloudCoords[b_i])))) &&
        (static_cast<bool>(!static_cast<int>(isnan(ptCloudCoords[b_i]))))) {
      float b_x;
      b_x = ptCloudCoords[b_i + static_cast<int>(numPoints)];
      if ((static_cast<bool>(!static_cast<int>(isinf(b_x)))) &&
          (static_cast<bool>(!static_cast<int>(isnan(b_x))))) {
        b_x = ptCloudCoords[b_i + (static_cast<int>(numPoints) << 1)];
        if ((static_cast<bool>(!static_cast<int>(isinf(b_x)))) &&
            (static_cast<bool>(!static_cast<int>(isnan(b_x))))) {
          validCoords[b_i] = true;
        } else {
          validCoords[b_i] = false;
        }
      } else {
        validCoords[b_i] = false;
      }
    } else {
      validCoords[b_i] = false;
    }
  }
}

//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const double numElements
//                const coder::gpu_array<unsigned char, 2U> color
//                const double outSize
//                const coder::gpu_array<double, 1U> outIndex
//                const coder::gpu_array<bool, 1U> indices
//                const int b_indices
//                coder::gpu_array<unsigned char, 2U> outCol
// Return Type  : void
//
static __global__
    __launch_bounds__(1024, 1) void PointCloudImpl_subsetImpl_kernel10(
        const double numElements,
        const coder::gpu_array<unsigned char, 2U> color, const double outSize,
        const coder::gpu_array<double, 1U> outIndex,
        const coder::gpu_array<bool, 1U> indices, const int b_indices,
        coder::gpu_array<unsigned char, 2U> outCol)
{
  unsigned long long loopEnd;
  unsigned long long threadId;
  unsigned long long threadStride;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = (static_cast<unsigned long long>(b_indices) + 1ULL) * 3ULL - 1ULL;
  for (unsigned long long idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int col;
    int itr;
    itr = static_cast<int>(idx %
                           (static_cast<unsigned long long>(b_indices) + 1ULL));
    col = static_cast<int>((idx - static_cast<unsigned long long>(itr)) /
                           (static_cast<unsigned long long>(b_indices) + 1ULL));
    if (indices[itr]) {
      outCol[static_cast<int>(outIndex[itr] +
                              static_cast<double>(col) * outSize) -
             1] =
          color[static_cast<int>((static_cast<double>(itr) + 1.0) +
                                 static_cast<double>(col) * numElements) -
                1];
    }
  }
}

//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const coder::gpu_array<bool, 1U> indices
//                const int b_indices
//                coder::gpu_array<double, 1U> outIndex
// Return Type  : void
//
static __global__
    __launch_bounds__(1024, 1) void PointCloudImpl_subsetImpl_kernel11(
        const coder::gpu_array<bool, 1U> indices, const int b_indices,
        coder::gpu_array<double, 1U> outIndex)
{
  unsigned long long loopEnd;
  unsigned long long threadId;
  unsigned long long threadStride;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<unsigned long long>(b_indices);
  for (unsigned long long idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int col;
    col = static_cast<int>(idx);
    outIndex[col] = static_cast<double>(indices[col]);
  }
}

//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const coder::gpu_array<double, 1U> outIndex
//                double *outSize
// Return Type  : void
//
static __global__
    __launch_bounds__(32, 1) void PointCloudImpl_subsetImpl_kernel12(
        const coder::gpu_array<double, 1U> outIndex, double *outSize)
{
  unsigned long long threadId;
  int i;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  i = static_cast<int>(threadId);
  if (i < 2) {
    *outSize = outIndex[outIndex.size(0) - 1];
  }
}

//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const coder::gpu_array<float, 2U> intensity
//                const double outSize
//                const coder::gpu_array<double, 1U> outIndex
//                const coder::gpu_array<bool, 1U> indices
//                const int i
//                coder::gpu_array<float, 1U> outIntensity
// Return Type  : void
//
static __global__
    __launch_bounds__(1024, 1) void PointCloudImpl_subsetImpl_kernel13(
        const coder::gpu_array<float, 2U> intensity, const double outSize,
        const coder::gpu_array<double, 1U> outIndex,
        const coder::gpu_array<bool, 1U> indices, const int i,
        coder::gpu_array<float, 1U> outIntensity)
{
  unsigned long long loopEnd;
  unsigned long long threadId;
  unsigned long long threadStride;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<unsigned long long>(i) - 1ULL;
  for (unsigned long long idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int itr;
    itr = static_cast<int>(idx);
    if (indices[itr]) {
      outIntensity[static_cast<int>(outIndex[itr] + 0.0 * outSize) - 1] =
          intensity[itr];
    }
  }
}

//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const coder::gpu_array<float, 1U> outIntensity
//                const int b_outIntensity
//                coder::gpu_array<float, 2U> c_outIntensity
// Return Type  : void
//
static __global__
    __launch_bounds__(1024, 1) void PointCloudImpl_subsetImpl_kernel14(
        const coder::gpu_array<float, 1U> outIntensity,
        const int b_outIntensity, coder::gpu_array<float, 2U> c_outIntensity)
{
  unsigned long long loopEnd;
  unsigned long long threadId;
  unsigned long long threadStride;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<unsigned long long>(b_outIntensity);
  for (unsigned long long idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int col;
    col = static_cast<int>(idx);
    c_outIntensity[col] = outIntensity[col];
  }
}

//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const coder::gpu_array<bool, 1U> indices
//                const int b_indices
//                coder::gpu_array<double, 1U> outIndex
// Return Type  : void
//
static __global__
    __launch_bounds__(1024, 1) void PointCloudImpl_subsetImpl_kernel5(
        const coder::gpu_array<bool, 1U> indices, const int b_indices,
        coder::gpu_array<double, 1U> outIndex)
{
  unsigned long long loopEnd;
  unsigned long long threadId;
  unsigned long long threadStride;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<unsigned long long>(b_indices);
  for (unsigned long long idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int col;
    col = static_cast<int>(idx);
    outIndex[col] = static_cast<double>(indices[col]);
  }
}

//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const coder::gpu_array<double, 1U> outIndex
//                double *outSize
// Return Type  : void
//
static __global__
    __launch_bounds__(32, 1) void PointCloudImpl_subsetImpl_kernel6(
        const coder::gpu_array<double, 1U> outIndex, double *outSize)
{
  unsigned long long threadId;
  int i;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  i = static_cast<int>(threadId);
  if (i < 2) {
    *outSize = outIndex[outIndex.size(0) - 1];
  }
}

//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const double numElements
//                const coder::gpu_array<float, 2U> location
//                const double outSize
//                const coder::gpu_array<double, 1U> outIndex
//                const coder::gpu_array<bool, 1U> indices
//                const int b_indices
//                coder::gpu_array<float, 2U> outLoc
// Return Type  : void
//
static __global__
    __launch_bounds__(1024, 1) void PointCloudImpl_subsetImpl_kernel7(
        const double numElements, const coder::gpu_array<float, 2U> location,
        const double outSize, const coder::gpu_array<double, 1U> outIndex,
        const coder::gpu_array<bool, 1U> indices, const int b_indices,
        coder::gpu_array<float, 2U> outLoc)
{
  unsigned long long loopEnd;
  unsigned long long threadId;
  unsigned long long threadStride;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = (static_cast<unsigned long long>(b_indices) + 1ULL) * 3ULL - 1ULL;
  for (unsigned long long idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int col;
    int itr;
    itr = static_cast<int>(idx %
                           (static_cast<unsigned long long>(b_indices) + 1ULL));
    col = static_cast<int>((idx - static_cast<unsigned long long>(itr)) /
                           (static_cast<unsigned long long>(b_indices) + 1ULL));
    if (indices[itr]) {
      outLoc[static_cast<int>(outIndex[itr] +
                              static_cast<double>(col) * outSize) -
             1] =
          location[static_cast<int>((static_cast<double>(itr) + 1.0) +
                                    static_cast<double>(col) * numElements) -
                   1];
    }
  }
}

//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const coder::gpu_array<bool, 1U> indices
//                const int b_indices
//                coder::gpu_array<double, 1U> outIndex
// Return Type  : void
//
static __global__
    __launch_bounds__(1024, 1) void PointCloudImpl_subsetImpl_kernel8(
        const coder::gpu_array<bool, 1U> indices, const int b_indices,
        coder::gpu_array<double, 1U> outIndex)
{
  unsigned long long loopEnd;
  unsigned long long threadId;
  unsigned long long threadStride;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<unsigned long long>(b_indices);
  for (unsigned long long idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int col;
    col = static_cast<int>(idx);
    outIndex[col] = static_cast<double>(indices[col]);
  }
}

//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const coder::gpu_array<double, 1U> outIndex
//                double *outSize
// Return Type  : void
//
static __global__
    __launch_bounds__(32, 1) void PointCloudImpl_subsetImpl_kernel9(
        const coder::gpu_array<double, 1U> outIndex, double *outSize)
{
  unsigned long long threadId;
  int i;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  i = static_cast<int>(threadId);
  if (i < 2) {
    *outSize = outIndex[outIndex.size(0) - 1];
  }
}

//
// Arguments    : const array<float, 2U> &cpu_ptCloudCoords
//                array<bool, 1U> &cpu_validCoords
//                bool *validCoords_outdatedOnCpu
//                gpu_array<bool, 1U> &gpu_validCoords
//                bool *validCoords_outdatedOnGpu
// Return Type  : void
//
namespace coder {
namespace vision {
namespace internal {
namespace codegen {
namespace gpu {
void PointCloudImpl_extractValidPoints(
    const array<float, 2U> &cpu_ptCloudCoords, array<bool, 1U> &cpu_validCoords,
    bool *validCoords_outdatedOnCpu, gpu_array<bool, 1U> &gpu_validCoords,
    bool *validCoords_outdatedOnGpu)
{
  gpu_array<float, 2U> gpu_ptCloudCoords;
  dim3 block;
  dim3 grid;
  double numPoints;
  bool validLaunchParams;
  numPoints = static_cast<double>(cpu_ptCloudCoords.size(0) * 3) / 3.0;
  cpu_validCoords.set_size(static_cast<int>(numPoints));
  if (!*validCoords_outdatedOnGpu) {
    gpu_validCoords.set_size(&cpu_validCoords);
  }
  validLaunchParams =
      mwGetLaunchParameters1D(static_cast<double>(static_cast<int>(numPoints)),
                              &grid, &block, 1024U, 65535U);
  if (validLaunchParams) {
    arrayCopyCpuToGpu(gpu_ptCloudCoords, cpu_ptCloudCoords);
    if (*validCoords_outdatedOnGpu) {
      arrayCopyCpuToGpu(gpu_validCoords, cpu_validCoords);
    }
    PointCloudImpl_extractValidPoints_kernel4<<<grid, block>>>(
        numPoints, gpu_ptCloudCoords, static_cast<int>(numPoints),
        gpu_validCoords);
    *validCoords_outdatedOnGpu = false;
    *validCoords_outdatedOnCpu = true;
  }
}

//
// Arguments    : const array<float, 2U> &cpu_location
//                const array<unsigned char, 2U> &cpu_color
//                const array<float, 2U> &cpu_normal
//                const array<float, 2U> &cpu_intensity
//                const array<float, 2U> &cpu_rangeData
//                array<bool, 1U> &cpu_indices
//                bool *indices_outdatedOnCpu
//                gpu_array<bool, 1U> &gpu_indices
//                bool *indices_outdatedOnGpu
//                array<float, 2U> &cpu_outLoc
//                array<unsigned char, 2U> &cpu_outCol
//                bool *outCol_outdatedOnCpu
//                gpu_array<unsigned char, 2U> &gpu_outCol
//                bool *outCol_outdatedOnGpu
//                array<float, 2U> &cpu_outNorm
//                bool *outNorm_outdatedOnCpu
//                gpu_array<float, 2U> &gpu_outNorm
//                bool *outNorm_outdatedOnGpu
//                array<float, 2U> &cpu_outIntensity
//                bool *outIntensity_outdatedOnCpu
//                gpu_array<float, 2U> &gpu_outIntensity
//                bool *outIntensity_outdatedOnGpu
//                array<float, 2U> &cpu_outRangeData
//                bool *outRangeData_outdatedOnCpu
//                gpu_array<float, 2U> &gpu_outRangeData
//                bool *outRangeData_outdatedOnGpu
// Return Type  : void
//
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
    gpu_array<float, 2U> &gpu_outRangeData, bool *outRangeData_outdatedOnGpu)
{
  array<double, 1U> b_cpu_outIndex;
  array<double, 1U> c_cpu_outIndex;
  array<double, 1U> cpu_outIndex;
  array<float, 1U> b_cpu_outIntensity;
  gpu_array<double, 1U> b_gpu_outIndex;
  gpu_array<double, 1U> c_gpu_outIndex;
  gpu_array<double, 1U> gpu_outIndex;
  gpu_array<float, 2U> gpu_intensity;
  gpu_array<float, 2U> gpu_location;
  gpu_array<float, 2U> gpu_normal;
  gpu_array<float, 2U> gpu_outLoc;
  gpu_array<float, 2U> gpu_rangeData;
  gpu_array<float, 1U> b_gpu_outIntensity;
  gpu_array<unsigned char, 2U> gpu_color;
  dim3 block;
  dim3 grid;
  double b_cpu_outSize;
  double c_cpu_outSize;
  double cpu_outSize;
  double numElements;
  double *b_gpu_outSize;
  double *c_gpu_outSize;
  double *gpu_outSize;
  int indices;
  bool normal_outdatedOnGpu;
  bool outLoc_outdatedOnCpu;
  bool rangeData_outdatedOnGpu;
  bool validLaunchParams;
  cudaMalloc(&gpu_outSize, 8ULL);
  cudaMalloc(&b_gpu_outSize, 8ULL);
  cudaMalloc(&c_gpu_outSize, 8ULL);
  outLoc_outdatedOnCpu = false;
  rangeData_outdatedOnGpu = true;
  normal_outdatedOnGpu = true;
  if ((cpu_location.size(0) == 0) || (cpu_indices.size(0) == 0)) {
    cpu_outLoc.set_size(0, 3);
  } else {
    numElements = static_cast<double>(cpu_location.size(0) * 3) / 3.0;
    cpu_outIndex.set_size(cpu_indices.size(0));
    c_gpu_outIndex.set_size(&cpu_outIndex);
    indices = cpu_indices.size(0) - 1;
    validLaunchParams = mwGetLaunchParameters1D(
        static_cast<double>(indices + 1LL), &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      if (*indices_outdatedOnGpu) {
        arrayCopyCpuToGpu(gpu_indices, cpu_indices);
      }
      *indices_outdatedOnGpu = false;
      PointCloudImpl_subsetImpl_kernel5<<<grid, block>>>(gpu_indices, indices,
                                                         c_gpu_outIndex);
    }
    if (cpu_outIndex.size(0) != 1) {
      mwCallThrustScan1D(&(c_gpu_outIndex.data())[0], false,
                         cpu_outIndex.size(0));
    }
    PointCloudImpl_subsetImpl_kernel6<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(
        c_gpu_outIndex, c_gpu_outSize);
    cudaMemcpy(&cpu_outSize, c_gpu_outSize, 8ULL, cudaMemcpyDeviceToHost);
    cpu_outLoc.set_size(static_cast<int>(cpu_outSize), 3);
    indices = cpu_indices.size(0) - 1;
    validLaunchParams =
        mwGetLaunchParameters1D(static_cast<double>((indices + 1LL) * 3LL),
                                &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      arrayCopyCpuToGpu(gpu_location, cpu_location);
      if (*indices_outdatedOnGpu) {
        arrayCopyCpuToGpu(gpu_indices, cpu_indices);
      }
      *indices_outdatedOnGpu = false;
      arrayCopyCpuToGpu(gpu_outLoc, cpu_outLoc);
      PointCloudImpl_subsetImpl_kernel7<<<grid, block>>>(
          numElements, gpu_location, cpu_outSize, c_gpu_outIndex, gpu_indices,
          indices, gpu_outLoc);
      outLoc_outdatedOnCpu = true;
    }
  }
  if ((cpu_color.size(0) == 0) || (cpu_color.size(1) == 0) ||
      (cpu_indices.size(0) == 0)) {
    cpu_outCol.set_size(0, 3);
    if (!*outCol_outdatedOnGpu) {
      gpu_outCol.set_size(&cpu_outCol);
    }
  } else {
    numElements =
        static_cast<double>(cpu_color.size(0) * cpu_color.size(1)) / 3.0;
    b_cpu_outIndex.set_size(cpu_indices.size(0));
    b_gpu_outIndex.set_size(&b_cpu_outIndex);
    indices = cpu_indices.size(0) - 1;
    validLaunchParams = mwGetLaunchParameters1D(
        static_cast<double>(indices + 1LL), &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      if (*indices_outdatedOnGpu) {
        arrayCopyCpuToGpu(gpu_indices, cpu_indices);
      }
      *indices_outdatedOnGpu = false;
      PointCloudImpl_subsetImpl_kernel8<<<grid, block>>>(gpu_indices, indices,
                                                         b_gpu_outIndex);
    }
    if (b_cpu_outIndex.size(0) != 1) {
      mwCallThrustScan1D(&(b_gpu_outIndex.data())[0], false,
                         b_cpu_outIndex.size(0));
    }
    PointCloudImpl_subsetImpl_kernel9<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(
        b_gpu_outIndex, b_gpu_outSize);
    cudaMemcpy(&b_cpu_outSize, b_gpu_outSize, 8ULL, cudaMemcpyDeviceToHost);
    cpu_outCol.set_size(static_cast<int>(b_cpu_outSize), 3);
    if (!*outCol_outdatedOnGpu) {
      gpu_outCol.set_size(&cpu_outCol);
    }
    indices = cpu_indices.size(0) - 1;
    validLaunchParams =
        mwGetLaunchParameters1D(static_cast<double>((indices + 1LL) * 3LL),
                                &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      arrayCopyCpuToGpu(gpu_color, cpu_color);
      if (*indices_outdatedOnGpu) {
        arrayCopyCpuToGpu(gpu_indices, cpu_indices);
      }
      *indices_outdatedOnGpu = false;
      if (*outCol_outdatedOnGpu) {
        arrayCopyCpuToGpu(gpu_outCol, cpu_outCol);
      }
      PointCloudImpl_subsetImpl_kernel10<<<grid, block>>>(
          numElements, gpu_color, b_cpu_outSize, b_gpu_outIndex, gpu_indices,
          indices, gpu_outCol);
      *outCol_outdatedOnGpu = false;
      *outCol_outdatedOnCpu = true;
    }
  }
  getSubsetPoints_anonFcn2(
      *(array<float, 2U> *)&cpu_normal, gpu_normal, &normal_outdatedOnGpu,
      cpu_indices, indices_outdatedOnCpu, gpu_indices, indices_outdatedOnGpu,
      cpu_outNorm, outNorm_outdatedOnCpu, gpu_outNorm, outNorm_outdatedOnGpu);
  if ((cpu_intensity.size(0) == 0) || (cpu_intensity.size(1) == 0) ||
      (cpu_indices.size(0) == 0)) {
    b_cpu_outIntensity.set_size(0);
    b_gpu_outIntensity.set_size(&b_cpu_outIntensity);
  } else {
    c_cpu_outIndex.set_size(cpu_indices.size(0));
    gpu_outIndex.set_size(&c_cpu_outIndex);
    indices = cpu_indices.size(0) - 1;
    validLaunchParams = mwGetLaunchParameters1D(
        static_cast<double>(indices + 1LL), &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      if (*indices_outdatedOnGpu) {
        arrayCopyCpuToGpu(gpu_indices, cpu_indices);
      }
      *indices_outdatedOnGpu = false;
      PointCloudImpl_subsetImpl_kernel11<<<grid, block>>>(gpu_indices, indices,
                                                          gpu_outIndex);
    }
    if (c_cpu_outIndex.size(0) != 1) {
      mwCallThrustScan1D(&(gpu_outIndex.data())[0], false,
                         c_cpu_outIndex.size(0));
    }
    PointCloudImpl_subsetImpl_kernel12<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(
        gpu_outIndex, gpu_outSize);
    cudaMemcpy(&c_cpu_outSize, gpu_outSize, 8ULL, cudaMemcpyDeviceToHost);
    b_cpu_outIntensity.set_size(static_cast<int>(c_cpu_outSize));
    b_gpu_outIntensity.set_size(&b_cpu_outIntensity);
    indices = cpu_indices.size(0);
    validLaunchParams = mwGetLaunchParameters1D(static_cast<double>(indices),
                                                &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      arrayCopyCpuToGpu(gpu_intensity, cpu_intensity);
      if (*indices_outdatedOnGpu) {
        arrayCopyCpuToGpu(gpu_indices, cpu_indices);
      }
      *indices_outdatedOnGpu = false;
      PointCloudImpl_subsetImpl_kernel13<<<grid, block>>>(
          gpu_intensity, c_cpu_outSize, gpu_outIndex, gpu_indices, indices,
          b_gpu_outIntensity);
    }
  }
  cpu_outIntensity.set_size(b_cpu_outIntensity.size(0), 1);
  if (!*outIntensity_outdatedOnGpu) {
    gpu_outIntensity.set_size(&cpu_outIntensity);
  }
  indices = b_cpu_outIntensity.size(0) - 1;
  validLaunchParams = mwGetLaunchParameters1D(
      static_cast<double>(indices + 1LL), &grid, &block, 1024U, 65535U);
  if (validLaunchParams) {
    if (*outIntensity_outdatedOnGpu) {
      arrayCopyCpuToGpu(gpu_outIntensity, cpu_outIntensity);
    }
    PointCloudImpl_subsetImpl_kernel14<<<grid, block>>>(
        b_gpu_outIntensity, indices, gpu_outIntensity);
    *outIntensity_outdatedOnGpu = false;
    *outIntensity_outdatedOnCpu = true;
  }
  getSubsetPoints_anonFcn2(
      *(array<float, 2U> *)&cpu_rangeData, gpu_rangeData,
      &rangeData_outdatedOnGpu, cpu_indices, indices_outdatedOnCpu, gpu_indices,
      indices_outdatedOnGpu, cpu_outRangeData, outRangeData_outdatedOnCpu,
      gpu_outRangeData, outRangeData_outdatedOnGpu);
  if (outLoc_outdatedOnCpu) {
    arrayCopyGpuToCpu(cpu_outLoc, gpu_outLoc);
  }
  cudaFree(c_gpu_outSize);
  cudaFree(b_gpu_outSize);
  cudaFree(gpu_outSize);
}

} // namespace gpu
} // namespace codegen
} // namespace internal
} // namespace vision
} // namespace coder

//
// File trailer for PointCloudImpl.cu
//
// [EOF]
//
