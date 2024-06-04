//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: predict.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "predict.h"
#include "deployedPointPillarModel_internal_types.h"
#include "dlnetwork.h"
#include "rt_nonfinite.h"
#include "MWCudaDimUtility.hpp"

// Function Declarations
static __global__ void
dlnetwork_predict_kernel17(const float varargin_1_Data[24000],
                           float inputDataT_f1[24000]);

static __global__ void
dlnetwork_predict_kernel18(const float varargin_2_Data[10800000],
                           float inputDataT_f2[10800000]);

static __global__ void dlnetwork_predict_kernel19(
    const float outputData_f2[321408], const float outputData_f1[321408],
    float varargout_2_Data[321408], float varargout_1_Data[321408]);

static __global__ void dlnetwork_predict_kernel20(
    const float outputData_f6[107136], const float outputData_f5[107136],
    const float outputData_f4[107136], const float outputData_f3[107136],
    float varargout_6_Data[107136], float varargout_5_Data[107136],
    float varargout_4_Data[107136], float varargout_3_Data[107136]);

// Function Definitions
//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const float varargin_1_Data[24000]
//                float inputDataT_f1[24000]
// Return Type  : void
//
static __global__ __launch_bounds__(512, 1) void dlnetwork_predict_kernel17(
    const float varargin_1_Data[24000], float inputDataT_f1[24000])
{
  unsigned long long threadId;
  int i;
  int i1;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  i1 = static_cast<int>(threadId % 2ULL);
  i = static_cast<int>((threadId - static_cast<unsigned long long>(i1)) / 2ULL);
  if ((i < 12000) && (i1 < 2)) {
    inputDataT_f1[i1 + (i << 1)] = varargin_1_Data[i + 12000 * i1];
  }
}

//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const float varargin_2_Data[10800000]
//                float inputDataT_f2[10800000]
// Return Type  : void
//
static __global__ __launch_bounds__(512, 1) void dlnetwork_predict_kernel18(
    const float varargin_2_Data[10800000], float inputDataT_f2[10800000])
{
  unsigned long long threadId;
  int i;
  int i1;
  int p;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  i = static_cast<int>(threadId % 100ULL);
  threadId = (threadId - static_cast<unsigned long long>(i)) / 100ULL;
  i1 = static_cast<int>(threadId % 12000ULL);
  threadId = (threadId - static_cast<unsigned long long>(i1)) / 12000ULL;
  p = static_cast<int>(threadId);
  if ((p < 9) && (i1 < 12000) && (i < 100)) {
    inputDataT_f2[(i + 100 * i1) + 1200000 * p] =
        varargin_2_Data[(i1 + 12000 * i) + 1200000 * p];
  }
}

//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const float outputData_f2[321408]
//                const float outputData_f1[321408]
//                float varargout_2_Data[321408]
//                float varargout_1_Data[321408]
// Return Type  : void
//
static __global__ __launch_bounds__(512, 1) void dlnetwork_predict_kernel19(
    const float outputData_f2[321408], const float outputData_f1[321408],
    float varargout_2_Data[321408], float varargout_1_Data[321408])
{
  unsigned long long threadId;
  int i;
  int i1;
  int p;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  i = static_cast<int>(threadId % 216ULL);
  threadId = (threadId - static_cast<unsigned long long>(i)) / 216ULL;
  i1 = static_cast<int>(threadId % 248ULL);
  threadId = (threadId - static_cast<unsigned long long>(i1)) / 248ULL;
  p = static_cast<int>(threadId);
  if ((p < 6) && (i1 < 248) && (i < 216)) {
    varargout_1_Data[(i + 216 * i1) + 53568 * p] =
        outputData_f1[(i1 + 248 * i) + 53568 * p];
    varargout_2_Data[(i + 216 * i1) + 53568 * p] =
        outputData_f2[(i1 + 248 * i) + 53568 * p];
  }
}

//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const float outputData_f6[107136]
//                const float outputData_f5[107136]
//                const float outputData_f4[107136]
//                const float outputData_f3[107136]
//                float varargout_6_Data[107136]
//                float varargout_5_Data[107136]
//                float varargout_4_Data[107136]
//                float varargout_3_Data[107136]
// Return Type  : void
//
static __global__ __launch_bounds__(512, 1) void dlnetwork_predict_kernel20(
    const float outputData_f6[107136], const float outputData_f5[107136],
    const float outputData_f4[107136], const float outputData_f3[107136],
    float varargout_6_Data[107136], float varargout_5_Data[107136],
    float varargout_4_Data[107136], float varargout_3_Data[107136])
{
  unsigned long long threadId;
  int i;
  int i1;
  int p;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  i = static_cast<int>(threadId % 216ULL);
  threadId = (threadId - static_cast<unsigned long long>(i)) / 216ULL;
  i1 = static_cast<int>(threadId % 248ULL);
  threadId = (threadId - static_cast<unsigned long long>(i1)) / 248ULL;
  p = static_cast<int>(threadId);
  if ((p < 2) && (i1 < 248) && (i < 216)) {
    varargout_3_Data[(i + 216 * i1) + 53568 * p] =
        outputData_f3[(i1 + 248 * i) + 53568 * p];
    varargout_4_Data[(i + 216 * i1) + 53568 * p] =
        outputData_f4[(i1 + 248 * i) + 53568 * p];
    varargout_5_Data[(i + 216 * i1) + 53568 * p] =
        outputData_f5[(i1 + 248 * i) + 53568 * p];
    varargout_6_Data[(i + 216 * i1) + 53568 * p] =
        outputData_f6[(i1 + 248 * i) + 53568 * p];
  }
}

//
// Arguments    : detector0_0 *obj
//                const float varargin_1_Data[24000]
//                const float varargin_2_Data[10800000]
//                float varargout_1_Data[321408]
//                float varargout_2_Data[321408]
//                float varargout_3_Data[107136]
//                float varargout_4_Data[107136]
//                float varargout_5_Data[107136]
//                float varargout_6_Data[107136]
// Return Type  : void
//
namespace coder {
namespace internal {
void dlnetwork_predict(detector0_0 *obj, const float varargin_1_Data[24000],
                       const float varargin_2_Data[10800000],
                       float varargout_1_Data[321408],
                       float varargout_2_Data[321408],
                       float varargout_3_Data[107136],
                       float varargout_4_Data[107136],
                       float varargout_5_Data[107136],
                       float varargout_6_Data[107136])
{
  float(*gpu_inputDataT_f2)[10800000];
  float(*gpu_outputData_f1)[321408];
  float(*gpu_outputData_f2)[321408];
  float(*gpu_outputData_f3)[107136];
  float(*gpu_outputData_f4)[107136];
  float(*gpu_outputData_f5)[107136];
  float(*gpu_outputData_f6)[107136];
  float(*gpu_inputDataT_f1)[24000];
  cudaMalloc(&gpu_outputData_f6, 428544ULL);
  cudaMalloc(&gpu_outputData_f5, 428544ULL);
  cudaMalloc(&gpu_outputData_f4, 428544ULL);
  cudaMalloc(&gpu_outputData_f3, 428544ULL);
  cudaMalloc(&gpu_outputData_f2, 1285632ULL);
  cudaMalloc(&gpu_outputData_f1, 1285632ULL);
  cudaMalloc(&gpu_inputDataT_f2, 43200000ULL);
  cudaMalloc(&gpu_inputDataT_f1, 96000ULL);
  dlnetwork_predict_kernel17<<<dim3(47U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
      varargin_1_Data, *gpu_inputDataT_f1);
  dlnetwork_predict_kernel18<<<dim3(21094U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
      varargin_2_Data, *gpu_inputDataT_f2);
  cudaMemcpy(obj->getInputDataPointer(0), *gpu_inputDataT_f1,
             obj->getLayerOutputSize(3, 0), cudaMemcpyDeviceToDevice);
  cudaMemcpy(obj->getInputDataPointer(1), *gpu_inputDataT_f2,
             obj->getLayerOutputSize(0, 0), cudaMemcpyDeviceToDevice);
  obj->activations(56);
  cudaMemcpy(*gpu_outputData_f1, obj->getLayerOutput(56, 0),
             obj->getLayerOutputSize(56, 0), cudaMemcpyDeviceToDevice);
  cudaMemcpy(*gpu_outputData_f2, obj->getLayerOutput(53, 0),
             obj->getLayerOutputSize(53, 0), cudaMemcpyDeviceToDevice);
  cudaMemcpy(*gpu_outputData_f3, obj->getLayerOutput(55, 0),
             obj->getLayerOutputSize(55, 0), cudaMemcpyDeviceToDevice);
  cudaMemcpy(*gpu_outputData_f4, obj->getLayerOutput(49, 0),
             obj->getLayerOutputSize(49, 0), cudaMemcpyDeviceToDevice);
  cudaMemcpy(*gpu_outputData_f5, obj->getLayerOutput(52, 0),
             obj->getLayerOutputSize(52, 0), cudaMemcpyDeviceToDevice);
  cudaMemcpy(*gpu_outputData_f6, obj->getLayerOutput(50, 0),
             obj->getLayerOutputSize(50, 0), cudaMemcpyDeviceToDevice);
  dlnetwork_predict_kernel19<<<dim3(628U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
      *gpu_outputData_f2, *gpu_outputData_f1, varargout_2_Data,
      varargout_1_Data);
  dlnetwork_predict_kernel20<<<dim3(210U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
      *gpu_outputData_f6, *gpu_outputData_f5, *gpu_outputData_f4,
      *gpu_outputData_f3, varargout_6_Data, varargout_5_Data, varargout_4_Data,
      varargout_3_Data);
  cudaFree(*gpu_inputDataT_f1);
  cudaFree(*gpu_inputDataT_f2);
  cudaFree(*gpu_outputData_f1);
  cudaFree(*gpu_outputData_f2);
  cudaFree(*gpu_outputData_f3);
  cudaFree(*gpu_outputData_f4);
  cudaFree(*gpu_outputData_f5);
  cudaFree(*gpu_outputData_f6);
}

} // namespace internal
} // namespace coder

//
// File trailer for predict.cu
//
// [EOF]
//
