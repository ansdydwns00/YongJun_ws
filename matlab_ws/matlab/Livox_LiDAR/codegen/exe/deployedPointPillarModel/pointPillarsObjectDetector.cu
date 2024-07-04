//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: pointPillarsObjectDetector.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "pointPillarsObjectDetector.h"
#include "PointCloudImpl.h"
#include "arrayfun.h"
#include "bbox2poly.h"
#include "cellstr_sort.h"
#include "cellstr_strtrim.h"
#include "cellstr_unique.h"
#include "cosd.h"
#include "createAnchorMaskPointPillars.h"
#include "createAnchorsPointPillars.h"
#include "deployedPointPillarModel_data.h"
#include "deployedPointPillarModel_internal_types.h"
#include "find.h"
#include "getCategoryNames.h"
#include "overlapPolygonRotatedRects.h"
#include "pointCloudBase.h"
#include "predict.h"
#include "rt_nonfinite.h"
#include "sind.h"
#include "sort.h"
#include "strcmp.h"
#include "MWCudaDimUtility.hpp"
#include "MWLaunchParametersUtilities.hpp"
#include "MWScanFunctors.h"
#include "MWScanUtility.h"
#include "MWShuffleUtility.h"
#include "MWSortFunctors.h"
#include "MWSortWithIndexUtility.h"
#include "coder_array.h"
#include "coder_gpu_array.h"
#include "createPillars.hpp"
#include "rt_defines.h"
#include <cmath>

// Variable Definitions
static const char cv[10]{'P', 'e', 'd', 'e', 's', 't', 'r', 'a', 'i', 'n'};

// Function Declarations
namespace coder {
namespace internal {
static void iGenerateDetections(const float YPredictions_f1_Data[321408],
                                const float YPredictions_f2_Data[321408],
                                const float YPredictions_f3_Data[107136],
                                const float YPredictions_f4_Data[107136],
                                const float YPredictions_f5_Data[107136],
                                const float YPredictions_f6_Data[107136],
                                const float pillarIndices[24000],
                                double params_Threshold,
                                array<float, 2U> &boxPreds);

static void pointPillarsObjectDetector_iPostprocessSingleDetection(
    const float YPredData_f1_Data[321408],
    const float YPredData_f2_Data[321408],
    const float YPredData_f3_Data[107136],
    const float YPredData_f4_Data[107136],
    const float YPredData_f5_Data[107136],
    const float YPredData_f6_Data[107136], const float pillarIndices[24000],
    array<double, 2U> &boxPred, array<float, 1U> &scores,
    array<unsigned int, 2U> &labelNames_codes,
    array<cell_wrap_6, 1U> &labelNames_categoryNames);

static void
returnCategoricalLabels(array<unsigned int, 2U> &labelNamesMod_codes,
                        array<cell_wrap_6, 1U> &labelNamesMod_categoryNames);

static void
returnCategoricalLabels(double numBBoxes,
                        array<unsigned int, 2U> &labelNamesMod_codes,
                        array<cell_wrap_6, 1U> &labelNamesMod_categoryNames);

} // namespace internal
} // namespace coder
static __global__ void
iGenerateDetections_kernel30(const coder::gpu_array<bool, 3U> a,
                             coder::gpu_array<bool, 3U> anchorMask);

static __global__ void pointPillarsObjectDetector_detect_kernel1(
    const int result_dim0, const coder::gpu_array<float, 2U> intensity,
    const int result_dim1, const int result, const int sizes_idx_1,
    coder::gpu_array<float, 2U> dataIn);

static __global__ void
pointPillarsObjectDetector_detect_kernel2(float pillarIndices[24000]);

static __global__ void pointPillarsObjectDetector_detect_kernel3(
    float dlPillarFeatures_Data[10800000]);

static float rt_atan2f_snf(float u0, float u1);

// Function Definitions
//
// Arguments    : const float YPredictions_f1_Data[321408]
//                const float YPredictions_f2_Data[321408]
//                const float YPredictions_f3_Data[107136]
//                const float YPredictions_f4_Data[107136]
//                const float YPredictions_f5_Data[107136]
//                const float YPredictions_f6_Data[107136]
//                const float pillarIndices[24000]
//                double params_Threshold
//                array<float, 2U> &boxPreds
// Return Type  : void
//
namespace coder {
namespace internal {
static void iGenerateDetections(const float YPredictions_f1_Data[321408],
                                const float YPredictions_f2_Data[321408],
                                const float YPredictions_f3_Data[107136],
                                const float YPredictions_f4_Data[107136],
                                const float YPredictions_f5_Data[107136],
                                const float YPredictions_f6_Data[107136],
                                const float pillarIndices[24000],
                                double params_Threshold,
                                array<float, 2U> &boxPreds)
{
  static const double dv[10]{0.824900632523975,
                             0.824900632523975,
                             0.93545500918179725,
                             0.93545500918179725,
                             1.7943301367067914,
                             1.7943301367067914,
                             -1.78,
                             -1.78,
                             0.0,
                             1.5707963267948966};
  static const double dv1[6]{0.0, 69.12, -39.68, 39.68, -5.0, 5.0};
  static float predAngle[107136];
  static const signed char dv2[3]{2, 3, 1};
  static bool b_x[107136];
  array<cell_wrap_60, 2U> newAnchors;
  array<double, 2U> a__6;
  array<double, 2U> anchorsBEV;
  array<double, 1U> anchorMask;
  array<double, 1U> anchorNum;
  array<double, 1U> c_r1;
  array<double, 1U> c_x;
  array<double, 1U> cls;
  array<double, 1U> col;
  array<double, 1U> r;
  array<double, 1U> row;
  array<float, 1U> angGt;
  array<float, 1U> hdGt;
  array<float, 1U> varargin_1;
  array<float, 1U> varargin_2;
  array<float, 1U> varargin_4;
  array<float, 1U> varargin_5;
  array<float, 1U> varargin_6;
  array<float, 1U> varargin_8;
  array<float, 1U> varargout_1;
  array<float, 1U> zGt;
  array<int, 1U> b_ii;
  array<int, 1U> v1;
  array<short, 1U> vk;
  array<signed char, 1U> varargout_6;
  array<bool, 3U> cpu_a;
  array<bool, 3U> cpu_anchorMask;
  gpu_array<bool, 3U> gpu_a;
  gpu_array<bool, 3U> gpu_anchorMask;
  cell_wrap_5 b_r1[1];
  cell_wrap_5 r1;
  int k;
  int plast;
  bool a_outdatedOnGpu;
  bool anchorMask_outdatedOnCpu;
  bool b;
  bool exitg1;
  anchorMask_outdatedOnCpu = false;
  a_outdatedOnGpu = false;
  for (k = 0; k < 10; k++) {
    r1.f1[k] = dv[k];
  }
  b_r1[0] = r1;
  lidar::internal::cnn::createAnchorsPointPillars(b_r1, a__6, anchorsBEV);
  lidar::internal::cnn::createAnchorMaskPointPillars(pillarIndices, dv1,
                                                     anchorsBEV, anchorMask);
  newAnchors.set_size(1, 2);
  for (plast = 0; plast < 2; plast++) {
    int ii;
    ii = plast + 1;
    for (k = 0; k < 5; k++) {
      newAnchors[ii - 1].f1[k] = dv[plast + (k << 1)];
    }
  }
  cpu_a.set_size(2, 216, 248);
  gpu_a.set_size(&cpu_a);
  for (k = 0; k < 107136; k++) {
    cpu_a[k] = (anchorMask[k] > 1.0);
    a_outdatedOnGpu = true;
  }
  b = true;
  plast = 0;
  k = 0;
  exitg1 = false;
  while ((!exitg1) && (k + 1 < 4)) {
    if (plast > dv2[k]) {
      b = false;
      exitg1 = true;
    } else {
      plast = dv2[k];
      k++;
    }
  }
  if (b) {
    cpu_anchorMask.set_size(216, 248, 2);
    gpu_anchorMask.set_size(&cpu_anchorMask);
    for (k = 0; k < 107136; k++) {
      cpu_anchorMask[k] = cpu_a[k];
    }
  } else {
    cpu_anchorMask.set_size(216, 248, 2);
    gpu_anchorMask.set_size(&cpu_anchorMask);
    if (a_outdatedOnGpu) {
      arrayCopyCpuToGpu(gpu_a, cpu_a);
    }
    iGenerateDetections_kernel30<<<dim3(210U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
        gpu_a, gpu_anchorMask);
    anchorMask_outdatedOnCpu = true;
  }
  for (k = 0; k < 107136; k++) {
    predAngle[k] = YPredictions_f6_Data[k];
  }
  for (k = 0; k < 107136; k++) {
    if (anchorMask_outdatedOnCpu) {
      arrayCopyGpuToCpu(cpu_anchorMask, gpu_anchorMask);
    }
    anchorMask_outdatedOnCpu = false;
    b_x[k] =
        ((YPredictions_f3_Data[k] > params_Threshold) && cpu_anchorMask[k]);
  }
  plast = 0;
  b_ii.set_size(107136);
  k = 1;
  exitg1 = false;
  while ((!exitg1) && (k < 107137)) {
    if (b_x[k - 1]) {
      plast++;
      b_ii[plast - 1] = k;
      if (plast >= 107136) {
        exitg1 = true;
      } else {
        k++;
      }
    } else {
      k++;
    }
  }
  if (plast < 1) {
    plast = 0;
  }
  b_ii.set_size(plast);
  v1.set_size(b_ii.size(0));
  for (k = 0; k < b_ii.size(0); k++) {
    v1[k] = b_ii[k] - 1;
  }
  vk.set_size(v1.size(0));
  for (k = 0; k < v1.size(0); k++) {
    vk[k] = static_cast<short>(v1[k] / 53568);
  }
  varargout_6.set_size(vk.size(0));
  for (k = 0; k < vk.size(0); k++) {
    varargout_6[k] = static_cast<signed char>(vk[k] + 1);
    v1[k] = v1[k] - vk[k] * 53568;
  }
  vk.set_size(v1.size(0));
  for (k = 0; k < v1.size(0); k++) {
    vk[k] = static_cast<short>(v1[k] / 216);
  }
  for (k = 0; k < v1.size(0); k++) {
    v1[k] = v1[k] - vk[k] * 216;
  }
  row.set_size(v1.size(0));
  col.set_size(vk.size(0));
  anchorNum.set_size(varargout_6.size(0));
  for (k = 0; k < v1.size(0); k++) {
    row[k] = static_cast<double>(v1[k]) + 1.0;
    col[k] = static_cast<double>(vk[k]) + 1.0;
    anchorNum[k] = varargout_6[k];
  }
  varargin_8.set_size(row.size(0));
  plast = row.size(0);
  r.set_size(row.size(0));
  c_r1.set_size(col.size(0));
  arrayfun(YPredictions_f2_Data, newAnchors, row, col, anchorNum, zGt);
  varargin_4.set_size(row.size(0));
  varargin_5.set_size(row.size(0));
  varargin_6.set_size(row.size(0));
  hdGt.set_size(row.size(0));
  for (k = 0; k < plast; k++) {
    varargin_8[k] =
        YPredictions_f3_Data[((static_cast<int>(row[k]) +
                               216 * (static_cast<int>(col[k]) - 1)) +
                              53568 * (static_cast<int>(anchorNum[k]) - 1)) -
                             1];
    r[k] = 0.32 * (row[k] - 1.0) + 0.16;
    c_r1[k] = (0.32 * (col[k] - 1.0) - 39.68) + 0.16;
    varargin_4[k] =
        std::exp(YPredictions_f1_Data[((static_cast<int>(row[k]) +
                                        216 * (static_cast<int>(col[k]) - 1)) +
                                       53568 * (static_cast<int>(anchorNum[k]) -
                                                1)) -
                                      1]) *
        static_cast<float>(
            newAnchors[static_cast<int>(anchorNum[k]) - 1].f1[0]);
    varargin_5[k] =
        std::exp(YPredictions_f1_Data[((static_cast<int>(row[k]) +
                                        216 * (static_cast<int>(col[k]) - 1)) +
                                       53568 * (static_cast<int>(anchorNum[k]) -
                                                1)) +
                                      107135]) *
        static_cast<float>(
            newAnchors[static_cast<int>(anchorNum[k]) - 1].f1[1]);
    varargin_6[k] =
        std::exp(YPredictions_f1_Data[((static_cast<int>(row[k]) +
                                        216 * (static_cast<int>(col[k]) - 1)) +
                                       53568 * (static_cast<int>(anchorNum[k]) -
                                                1)) +
                                      214271]) *
        static_cast<float>(
            newAnchors[static_cast<int>(anchorNum[k]) - 1].f1[2]);
    hdGt[k] =
        YPredictions_f5_Data[((static_cast<int>(row[k]) +
                               216 * (static_cast<int>(col[k]) - 1)) +
                              53568 * (static_cast<int>(anchorNum[k]) - 1)) -
                             1];
  }
  applyArrayFunction(YPredictions_f2_Data, newAnchors, row, col, anchorNum, r,
                     varargin_1);
  b_applyArrayFunction(YPredictions_f2_Data, newAnchors, row, col, anchorNum,
                       c_r1, varargin_2);
  plast = hdGt.size(0) - 1;
  for (k = 0; k <= plast; k++) {
    if (hdGt[k] >= 0.5F) {
      hdGt[k] = 1.0F;
    }
  }
  plast = hdGt.size(0) - 1;
  for (k = 0; k <= plast; k++) {
    if (hdGt[k] < 0.5F) {
      hdGt[k] = -1.0F;
    }
  }
  for (k = 0; k < 107136; k++) {
    float f;
    f = YPredictions_f6_Data[k];
    if ((f > 1.0F) || (f < -1.0F)) {
      predAngle[k] = 0.0F;
    }
  }
  arrayfun(predAngle, newAnchors, row, col, anchorNum, hdGt, angGt);
  plast = angGt.size(0) - 1;
  for (k = 0; k <= plast; k++) {
    if (angGt[k] > 3.1415926535897931) {
      angGt[k] = angGt[k] - 6.28318548F;
    }
  }
  plast = angGt.size(0) - 1;
  for (k = 0; k <= plast; k++) {
    if (angGt[k] < -3.1415926535897931) {
      angGt[k] = angGt[k] + 6.28318548F;
    }
  }
  varargout_1.set_size(row.size(0));
  plast = row.size(0);
  for (k = 0; k < plast; k++) {
    varargout_1[k] =
        YPredictions_f4_Data[((static_cast<int>(row[k]) +
                               216 * (static_cast<int>(col[k]) - 1)) +
                              53568 * (static_cast<int>(anchorNum[k]) - 1)) -
                             1];
  }
  c_x.set_size(varargout_1.size(0));
  for (k = 0; k < varargout_1.size(0); k++) {
    c_x[k] = -static_cast<double>(varargout_1[k]);
  }
  plast = c_x.size(0);
  for (k = 0; k < plast; k++) {
    c_x[k] = std::exp(c_x[k]);
  }
  cls.set_size(c_x.size(0));
  for (k = 0; k < c_x.size(0); k++) {
    cls[k] = 1.0 / (c_x[k] + 1.0);
  }
  plast = cls.size(0) - 1;
  for (k = 0; k <= plast; k++) {
    if (cls[k] >= params_Threshold) {
      cls[k] = 1.0;
    }
  }
  plast = cls.size(0) - 1;
  for (k = 0; k <= plast; k++) {
    if (cls[k] < params_Threshold) {
      cls[k] = 0.0;
    }
  }
  boxPreds.set_size(varargin_1.size(0), 9);
  plast = varargin_1.size(0);
  for (k = 0; k < plast; k++) {
    boxPreds[k] = varargin_1[k];
  }
  plast = varargin_2.size(0);
  for (k = 0; k < plast; k++) {
    boxPreds[k + boxPreds.size(0)] = varargin_2[k];
  }
  plast = zGt.size(0);
  for (k = 0; k < plast; k++) {
    boxPreds[k + boxPreds.size(0) * 2] = 0.5F * zGt[k];
  }
  plast = varargin_4.size(0);
  for (k = 0; k < plast; k++) {
    boxPreds[k + boxPreds.size(0) * 3] = varargin_4[k];
    boxPreds[k + boxPreds.size(0) * 4] = varargin_5[k];
    boxPreds[k + boxPreds.size(0) * 5] = varargin_6[k];
  }
  plast = angGt.size(0);
  for (k = 0; k < plast; k++) {
    boxPreds[k + boxPreds.size(0) * 6] = angGt[k];
  }
  plast = varargin_8.size(0);
  for (k = 0; k < plast; k++) {
    boxPreds[k + boxPreds.size(0) * 7] = varargin_8[k];
    boxPreds[k + boxPreds.size(0) * 8] = static_cast<float>(cls[k]);
  }
}

//
// Arguments    : const float YPredData_f1_Data[321408]
//                const float YPredData_f2_Data[321408]
//                const float YPredData_f3_Data[107136]
//                const float YPredData_f4_Data[107136]
//                const float YPredData_f5_Data[107136]
//                const float YPredData_f6_Data[107136]
//                const float pillarIndices[24000]
//                array<double, 2U> &boxPred
//                array<float, 1U> &scores
//                array<unsigned int, 2U> &labelNames_codes
//                array<cell_wrap_6, 1U> &labelNames_categoryNames
// Return Type  : void
//
static void pointPillarsObjectDetector_iPostprocessSingleDetection(
    const float YPredData_f1_Data[321408],
    const float YPredData_f2_Data[321408],
    const float YPredData_f3_Data[107136],
    const float YPredData_f4_Data[107136],
    const float YPredData_f5_Data[107136],
    const float YPredData_f6_Data[107136], const float pillarIndices[24000],
    array<double, 2U> &boxPred, array<float, 1U> &scores,
    array<unsigned int, 2U> &labelNames_codes,
    array<cell_wrap_6, 1U> &labelNames_categoryNames)
{
  static const signed char iv4[7]{0, 1, 2, 3, 4, 5, 8};
  static const signed char iv[5]{0, 1, 3, 4, 6};
  array<double, 1U> cpu_idx;
  array<float, 2U> X;
  array<float, 2U> Y;
  array<float, 2U> area;
  array<float, 2U> b_bbox;
  array<float, 2U> b_overlapedPolyPts;
  array<float, 2U> boxPreds;
  array<float, 2U> c_bbox;
  array<float, 2U> d_bbox;
  array<float, 2U> distVec;
  array<float, 2U> fv1;
  array<float, 2U> overlapPoly;
  array<float, 2U> overlapedPolyPts;
  array<float, 2U> r3;
  array<float, 2U> r4;
  array<float, 2U> theta;
  array<float, 2U> u;
  array<float, 2U> v;
  array<float, 1U> b_X;
  array<float, 1U> b_Y;
  array<float, 1U> b_r;
  array<float, 1U> cpu_out;
  array<float, 1U> r;
  array<float, 1U> r1;
  array<float, 1U> r2;
  array<float, 1U> xIndices1;
  array<float, 1U> yIndices1;
  array<int, 2U> iidx;
  array<int, 1U> b_index;
  array<int, 1U> posIdx;
  array<bool, 1U> b_boxPreds;
  array<bool, 1U> b_selectedIndex;
  array<bool, 1U> selectedIndex;
  gpu_array<double, 1U> gpu_idx;
  gpu_array<float, 1U> gpu_out;
  int inDims[2];
  bool idx_outdatedOnGpu;
  bool out_outdatedOnGpu;
  idx_outdatedOnGpu = false;
  out_outdatedOnGpu = false;
  iGenerateDetections(YPredData_f1_Data, YPredData_f2_Data, YPredData_f3_Data,
                      YPredData_f4_Data, YPredData_f5_Data, YPredData_f6_Data,
                      pillarIndices, 0.3, boxPreds);
  if (boxPreds.size(0) != 0) {
    int i;
    int sortDim;
    b_boxPreds.set_size(boxPreds.size(0));
    for (i = 0; i < boxPreds.size(0); i++) {
      b_boxPreds[i] = (boxPreds[i + boxPreds.size(0) * 8] > 0.15);
    }
    eml_find(b_boxPreds, posIdx);
    sortDim = boxPreds.size(0);
    for (i = 0; i < sortDim; i++) {
      boxPreds[i + boxPreds.size(0) * 6] =
          57.2957802F * boxPreds[i + boxPreds.size(0) * 6];
    }
    if (posIdx.size(0) != 0) {
      float center_idx_0;
      int currentBox;
      int inidx;
      int numOfBbox;
      int vidx;
      scores.set_size(posIdx.size(0));
      for (i = 0; i < posIdx.size(0); i++) {
        scores[i] = boxPreds[(posIdx[i] + boxPreds.size(0) * 7) - 1];
      }
      sortDim = 2;
      if (posIdx.size(0) != 1) {
        sortDim = 1;
      }
      inDims[0] = posIdx.size(0);
      inDims[1] = 1;
      cpu_out.set_size(scores.size(0));
      gpu_out.set_size(&cpu_out);
      cpu_idx.set_size(posIdx.size(0));
      gpu_idx.set_size(&cpu_idx);
      for (i = 0; i < scores.size(0); i++) {
        cpu_out[i] = scores[i];
        out_outdatedOnGpu = true;
        cpu_idx[i] = 0.0;
        idx_outdatedOnGpu = true;
      }
      if (out_outdatedOnGpu) {
        arrayCopyCpuToGpu(gpu_out, cpu_out);
      }
      if (idx_outdatedOnGpu) {
        arrayCopyCpuToGpu(gpu_idx, cpu_idx);
      }
      gpu_thrust_sort_with_index(&(gpu_out.data())[0], &(gpu_idx.data())[0], 2,
                                 &inDims[0], sortDim, 'd', false);
      idx_outdatedOnGpu = true;
      b_bbox.set_size(cpu_idx.size(0), 5);
      for (i = 0; i < 5; i++) {
        for (inidx = 0; inidx < cpu_idx.size(0); inidx++) {
          if (idx_outdatedOnGpu) {
            arrayCopyGpuToCpu(cpu_idx, gpu_idx);
          }
          idx_outdatedOnGpu = false;
          b_bbox[inidx + b_bbox.size(0) * i] =
              boxPreds[(posIdx[static_cast<int>(cpu_idx[inidx]) - 1] +
                        boxPreds.size(0) * iv[i]) -
                       1];
        }
      }
      selectedIndex.set_size(cpu_idx.size(0));
      for (i = 0; i < cpu_idx.size(0); i++) {
        selectedIndex[i] = true;
      }
      X.set_size(4, cpu_idx.size(0));
      Y.set_size(4, cpu_idx.size(0));
      for (i = 0; i < (cpu_idx.size(0) << 2); i++) {
        X[i] = 0.0F;
        Y[i] = 0.0F;
      }
      r.set_size(cpu_idx.size(0));
      for (i = 0; i < cpu_idx.size(0); i++) {
        r[i] = b_bbox[i + b_bbox.size(0) * 4];
      }
      b_r.set_size(r.size(0));
      for (i = 0; i < r.size(0); i++) {
        b_r[i] = r[i];
      }
      b_cosd(b_r);
      r1.set_size(r.size(0));
      for (i = 0; i < r.size(0); i++) {
        r1[i] = r[i];
      }
      b_sind(r1);
      if (cpu_idx.size(0) == b_r.size(0)) {
        c_bbox.set_size(cpu_idx.size(0), 2);
        sortDim = cpu_idx.size(0);
        for (i = 0; i < sortDim; i++) {
          center_idx_0 = b_bbox[i + b_bbox.size(0) * 2];
          c_bbox[i] = center_idx_0 / 2.0F;
          c_bbox[i + c_bbox.size(0)] = center_idx_0 / 2.0F;
        }
        r3.set_size(b_r.size(0), 2);
        sortDim = b_r.size(0);
        for (i = 0; i < sortDim; i++) {
          r3[i] = b_r[i];
        }
        sortDim = r1.size(0);
        for (i = 0; i < sortDim; i++) {
          r3[i + r3.size(0)] = r1[i];
        }
        u.set_size(c_bbox.size(0), 2);
        for (i = 0; i < (c_bbox.size(0) << 1); i++) {
          u[i] = c_bbox[i] * r3[i];
        }
      } else {
        if (idx_outdatedOnGpu) {
          arrayCopyGpuToCpu(cpu_idx, gpu_idx);
        }
        idx_outdatedOnGpu = false;
        binary_expand_op_9(u, b_bbox, cpu_idx, b_r, r1);
      }
      r2.set_size(r.size(0));
      for (i = 0; i < r.size(0); i++) {
        r2[i] = r[i];
      }
      b_sind(r2);
      b_cosd(r);
      if (cpu_idx.size(0) == r2.size(0)) {
        d_bbox.set_size(cpu_idx.size(0), 2);
        sortDim = cpu_idx.size(0);
        for (i = 0; i < sortDim; i++) {
          center_idx_0 = b_bbox[i + b_bbox.size(0) * 3];
          d_bbox[i] = center_idx_0 / 2.0F;
          d_bbox[i + d_bbox.size(0)] = center_idx_0 / 2.0F;
        }
        r4.set_size(r2.size(0), 2);
        sortDim = r2.size(0);
        for (i = 0; i < sortDim; i++) {
          r4[i] = -r2[i];
        }
        sortDim = r.size(0);
        for (i = 0; i < sortDim; i++) {
          r4[i + r4.size(0)] = r[i];
        }
        v.set_size(d_bbox.size(0), 2);
        for (i = 0; i < (d_bbox.size(0) << 1); i++) {
          v[i] = d_bbox[i] * r4[i];
        }
      } else {
        if (idx_outdatedOnGpu) {
          arrayCopyGpuToCpu(cpu_idx, gpu_idx);
        }
        idx_outdatedOnGpu = false;
        binary_expand_op_8(v, b_bbox, cpu_idx, r2, r);
      }
      if (cpu_idx.size(0) == 1) {
        sortDim = u.size(0);
      } else {
        sortDim = cpu_idx.size(0);
      }
      if ((cpu_idx.size(0) == u.size(0)) && (sortDim == v.size(0))) {
        sortDim = cpu_idx.size(0);
        for (i = 0; i < sortDim; i++) {
          X[4 * i] = (b_bbox[i] - u[i]) - v[i];
        }
      } else {
        if (idx_outdatedOnGpu) {
          arrayCopyGpuToCpu(cpu_idx, gpu_idx);
        }
        idx_outdatedOnGpu = false;
        binary_expand_op_7(X, cpu_idx, b_bbox, u, v);
      }
      if (cpu_idx.size(0) == 1) {
        sortDim = u.size(0);
      } else {
        sortDim = cpu_idx.size(0);
      }
      if ((cpu_idx.size(0) == u.size(0)) && (sortDim == v.size(0))) {
        sortDim = cpu_idx.size(0);
        for (i = 0; i < sortDim; i++) {
          Y[4 * i] = (b_bbox[i + b_bbox.size(0)] - u[i + u.size(0)]) -
                     v[i + v.size(0)];
        }
      } else {
        if (idx_outdatedOnGpu) {
          arrayCopyGpuToCpu(cpu_idx, gpu_idx);
        }
        idx_outdatedOnGpu = false;
        binary_expand_op_6(Y, cpu_idx, b_bbox, u, v);
      }
      if (cpu_idx.size(0) == 1) {
        sortDim = u.size(0);
      } else {
        sortDim = cpu_idx.size(0);
      }
      if ((cpu_idx.size(0) == u.size(0)) && (sortDim == v.size(0))) {
        sortDim = X.size(1);
        for (i = 0; i < sortDim; i++) {
          X[4 * i + 1] = (b_bbox[i] + u[i]) - v[i];
        }
      } else {
        if (idx_outdatedOnGpu) {
          arrayCopyGpuToCpu(cpu_idx, gpu_idx);
        }
        idx_outdatedOnGpu = false;
        binary_expand_op_5(X, b_bbox, cpu_idx, u, v);
      }
      if (cpu_idx.size(0) == 1) {
        sortDim = u.size(0);
      } else {
        sortDim = cpu_idx.size(0);
      }
      if ((cpu_idx.size(0) == u.size(0)) && (sortDim == v.size(0))) {
        sortDim = Y.size(1);
        for (i = 0; i < sortDim; i++) {
          Y[4 * i + 1] = (b_bbox[i + b_bbox.size(0)] + u[i + u.size(0)]) -
                         v[i + v.size(0)];
        }
      } else {
        if (idx_outdatedOnGpu) {
          arrayCopyGpuToCpu(cpu_idx, gpu_idx);
        }
        idx_outdatedOnGpu = false;
        binary_expand_op_4(Y, b_bbox, cpu_idx, u, v);
      }
      if (cpu_idx.size(0) == 1) {
        sortDim = u.size(0);
      } else {
        sortDim = cpu_idx.size(0);
      }
      if ((cpu_idx.size(0) == u.size(0)) && (sortDim == v.size(0))) {
        sortDim = X.size(1);
        for (i = 0; i < sortDim; i++) {
          X[4 * i + 2] = (b_bbox[i] + u[i]) + v[i];
        }
      } else {
        if (idx_outdatedOnGpu) {
          arrayCopyGpuToCpu(cpu_idx, gpu_idx);
        }
        idx_outdatedOnGpu = false;
        binary_expand_op_3(X, b_bbox, cpu_idx, u, v);
      }
      if (cpu_idx.size(0) == 1) {
        sortDim = u.size(0);
      } else {
        sortDim = cpu_idx.size(0);
      }
      if ((cpu_idx.size(0) == u.size(0)) && (sortDim == v.size(0))) {
        sortDim = Y.size(1);
        for (i = 0; i < sortDim; i++) {
          Y[4 * i + 2] = (b_bbox[i + b_bbox.size(0)] + u[i + u.size(0)]) +
                         v[i + v.size(0)];
        }
      } else {
        if (idx_outdatedOnGpu) {
          arrayCopyGpuToCpu(cpu_idx, gpu_idx);
        }
        idx_outdatedOnGpu = false;
        binary_expand_op_2(Y, b_bbox, cpu_idx, u, v);
      }
      if (cpu_idx.size(0) == 1) {
        sortDim = u.size(0);
      } else {
        sortDim = cpu_idx.size(0);
      }
      if ((cpu_idx.size(0) == u.size(0)) && (sortDim == v.size(0))) {
        sortDim = X.size(1);
        for (i = 0; i < sortDim; i++) {
          X[4 * i + 3] = (b_bbox[i] - u[i]) + v[i];
        }
      } else {
        if (idx_outdatedOnGpu) {
          arrayCopyGpuToCpu(cpu_idx, gpu_idx);
        }
        idx_outdatedOnGpu = false;
        binary_expand_op_1(X, b_bbox, cpu_idx, u, v);
      }
      if (cpu_idx.size(0) == 1) {
        sortDim = u.size(0);
      } else {
        sortDim = cpu_idx.size(0);
      }
      if ((cpu_idx.size(0) == u.size(0)) && (sortDim == v.size(0))) {
        sortDim = Y.size(1);
        for (i = 0; i < sortDim; i++) {
          Y[4 * i + 3] = (b_bbox[i + b_bbox.size(0)] - u[i + u.size(0)]) +
                         v[i + v.size(0)];
        }
      } else {
        if (idx_outdatedOnGpu) {
          arrayCopyGpuToCpu(cpu_idx, gpu_idx);
        }
        idx_outdatedOnGpu = false;
        binary_expand_op(Y, b_bbox, cpu_idx, u, v);
      }
      area.set_size(1, X.size(1));
      sortDim = X.size(1);
      for (int b_i{0}; b_i < sortDim; b_i++) {
        inidx = b_i << 2;
        vidx = b_i << 2;
        area[b_i] = std::abs(
            (((X[vidx] - X[vidx + 3]) * (Y[vidx] + Y[vidx + 3]) / 2.0F +
              (X[inidx + 1] - X[inidx]) * (Y[inidx + 1] + Y[inidx]) / 2.0F) +
             (X[inidx + 2] - X[inidx + 1]) * (Y[inidx + 2] + Y[inidx + 1]) /
                 2.0F) +
            (X[inidx + 3] - X[inidx + 2]) * (Y[inidx + 3] + Y[inidx + 2]) /
                2.0F);
      }
      numOfBbox = cpu_idx.size(0) - 2;
      currentBox = 0;
      for (int b_i{0}; b_i <= numOfBbox + 1; b_i++) {
        currentBox = b_i + 1;
        xIndices1.set_size(5);
        xIndices1[4] = X[4 * b_i];
        yIndices1.set_size(5);
        xIndices1[0] = X[4 * b_i];
        yIndices1[0] = Y[4 * b_i];
        xIndices1[1] = X[4 * b_i + 1];
        yIndices1[1] = Y[4 * b_i + 1];
        xIndices1[2] = X[4 * b_i + 2];
        yIndices1[2] = Y[4 * b_i + 2];
        xIndices1[3] = X[4 * b_i + 3];
        yIndices1[3] = Y[4 * b_i + 3];
        yIndices1[4] = Y[4 * b_i];
        if (idx_outdatedOnGpu) {
          arrayCopyGpuToCpu(cpu_idx, gpu_idx);
        }
        idx_outdatedOnGpu = false;
        if (std::isnan(boxPreds[(posIdx[static_cast<int>(cpu_idx[b_i]) - 1] +
                                 boxPreds.size(0) * 8) -
                                1])) {
          selectedIndex[b_i] = false;
        } else {
          if (selectedIndex[b_i]) {
            sortDim = 2;
          } else {
            sortDim = 1;
          }
          if (sortDim != 1) {
            int i3;
            i3 = numOfBbox - b_i;
            for (int j{0}; j <= i3; j++) {
              unsigned int b_j;
              b_j = (static_cast<unsigned int>(b_i) +
                     static_cast<unsigned int>(j)) +
                    2U;
              if (selectedIndex[static_cast<int>(b_j) - 1] &&
                  (!(boxPreds[(posIdx[static_cast<int>(
                                          cpu_idx[static_cast<int>(b_j) - 1]) -
                                      1] +
                               boxPreds.size(0) * 8) -
                              1] !=
                     boxPreds[(posIdx[static_cast<int>(cpu_idx[b_i]) - 1] +
                               boxPreds.size(0) * 8) -
                              1]))) {
                b_X.set_size(5);
                b_X[4] = X[4 * (static_cast<int>(b_j) - 1)];
                b_Y.set_size(5);
                b_X[0] = X[4 * (static_cast<int>(b_j) - 1)];
                b_Y[0] = Y[4 * (static_cast<int>(b_j) - 1)];
                b_X[1] = X[4 * (static_cast<int>(b_j) - 1) + 1];
                b_Y[1] = Y[4 * (static_cast<int>(b_j) - 1) + 1];
                b_X[2] = X[4 * (static_cast<int>(b_j) - 1) + 2];
                b_Y[2] = Y[4 * (static_cast<int>(b_j) - 1) + 2];
                b_X[3] = X[4 * (static_cast<int>(b_j) - 1) + 3];
                b_Y[3] = Y[4 * (static_cast<int>(b_j) - 1) + 3];
                b_Y[4] = Y[4 * (static_cast<int>(b_j) - 1)];
                vision::internal::detector::
                    overlapPolygonRotatedRects_findOverlapPolyPoints(
                        xIndices1, yIndices1, b_X, b_Y, overlapedPolyPts);
                if (overlapedPolyPts.size(1) != 0) {
                  float center_idx_1;
                  sortDim = overlapedPolyPts.size(1);
                  center_idx_0 = overlapedPolyPts[0];
                  center_idx_1 = overlapedPolyPts[1];
                  for (vidx = 0; vidx <= sortDim - 2; vidx++) {
                    inidx = (vidx + 1) << 1;
                    center_idx_0 += overlapedPolyPts[inidx];
                    center_idx_1 += overlapedPolyPts[inidx + 1];
                  }
                  center_idx_0 /= static_cast<float>(overlapedPolyPts.size(1));
                  center_idx_1 /= static_cast<float>(overlapedPolyPts.size(1));
                  fv1.set_size(2, overlapedPolyPts.size(1));
                  sortDim = overlapedPolyPts.size(1);
                  for (vidx = 0; vidx < sortDim; vidx++) {
                    inidx = vidx << 1;
                    fv1[inidx] = center_idx_0;
                    fv1[inidx + 1] = center_idx_1;
                  }
                  if (overlapedPolyPts.size(1) == fv1.size(1)) {
                    distVec.set_size(2, overlapedPolyPts.size(1));
                    for (i = 0; i < (overlapedPolyPts.size(1) << 1); i++) {
                      distVec[i] = overlapedPolyPts[i] - fv1[i];
                    }
                  } else {
                    minus(distVec, overlapedPolyPts, fv1);
                  }
                  i = distVec.size(1);
                  theta.set_size(1, distVec.size(1));
                  for (vidx = 0; vidx < i; vidx++) {
                    theta[vidx] =
                        rt_atan2f_snf(distVec[2 * vidx + 1], distVec[2 * vidx]);
                  }
                  sort(theta, iidx);
                  b_overlapedPolyPts.set_size(2, iidx.size(1));
                  for (i = 0; i < iidx.size(1); i++) {
                    b_overlapedPolyPts[2 * i] =
                        overlapedPolyPts[2 * (iidx[i] - 1)];
                    b_overlapedPolyPts[2 * i + 1] =
                        overlapedPolyPts[2 * (iidx[i] - 1) + 1];
                  }
                  overlapedPolyPts.set_size(2, b_overlapedPolyPts.size(1));
                  for (i = 0; i < (b_overlapedPolyPts.size(1) << 1); i++) {
                    overlapedPolyPts[i] = b_overlapedPolyPts[i];
                  }
                  overlapPoly.set_size(2, overlapedPolyPts.size(1) + 1);
                  sortDim = overlapedPolyPts.size(1);
                  for (i = 0; i < sortDim; i++) {
                    overlapPoly[2 * i] = overlapedPolyPts[2 * i];
                    overlapPoly[2 * i + 1] = overlapedPolyPts[2 * i + 1];
                  }
                  overlapPoly[2 * overlapedPolyPts.size(1)] =
                      overlapedPolyPts[0];
                  overlapPoly[2 * overlapedPolyPts.size(1) + 1] =
                      overlapedPolyPts[1];
                  center_idx_0 =
                      (overlapPoly[0] -
                       overlapPoly[2 * (overlapPoly.size(1) - 1)]) *
                      (overlapPoly[1] +
                       overlapPoly[2 * (overlapPoly.size(1) - 1) + 1]) /
                      2.0F;
                  sortDim = overlapPoly.size(1);
                  for (vidx = 0; vidx <= sortDim - 2; vidx++) {
                    center_idx_0 +=
                        (overlapPoly[2 * (vidx + 1)] - overlapPoly[2 * vidx]) *
                        (overlapPoly[2 * (vidx + 1) + 1] +
                         overlapPoly[2 * vidx + 1]) /
                        2.0F;
                  }
                  if (std::abs(center_idx_0) /
                          std::fmin(area[b_i],
                                    area[static_cast<int>(b_j) - 1]) >
                      0.1) {
                    selectedIndex[static_cast<int>(b_j) - 1] = false;
                  }
                }
              }
            }
          }
        }
      }
      if (static_cast<unsigned int>(currentBox) + 1U >
          static_cast<unsigned int>(selectedIndex.size(0))) {
        currentBox = 0;
        sortDim = 0;
      } else {
        sortDim = selectedIndex.size(0);
      }
      sortDim -= currentBox;
      for (i = 0; i < sortDim; i++) {
        selectedIndex[currentBox + i] = false;
      }
      b_selectedIndex.set_size(selectedIndex.size(0));
      for (i = 0; i < selectedIndex.size(0); i++) {
        b_selectedIndex[i] = selectedIndex[i];
      }
      for (i = 0; i < b_selectedIndex.size(0); i++) {
        if (idx_outdatedOnGpu) {
          arrayCopyGpuToCpu(cpu_idx, gpu_idx);
        }
        idx_outdatedOnGpu = false;
        selectedIndex[static_cast<int>(cpu_idx[i]) - 1] = b_selectedIndex[i];
      }
      sortDim = selectedIndex.size(0) - 1;
      inidx = 0;
      vidx = 0;
      for (int b_i{0}; b_i <= sortDim; b_i++) {
        if (selectedIndex[b_i]) {
          inidx++;
          scores[vidx] = scores[b_i];
          vidx++;
        }
      }
      scores.set_size(inidx);
      eml_find(selectedIndex, b_index);
      boxPred.set_size(b_index.size(0), 9);
      for (i = 0; i < b_index.size(0) * 9; i++) {
        boxPred[i] = 0.0;
      }
      sortDim = b_index.size(0);
      for (i = 0; i < 7; i++) {
        for (inidx = 0; inidx < sortDim; inidx++) {
          boxPred[inidx + boxPred.size(0) * iv4[i]] =
              boxPreds[(b_index[inidx] + boxPreds.size(0) * i) - 1];
        }
      }
      returnCategoricalLabels(static_cast<double>(boxPred.size(0)),
                              labelNames_codes, labelNames_categoryNames);
    } else {
      boxPred.set_size(0, 9);
      scores.set_size(0);
      returnCategoricalLabels(labelNames_codes, labelNames_categoryNames);
    }
  } else {
    boxPred.set_size(0, 9);
    scores.set_size(0);
    returnCategoricalLabels(labelNames_codes, labelNames_categoryNames);
  }
}

//
// Arguments    : array<unsigned int, 2U> &labelNamesMod_codes
//                array<cell_wrap_6, 1U> &labelNamesMod_categoryNames
// Return Type  : void
//
static void
returnCategoricalLabels(array<unsigned int, 2U> &labelNamesMod_codes,
                        array<cell_wrap_6, 1U> &labelNamesMod_categoryNames)
{
  array<cell_wrap_6, 2U> rv;
  array<cell_wrap_6, 1U> b_rv;
  array<cell_wrap_6, 1U> c_rv;
  array<cell_wrap_6, 1U> uB;
  array<cell_wrap_9, 2U> valueset;
  array<double, 1U> ib;
  int rv_idx_0;
  valueset.set_size(1, 1);
  for (rv_idx_0 = 0; rv_idx_0 < 10; rv_idx_0++) {
    valueset[0].f1[rv_idx_0] = cv[rv_idx_0];
  }
  matlab::internal::coder::datatypes::cellstr_strtrim(valueset, rv);
  rv_idx_0 = rv.size(1);
  b_rv = rv.reshape(rv_idx_0);
  matlab::internal::coder::datatypes::cellstr_unique(b_rv, c_rv);
  rv_idx_0 = rv.size(1);
  b_rv = rv.reshape(rv_idx_0);
  categorical_getCategoryNames(b_rv, labelNamesMod_categoryNames);
  rv_idx_0 = rv.size(1);
  b_rv = rv.reshape(rv_idx_0);
  matlab::internal::coder::datatypes::cellstr_unique(b_rv, uB, ib);
  labelNamesMod_codes.set_size(1, 0);
}

//
// Arguments    : double numBBoxes
//                array<unsigned int, 2U> &labelNamesMod_codes
//                array<cell_wrap_6, 1U> &labelNamesMod_categoryNames
// Return Type  : void
//
static void
returnCategoricalLabels(double numBBoxes,
                        array<unsigned int, 2U> &labelNamesMod_codes,
                        array<cell_wrap_6, 1U> &labelNamesMod_categoryNames)
{
  array<char, 2U> *b_x;
  array<char, 2U> *b_y;
  array<cell_wrap_6, 2U> rv;
  array<cell_wrap_6, 1U> b_rv;
  array<cell_wrap_6, 1U> c;
  array<cell_wrap_6, 1U> inData;
  array<cell_wrap_6, 1U> labelCells;
  array<cell_wrap_6, 1U> uA;
  array<cell_wrap_6, 1U> uB;
  array<cell_wrap_9, 2U> valueset;
  array<double, 1U> cpu_icA;
  array<double, 1U> ib;
  array<double, 1U> icA;
  array<double, 1U> locbOfUA;
  array<int, 2U> c_y;
  array<int, 2U> d_y;
  array<int, 1U> a__2;
  array<int, 1U> dIdx;
  array<int, 1U> idx;
  array<char, 1U> b_v;
  array<bool, 1U> d;
  array<bool, 1U> r;
  gpu_array<double, 1U> gpu_icA;
  double b_d;
  int b_i;
  int b_j1;
  int c_i;
  int i;
  int j;
  int j2;
  char v[10];
  bool icA_outdatedOnCpu;
  bool icA_outdatedOnGpu;
  icA_outdatedOnCpu = false;
  icA_outdatedOnGpu = false;
  labelCells.set_size(static_cast<int>(numBBoxes));
  i = static_cast<int>(numBBoxes);
  for (b_i = 0; b_i < i; b_i++) {
    b_j1 = 0;
    for (j = 0; j < 10; j++) {
      b_j1 = j + 1;
    }
    b_v.set_size(b_j1);
    for (j = 0; j < 10; j++) {
      b_v[j] = cv[j];
    }
    labelCells[b_i].f1.set_size(1, b_v.size(0));
    for (c_i = 0; c_i < b_v.size(0); c_i++) {
      labelCells[b_i].f1[c_i] = b_v[c_i];
    }
  }
  for (j = 0; j < 10; j++) {
    v[j] = cv[j];
  }
  valueset.set_size(1, 1);
  for (c_i = 0; c_i < 10; c_i++) {
    valueset[0].f1[c_i] = v[c_i];
  }
  inData.set_size(labelCells.size(0));
  j = labelCells.size(0);
  for (i = 0; i < j; i++) {
    b_x = &labelCells[i].f1;
    b_y = &inData[i].f1;
    b_j1 = 1;
    while ((b_j1 <= b_x->size(1)) &&
           bv[static_cast<unsigned char>((*b_x)[b_j1 - 1]) & 127] &&
           ((*b_x)[b_j1 - 1] != '\x00')) {
      b_j1++;
    }
    j2 = b_x->size(1);
    while ((j2 > 0) && bv[static_cast<unsigned char>((*b_x)[j2 - 1]) & 127] &&
           ((*b_x)[j2 - 1] != '\x00')) {
      j2--;
    }
    if (b_j1 > j2) {
      b_i = 0;
      j2 = 0;
    } else {
      b_i = b_j1 - 1;
    }
    b_y->set_size(1, j2 - b_i);
    for (c_i = 0; c_i < j2 - b_i; c_i++) {
      (*b_y)[c_i] = (*b_x)[b_i + c_i];
    }
  }
  matlab::internal::coder::datatypes::cellstr_strtrim(valueset, rv);
  b_j1 = rv.size(1);
  labelCells = rv.reshape(b_j1);
  matlab::internal::coder::datatypes::cellstr_unique(labelCells, b_rv);
  b_j1 = rv.size(1);
  labelCells = rv.reshape(b_j1);
  categorical_getCategoryNames(labelCells, labelNamesMod_categoryNames);
  if (inData.size(0) == 0) {
    uA.set_size(0);
    cpu_icA.set_size(0);
    gpu_icA.set_size(&cpu_icA);
  } else {
    b_j1 = inData.size(0);
    labelCells = inData.reshape(b_j1);
    matlab::internal::coder::datatypes::cellstr_sort(labelCells, c, idx);
    d.set_size(c.size(0) - 1);
    for (i = 0; i <= c.size(0) - 2; i++) {
      d[i] = !b_strcmp(c[i].f1, c[i + 1].f1);
    }
    r.set_size(d.size(0) + 1);
    r[0] = true;
    b_j1 = d.size(0);
    for (c_i = 0; c_i < b_j1; c_i++) {
      r[c_i + 1] = d[c_i];
    }
    d.set_size(r.size(0));
    for (c_i = 0; c_i < r.size(0); c_i++) {
      d[c_i] = r[c_i];
    }
    j2 = d.size(0);
    b_j1 = d[0];
    for (j = 0; j <= j2 - 2; j++) {
      b_j1 += d[j + 1];
    }
    uA.set_size(static_cast<int>(std::fmin(
        static_cast<double>(b_j1), static_cast<double>(inData.size(0)))));
    eml_find(d, dIdx);
    a__2.set_size(dIdx.size(0));
    j = dIdx.size(0);
    for (i = 0; i < j; i++) {
      if (i + 1 != dIdx.size(0)) {
        if (static_cast<double>(dIdx[i + 1]) - 1.0 < dIdx[i]) {
          d_y.set_size(1, 0);
        } else {
          c_i = dIdx[i];
          b_d = static_cast<double>(dIdx[i + 1]) - 1.0;
          d_y.set_size(
              1, static_cast<int>((static_cast<double>(dIdx[i + 1]) - 1.0) -
                                  static_cast<double>(dIdx[i])) +
                     1);
          for (b_j1 = 0;
               b_j1 <= static_cast<int>(b_d - static_cast<double>(c_i));
               b_j1++) {
            d_y[b_j1] = c_i + b_j1;
          }
        }
        j2 = d_y.size(1);
        b_j1 = idx[d_y[0] - 1];
        for (b_i = 0; b_i <= j2 - 2; b_i++) {
          c_i = d_y[b_i + 1];
          if (b_j1 > idx[c_i - 1]) {
            b_j1 = idx[c_i - 1];
          }
        }
        a__2[i] = b_j1;
      } else {
        if (idx.size(0) < dIdx[i]) {
          c_y.set_size(1, 0);
        } else {
          c_i = dIdx[i];
          c_y.set_size(1, (idx.size(0) - dIdx[i]) + 1);
          for (b_j1 = 0; b_j1 <= idx.size(0) - c_i; b_j1++) {
            c_y[b_j1] = c_i + b_j1;
          }
        }
        j2 = c_y.size(1);
        b_j1 = idx[c_y[0] - 1];
        for (b_i = 0; b_i <= j2 - 2; b_i++) {
          c_i = c_y[b_i + 1];
          if (b_j1 > idx[c_i - 1]) {
            b_j1 = idx[c_i - 1];
          }
        }
        a__2[i] = b_j1;
      }
    }
    cpu_icA.set_size(d.size(0));
    gpu_icA.set_size(&cpu_icA);
    for (c_i = 0; c_i < d.size(0); c_i++) {
      cpu_icA[c_i] = d[c_i];
      icA_outdatedOnGpu = true;
    }
    if (cpu_icA.size(0) != 1) {
      if (icA_outdatedOnGpu) {
        arrayCopyCpuToGpu(gpu_icA, cpu_icA);
      }
      mwCallThrustScan1D(&(gpu_icA.data())[0], false, cpu_icA.size(0));
      icA_outdatedOnCpu = true;
    }
    icA.set_size(cpu_icA.size(0));
    for (c_i = 0; c_i < cpu_icA.size(0); c_i++) {
      if (icA_outdatedOnCpu) {
        arrayCopyGpuToCpu(cpu_icA, gpu_icA);
      }
      icA_outdatedOnCpu = false;
      icA[c_i] = cpu_icA[c_i];
    }
    for (c_i = 0; c_i < icA.size(0); c_i++) {
      if (icA_outdatedOnCpu) {
        arrayCopyGpuToCpu(cpu_icA, gpu_icA);
      }
      cpu_icA[idx[c_i] - 1] = icA[c_i];
      icA_outdatedOnCpu = false;
    }
    j = dIdx.size(0);
    for (i = 0; i < j; i++) {
      uA[i].f1.set_size(1, inData[a__2[i] - 1].f1.size(1));
      b_j1 = inData[a__2[i] - 1].f1.size(1);
      for (c_i = 0; c_i < b_j1; c_i++) {
        uA[i].f1[c_i] = inData[a__2[i] - 1].f1[c_i];
      }
    }
  }
  b_j1 = rv.size(1);
  labelCells = rv.reshape(b_j1);
  matlab::internal::coder::datatypes::cellstr_unique(labelCells, uB, ib);
  locbOfUA.set_size(uA.size(0));
  for (c_i = 0; c_i < uA.size(0); c_i++) {
    locbOfUA[c_i] = 0.0;
  }
  if (uB.size(0) > 0) {
    bool exitg1;
    j = 0;
    i = 0;
    exitg1 = false;
    while ((!exitg1) && (i <= uA.size(0) - 1)) {
      b_j1 = uA[i].f1.size(1);
      j2 = uB[j].f1.size(1);
      if (b_j1 <= j2) {
        j2 = b_j1;
      }
      if (j2 == 0) {
        icA_outdatedOnGpu = (uA[i].f1.size(1) < uB[j].f1.size(1));
      } else {
        b_i = 0;
        while ((b_i + 1 <= j2) && (uA[i].f1[b_i] == uB[j].f1[b_i])) {
          b_i++;
        }
        if (b_i + 1 == j2 + 1) {
          icA_outdatedOnGpu = (uA[i].f1.size(1) < uB[j].f1.size(1));
        } else {
          icA_outdatedOnGpu = (uA[i].f1[b_i] < uB[j].f1[b_i]);
        }
      }
      if (!icA_outdatedOnGpu) {
        if (b_strcmp(uA[i].f1, uB[j].f1)) {
          locbOfUA[i] = ib[j];
          j++;
        } else {
          bool exitg2;
          exitg2 = false;
          while ((!exitg2) && (j + 1 <= uB.size(0))) {
            b_j1 = uA[i].f1.size(1);
            j2 = uB[j].f1.size(1);
            if (b_j1 <= j2) {
              j2 = b_j1;
            }
            if (j2 == 0) {
              icA_outdatedOnGpu = (uA[i].f1.size(1) > uB[j].f1.size(1));
            } else {
              b_i = 0;
              while ((b_i + 1 <= j2) && (uA[i].f1[b_i] == uB[j].f1[b_i])) {
                b_i++;
              }
              if (b_i + 1 == j2 + 1) {
                icA_outdatedOnGpu = (uA[i].f1.size(1) > uB[j].f1.size(1));
              } else {
                icA_outdatedOnGpu = (uA[i].f1[b_i] > uB[j].f1[b_i]);
              }
            }
            if (icA_outdatedOnGpu) {
              j++;
            } else {
              exitg2 = true;
            }
          }
          if ((j + 1 <= uB.size(0)) && b_strcmp(uA[i].f1, uB[j].f1)) {
            locbOfUA[i] = ib[j];
            j++;
          }
        }
      }
      if (j + 1 > uB.size(0)) {
        exitg1 = true;
      } else {
        i++;
      }
    }
  }
  b_j1 = cpu_icA.size(0);
  labelNamesMod_codes.set_size(1, cpu_icA.size(0));
  for (c_i = 0; c_i < b_j1; c_i++) {
    unsigned int u;
    if (icA_outdatedOnCpu) {
      arrayCopyGpuToCpu(cpu_icA, gpu_icA);
    }
    icA_outdatedOnCpu = false;
    b_d = std::round(locbOfUA[static_cast<int>(cpu_icA[c_i]) - 1]);
    if (b_d < 4.294967296E+9) {
      if (b_d >= 0.0) {
        u = static_cast<unsigned int>(b_d);
      } else {
        u = 0U;
      }
    } else if (b_d >= 4.294967296E+9) {
      u = MAX_uint32_T;
    } else {
      u = 0U;
    }
    labelNamesMod_codes[c_i] = u;
  }
}

//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const coder::gpu_array<bool, 3U> a
//                coder::gpu_array<bool, 3U> anchorMask
// Return Type  : void
//
} // namespace internal
} // namespace coder
static __global__ __launch_bounds__(512, 1) void iGenerateDetections_kernel30(
    const coder::gpu_array<bool, 3U> a, coder::gpu_array<bool, 3U> anchorMask)
{
  unsigned long long threadId;
  int b_k;
  int c_k;
  int k;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  c_k = static_cast<int>(threadId % 2ULL);
  threadId = (threadId - static_cast<unsigned long long>(c_k)) / 2ULL;
  b_k = static_cast<int>(threadId % 216ULL);
  threadId = (threadId - static_cast<unsigned long long>(b_k)) / 216ULL;
  k = static_cast<int>(threadId);
  if ((k < 248) && (b_k < 216) && (c_k < 2)) {
    anchorMask[(b_k + 216 * k) + 53568 * c_k] =
        a[(c_k + a.size(0) * b_k) + a.size(0) * 216 * k];
  }
}

//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const int result_dim0
//                const coder::gpu_array<float, 2U> intensity
//                const int result_dim1
//                const int result
//                const int sizes_idx_1
//                coder::gpu_array<float, 2U> dataIn
// Return Type  : void
//
static __global__
    __launch_bounds__(1024, 1) void pointPillarsObjectDetector_detect_kernel1(
        const int result_dim0, const coder::gpu_array<float, 2U> intensity,
        const int result_dim1, const int result, const int sizes_idx_1,
        coder::gpu_array<float, 2U> dataIn)
{
  unsigned long long loopEnd;
  unsigned long long threadId;
  unsigned long long threadStride;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = (static_cast<unsigned long long>(result) + 1ULL) *
                static_cast<unsigned long long>(sizes_idx_1) -
            1ULL;
  for (unsigned long long idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int i1;
    int i3;
    i3 = static_cast<int>(idx %
                          (static_cast<unsigned long long>(result) + 1ULL));
    i1 = static_cast<int>((idx - static_cast<unsigned long long>(i3)) /
                          (static_cast<unsigned long long>(result) + 1ULL));
    dataIn[i3 + dataIn.size(0) * (i1 + result_dim1)] =
        intensity[i3 + result_dim0 * i1];
  }
}

//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                float pillarIndices[24000]
// Return Type  : void
//
static __global__
    __launch_bounds__(512, 1) void pointPillarsObjectDetector_detect_kernel2(
        float pillarIndices[24000])
{
  unsigned long long threadId;
  int i1;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  i1 = static_cast<int>(threadId);
  if (i1 < 24000) {
    pillarIndices[i1] = 0.0F;
  }
}

//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                float dlPillarFeatures_Data[10800000]
// Return Type  : void
//
static __global__
    __launch_bounds__(512, 1) void pointPillarsObjectDetector_detect_kernel3(
        float dlPillarFeatures_Data[10800000])
{
  unsigned long long threadId;
  int i1;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  i1 = static_cast<int>(threadId);
  if (i1 < 10800000) {
    dlPillarFeatures_Data[i1] = 0.0F;
  }
}

//
// Arguments    : float u0
//                float u1
// Return Type  : float
//
static float rt_atan2f_snf(float u0, float u1)
{
  float b_y;
  if (std::isnan(u0) || std::isnan(u1)) {
    b_y = rtNaNF;
  } else if (std::isinf(u0) && std::isinf(u1)) {
    int b;
    int c;
    if (u1 > 0.0F) {
      b = 1;
    } else {
      b = -1;
    }
    if (u0 > 0.0F) {
      c = 1;
    } else {
      c = -1;
    }
    b_y = std::atan2(static_cast<float>(c), static_cast<float>(b));
  } else if (u1 == 0.0F) {
    if (u0 > 0.0F) {
      b_y = RT_PIF / 2.0F;
    } else if (u0 < 0.0F) {
      b_y = -(RT_PIF / 2.0F);
    } else {
      b_y = 0.0F;
    }
  } else {
    b_y = std::atan2(u0, u1);
  }
  return b_y;
}

//
// Arguments    : detector0_0 *this_Network
//                const pointCloud *ptCloud
//                array<double, 2U> &bboxes
//                array<float, 1U> &scores
//                array<unsigned int, 2U> &varargout_1_codes
//                array<cell_wrap_6, 1U> &varargout_1_categoryNames
// Return Type  : void
//
namespace coder {
namespace internal {
void pointPillarsObjectDetector_detect(
    detector0_0 *this_Network, const pointCloud *ptCloud,
    array<double, 2U> &bboxes, array<float, 1U> &scores,
    array<unsigned int, 2U> &varargout_1_codes,
    array<cell_wrap_6, 1U> &varargout_1_categoryNames)
{
  static float cpu_dlPillarFeatures_Data[10800000];
  static float cpu_predictions_f1_Data[321408];
  static float cpu_predictions_f2_Data[321408];
  static float cpu_predictions_f3_Data[107136];
  static float cpu_predictions_f4_Data[107136];
  static float cpu_predictions_f5_Data[107136];
  static float cpu_predictions_f6_Data[107136];
  array<float, 2U> cpu_dataIn;
  array<float, 2U> cpu_intensity;
  array<float, 2U> cpu_normals;
  array<float, 2U> cpu_rangeData;
  array<unsigned char, 2U> cpu_color;
  array<bool, 1U> cpu_r;
  gpu_array<float, 2U> gpu_dataIn;
  gpu_array<float, 2U> gpu_intensity;
  gpu_array<float, 2U> gpu_normals;
  gpu_array<float, 2U> gpu_rangeData;
  gpu_array<unsigned char, 2U> gpu_color;
  gpu_array<bool, 1U> gpu_r;
  dim3 block;
  dim3 grid;
  pointCloud ptCloudUnorg;
  float(*gpu_dlPillarFeatures_Data)[10800000];
  float(*gpu_predictions_f1_Data)[321408];
  float(*gpu_predictions_f2_Data)[321408];
  float(*gpu_predictions_f3_Data)[107136];
  float(*gpu_predictions_f4_Data)[107136];
  float(*gpu_predictions_f5_Data)[107136];
  float(*gpu_predictions_f6_Data)[107136];
  float cpu_pillarIndices[24000];
  float(*gpu_pillarIndices)[24000];
  int loop_ub;
  int result;
  int sizes_idx_1;
  signed char input_sizes_idx_1;
  bool color_outdatedOnCpu;
  bool color_outdatedOnGpu;
  bool dataIn_outdatedOnCpu;
  bool dataIn_outdatedOnGpu;
  bool empty_non_axis_sizes;
  bool intensity_outdatedOnCpu;
  bool intensity_outdatedOnGpu;
  bool normals_outdatedOnCpu;
  bool normals_outdatedOnGpu;
  bool r_outdatedOnCpu;
  bool r_outdatedOnGpu;
  bool rangeData_outdatedOnGpu;
  cudaMalloc(&gpu_predictions_f6_Data, 428544ULL);
  cudaMalloc(&gpu_predictions_f5_Data, 428544ULL);
  cudaMalloc(&gpu_predictions_f4_Data, 428544ULL);
  cudaMalloc(&gpu_predictions_f3_Data, 428544ULL);
  cudaMalloc(&gpu_predictions_f2_Data, 1285632ULL);
  cudaMalloc(&gpu_predictions_f1_Data, 1285632ULL);
  cudaMalloc(&gpu_dlPillarFeatures_Data, 43200000ULL);
  cudaMalloc(&gpu_pillarIndices, 96000ULL);
  dataIn_outdatedOnCpu = false;
  dataIn_outdatedOnGpu = false;
  empty_non_axis_sizes = false;
  rangeData_outdatedOnGpu = false;
  intensity_outdatedOnCpu = false;
  intensity_outdatedOnGpu = false;
  normals_outdatedOnCpu = false;
  normals_outdatedOnGpu = false;
  color_outdatedOnCpu = false;
  color_outdatedOnGpu = false;
  r_outdatedOnCpu = false;
  r_outdatedOnGpu = false;
  ptCloudUnorg.matlabCodegenIsDeleted = true;
  vision::internal::codegen::gpu::PointCloudImpl_extractValidPoints(
      ptCloud->Location, cpu_r, &r_outdatedOnCpu, gpu_r, &r_outdatedOnGpu);
  vision::internal::codegen::gpu::PointCloudImpl_subsetImpl(
      ptCloud->Location, ptCloud->Color, ptCloud->Normal, ptCloud->Intensity,
      ptCloud->RangeData, cpu_r, &r_outdatedOnCpu, gpu_r, &r_outdatedOnGpu,
      ptCloudUnorg.Location, cpu_color, &color_outdatedOnCpu, gpu_color,
      &color_outdatedOnGpu, cpu_normals, &normals_outdatedOnCpu, gpu_normals,
      &normals_outdatedOnGpu, cpu_intensity, &intensity_outdatedOnCpu,
      gpu_intensity, &intensity_outdatedOnGpu, cpu_rangeData,
      &empty_non_axis_sizes, gpu_rangeData, &rangeData_outdatedOnGpu);
  if (color_outdatedOnCpu) {
    arrayCopyGpuToCpu(cpu_color, gpu_color);
  }
  pointCloudBase_set_Color(&ptCloudUnorg, cpu_color);
  if (ptCloudUnorg.Location.size(0) != 0) {
    result = ptCloudUnorg.Location.size(0);
  } else if ((cpu_intensity.size(0) != 0) && (cpu_intensity.size(1) != 0)) {
    result = cpu_intensity.size(0);
  } else {
    result = ptCloudUnorg.Location.size(0);
    if (cpu_intensity.size(0) > ptCloudUnorg.Location.size(0)) {
      result = cpu_intensity.size(0);
    }
  }
  empty_non_axis_sizes = (result == 0);
  if (empty_non_axis_sizes || (ptCloudUnorg.Location.size(0) != 0)) {
    input_sizes_idx_1 = 3;
  } else {
    input_sizes_idx_1 = 0;
  }
  if (empty_non_axis_sizes ||
      ((cpu_intensity.size(0) != 0) && (cpu_intensity.size(1) != 0))) {
    sizes_idx_1 = cpu_intensity.size(1);
  } else {
    sizes_idx_1 = 0;
  }
  cpu_dataIn.set_size(result, input_sizes_idx_1 + sizes_idx_1);
  gpu_dataIn.set_size(&cpu_dataIn);
  loop_ub = input_sizes_idx_1;
  for (int i{0}; i < loop_ub; i++) {
    for (int i2{0}; i2 < result; i2++) {
      cpu_dataIn[i2 + cpu_dataIn.size(0) * i] =
          ptCloudUnorg.Location[i2 + result * i];
      dataIn_outdatedOnGpu = true;
    }
  }
  loop_ub = result - 1;
  empty_non_axis_sizes = mwGetLaunchParameters1D(
      static_cast<double>((loop_ub + 1LL) * sizes_idx_1), &grid, &block, 1024U,
      65535U);
  if (empty_non_axis_sizes) {
    if (intensity_outdatedOnGpu) {
      arrayCopyCpuToGpu(gpu_intensity, cpu_intensity);
    }
    if (dataIn_outdatedOnGpu) {
      arrayCopyCpuToGpu(gpu_dataIn, cpu_dataIn);
    }
    pointPillarsObjectDetector_detect_kernel1<<<grid, block>>>(
        result, gpu_intensity, static_cast<int>(input_sizes_idx_1), result - 1,
        sizes_idx_1, gpu_dataIn);
    dataIn_outdatedOnCpu = true;
  }
  pointPillarsObjectDetector_detect_kernel2<<<dim3(47U, 1U, 1U),
                                              dim3(512U, 1U, 1U)>>>(
      *gpu_pillarIndices);
  pointPillarsObjectDetector_detect_kernel3<<<dim3(21094U, 1U, 1U),
                                              dim3(512U, 1U, 1U)>>>(
      *gpu_dlPillarFeatures_Data);
  cudaMemcpy(cpu_dlPillarFeatures_Data, *gpu_dlPillarFeatures_Data, 43200000ULL,
             cudaMemcpyDeviceToHost);
  cudaMemcpy(cpu_pillarIndices, *gpu_pillarIndices, 96000ULL,
             cudaMemcpyDeviceToHost);
  if (dataIn_outdatedOnCpu) {
    arrayCopyGpuToCpu(cpu_dataIn, gpu_dataIn);
  }
  createPillarsImplSingle(&cpu_dlPillarFeatures_Data[0], &cpu_pillarIndices[0],
                          &cpu_dataIn[0], cpu_dataIn.size(0), 100, 12000, 0.16F,
                          0.16F, 0.0F, 69.12F, -39.68F, 39.68F, -5.0F, 5.0F);
  cudaMemcpy(*gpu_pillarIndices, cpu_pillarIndices, 96000ULL,
             cudaMemcpyHostToDevice);
  cudaMemcpy(*gpu_dlPillarFeatures_Data, cpu_dlPillarFeatures_Data, 43200000ULL,
             cudaMemcpyHostToDevice);
  dlnetwork_predict(this_Network, *gpu_pillarIndices,
                    *gpu_dlPillarFeatures_Data, *gpu_predictions_f1_Data,
                    *gpu_predictions_f2_Data, *gpu_predictions_f3_Data,
                    *gpu_predictions_f4_Data, *gpu_predictions_f5_Data,
                    *gpu_predictions_f6_Data);
  cudaMemcpy(cpu_predictions_f1_Data, *gpu_predictions_f1_Data, 1285632ULL,
             cudaMemcpyDeviceToHost);
  cudaMemcpy(cpu_predictions_f2_Data, *gpu_predictions_f2_Data, 1285632ULL,
             cudaMemcpyDeviceToHost);
  cudaMemcpy(cpu_predictions_f3_Data, *gpu_predictions_f3_Data, 428544ULL,
             cudaMemcpyDeviceToHost);
  cudaMemcpy(cpu_predictions_f4_Data, *gpu_predictions_f4_Data, 428544ULL,
             cudaMemcpyDeviceToHost);
  cudaMemcpy(cpu_predictions_f5_Data, *gpu_predictions_f5_Data, 428544ULL,
             cudaMemcpyDeviceToHost);
  cudaMemcpy(cpu_predictions_f6_Data, *gpu_predictions_f6_Data, 428544ULL,
             cudaMemcpyDeviceToHost);
  pointPillarsObjectDetector_iPostprocessSingleDetection(
      cpu_predictions_f1_Data, cpu_predictions_f2_Data, cpu_predictions_f3_Data,
      cpu_predictions_f4_Data, cpu_predictions_f5_Data, cpu_predictions_f6_Data,
      cpu_pillarIndices, bboxes, scores, varargout_1_codes,
      varargout_1_categoryNames);
  cudaFree(*gpu_pillarIndices);
  cudaFree(*gpu_dlPillarFeatures_Data);
  cudaFree(*gpu_predictions_f1_Data);
  cudaFree(*gpu_predictions_f2_Data);
  cudaFree(*gpu_predictions_f3_Data);
  cudaFree(*gpu_predictions_f4_Data);
  cudaFree(*gpu_predictions_f5_Data);
  cudaFree(*gpu_predictions_f6_Data);
}

} // namespace internal
} // namespace coder

//
// File trailer for pointPillarsObjectDetector.cu
//
// [EOF]
//
