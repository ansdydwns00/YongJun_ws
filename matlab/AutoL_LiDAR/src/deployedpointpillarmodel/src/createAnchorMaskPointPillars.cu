//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: createAnchorMaskPointPillars.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "createAnchorMaskPointPillars.h"
#include "rt_nonfinite.h"
#include "MWScanFunctors.h"
#include "MWScanUtility.h"
#include "MWShuffleUtility.h"
#include "coder_array.h"
#include <cmath>
#include <cstring>

// Function Definitions
//
// Arguments    : const float pillarIndices[24000]
//                const double pcRange[6]
//                const array<double, 2U> &anchorsBEV
//                array<double, 1U> &anchorMask
// Return Type  : void
//
namespace coder {
namespace lidar {
namespace internal {
namespace cnn {
void createAnchorMaskPointPillars(const float pillarIndices[24000],
                                  const double pcRange[6],
                                  const array<double, 2U> &anchorsBEV,
                                  array<double, 1U> &anchorMask)
{
  static double cpu_sparseVoxelMap[214272];
  array<int, 1U> iv;
  double(*gpu_sparseVoxelMap)[214272];
  double numPillars;
  double xMin;
  double yMin;
  int inDims[2];
  int n;
  bool sparseVoxelMap_outdatedOnCpu;
  cudaMalloc(&gpu_sparseVoxelMap, 1714176ULL);
  xMin = pcRange[0];
  yMin = pcRange[2];
  std::memset(&cpu_sparseVoxelMap[0], 0, 214272U * sizeof(double));
  n = 0;
  for (int k{0}; k < 24000; k++) {
    if (pillarIndices[k] != 0.0F) {
      n++;
    }
  }
  numPillars = static_cast<double>(n) / 2.0;
  if (numPillars < 1.0) {
    n = 0;
  } else {
    n = static_cast<int>(numPillars);
  }
  iv.set_size(n);
  for (int k{0}; k < n; k++) {
    iv[k] = static_cast<int>(pillarIndices[k]) +
            432 * (static_cast<int>(pillarIndices[k + 12000]) - 1);
  }
  for (int k{0}; k < iv.size(0); k++) {
    cpu_sparseVoxelMap[iv[k] - 1] = 1.0;
  }
  cudaMemcpy(*gpu_sparseVoxelMap, cpu_sparseVoxelMap, 1714176ULL,
             cudaMemcpyHostToDevice);
  mwCallThrustScanNDEdge(&(*gpu_sparseVoxelMap)[0], 432, false, 214272);
  inDims[0] = 432;
  inDims[1] = 496;
  mwCallThrustScanNDOther(&(*gpu_sparseVoxelMap)[0], 2, &inDims[0], 1, false,
                          214272, false);
  sparseVoxelMap_outdatedOnCpu = true;
  anchorMask.set_size(anchorsBEV.size(0));
  for (int k{0}; k < anchorsBEV.size(0); k++) {
    double xmaxGrid;
    double ymaxGrid;
    double yminGrid;
    numPillars = std::fmax(std::floor((anchorsBEV[k] - xMin) / 0.16), 1.0);
    yminGrid = std::fmax(
        std::floor((anchorsBEV[k + anchorsBEV.size(0)] - yMin) / 0.16), 1.0);
    xmaxGrid = std::fmin(
        std::floor((anchorsBEV[k + anchorsBEV.size(0) * 2] - xMin) / 0.16),
        432.0);
    ymaxGrid = std::fmin(
        std::floor((anchorsBEV[k + anchorsBEV.size(0) * 3] - yMin) / 0.16),
        496.0);
    if (sparseVoxelMap_outdatedOnCpu) {
      cudaMemcpy(cpu_sparseVoxelMap, *gpu_sparseVoxelMap, 1714176ULL,
                 cudaMemcpyDeviceToHost);
    }
    sparseVoxelMap_outdatedOnCpu = false;
    anchorMask[k] =
        ((cpu_sparseVoxelMap[(static_cast<int>(xmaxGrid) +
                              432 * (static_cast<int>(ymaxGrid) - 1)) -
                             1] -
          cpu_sparseVoxelMap[(static_cast<int>(xmaxGrid) +
                              432 * (static_cast<int>(yminGrid) - 1)) -
                             1]) -
         cpu_sparseVoxelMap[(static_cast<int>(numPillars) +
                             432 * (static_cast<int>(ymaxGrid) - 1)) -
                            1]) +
        cpu_sparseVoxelMap[(static_cast<int>(numPillars) +
                            432 * (static_cast<int>(yminGrid) - 1)) -
                           1];
  }
  cudaFree(*gpu_sparseVoxelMap);
}

} // namespace cnn
} // namespace internal
} // namespace lidar
} // namespace coder

//
// File trailer for createAnchorMaskPointPillars.cu
//
// [EOF]
//
