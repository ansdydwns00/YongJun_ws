//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: Resize2DLayer.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "Resize2DLayer.h"
#include "deployedPointPillarModel_data.h"
#include "rt_nonfinite.h"
#include "MWCudaDimUtility.hpp"

// Variable Definitions
static bool gpuConstsCopied_interpAlongSpatialDim;

static bool b_gpuConstsCopied_interpAlongSpatialDim;

// Function Declarations
static __global__ void interp1CustomImpl_kernel24(const double b_x[124],
                                                  const float v[3428352],
                                                  const double xq[248],
                                                  float out[6856704]);

static __global__ void interp1CustomImpl_kernel29(const double b_x[62],
                                                  const float v[1714176],
                                                  const double xq[248],
                                                  float out[6856704]);

static __global__ void
interpAlongSpatialDim_kernel22(const float inTmp[1714176], const double xq[216],
                               float out[3428352]);

static __global__ void interpAlongSpatialDim_kernel27(const float inTmp[428544],
                                                      const double xq[216],
                                                      float out[1714176]);

// Function Definitions
//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const double b_x[124]
//                const float v[3428352]
//                const double xq[248]
//                float out[6856704]
// Return Type  : void
//
static __global__ __launch_bounds__(512, 1) void interp1CustomImpl_kernel24(
    const double b_x[124], const float v[3428352], const double xq[248],
    float out[6856704])
{
  unsigned long long threadId;
  int i;
  int j;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  j = static_cast<int>(threadId % 27648ULL);
  i = static_cast<int>((threadId - static_cast<unsigned long long>(j)) /
                       27648ULL);
  if ((i < 248) && (j < 27648)) {
    double d;
    double idx;
    double nextIdx;
    d = xq[i];
    idx = floor(d);
    nextIdx = ceil(d);
    if (idx != nextIdx) {
      float slope;
      slope = (v[(static_cast<int>(idx) + 124 * j) - 1] -
               v[(static_cast<int>(nextIdx) + 124 * j) - 1]) /
              static_cast<float>(b_x[static_cast<int>(idx) - 1] -
                                 b_x[static_cast<int>(nextIdx) - 1]);
      out[i + 248 * j] =
          slope * static_cast<float>(d) +
          (v[(static_cast<int>(idx) + 124 * j) - 1] -
           slope * static_cast<float>(b_x[static_cast<int>(idx) - 1]));
    } else {
      out[i + 248 * j] = v[(static_cast<int>(idx) + 124 * j) - 1];
    }
  }
}

//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const double b_x[62]
//                const float v[1714176]
//                const double xq[248]
//                float out[6856704]
// Return Type  : void
//
static __global__ __launch_bounds__(512, 1) void interp1CustomImpl_kernel29(
    const double b_x[62], const float v[1714176], const double xq[248],
    float out[6856704])
{
  unsigned long long threadId;
  int i;
  int j;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  j = static_cast<int>(threadId % 27648ULL);
  i = static_cast<int>((threadId - static_cast<unsigned long long>(j)) /
                       27648ULL);
  if ((i < 248) && (j < 27648)) {
    double d;
    double idx;
    double nextIdx;
    d = xq[i];
    idx = floor(d);
    nextIdx = ceil(d);
    if (idx != nextIdx) {
      float slope;
      slope = (v[(static_cast<int>(idx) + 62 * j) - 1] -
               v[(static_cast<int>(nextIdx) + 62 * j) - 1]) /
              static_cast<float>(b_x[static_cast<int>(idx) - 1] -
                                 b_x[static_cast<int>(nextIdx) - 1]);
      out[i + 248 * j] =
          slope * static_cast<float>(d) +
          (v[(static_cast<int>(idx) + 62 * j) - 1] -
           slope * static_cast<float>(b_x[static_cast<int>(idx) - 1]));
    } else {
      out[i + 248 * j] = v[(static_cast<int>(idx) + 62 * j) - 1];
    }
  }
}

//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const float inTmp[1714176]
//                const double xq[216]
//                float out[3428352]
// Return Type  : void
//
static __global__ __launch_bounds__(512, 1) void interpAlongSpatialDim_kernel22(
    const float inTmp[1714176], const double xq[216], float out[3428352])
{
  unsigned long long threadId;
  int i;
  int j;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  j = static_cast<int>(threadId % 15872ULL);
  i = static_cast<int>((threadId - static_cast<unsigned long long>(j)) /
                       15872ULL);
  if ((i < 216) && (j < 15872)) {
    double d;
    int idx;
    int nextIdx;
    d = xq[i];
    idx = static_cast<int>(floor(d));
    nextIdx = static_cast<int>(ceil(d));
    if (idx != nextIdx) {
      float slope;
      slope = (inTmp[(idx + 108 * j) - 1] - inTmp[(nextIdx + 108 * j) - 1]) /
              static_cast<float>(idx - nextIdx);
      out[i + 216 * j] = slope * static_cast<float>(d) +
                         (inTmp[(idx + 108 * j) - 1] -
                          slope * ((static_cast<float>(idx) - 1.0F) + 1.0F));
    } else {
      out[i + 216 * j] = inTmp[(idx + 108 * j) - 1];
    }
  }
}

//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const float inTmp[428544]
//                const double xq[216]
//                float out[1714176]
// Return Type  : void
//
static __global__ __launch_bounds__(512, 1) void interpAlongSpatialDim_kernel27(
    const float inTmp[428544], const double xq[216], float out[1714176])
{
  unsigned long long threadId;
  int i;
  int j;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  j = static_cast<int>(threadId % 7936ULL);
  i = static_cast<int>((threadId - static_cast<unsigned long long>(j)) /
                       7936ULL);
  if ((i < 216) && (j < 7936)) {
    double d;
    int idx;
    int nextIdx;
    d = xq[i];
    idx = static_cast<int>(floor(d));
    nextIdx = static_cast<int>(ceil(d));
    if (idx != nextIdx) {
      float slope;
      slope = (inTmp[(idx + 54 * j) - 1] - inTmp[(nextIdx + 54 * j) - 1]) /
              static_cast<float>(idx - nextIdx);
      out[i + 216 * j] = slope * static_cast<float>(d) +
                         (inTmp[(idx + 54 * j) - 1] -
                          slope * ((static_cast<float>(idx) - 1.0F) + 1.0F));
    } else {
      out[i + 216 * j] = inTmp[(idx + 54 * j) - 1];
    }
  }
}

//
// Arguments    : const double b_x[62]
//                const float v[1714176]
//                const double xq[248]
//                float out[6856704]
// Return Type  : void
//
namespace coder {
namespace nnet {
namespace internal {
namespace cnn {
namespace coder {
void b_interp1CustomImpl(const double b_x[62], const float v[1714176],
                         const double xq[248], float out[6856704])
{
  interp1CustomImpl_kernel29<<<dim3(13392U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
      b_x, v, xq, out);
}

//
// Arguments    : const float inTmp[428544]
//                float out[1714176]
// Return Type  : void
//
void b_interpAlongSpatialDim(const float inTmp[428544], float out[1714176])
{
  static const double cpu_xq[216]{
      1.0,    1.0,    1.125,  1.375,  1.625,  1.875,  2.125,  2.375,  2.625,
      2.875,  3.125,  3.375,  3.625,  3.875,  4.125,  4.375,  4.625,  4.875,
      5.125,  5.375,  5.625,  5.875,  6.125,  6.375,  6.625,  6.875,  7.125,
      7.375,  7.625,  7.875,  8.125,  8.375,  8.625,  8.875,  9.125,  9.375,
      9.625,  9.875,  10.125, 10.375, 10.625, 10.875, 11.125, 11.375, 11.625,
      11.875, 12.125, 12.375, 12.625, 12.875, 13.125, 13.375, 13.625, 13.875,
      14.125, 14.375, 14.625, 14.875, 15.125, 15.375, 15.625, 15.875, 16.125,
      16.375, 16.625, 16.875, 17.125, 17.375, 17.625, 17.875, 18.125, 18.375,
      18.625, 18.875, 19.125, 19.375, 19.625, 19.875, 20.125, 20.375, 20.625,
      20.875, 21.125, 21.375, 21.625, 21.875, 22.125, 22.375, 22.625, 22.875,
      23.125, 23.375, 23.625, 23.875, 24.125, 24.375, 24.625, 24.875, 25.125,
      25.375, 25.625, 25.875, 26.125, 26.375, 26.625, 26.875, 27.125, 27.375,
      27.625, 27.875, 28.125, 28.375, 28.625, 28.875, 29.125, 29.375, 29.625,
      29.875, 30.125, 30.375, 30.625, 30.875, 31.125, 31.375, 31.625, 31.875,
      32.125, 32.375, 32.625, 32.875, 33.125, 33.375, 33.625, 33.875, 34.125,
      34.375, 34.625, 34.875, 35.125, 35.375, 35.625, 35.875, 36.125, 36.375,
      36.625, 36.875, 37.125, 37.375, 37.625, 37.875, 38.125, 38.375, 38.625,
      38.875, 39.125, 39.375, 39.625, 39.875, 40.125, 40.375, 40.625, 40.875,
      41.125, 41.375, 41.625, 41.875, 42.125, 42.375, 42.625, 42.875, 43.125,
      43.375, 43.625, 43.875, 44.125, 44.375, 44.625, 44.875, 45.125, 45.375,
      45.625, 45.875, 46.125, 46.375, 46.625, 46.875, 47.125, 47.375, 47.625,
      47.875, 48.125, 48.375, 48.625, 48.875, 49.125, 49.375, 49.625, 49.875,
      50.125, 50.375, 50.625, 50.875, 51.125, 51.375, 51.625, 51.875, 52.125,
      52.375, 52.625, 52.875, 53.125, 53.375, 53.625, 53.875, 54.0,   54.0};
  if (!b_gpuConstsCopied_interpAlongSpatialDim) {
    b_gpuConstsCopied_interpAlongSpatialDim = true;
    cudaMemcpy(*b_global_gpu_xq, cpu_xq, sizeof(double[216]),
               cudaMemcpyHostToDevice);
  }
  interpAlongSpatialDim_kernel27<<<dim3(3348U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
      inTmp, *b_global_gpu_xq, out);
}

//
// Arguments    : const double b_x[124]
//                const float v[3428352]
//                const double xq[248]
//                float out[6856704]
// Return Type  : void
//
void interp1CustomImpl(const double b_x[124], const float v[3428352],
                       const double xq[248], float out[6856704])
{
  interp1CustomImpl_kernel24<<<dim3(13392U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
      b_x, v, xq, out);
}

//
// Arguments    : const float inTmp[1714176]
//                float out[3428352]
// Return Type  : void
//
void interpAlongSpatialDim(const float inTmp[1714176], float out[3428352])
{
  static const double cpu_xq[216]{
      1.0,    1.25,   1.75,   2.25,   2.75,   3.25,   3.75,   4.25,   4.75,
      5.25,   5.75,   6.25,   6.75,   7.25,   7.75,   8.25,   8.75,   9.25,
      9.75,   10.25,  10.75,  11.25,  11.75,  12.25,  12.75,  13.25,  13.75,
      14.25,  14.75,  15.25,  15.75,  16.25,  16.75,  17.25,  17.75,  18.25,
      18.75,  19.25,  19.75,  20.25,  20.75,  21.25,  21.75,  22.25,  22.75,
      23.25,  23.75,  24.25,  24.75,  25.25,  25.75,  26.25,  26.75,  27.25,
      27.75,  28.25,  28.75,  29.25,  29.75,  30.25,  30.75,  31.25,  31.75,
      32.25,  32.75,  33.25,  33.75,  34.25,  34.75,  35.25,  35.75,  36.25,
      36.75,  37.25,  37.75,  38.25,  38.75,  39.25,  39.75,  40.25,  40.75,
      41.25,  41.75,  42.25,  42.75,  43.25,  43.75,  44.25,  44.75,  45.25,
      45.75,  46.25,  46.75,  47.25,  47.75,  48.25,  48.75,  49.25,  49.75,
      50.25,  50.75,  51.25,  51.75,  52.25,  52.75,  53.25,  53.75,  54.25,
      54.75,  55.25,  55.75,  56.25,  56.75,  57.25,  57.75,  58.25,  58.75,
      59.25,  59.75,  60.25,  60.75,  61.25,  61.75,  62.25,  62.75,  63.25,
      63.75,  64.25,  64.75,  65.25,  65.75,  66.25,  66.75,  67.25,  67.75,
      68.25,  68.75,  69.25,  69.75,  70.25,  70.75,  71.25,  71.75,  72.25,
      72.75,  73.25,  73.75,  74.25,  74.75,  75.25,  75.75,  76.25,  76.75,
      77.25,  77.75,  78.25,  78.75,  79.25,  79.75,  80.25,  80.75,  81.25,
      81.75,  82.25,  82.75,  83.25,  83.75,  84.25,  84.75,  85.25,  85.75,
      86.25,  86.75,  87.25,  87.75,  88.25,  88.75,  89.25,  89.75,  90.25,
      90.75,  91.25,  91.75,  92.25,  92.75,  93.25,  93.75,  94.25,  94.75,
      95.25,  95.75,  96.25,  96.75,  97.25,  97.75,  98.25,  98.75,  99.25,
      99.75,  100.25, 100.75, 101.25, 101.75, 102.25, 102.75, 103.25, 103.75,
      104.25, 104.75, 105.25, 105.75, 106.25, 106.75, 107.25, 107.75, 108.0};
  if (!gpuConstsCopied_interpAlongSpatialDim) {
    gpuConstsCopied_interpAlongSpatialDim = true;
    cudaMemcpy(*global_gpu_xq, cpu_xq, sizeof(double[216]),
               cudaMemcpyHostToDevice);
  }
  interpAlongSpatialDim_kernel22<<<dim3(6696U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
      inTmp, *global_gpu_xq, out);
}

} // namespace coder
} // namespace cnn
} // namespace internal
} // namespace nnet
} // namespace coder

//
// File trailer for Resize2DLayer.cu
//
// [EOF]
//
