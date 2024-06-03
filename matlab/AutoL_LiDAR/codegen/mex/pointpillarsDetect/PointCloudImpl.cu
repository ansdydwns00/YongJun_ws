//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// PointCloudImpl.cu
//
// Code generation for function 'PointCloudImpl'
//

// Include files
#include "PointCloudImpl.h"
#include "pointpillarsDetect_data.h"
#include "pointpillarsDetect_emxutil.h"
#include "pointpillarsDetect_mexutil.h"
#include "pointpillarsDetect_types.h"
#include "rt_nonfinite.h"
#include "MWCudaDimUtility.hpp"
#include "MWCudaMemoryFunctions.hpp"
#include "MWLaunchParametersUtilities.hpp"
#include "MWScanFunctors.h"
#include "MWScanUtility.h"
#include "MWShuffleUtility.h"

// Variable Definitions
static emlrtRTEInfo k_emlrtRTEI{
    1,                // lineNo
    1,                // colNo
    "PointCloudImpl", // fName
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+codegen/"
    "+gpu/PointCloudImpl.p" // pName
};

static emlrtRTEInfo l_emlrtRTEI{
    1,                 // lineNo
    1,                 // colNo
    "getSubsetPoints", // fName
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/+vision/+internal/+codegen/"
    "+gpu/getSubsetPoints.p" // pName
};

// Function Declarations
static __global__ void c_PointCloudImpl_extractValidPo(
    const real_T numPoints, const emxArray_real32_T ptCloudCoords,
    const int32_T b, emxArray_boolean_T validCoords);

static __global__ void
c_PointCloudImpl_subsetImpl_ker(const emxArray_real32_T outIntensity,
                                const int32_T b_outIntensity,
                                emxArray_real32_T c_outIntensity);

static __global__ void
d_PointCloudImpl_subsetImpl_ker(const emxArray_boolean_T indices,
                                const int32_T b_indices,
                                emxArray_real_T outIndex);

static __global__ void
e_PointCloudImpl_subsetImpl_ker(const emxArray_real_T outIndex, real_T *outSize,
                                int32_T outIndex_dim0);

static __global__ void f_PointCloudImpl_subsetImpl_ker(
    const emxArray_real32_T rangeData, const real_T numElements,
    const real_T outSize, const emxArray_real_T outIndex,
    const emxArray_boolean_T indices, const int32_T b_indices,
    emxArray_real32_T outRangeData);

static __global__ void
g_PointCloudImpl_subsetImpl_ker(const emxArray_boolean_T indices,
                                const int32_T b_indices,
                                emxArray_real_T outIndex);

static void gpuEmxEnsureCapacity_boolean_T(const emxArray_boolean_T *cpu,
                                           emxArray_boolean_T *gpu,
                                           boolean_T needsCopy);

static void gpuEmxEnsureCapacity_real32_T(const emxArray_real32_T *cpu,
                                          emxArray_real32_T *gpu,
                                          boolean_T needsCopy);

static void gpuEmxMemcpyCpuToGpu_boolean_T(emxArray_boolean_T *gpu,
                                           const emxArray_boolean_T *cpu);

static void gpuEmxMemcpyCpuToGpu_real32_T(emxArray_real32_T *gpu,
                                          const emxArray_real32_T *cpu);

static __global__ void
h_PointCloudImpl_subsetImpl_ker(const emxArray_real_T outIndex, real_T *outSize,
                                int32_T outIndex_dim0);

static __global__ void i_PointCloudImpl_subsetImpl_ker(
    const emxArray_real32_T intensity, const real_T outSize,
    const emxArray_real_T outIndex, const emxArray_boolean_T indices,
    const int32_T b, emxArray_real32_T outIntensity);

static __global__ void
j_PointCloudImpl_subsetImpl_ker(const emxArray_boolean_T indices,
                                const int32_T b_indices,
                                emxArray_real_T outIndex);

static __global__ void
k_PointCloudImpl_subsetImpl_ker(const emxArray_real_T outIndex, real_T *outSize,
                                int32_T outIndex_dim0);

static __global__ void l_PointCloudImpl_subsetImpl_ker(
    const emxArray_real32_T normal, const real_T numElements,
    const real_T outSize, const emxArray_real_T outIndex,
    const emxArray_boolean_T indices, const int32_T b_indices,
    emxArray_real32_T outNorm);

static __global__ void
m_PointCloudImpl_subsetImpl_ker(const emxArray_boolean_T indices,
                                const int32_T b_indices,
                                emxArray_real_T outIndex);

static __global__ void
n_PointCloudImpl_subsetImpl_ker(const emxArray_real_T outIndex, real_T *outSize,
                                int32_T outIndex_dim0);

static __global__ void o_PointCloudImpl_subsetImpl_ker(
    const emxArray_uint8_T color, const real_T numElements,
    const real_T outSize, const emxArray_real_T outIndex,
    const emxArray_boolean_T indices, const int32_T b_indices,
    emxArray_uint8_T outCol);

static __global__ void
p_PointCloudImpl_subsetImpl_ker(const emxArray_boolean_T indices,
                                const int32_T b_indices,
                                emxArray_real_T outIndex);

static __global__ void
q_PointCloudImpl_subsetImpl_ker(const emxArray_real_T outIndex, real_T *outSize,
                                int32_T outIndex_dim0);

static __global__ void r_PointCloudImpl_subsetImpl_ker(
    const emxArray_real32_T location, const real_T numElements,
    const real_T outSize, const emxArray_real_T outIndex,
    const emxArray_boolean_T indices, const int32_T b_indices,
    emxArray_real32_T outLoc);

// Function Definitions
static __global__
    __launch_bounds__(1024, 1) void c_PointCloudImpl_extractValidPo(
        const real_T numPoints, const emxArray_real32_T ptCloudCoords,
        const int32_T b, emxArray_boolean_T validCoords)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    if ((static_cast<boolean_T>(
            !static_cast<int32_T>(isinf(ptCloudCoords.data[i])))) &&
        (static_cast<boolean_T>(
            !static_cast<int32_T>(isnan(ptCloudCoords.data[i]))))) {
      real32_T x;
      x = ptCloudCoords.data[i + static_cast<int32_T>(numPoints)];
      if ((static_cast<boolean_T>(!static_cast<int32_T>(isinf(x)))) &&
          (static_cast<boolean_T>(!static_cast<int32_T>(isnan(x))))) {
        x = ptCloudCoords.data[i + (static_cast<int32_T>(numPoints) << 1)];
        if ((static_cast<boolean_T>(!static_cast<int32_T>(isinf(x)))) &&
            (static_cast<boolean_T>(!static_cast<int32_T>(isnan(x))))) {
          validCoords.data[i] = true;
        } else {
          validCoords.data[i] = false;
        }
      } else {
        validCoords.data[i] = false;
      }
    } else {
      validCoords.data[i] = false;
    }
  }
}

static __global__
    __launch_bounds__(1024, 1) void c_PointCloudImpl_subsetImpl_ker(
        const emxArray_real32_T outIntensity, const int32_T b_outIntensity,
        emxArray_real32_T c_outIntensity)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_outIntensity);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T col;
    col = static_cast<int32_T>(idx);
    c_outIntensity.data[col] = outIntensity.data[col];
  }
}

static __global__
    __launch_bounds__(1024, 1) void d_PointCloudImpl_subsetImpl_ker(
        const emxArray_boolean_T indices, const int32_T b_indices,
        emxArray_real_T outIndex)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_indices);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T col;
    col = static_cast<int32_T>(idx);
    outIndex.data[col] = static_cast<real_T>(indices.data[col]);
  }
}

static __global__ __launch_bounds__(32, 1) void e_PointCloudImpl_subsetImpl_ker(
    const emxArray_real_T outIndex, real_T *outSize, int32_T outIndex_dim0)
{
  int32_T i;
  i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (i < 2) {
    *outSize = outIndex.data[outIndex_dim0 - 1];
  }
}

static __global__
    __launch_bounds__(1024, 1) void f_PointCloudImpl_subsetImpl_ker(
        const emxArray_real32_T rangeData, const real_T numElements,
        const real_T outSize, const emxArray_real_T outIndex,
        const emxArray_boolean_T indices, const int32_T b_indices,
        emxArray_real32_T outRangeData)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = 3UL * (static_cast<uint64_T>(b_indices) + 1UL) - 1UL;
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T col;
    int32_T itr;
    itr = static_cast<int32_T>(idx % (static_cast<uint64_T>(b_indices) + 1UL));
    col = static_cast<int32_T>((idx - static_cast<uint64_T>(itr)) /
                               (static_cast<uint64_T>(b_indices) + 1UL));
    if (indices.data[itr]) {
      outRangeData
          .data[static_cast<int32_T>(outIndex.data[itr] +
                                     static_cast<real_T>(col) * outSize) -
                1] =
          rangeData.data[static_cast<int32_T>((static_cast<real_T>(itr) + 1.0) +
                                              static_cast<real_T>(col) *
                                                  numElements) -
                         1];
    }
  }
}

static __global__
    __launch_bounds__(1024, 1) void g_PointCloudImpl_subsetImpl_ker(
        const emxArray_boolean_T indices, const int32_T b_indices,
        emxArray_real_T outIndex)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_indices);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T col;
    col = static_cast<int32_T>(idx);
    outIndex.data[col] = static_cast<real_T>(indices.data[col]);
  }
}

static void gpuEmxEnsureCapacity_boolean_T(const emxArray_boolean_T *cpu,
                                           emxArray_boolean_T *gpu,
                                           boolean_T needsCopy)
{
  int32_T i;
  int32_T totalSizeCpu;
  int32_T totalSizeGpu;
  boolean_T *newData;
  if (gpu->numDimensions == 0) {
    gpu->numDimensions = cpu->numDimensions;
    gpu->size = static_cast<int32_T *>(emlrtCallocMex(
        static_cast<uint32_T>(gpu->numDimensions), sizeof(int32_T)));
  }
  totalSizeCpu = 1;
  totalSizeGpu = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    totalSizeGpu *= gpu->size[i];
    totalSizeCpu *= cpu->size[i];
    gpu->size[i] = cpu->size[i];
  }
  if (gpu->allocatedSize < totalSizeCpu) {
    i = cpu->allocatedSize;
    if (i < totalSizeCpu) {
      i = totalSizeCpu;
    }
    checkCudaError(
        mwCudaMalloc(&newData, static_cast<uint32_T>(i) * sizeof(boolean_T)),
        __FILE__, __LINE__);
    needsCopy = (needsCopy && gpu->canFreeData);
    if (needsCopy) {
      checkCudaError(
          cudaMemcpy(newData, gpu->data,
                     static_cast<uint32_T>(totalSizeGpu) * sizeof(boolean_T),
                     cudaMemcpyDeviceToDevice),
          __FILE__, __LINE__);
    }
    if (gpu->canFreeData) {
      checkCudaError(mwCudaFree(gpu->data), __FILE__, __LINE__);
    }
    gpu->data = newData;
    gpu->allocatedSize = i;
    gpu->canFreeData = true;
  }
}

static void gpuEmxEnsureCapacity_real32_T(const emxArray_real32_T *cpu,
                                          emxArray_real32_T *gpu,
                                          boolean_T needsCopy)
{
  int32_T i;
  int32_T totalSizeCpu;
  int32_T totalSizeGpu;
  real32_T *newData;
  if (gpu->numDimensions == 0) {
    gpu->numDimensions = cpu->numDimensions;
    gpu->size = static_cast<int32_T *>(emlrtCallocMex(
        static_cast<uint32_T>(gpu->numDimensions), sizeof(int32_T)));
  }
  totalSizeCpu = 1;
  totalSizeGpu = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    totalSizeGpu *= gpu->size[i];
    totalSizeCpu *= cpu->size[i];
    gpu->size[i] = cpu->size[i];
  }
  if (gpu->allocatedSize < totalSizeCpu) {
    i = cpu->allocatedSize;
    if (i < totalSizeCpu) {
      i = totalSizeCpu;
    }
    checkCudaError(
        mwCudaMalloc(&newData, static_cast<uint32_T>(i) * sizeof(real32_T)),
        __FILE__, __LINE__);
    needsCopy = (needsCopy && gpu->canFreeData);
    if (needsCopy) {
      checkCudaError(
          cudaMemcpy(newData, gpu->data,
                     static_cast<uint32_T>(totalSizeGpu) * sizeof(real32_T),
                     cudaMemcpyDeviceToDevice),
          __FILE__, __LINE__);
    }
    if (gpu->canFreeData) {
      checkCudaError(mwCudaFree(gpu->data), __FILE__, __LINE__);
    }
    gpu->data = newData;
    gpu->allocatedSize = i;
    gpu->canFreeData = true;
  }
}

static void gpuEmxMemcpyCpuToGpu_boolean_T(emxArray_boolean_T *gpu,
                                           const emxArray_boolean_T *cpu)
{
  int32_T actualSize;
  actualSize = 1;
  for (int32_T i{0}; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }
  checkCudaError(
      cudaMemcpy(gpu->data, cpu->data,
                 static_cast<uint32_T>(actualSize) * sizeof(boolean_T),
                 cudaMemcpyHostToDevice),
      __FILE__, __LINE__);
}

static void gpuEmxMemcpyCpuToGpu_real32_T(emxArray_real32_T *gpu,
                                          const emxArray_real32_T *cpu)
{
  int32_T actualSize;
  actualSize = 1;
  for (int32_T i{0}; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }
  checkCudaError(
      cudaMemcpy(gpu->data, cpu->data,
                 static_cast<uint32_T>(actualSize) * sizeof(real32_T),
                 cudaMemcpyHostToDevice),
      __FILE__, __LINE__);
}

static __global__ __launch_bounds__(32, 1) void h_PointCloudImpl_subsetImpl_ker(
    const emxArray_real_T outIndex, real_T *outSize, int32_T outIndex_dim0)
{
  int32_T i;
  i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (i < 2) {
    *outSize = outIndex.data[outIndex_dim0 - 1];
  }
}

static __global__
    __launch_bounds__(1024, 1) void i_PointCloudImpl_subsetImpl_ker(
        const emxArray_real32_T intensity, const real_T outSize,
        const emxArray_real_T outIndex, const emxArray_boolean_T indices,
        const int32_T b, emxArray_real32_T outIntensity)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T itr;
    itr = static_cast<int32_T>(idx);
    if (indices.data[itr]) {
      outIntensity
          .data[static_cast<int32_T>(outIndex.data[itr] + 0.0 * outSize) - 1] =
          intensity.data[itr];
    }
  }
}

static __global__
    __launch_bounds__(1024, 1) void j_PointCloudImpl_subsetImpl_ker(
        const emxArray_boolean_T indices, const int32_T b_indices,
        emxArray_real_T outIndex)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_indices);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T col;
    col = static_cast<int32_T>(idx);
    outIndex.data[col] = static_cast<real_T>(indices.data[col]);
  }
}

static __global__ __launch_bounds__(32, 1) void k_PointCloudImpl_subsetImpl_ker(
    const emxArray_real_T outIndex, real_T *outSize, int32_T outIndex_dim0)
{
  int32_T i;
  i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (i < 2) {
    *outSize = outIndex.data[outIndex_dim0 - 1];
  }
}

static __global__
    __launch_bounds__(1024, 1) void l_PointCloudImpl_subsetImpl_ker(
        const emxArray_real32_T normal, const real_T numElements,
        const real_T outSize, const emxArray_real_T outIndex,
        const emxArray_boolean_T indices, const int32_T b_indices,
        emxArray_real32_T outNorm)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = 3UL * (static_cast<uint64_T>(b_indices) + 1UL) - 1UL;
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T col;
    int32_T itr;
    itr = static_cast<int32_T>(idx % (static_cast<uint64_T>(b_indices) + 1UL));
    col = static_cast<int32_T>((idx - static_cast<uint64_T>(itr)) /
                               (static_cast<uint64_T>(b_indices) + 1UL));
    if (indices.data[itr]) {
      outNorm.data[static_cast<int32_T>(outIndex.data[itr] +
                                        static_cast<real_T>(col) * outSize) -
                   1] =
          normal.data[static_cast<int32_T>((static_cast<real_T>(itr) + 1.0) +
                                           static_cast<real_T>(col) *
                                               numElements) -
                      1];
    }
  }
}

static __global__
    __launch_bounds__(1024, 1) void m_PointCloudImpl_subsetImpl_ker(
        const emxArray_boolean_T indices, const int32_T b_indices,
        emxArray_real_T outIndex)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_indices);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T col;
    col = static_cast<int32_T>(idx);
    outIndex.data[col] = static_cast<real_T>(indices.data[col]);
  }
}

static __global__ __launch_bounds__(32, 1) void n_PointCloudImpl_subsetImpl_ker(
    const emxArray_real_T outIndex, real_T *outSize, int32_T outIndex_dim0)
{
  int32_T i;
  i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (i < 2) {
    *outSize = outIndex.data[outIndex_dim0 - 1];
  }
}

static __global__
    __launch_bounds__(1024, 1) void o_PointCloudImpl_subsetImpl_ker(
        const emxArray_uint8_T color, const real_T numElements,
        const real_T outSize, const emxArray_real_T outIndex,
        const emxArray_boolean_T indices, const int32_T b_indices,
        emxArray_uint8_T outCol)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = 3UL * (static_cast<uint64_T>(b_indices) + 1UL) - 1UL;
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T col;
    int32_T itr;
    itr = static_cast<int32_T>(idx % (static_cast<uint64_T>(b_indices) + 1UL));
    col = static_cast<int32_T>((idx - static_cast<uint64_T>(itr)) /
                               (static_cast<uint64_T>(b_indices) + 1UL));
    if (indices.data[itr]) {
      outCol.data[static_cast<int32_T>(outIndex.data[itr] +
                                       static_cast<real_T>(col) * outSize) -
                  1] =
          color.data[static_cast<int32_T>((static_cast<real_T>(itr) + 1.0) +
                                          static_cast<real_T>(col) *
                                              numElements) -
                     1];
    }
  }
}

static __global__
    __launch_bounds__(1024, 1) void p_PointCloudImpl_subsetImpl_ker(
        const emxArray_boolean_T indices, const int32_T b_indices,
        emxArray_real_T outIndex)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_indices);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T col;
    col = static_cast<int32_T>(idx);
    outIndex.data[col] = static_cast<real_T>(indices.data[col]);
  }
}

static __global__ __launch_bounds__(32, 1) void q_PointCloudImpl_subsetImpl_ker(
    const emxArray_real_T outIndex, real_T *outSize, int32_T outIndex_dim0)
{
  int32_T i;
  i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (i < 2) {
    *outSize = outIndex.data[outIndex_dim0 - 1];
  }
}

static __global__
    __launch_bounds__(1024, 1) void r_PointCloudImpl_subsetImpl_ker(
        const emxArray_real32_T location, const real_T numElements,
        const real_T outSize, const emxArray_real_T outIndex,
        const emxArray_boolean_T indices, const int32_T b_indices,
        emxArray_real32_T outLoc)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = 3UL * (static_cast<uint64_T>(b_indices) + 1UL) - 1UL;
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T col;
    int32_T itr;
    itr = static_cast<int32_T>(idx % (static_cast<uint64_T>(b_indices) + 1UL));
    col = static_cast<int32_T>((idx - static_cast<uint64_T>(itr)) /
                               (static_cast<uint64_T>(b_indices) + 1UL));
    if (indices.data[itr]) {
      outLoc.data[static_cast<int32_T>(outIndex.data[itr] +
                                       static_cast<real_T>(col) * outSize) -
                  1] =
          location.data[static_cast<int32_T>((static_cast<real_T>(itr) + 1.0) +
                                             static_cast<real_T>(col) *
                                                 numElements) -
                        1];
    }
  }
}

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
    emxArray_real32_T *gpu_outRangeData, boolean_T *outRangeData_outdatedOnGpu)
{
  dim3 block;
  dim3 grid;
  emxArray_real32_T b_gpu_outIntensity;
  emxArray_real32_T gpu_intensity;
  emxArray_real32_T gpu_location;
  emxArray_real32_T gpu_normal;
  emxArray_real32_T gpu_rangeData;
  emxArray_real32_T *b_cpu_outIntensity;
  emxArray_real_T b_gpu_outIndex;
  emxArray_real_T c_gpu_outIndex;
  emxArray_real_T d_gpu_outIndex;
  emxArray_real_T e_gpu_outIndex;
  emxArray_real_T gpu_outIndex;
  emxArray_real_T *b_cpu_outIndex;
  emxArray_real_T *c_cpu_outIndex;
  emxArray_real_T *cpu_outIndex;
  emxArray_real_T *d_cpu_outIndex;
  emxArray_real_T *e_cpu_outIndex;
  emxArray_uint8_T gpu_color;
  real_T b_cpu_outSize;
  real_T c_cpu_outSize;
  real_T cpu_outSize;
  real_T d_cpu_outSize;
  real_T e_cpu_outSize;
  real_T numElements;
  real_T *b_gpu_outSize;
  real_T *c_gpu_outSize;
  real_T *d_gpu_outSize;
  real_T *e_gpu_outSize;
  real_T *gpu_outSize;
  int32_T i;
  boolean_T c_outIntensity_needsGpuEnsureCa;
  boolean_T indices_needsGpuEnsureCapacity;
  boolean_T validLaunchParams;
  checkCudaError(mwCudaMalloc(&gpu_outSize, 8UL), __FILE__, __LINE__);
  gpuEmxReset_real_T(&gpu_outIndex);
  checkCudaError(mwCudaMalloc(&b_gpu_outSize, 8UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&c_gpu_outSize, 8UL), __FILE__, __LINE__);
  gpuEmxReset_real32_T(&b_gpu_outIntensity);
  gpuEmxReset_real_T(&b_gpu_outIndex);
  checkCudaError(mwCudaMalloc(&d_gpu_outSize, 8UL), __FILE__, __LINE__);
  gpuEmxReset_real_T(&c_gpu_outIndex);
  checkCudaError(mwCudaMalloc(&e_gpu_outSize, 8UL), __FILE__, __LINE__);
  gpuEmxReset_real_T(&d_gpu_outIndex);
  gpuEmxReset_real_T(&e_gpu_outIndex);
  gpuEmxReset_real32_T(&gpu_rangeData);
  gpuEmxReset_real32_T(&gpu_intensity);
  gpuEmxReset_real32_T(&gpu_normal);
  gpuEmxReset_uint8_T(&gpu_color);
  gpuEmxReset_real32_T(&gpu_location);
  c_outIntensity_needsGpuEnsureCa = true;
  indices_needsGpuEnsureCapacity = true;
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);
  emxInit_real_T(&cpu_outIndex, 1, &l_emlrtRTEI, true);
  if ((cpu_location->size[0] == 0) || (cpu_indices->size[0] == 0)) {
    *outLoc_outdatedOnCpu = false;
    cpu_outLoc->size[0] = 0;
    cpu_outLoc->size[1] = 3;
  } else {
    numElements = static_cast<real_T>(cpu_location->size[0] * 3) / 3.0;
    i = cpu_outIndex->size[0];
    cpu_outIndex->size[0] = cpu_indices->size[0];
    emxEnsureCapacity_real_T(cpu_outIndex, i, &l_emlrtRTEI);
    i = cpu_indices->size[0] - 1;
    mwGetLaunchParameters1D(computeNumIters(i), &grid, &block, 2147483647U);
    gpuEmxEnsureCapacity_boolean_T(cpu_indices, gpu_indices,
                                   !*indices_outdatedOnGpu);
    gpuEmxEnsureCapacity_real_T(cpu_outIndex, &e_gpu_outIndex, true);
    if (*indices_outdatedOnGpu) {
      gpuEmxMemcpyCpuToGpu_boolean_T(gpu_indices, cpu_indices);
    }
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      p_PointCloudImpl_subsetImpl_ker<<<grid, block>>>(*gpu_indices, i,
                                                       e_gpu_outIndex);
    }
    if (cpu_outIndex->size[0] != 1) {
      mwCallThrustScan1D(&e_gpu_outIndex.data[0], false, cpu_outIndex->size[0]);
    }
    q_PointCloudImpl_subsetImpl_ker<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(
        e_gpu_outIndex, e_gpu_outSize, cpu_outIndex->size[0U]);
    i = cpu_outLoc->size[0] * cpu_outLoc->size[1];
    checkCudaError(
        cudaMemcpy(&cpu_outSize, e_gpu_outSize, 8UL, cudaMemcpyDeviceToHost),
        __FILE__, __LINE__);
    cpu_outLoc->size[0] = static_cast<int32_T>(cpu_outSize);
    cpu_outLoc->size[1] = 3;
    emxEnsureCapacity_real32_T(cpu_outLoc, i, &l_emlrtRTEI);
    i = cpu_indices->size[0] - 1;
    mwGetLaunchParameters1D(computeNumIters(2, i), &grid, &block, 2147483647U);
    gpuEmxEnsureCapacity_real32_T(cpu_location, &gpu_location, false);
    indices_needsGpuEnsureCapacity = false;
    gpuEmxEnsureCapacity_real32_T(cpu_outLoc, gpu_outLoc, true);
    gpuEmxMemcpyCpuToGpu_real32_T(&gpu_location, cpu_location);
    *indices_outdatedOnGpu = false;
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      r_PointCloudImpl_subsetImpl_ker<<<grid, block>>>(
          gpu_location, numElements, cpu_outSize, e_gpu_outIndex, *gpu_indices,
          i, *gpu_outLoc);
    }
    *outLoc_outdatedOnCpu = true;
  }
  emxFree_real_T(&cpu_outIndex);
  emxInit_real_T(&b_cpu_outIndex, 1, &l_emlrtRTEI, true);
  if ((cpu_color->size[0] == 0) || (cpu_color->size[1] == 0) ||
      (cpu_indices->size[0] == 0)) {
    *outCol_outdatedOnCpu = false;
    cpu_outCol->size[0] = 0;
    cpu_outCol->size[1] = 3;
  } else {
    numElements =
        static_cast<real_T>(cpu_color->size[0] * cpu_color->size[1]) / 3.0;
    i = b_cpu_outIndex->size[0];
    b_cpu_outIndex->size[0] = cpu_indices->size[0];
    emxEnsureCapacity_real_T(b_cpu_outIndex, i, &l_emlrtRTEI);
    i = cpu_indices->size[0] - 1;
    mwGetLaunchParameters1D(computeNumIters(i), &grid, &block, 2147483647U);
    if (indices_needsGpuEnsureCapacity) {
      gpuEmxEnsureCapacity_boolean_T(cpu_indices, gpu_indices,
                                     !*indices_outdatedOnGpu);
    }
    gpuEmxEnsureCapacity_real_T(b_cpu_outIndex, &d_gpu_outIndex, true);
    if (*indices_outdatedOnGpu) {
      gpuEmxMemcpyCpuToGpu_boolean_T(gpu_indices, cpu_indices);
    }
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      m_PointCloudImpl_subsetImpl_ker<<<grid, block>>>(*gpu_indices, i,
                                                       d_gpu_outIndex);
    }
    if (b_cpu_outIndex->size[0] != 1) {
      mwCallThrustScan1D(&d_gpu_outIndex.data[0], false,
                         b_cpu_outIndex->size[0]);
    }
    n_PointCloudImpl_subsetImpl_ker<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(
        d_gpu_outIndex, d_gpu_outSize, b_cpu_outIndex->size[0U]);
    i = cpu_outCol->size[0] * cpu_outCol->size[1];
    checkCudaError(
        cudaMemcpy(&b_cpu_outSize, d_gpu_outSize, 8UL, cudaMemcpyDeviceToHost),
        __FILE__, __LINE__);
    cpu_outCol->size[0] = static_cast<int32_T>(b_cpu_outSize);
    cpu_outCol->size[1] = 3;
    emxEnsureCapacity_uint8_T(cpu_outCol, i, &l_emlrtRTEI);
    i = cpu_indices->size[0] - 1;
    mwGetLaunchParameters1D(computeNumIters(2, i), &grid, &block, 2147483647U);
    gpuEmxEnsureCapacity_uint8_T(cpu_color, &gpu_color, false);
    indices_needsGpuEnsureCapacity = false;
    gpuEmxEnsureCapacity_uint8_T(cpu_outCol, gpu_outCol, true);
    gpuEmxMemcpyCpuToGpu_uint8_T(&gpu_color, cpu_color);
    *indices_outdatedOnGpu = false;
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      o_PointCloudImpl_subsetImpl_ker<<<grid, block>>>(
          gpu_color, numElements, b_cpu_outSize, d_gpu_outIndex, *gpu_indices,
          i, *gpu_outCol);
    }
    *outCol_outdatedOnCpu = true;
  }
  emxFree_real_T(&b_cpu_outIndex);
  emxInit_real_T(&c_cpu_outIndex, 1, &l_emlrtRTEI, true);
  if ((cpu_normal->size[0] == 0) || (cpu_normal->size[1] == 0) ||
      (cpu_indices->size[0] == 0)) {
    *outNorm_outdatedOnCpu = false;
    cpu_outNorm->size[0] = 0;
    cpu_outNorm->size[1] = 3;
  } else {
    numElements =
        static_cast<real_T>(cpu_normal->size[0] * cpu_normal->size[1]) / 3.0;
    i = c_cpu_outIndex->size[0];
    c_cpu_outIndex->size[0] = cpu_indices->size[0];
    emxEnsureCapacity_real_T(c_cpu_outIndex, i, &l_emlrtRTEI);
    i = cpu_indices->size[0] - 1;
    mwGetLaunchParameters1D(computeNumIters(i), &grid, &block, 2147483647U);
    if (indices_needsGpuEnsureCapacity) {
      gpuEmxEnsureCapacity_boolean_T(cpu_indices, gpu_indices,
                                     !*indices_outdatedOnGpu);
    }
    gpuEmxEnsureCapacity_real_T(c_cpu_outIndex, &c_gpu_outIndex, true);
    if (*indices_outdatedOnGpu) {
      gpuEmxMemcpyCpuToGpu_boolean_T(gpu_indices, cpu_indices);
    }
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      j_PointCloudImpl_subsetImpl_ker<<<grid, block>>>(*gpu_indices, i,
                                                       c_gpu_outIndex);
    }
    if (c_cpu_outIndex->size[0] != 1) {
      mwCallThrustScan1D(&c_gpu_outIndex.data[0], false,
                         c_cpu_outIndex->size[0]);
    }
    k_PointCloudImpl_subsetImpl_ker<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(
        c_gpu_outIndex, c_gpu_outSize, c_cpu_outIndex->size[0U]);
    i = cpu_outNorm->size[0] * cpu_outNorm->size[1];
    checkCudaError(
        cudaMemcpy(&c_cpu_outSize, c_gpu_outSize, 8UL, cudaMemcpyDeviceToHost),
        __FILE__, __LINE__);
    cpu_outNorm->size[0] = static_cast<int32_T>(c_cpu_outSize);
    cpu_outNorm->size[1] = 3;
    emxEnsureCapacity_real32_T(cpu_outNorm, i, &l_emlrtRTEI);
    i = cpu_indices->size[0] - 1;
    mwGetLaunchParameters1D(computeNumIters(2, i), &grid, &block, 2147483647U);
    gpuEmxEnsureCapacity_real32_T(cpu_normal, &gpu_normal, false);
    indices_needsGpuEnsureCapacity = false;
    gpuEmxEnsureCapacity_real32_T(cpu_outNorm, gpu_outNorm, true);
    gpuEmxMemcpyCpuToGpu_real32_T(&gpu_normal, cpu_normal);
    *indices_outdatedOnGpu = false;
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      l_PointCloudImpl_subsetImpl_ker<<<grid, block>>>(
          gpu_normal, numElements, c_cpu_outSize, c_gpu_outIndex, *gpu_indices,
          i, *gpu_outNorm);
    }
    *outNorm_outdatedOnCpu = true;
  }
  emxFree_real_T(&c_cpu_outIndex);
  emxInit_real_T(&d_cpu_outIndex, 1, &l_emlrtRTEI, true);
  emxInit_real32_T(&b_cpu_outIntensity, 1, &l_emlrtRTEI, true);
  if ((cpu_intensity->size[0] == 0) || (cpu_indices->size[0] == 0)) {
    b_cpu_outIntensity->size[0] = 0;
  } else {
    i = d_cpu_outIndex->size[0];
    d_cpu_outIndex->size[0] = cpu_indices->size[0];
    emxEnsureCapacity_real_T(d_cpu_outIndex, i, &l_emlrtRTEI);
    i = cpu_indices->size[0] - 1;
    mwGetLaunchParameters1D(computeNumIters(i), &grid, &block, 2147483647U);
    if (indices_needsGpuEnsureCapacity) {
      gpuEmxEnsureCapacity_boolean_T(cpu_indices, gpu_indices,
                                     !*indices_outdatedOnGpu);
    }
    gpuEmxEnsureCapacity_real_T(d_cpu_outIndex, &b_gpu_outIndex, true);
    if (*indices_outdatedOnGpu) {
      gpuEmxMemcpyCpuToGpu_boolean_T(gpu_indices, cpu_indices);
    }
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      g_PointCloudImpl_subsetImpl_ker<<<grid, block>>>(*gpu_indices, i,
                                                       b_gpu_outIndex);
    }
    if (d_cpu_outIndex->size[0] != 1) {
      mwCallThrustScan1D(&b_gpu_outIndex.data[0], false,
                         d_cpu_outIndex->size[0]);
    }
    h_PointCloudImpl_subsetImpl_ker<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(
        b_gpu_outIndex, b_gpu_outSize, d_cpu_outIndex->size[0U]);
    i = b_cpu_outIntensity->size[0];
    checkCudaError(
        cudaMemcpy(&d_cpu_outSize, b_gpu_outSize, 8UL, cudaMemcpyDeviceToHost),
        __FILE__, __LINE__);
    b_cpu_outIntensity->size[0] = static_cast<int32_T>(d_cpu_outSize);
    emxEnsureCapacity_real32_T(b_cpu_outIntensity, i, &l_emlrtRTEI);
    i = cpu_indices->size[0];
    mwGetLaunchParameters1D(computeNumIters(i - 1), &grid, &block, 2147483647U);
    gpuEmxEnsureCapacity_real32_T(cpu_intensity, &gpu_intensity, false);
    indices_needsGpuEnsureCapacity = false;
    gpuEmxEnsureCapacity_real32_T(b_cpu_outIntensity, &b_gpu_outIntensity,
                                  true);
    c_outIntensity_needsGpuEnsureCa = false;
    gpuEmxMemcpyCpuToGpu_real32_T(&gpu_intensity, cpu_intensity);
    *indices_outdatedOnGpu = false;
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      i_PointCloudImpl_subsetImpl_ker<<<grid, block>>>(
          gpu_intensity, d_cpu_outSize, b_gpu_outIndex, *gpu_indices, i - 1,
          b_gpu_outIntensity);
    }
  }
  emxFree_real_T(&d_cpu_outIndex);
  i = cpu_outIntensity->size[0] * cpu_outIntensity->size[1];
  cpu_outIntensity->size[0] = b_cpu_outIntensity->size[0];
  cpu_outIntensity->size[1] = 1;
  emxEnsureCapacity_real32_T(cpu_outIntensity, i, &l_emlrtRTEI);
  i = b_cpu_outIntensity->size[0] - 1;
  mwGetLaunchParameters1D(computeNumIters(i), &grid, &block, 2147483647U);
  if (c_outIntensity_needsGpuEnsureCa) {
    gpuEmxEnsureCapacity_real32_T(b_cpu_outIntensity, &b_gpu_outIntensity,
                                  true);
  }
  gpuEmxEnsureCapacity_real32_T(cpu_outIntensity, gpu_outIntensity, true);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    c_PointCloudImpl_subsetImpl_ker<<<grid, block>>>(b_gpu_outIntensity, i,
                                                     *gpu_outIntensity);
  }
  emxFree_real32_T(&b_cpu_outIntensity);
  emxInit_real_T(&e_cpu_outIndex, 1, &l_emlrtRTEI, true);
  if ((cpu_rangeData->size[0] == 0) || (cpu_rangeData->size[1] == 0) ||
      (cpu_indices->size[0] == 0)) {
    *outRangeData_outdatedOnCpu = false;
    cpu_outRangeData->size[0] = 0;
    cpu_outRangeData->size[1] = 3;
  } else {
    numElements =
        static_cast<real_T>(cpu_rangeData->size[0] * cpu_rangeData->size[1]) /
        3.0;
    i = e_cpu_outIndex->size[0];
    e_cpu_outIndex->size[0] = cpu_indices->size[0];
    emxEnsureCapacity_real_T(e_cpu_outIndex, i, &l_emlrtRTEI);
    i = cpu_indices->size[0] - 1;
    mwGetLaunchParameters1D(computeNumIters(i), &grid, &block, 2147483647U);
    if (indices_needsGpuEnsureCapacity) {
      gpuEmxEnsureCapacity_boolean_T(cpu_indices, gpu_indices,
                                     !*indices_outdatedOnGpu);
    }
    gpuEmxEnsureCapacity_real_T(e_cpu_outIndex, &gpu_outIndex, true);
    if (*indices_outdatedOnGpu) {
      gpuEmxMemcpyCpuToGpu_boolean_T(gpu_indices, cpu_indices);
    }
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      d_PointCloudImpl_subsetImpl_ker<<<grid, block>>>(*gpu_indices, i,
                                                       gpu_outIndex);
    }
    if (e_cpu_outIndex->size[0] != 1) {
      mwCallThrustScan1D(&gpu_outIndex.data[0], false, e_cpu_outIndex->size[0]);
    }
    e_PointCloudImpl_subsetImpl_ker<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(
        gpu_outIndex, gpu_outSize, e_cpu_outIndex->size[0U]);
    i = cpu_outRangeData->size[0] * cpu_outRangeData->size[1];
    checkCudaError(
        cudaMemcpy(&e_cpu_outSize, gpu_outSize, 8UL, cudaMemcpyDeviceToHost),
        __FILE__, __LINE__);
    cpu_outRangeData->size[0] = static_cast<int32_T>(e_cpu_outSize);
    cpu_outRangeData->size[1] = 3;
    emxEnsureCapacity_real32_T(cpu_outRangeData, i, &l_emlrtRTEI);
    i = cpu_indices->size[0] - 1;
    mwGetLaunchParameters1D(computeNumIters(2, i), &grid, &block, 2147483647U);
    gpuEmxEnsureCapacity_real32_T(cpu_rangeData, &gpu_rangeData, false);
    gpuEmxEnsureCapacity_real32_T(cpu_outRangeData, gpu_outRangeData, true);
    gpuEmxMemcpyCpuToGpu_real32_T(&gpu_rangeData, cpu_rangeData);
    *indices_outdatedOnGpu = false;
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      f_PointCloudImpl_subsetImpl_ker<<<grid, block>>>(
          gpu_rangeData, numElements, e_cpu_outSize, gpu_outIndex, *gpu_indices,
          i, *gpu_outRangeData);
    }
    *outRangeData_outdatedOnCpu = true;
  }
  emxFree_real_T(&e_cpu_outIndex);
  emlrtHeapReferenceStackLeaveFcnR2012b(emlrtRootTLSGlobal);
  gpuEmxFree_real32_T(&gpu_location);
  gpuEmxFree_uint8_T(&gpu_color);
  gpuEmxFree_real32_T(&gpu_normal);
  gpuEmxFree_real32_T(&gpu_intensity);
  gpuEmxFree_real32_T(&gpu_rangeData);
  gpuEmxFree_real_T(&e_gpu_outIndex);
  gpuEmxFree_real_T(&d_gpu_outIndex);
  checkCudaError(mwCudaFree(e_gpu_outSize), __FILE__, __LINE__);
  gpuEmxFree_real_T(&c_gpu_outIndex);
  checkCudaError(mwCudaFree(d_gpu_outSize), __FILE__, __LINE__);
  gpuEmxFree_real_T(&b_gpu_outIndex);
  gpuEmxFree_real32_T(&b_gpu_outIntensity);
  checkCudaError(mwCudaFree(c_gpu_outSize), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(b_gpu_outSize), __FILE__, __LINE__);
  gpuEmxFree_real_T(&gpu_outIndex);
  checkCudaError(mwCudaFree(gpu_outSize), __FILE__, __LINE__);
  *outLoc_outdatedOnGpu = false;
  *outCol_outdatedOnGpu = false;
  *outNorm_outdatedOnGpu = false;
  *outIntensity_outdatedOnCpu = true;
  *outIntensity_outdatedOnGpu = false;
  *outRangeData_outdatedOnGpu = false;
}

void d_PointCloudImpl_extractValidPo(const emxArray_real32_T *cpu_ptCloudCoords,
                                     emxArray_boolean_T *cpu_validCoords,
                                     boolean_T *validCoords_outdatedOnCpu,
                                     emxArray_boolean_T *gpu_validCoords,
                                     boolean_T *validCoords_outdatedOnGpu)
{
  dim3 block;
  dim3 grid;
  emxArray_real32_T gpu_ptCloudCoords;
  real_T numPoints;
  int32_T i;
  boolean_T validLaunchParams;
  gpuEmxReset_real32_T(&gpu_ptCloudCoords);
  numPoints = static_cast<real_T>(cpu_ptCloudCoords->size[0] * 3) / 3.0;
  i = cpu_validCoords->size[0];
  cpu_validCoords->size[0] = static_cast<int32_T>(numPoints);
  emxEnsureCapacity_boolean_T(cpu_validCoords, i, &k_emlrtRTEI);
  mwGetLaunchParameters1D(computeNumIters(static_cast<int32_T>(numPoints) - 1),
                          &grid, &block, 2147483647U);
  gpuEmxEnsureCapacity_real32_T(cpu_ptCloudCoords, &gpu_ptCloudCoords, false);
  gpuEmxEnsureCapacity_boolean_T(cpu_validCoords, gpu_validCoords,
                                 !*validCoords_outdatedOnGpu);
  gpuEmxMemcpyCpuToGpu_real32_T(&gpu_ptCloudCoords, cpu_ptCloudCoords);
  if (*validCoords_outdatedOnGpu) {
    gpuEmxMemcpyCpuToGpu_boolean_T(gpu_validCoords, cpu_validCoords);
  }
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    c_PointCloudImpl_extractValidPo<<<grid, block>>>(
        numPoints, gpu_ptCloudCoords, static_cast<int32_T>(numPoints) - 1,
        *gpu_validCoords);
  }
  gpuEmxFree_real32_T(&gpu_ptCloudCoords);
  *validCoords_outdatedOnCpu = true;
  *validCoords_outdatedOnGpu = false;
}

} // namespace gpu
} // namespace codegen
} // namespace internal
} // namespace vision
} // namespace coder

// End of code generation (PointCloudImpl.cu)
