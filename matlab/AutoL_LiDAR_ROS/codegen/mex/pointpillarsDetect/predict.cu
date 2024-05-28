//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// predict.cu
//
// Code generation for function 'predict'
//

// Include files
#include "predict.h"
#include "dlnetwork.h"
#include "pointpillarsDetect_data.h"
#include "pointpillarsDetect_mexutil.h"
#include "pointpillarsDetect_types.h"
#include "rt_nonfinite.h"
#include "MWCudaDimUtility.hpp"
#include "MWCudaMemoryFunctions.hpp"

// Function Declarations
static __global__ void
dlnetwork_predict_kernel75(const real32_T varargin_1_Data[24000],
                           real32_T inputDataT_f1[24000]);

static __global__ void
dlnetwork_predict_kernel76(const real32_T varargin_2_Data[10800000],
                           real32_T inputDataT_f2[10800000]);

static __global__ void dlnetwork_predict_kernel77(
    const real32_T outputData_f2[321408], const real32_T outputData_f1[321408],
    real32_T varargout_2_Data[321408], real32_T varargout_1_Data[321408]);

static __global__ void dlnetwork_predict_kernel78(
    const real32_T outputData_f6[107136], const real32_T outputData_f5[107136],
    const real32_T outputData_f4[107136], const real32_T outputData_f3[107136],
    real32_T varargout_6_Data[107136], real32_T varargout_5_Data[107136],
    real32_T varargout_4_Data[107136], real32_T varargout_3_Data[107136]);

// Function Definitions
static __global__ __launch_bounds__(224, 1) void dlnetwork_predict_kernel75(
    const real32_T varargin_1_Data[24000], real32_T inputDataT_f1[24000])
{
  uint64_T gThreadId;
  int32_T i;
  int32_T i1;
  gThreadId = mwGetGlobalThreadIndex();
  i1 = static_cast<int32_T>(gThreadId % 2UL);
  i = static_cast<int32_T>((gThreadId - static_cast<uint64_T>(i1)) / 2UL);
  if ((i < 12000) && (i1 < 2)) {
    inputDataT_f1[i1 + (i << 1)] = varargin_1_Data[i + 12000 * i1];
  }
}

static __global__ __launch_bounds__(512, 1) void dlnetwork_predict_kernel76(
    const real32_T varargin_2_Data[10800000], real32_T inputDataT_f2[10800000])
{
  uint64_T gThreadId;
  int32_T i;
  int32_T i1;
  int32_T p;
  gThreadId = mwGetGlobalThreadIndex();
  i = static_cast<int32_T>(gThreadId % 100UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(i)) / 100UL;
  i1 = static_cast<int32_T>(gThreadId % 12000UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(i1)) / 12000UL;
  p = static_cast<int32_T>(gThreadId);
  if ((p < 9) && (i1 < 12000) && (i < 100)) {
    inputDataT_f2[(i + 100 * i1) + 1200000 * p] =
        varargin_2_Data[(i1 + 12000 * i) + 1200000 * p];
  }
}

static __global__ __launch_bounds__(512, 1) void dlnetwork_predict_kernel77(
    const real32_T outputData_f2[321408], const real32_T outputData_f1[321408],
    real32_T varargout_2_Data[321408], real32_T varargout_1_Data[321408])
{
  uint64_T gThreadId;
  int32_T i;
  int32_T i1;
  int32_T p;
  gThreadId = mwGetGlobalThreadIndex();
  i = static_cast<int32_T>(gThreadId % 216UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(i)) / 216UL;
  i1 = static_cast<int32_T>(gThreadId % 248UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(i1)) / 248UL;
  p = static_cast<int32_T>(gThreadId);
  if ((p < 6) && (i1 < 248) && (i < 216)) {
    varargout_1_Data[(i + 216 * i1) + 53568 * p] =
        outputData_f1[(i1 + 248 * i) + 53568 * p];
    varargout_2_Data[(i + 216 * i1) + 53568 * p] =
        outputData_f2[(i1 + 248 * i) + 53568 * p];
  }
}

static __global__ __launch_bounds__(512, 1) void dlnetwork_predict_kernel78(
    const real32_T outputData_f6[107136], const real32_T outputData_f5[107136],
    const real32_T outputData_f4[107136], const real32_T outputData_f3[107136],
    real32_T varargout_6_Data[107136], real32_T varargout_5_Data[107136],
    real32_T varargout_4_Data[107136], real32_T varargout_3_Data[107136])
{
  uint64_T gThreadId;
  int32_T i;
  int32_T i1;
  int32_T p;
  gThreadId = mwGetGlobalThreadIndex();
  i = static_cast<int32_T>(gThreadId % 216UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(i)) / 216UL;
  i1 = static_cast<int32_T>(gThreadId % 248UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(i1)) / 248UL;
  p = static_cast<int32_T>(gThreadId);
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

namespace coder {
namespace internal {
void dlnetwork_predict(detector0_0 *obj, const real32_T varargin_1_Data[24000],
                       const real32_T varargin_2_Data[10800000],
                       real32_T varargout_1_Data[321408],
                       real32_T varargout_2_Data[321408],
                       real32_T varargout_3_Data[107136],
                       real32_T varargout_4_Data[107136],
                       real32_T varargout_5_Data[107136],
                       real32_T varargout_6_Data[107136])
{
  real32_T(*gpu_inputDataT_f2)[10800000];
  real32_T(*gpu_outputData_f1)[321408];
  real32_T(*gpu_outputData_f2)[321408];
  real32_T(*gpu_outputData_f3)[107136];
  real32_T(*gpu_outputData_f4)[107136];
  real32_T(*gpu_outputData_f5)[107136];
  real32_T(*gpu_outputData_f6)[107136];
  real32_T(*gpu_inputDataT_f1)[24000];
  checkCudaError(mwCudaMalloc(&gpu_outputData_f6, 428544UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_outputData_f5, 428544UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_outputData_f4, 428544UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_outputData_f3, 428544UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_outputData_f2, 1285632UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_outputData_f1, 1285632UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_inputDataT_f2, 43200000UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_inputDataT_f1, 96000UL), __FILE__, __LINE__);
  dlnetwork_predict_kernel75<<<dim3(108U, 1U, 1U), dim3(224U, 1U, 1U)>>>(
      varargin_1_Data, *gpu_inputDataT_f1);
  dlnetwork_predict_kernel76<<<dim3(21094U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
      varargin_2_Data, *gpu_inputDataT_f2);
  checkCudaError(cudaMemcpy(obj->getInputDataPointer(0), *gpu_inputDataT_f1,
                            obj->getLayerOutputSize(3, 0),
                            cudaMemcpyDeviceToDevice),
                 __FILE__, __LINE__);
  checkCudaError(cudaMemcpy(obj->getInputDataPointer(1), *gpu_inputDataT_f2,
                            obj->getLayerOutputSize(0, 0),
                            cudaMemcpyDeviceToDevice),
                 __FILE__, __LINE__);
  try {
    obj->activations(56);
  } catch (std::runtime_error const &err) {
    checkRunTimeError(err.what(), __FILE__, __LINE__);
  } catch (...) {
    checkRunTimeError("", __FILE__, __LINE__);
  }
  checkCudaError(cudaMemcpy(*gpu_outputData_f1, obj->getLayerOutput(56, 0),
                            obj->getLayerOutputSize(56, 0),
                            cudaMemcpyDeviceToDevice),
                 __FILE__, __LINE__);
  checkCudaError(cudaMemcpy(*gpu_outputData_f2, obj->getLayerOutput(53, 0),
                            obj->getLayerOutputSize(53, 0),
                            cudaMemcpyDeviceToDevice),
                 __FILE__, __LINE__);
  checkCudaError(cudaMemcpy(*gpu_outputData_f3, obj->getLayerOutput(55, 0),
                            obj->getLayerOutputSize(55, 0),
                            cudaMemcpyDeviceToDevice),
                 __FILE__, __LINE__);
  checkCudaError(cudaMemcpy(*gpu_outputData_f4, obj->getLayerOutput(49, 0),
                            obj->getLayerOutputSize(49, 0),
                            cudaMemcpyDeviceToDevice),
                 __FILE__, __LINE__);
  checkCudaError(cudaMemcpy(*gpu_outputData_f5, obj->getLayerOutput(52, 0),
                            obj->getLayerOutputSize(52, 0),
                            cudaMemcpyDeviceToDevice),
                 __FILE__, __LINE__);
  checkCudaError(cudaMemcpy(*gpu_outputData_f6, obj->getLayerOutput(50, 0),
                            obj->getLayerOutputSize(50, 0),
                            cudaMemcpyDeviceToDevice),
                 __FILE__, __LINE__);
  dlnetwork_predict_kernel77<<<dim3(628U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
      *gpu_outputData_f2, *gpu_outputData_f1, varargout_2_Data,
      varargout_1_Data);
  dlnetwork_predict_kernel78<<<dim3(210U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
      *gpu_outputData_f6, *gpu_outputData_f5, *gpu_outputData_f4,
      *gpu_outputData_f3, varargout_6_Data, varargout_5_Data, varargout_4_Data,
      varargout_3_Data);
  checkCudaError(mwCudaFree(*gpu_inputDataT_f1), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_inputDataT_f2), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_outputData_f1), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_outputData_f2), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_outputData_f3), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_outputData_f4), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_outputData_f5), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_outputData_f6), __FILE__, __LINE__);
}

} // namespace internal
} // namespace coder

// End of code generation (predict.cu)
