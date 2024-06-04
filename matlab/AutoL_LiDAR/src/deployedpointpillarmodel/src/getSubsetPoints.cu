//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: getSubsetPoints.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
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
static __global__ void
getSubsetPoints_anonFcn2_kernel15(const coder::gpu_array<double, 1U> outIndex,
                                  double *outSize);

static __global__ void getSubsetPoints_anonFcn2_kernel16(
    const double numElements, const coder::gpu_array<float, 2U> property,
    const double outSize, const coder::gpu_array<double, 1U> outIndex,
    const coder::gpu_array<bool, 1U> indices, const int b_indices,
    coder::gpu_array<float, 2U> varargout_1);

// Function Definitions
//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const coder::gpu_array<double, 1U> outIndex
//                double *outSize
// Return Type  : void
//
static __global__
    __launch_bounds__(32, 1) void getSubsetPoints_anonFcn2_kernel15(
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
//                const coder::gpu_array<float, 2U> property
//                const double outSize
//                const coder::gpu_array<double, 1U> outIndex
//                const coder::gpu_array<bool, 1U> indices
//                const int b_indices
//                coder::gpu_array<float, 2U> varargout_1
// Return Type  : void
//
static __global__
    __launch_bounds__(1024, 1) void getSubsetPoints_anonFcn2_kernel16(
        const double numElements, const coder::gpu_array<float, 2U> property,
        const double outSize, const coder::gpu_array<double, 1U> outIndex,
        const coder::gpu_array<bool, 1U> indices, const int b_indices,
        coder::gpu_array<float, 2U> varargout_1)
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
      varargout_1[static_cast<int>(outIndex[itr] +
                                   static_cast<double>(col) * outSize) -
                  1] =
          property[static_cast<int>((static_cast<double>(itr) + 1.0) +
                                    static_cast<double>(col) * numElements) -
                   1];
    }
  }
}

//
// Arguments    : array<float, 2U> &cpu_property
//                gpu_array<float, 2U> &gpu_property
//                bool *property_outdatedOnGpu
//                array<bool, 1U> &cpu_indices
//                bool *indices_outdatedOnCpu
//                gpu_array<bool, 1U> &gpu_indices
//                bool *indices_outdatedOnGpu
//                array<float, 2U> &cpu_varargout_1
//                bool *varargout_1_outdatedOnCpu
//                gpu_array<float, 2U> &gpu_varargout_1
//                bool *varargout_1_outdatedOnGpu
// Return Type  : void
//
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
    bool *varargout_1_outdatedOnGpu)
{
  array<double, 1U> cpu_outIndex;
  gpu_array<double, 1U> gpu_outIndex;
  dim3 block;
  dim3 grid;
  double cpu_outSize;
  double *gpu_outSize;
  bool outIndex_outdatedOnGpu;
  cudaMalloc(&gpu_outSize, 8ULL);
  outIndex_outdatedOnGpu = false;
  if ((cpu_property.size(0) == 0) || (cpu_property.size(1) == 0) ||
      (cpu_indices.size(0) == 0)) {
    cpu_varargout_1.set_size(0, 3);
    if (!*varargout_1_outdatedOnGpu) {
      gpu_varargout_1.set_size(&cpu_varargout_1);
    }
  } else {
    double numElements;
    int i;
    numElements =
        static_cast<double>(cpu_property.size(0) * cpu_property.size(1)) / 3.0;
    cpu_outIndex.set_size(cpu_indices.size(0));
    gpu_outIndex.set_size(&cpu_outIndex);
    for (i = 0; i < cpu_indices.size(0); i++) {
      if (*indices_outdatedOnCpu) {
        arrayCopyGpuToCpu(cpu_indices, gpu_indices);
      }
      *indices_outdatedOnCpu = false;
      cpu_outIndex[i] = cpu_indices[i];
      outIndex_outdatedOnGpu = true;
    }
    if (cpu_outIndex.size(0) != 1) {
      if (outIndex_outdatedOnGpu) {
        arrayCopyCpuToGpu(gpu_outIndex, cpu_outIndex);
      }
      mwCallThrustScan1D(&(gpu_outIndex.data())[0], false,
                         cpu_outIndex.size(0));
      outIndex_outdatedOnGpu = false;
    }
    if (outIndex_outdatedOnGpu) {
      arrayCopyCpuToGpu(gpu_outIndex, cpu_outIndex);
    }
    getSubsetPoints_anonFcn2_kernel15<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(
        gpu_outIndex, gpu_outSize);
    cudaMemcpy(&cpu_outSize, gpu_outSize, 8ULL, cudaMemcpyDeviceToHost);
    cpu_varargout_1.set_size(static_cast<int>(cpu_outSize), 3);
    if (!*varargout_1_outdatedOnGpu) {
      gpu_varargout_1.set_size(&cpu_varargout_1);
    }
    i = cpu_indices.size(0) - 1;
    outIndex_outdatedOnGpu = mwGetLaunchParameters1D(
        static_cast<double>((i + 1LL) * 3LL), &grid, &block, 1024U, 65535U);
    if (outIndex_outdatedOnGpu) {
      if (*property_outdatedOnGpu) {
        arrayCopyCpuToGpu(gpu_property, cpu_property);
      }
      *property_outdatedOnGpu = false;
      if (*indices_outdatedOnGpu) {
        arrayCopyCpuToGpu(gpu_indices, cpu_indices);
      }
      *indices_outdatedOnGpu = false;
      if (*varargout_1_outdatedOnGpu) {
        arrayCopyCpuToGpu(gpu_varargout_1, cpu_varargout_1);
      }
      getSubsetPoints_anonFcn2_kernel16<<<grid, block>>>(
          numElements, gpu_property, cpu_outSize, gpu_outIndex, gpu_indices, i,
          gpu_varargout_1);
      *varargout_1_outdatedOnGpu = false;
      *varargout_1_outdatedOnCpu = true;
    }
  }
  cudaFree(gpu_outSize);
}

} // namespace gpu
} // namespace codegen
} // namespace internal
} // namespace vision
} // namespace coder

//
// File trailer for getSubsetPoints.cu
//
// [EOF]
//
