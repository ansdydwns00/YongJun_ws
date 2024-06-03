//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// pointPillarsObjectDetector.cu
//
// Code generation for function 'pointPillarsObjectDetector'
//

// Include files
#include "pointPillarsObjectDetector.h"
#include "introsort.h"
#include "pointpillarsDetect_data.h"
#include "pointpillarsDetect_emxutil.h"
#include "pointpillarsDetect_mexutil.h"
#include "pointpillarsDetect_types.h"
#include "rt_nonfinite.h"
#include "MWScanFunctors.h"
#include "MWScanUtility.h"
#include "MWShuffleUtility.h"
#include <cmath>

// Type Definitions
struct cell_wrap_63 {
  char_T f1[10];
};

struct emxArray_cell_wrap_6_1x1 {
  cell_wrap_6 data[1];
};

// Variable Definitions
static emlrtRTEInfo m_emlrtRTEI{
    11,                                                                // lineNo
    5,                                                                 // colNo
    "cumsum",                                                          // fName
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/cumsum.m" // pName
};

static emlrtRTEInfo n_emlrtRTEI{
    44,               // lineNo
    10,               // colNo
    "cellstr_unique", // fName
    "/usr/local/MATLAB/R2024a/toolbox/matlab/datatypes/shared/codegen/+matlab/"
    "+internal/+coder/+datatypes/cellstr_unique.m" // pName
};

static const char_T cv[10]{'P', 'e', 'd', 'e', 's', 't', 'r', 'a', 'i', 'n'};

static const boolean_T bv[128]{
    false, false, false, false, false, false, false, false, false, true,  true,
    true,  true,  true,  false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, true,  true,  true,  true,  true,
    false, false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false};

// Function Declarations
static void gpuEmxMemcpyCpuToGpu_real_T(emxArray_real_T *gpu,
                                        const emxArray_real_T *cpu);

static void gpuEmxMemcpyGpuToCpu_real_T(emxArray_real_T *cpu,
                                        emxArray_real_T *gpu);

// Function Definitions
static void gpuEmxMemcpyCpuToGpu_real_T(emxArray_real_T *gpu,
                                        const emxArray_real_T *cpu)
{
  int32_T actualSize;
  actualSize = 1;
  for (int32_T i{0}; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }
  checkCudaError(cudaMemcpy(gpu->data, cpu->data,
                            static_cast<uint32_T>(actualSize) * sizeof(real_T),
                            cudaMemcpyHostToDevice),
                 __FILE__, __LINE__);
}

static void gpuEmxMemcpyGpuToCpu_real_T(emxArray_real_T *cpu,
                                        emxArray_real_T *gpu)
{
  int32_T actualSize;
  actualSize = 1;
  for (int32_T i{0}; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }
  checkCudaError(cudaMemcpy(cpu->data, gpu->data,
                            static_cast<uint32_T>(actualSize) * sizeof(real_T),
                            cudaMemcpyDeviceToHost),
                 __FILE__, __LINE__);
}

namespace coder {
namespace internal {
void c_returnCategoricalLabels(pointpillarsDetectStackData *SD,
                               int32_T labelNamesMod_codes_size[2],
                               cell_wrap_6 c_labelNamesMod_categoryNames_d[],
                               int32_T c_labelNamesMod_categoryNames_s[1])
{
  cell_wrap_63 valueset_data[1];
  emxArray_cell_wrap_6_1x1 rv;
  int32_T b_j1;
  int32_T j2;
  char_T v[10];
  for (j2 = 0; j2 < 10; j2++) {
    v[j2] = cv[j2];
  }
  for (int32_T i{0}; i < 10; i++) {
    valueset_data[0].f1[i] = v[i];
  }
  b_j1 = 0;
  while ((b_j1 + 1 <= 10) &&
         bv[static_cast<int32_T>(valueset_data[0].f1[b_j1])]) {
    b_j1++;
  }
  j2 = 9;
  while ((j2 + 1 > 0) && bv[static_cast<int32_T>(valueset_data[0].f1[j2])]) {
    j2--;
  }
  if (b_j1 + 1 > j2 + 1) {
    b_j1 = 0;
    j2 = -1;
  }
  rv.data[0].f1.size[0] = 1;
  rv.data[0].f1.size[1] = (j2 - b_j1) + 1;
  j2 -= b_j1;
  for (int32_T i{0}; i <= j2; i++) {
    rv.data[0].f1.data[i] = valueset_data[0].f1[b_j1 + i];
  }
  SD->f0.idx_data[0] = 1;
  introsort(SD->f0.idx_data, 1, rv.data);
  c_labelNamesMod_categoryNames_s[0] = 1;
  j2 = rv.data[0].f1.size[1];
  c_labelNamesMod_categoryNames_d[0].f1.size[0] = 1;
  c_labelNamesMod_categoryNames_d[0].f1.size[1] = rv.data[0].f1.size[1];
  for (int32_T i{0}; i < j2; i++) {
    c_labelNamesMod_categoryNames_d[0].f1.data[i] = rv.data[0].f1.data[i];
  }
  SD->f0.idx_data[0] = 1;
  introsort(SD->f0.idx_data, 1, rv.data);
  labelNamesMod_codes_size[0] = 1;
  labelNamesMod_codes_size[1] = 0;
}

void c_returnCategoricalLabels(pointpillarsDetectStackData *SD,
                               real_T numBBoxes,
                               uint32_T labelNamesMod_codes_data[],
                               int32_T labelNamesMod_codes_size[2],
                               cell_wrap_6 c_labelNamesMod_categoryNames_d[],
                               int32_T c_labelNamesMod_categoryNames_s[1])
{
  cell_wrap_63 valueset_data[1];
  emxArray_cell_wrap_6_1 uB;
  emxArray_cell_wrap_6_1x1 rv;
  emxArray_real_T gpu_y;
  emxArray_real_T *cpu_y;
  int32_T idx_size[1];
  int32_T b_i;
  int32_T b_j1;
  int32_T c_i;
  int32_T exitg1;
  int32_T i;
  int32_T idx;
  int32_T j2;
  int32_T k;
  char_T v_data[10];
  boolean_T b;
  boolean_T b_bool;
  boolean_T exitg2;
  boolean_T y_outdatedOnCpu;
  gpuEmxReset_real_T(&gpu_y);
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);
  i = static_cast<int32_T>(numBBoxes);
  for (b_i = 0; b_i < i; b_i++) {
    j2 = 0;
    for (k = 0; k < 10; k++) {
      j2 = k + 1;
    }
    for (k = 0; k < 10; k++) {
      v_data[k] = cv[k];
    }
    SD->f2.labelCells.data[b_i].f1.size[0] = 1;
    SD->f2.labelCells.data[b_i].f1.size[1] = j2;
    for (c_i = 0; c_i < j2; c_i++) {
      SD->f2.labelCells.data[b_i].f1.data[c_i] = v_data[c_i];
    }
  }
  for (k = 0; k < 10; k++) {
    v_data[k] = cv[k];
  }
  for (c_i = 0; c_i < 10; c_i++) {
    valueset_data[0].f1[c_i] = v_data[c_i];
  }
  idx = static_cast<int32_T>(numBBoxes);
  for (i = 0; i < idx; i++) {
    b_j1 = 0;
    while ((b_j1 + 1 <= SD->f2.labelCells.data[i].f1.size[1]) &&
           bv[static_cast<int32_T>(SD->f2.labelCells.data[i].f1.data[b_j1])]) {
      b_j1++;
    }
    j2 = SD->f2.labelCells.data[i].f1.size[1];
    while (
        (j2 > 0) &&
        bv[static_cast<int32_T>(SD->f2.labelCells.data[i].f1.data[j2 - 1])]) {
      j2--;
    }
    if (b_j1 + 1 > j2) {
      b_j1 = 0;
      j2 = 0;
    }
    SD->f2.inData.data[i].f1.size[0] = 1;
    SD->f2.inData.data[i].f1.size[1] = j2 - b_j1;
    k = j2 - b_j1;
    for (c_i = 0; c_i < k; c_i++) {
      SD->f2.inData.data[i].f1.data[c_i] =
          SD->f2.labelCells.data[i].f1.data[b_j1 + c_i];
    }
  }
  b_j1 = 0;
  while ((b_j1 + 1 <= 10) &&
         bv[static_cast<int32_T>(valueset_data[0].f1[b_j1])]) {
    b_j1++;
  }
  j2 = 9;
  while ((j2 + 1 > 0) && bv[static_cast<int32_T>(valueset_data[0].f1[j2])]) {
    j2--;
  }
  if (b_j1 + 1 > j2 + 1) {
    b_j1 = 0;
    j2 = -1;
  }
  rv.data[0].f1.size[0] = 1;
  rv.data[0].f1.size[1] = (j2 - b_j1) + 1;
  k = j2 - b_j1;
  for (c_i = 0; c_i <= k; c_i++) {
    rv.data[0].f1.data[c_i] = valueset_data[0].f1[b_j1 + c_i];
  }
  SD->f2.locbOfUA_data[0] = 1;
  introsort(SD->f2.locbOfUA_data, 1, rv.data);
  c_labelNamesMod_categoryNames_s[0] = 1;
  k = rv.data[0].f1.size[1];
  c_labelNamesMod_categoryNames_d[0].f1.size[0] = 1;
  c_labelNamesMod_categoryNames_d[0].f1.size[1] = rv.data[0].f1.size[1];
  for (c_i = 0; c_i < k; c_i++) {
    c_labelNamesMod_categoryNames_d[0].f1.data[c_i] = rv.data[0].f1.data[c_i];
  }
  emxInit_real_T(&cpu_y, 1, &n_emlrtRTEI, true);
  if (static_cast<int32_T>(numBBoxes) == 0) {
    SD->f2.uA.size[0] = 0;
    y_outdatedOnCpu = false;
    cpu_y->size[0] = 0;
  } else {
    int32_T d_size_idx_0;
    int32_T ii_size_idx_0;
    int32_T y_size_idx_1;
    j2 = static_cast<int32_T>(numBBoxes);
    y_size_idx_1 = static_cast<int32_T>(numBBoxes);
    SD->f2.b_y_data[0] = 1;
    b_j1 = 1;
    for (k = 0; k <= j2 - 2; k++) {
      b_j1++;
      SD->f2.b_y_data[k + 1] = b_j1;
    }
    idx_size[0] = static_cast<int32_T>(numBBoxes);
    for (c_i = 0; c_i < y_size_idx_1; c_i++) {
      SD->f2.locbOfUA_data[c_i] = SD->f2.b_y_data[c_i];
    }
    introsort(SD->f2.locbOfUA_data, static_cast<int32_T>(numBBoxes),
              SD->f2.inData.data);
    SD->f2.labelCells.size[0] = static_cast<int32_T>(numBBoxes);
    j2 = static_cast<int32_T>(numBBoxes);
    for (i = 0; i < j2; i++) {
      SD->f2.labelCells.data[i].f1.size[0] = 1;
      SD->f2.labelCells.data[i].f1.size[1] =
          SD->f2.inData.data[SD->f2.locbOfUA_data[i] - 1].f1.size[1];
      k = SD->f2.inData.data[SD->f2.locbOfUA_data[i] - 1].f1.size[1];
      for (c_i = 0; c_i < k; c_i++) {
        SD->f2.labelCells.data[i].f1.data[c_i] =
            SD->f2.inData.data[SD->f2.locbOfUA_data[i] - 1].f1.data[c_i];
      }
    }
    b_j1 = static_cast<int32_T>(numBBoxes) - 1;
    for (i = 0; i <= SD->f2.labelCells.size[0] - 2; i++) {
      SD->f2.b_d_data[i] = false;
      b_bool = false;
      b = (SD->f2.labelCells.data[i].f1.size[1] == 0);
      if (b && (SD->f2.labelCells.data[i + 1].f1.size[1] == 0)) {
        b_bool = true;
      } else if (SD->f2.labelCells.data[i].f1.size[1] ==
                 SD->f2.labelCells.data[i + 1].f1.size[1]) {
        j2 = 0;
        do {
          exitg1 = 0;
          if (j2 + 1 <= SD->f2.labelCells.data[i + 1].f1.size[1]) {
            if (SD->f2.labelCells.data[i].f1.data[j2] !=
                SD->f2.labelCells.data[i + 1].f1.data[j2]) {
              exitg1 = 1;
            } else {
              j2++;
            }
          } else {
            b_bool = true;
            exitg1 = 1;
          }
        } while (exitg1 == 0);
      }
      SD->f2.b_d_data[i] = !b_bool;
    }
    d_size_idx_0 = static_cast<int32_T>(numBBoxes);
    SD->f2.d_data[0] = true;
    for (c_i = 0; c_i < b_j1; c_i++) {
      SD->f2.d_data[c_i + 1] = SD->f2.b_d_data[c_i];
    }
    j2 = SD->f2.d_data[0];
    for (k = 0; k <= d_size_idx_0 - 2; k++) {
      j2 += SD->f2.d_data[k + 1];
    }
    SD->f2.uA.size[0] = static_cast<int32_T>(
        std::fmin(static_cast<real_T>(j2),
                  static_cast<real_T>(static_cast<int32_T>(numBBoxes))));
    idx = 0;
    ii_size_idx_0 = static_cast<int32_T>(numBBoxes);
    b_j1 = 1;
    exitg2 = false;
    while ((!exitg2) && (b_j1 <= static_cast<int32_T>(numBBoxes))) {
      if (SD->f2.d_data[b_j1 - 1]) {
        idx++;
        SD->f2.ii_data[idx - 1] = b_j1;
        if (idx >= static_cast<int32_T>(numBBoxes)) {
          exitg2 = true;
        } else {
          b_j1++;
        }
      } else {
        b_j1++;
      }
    }
    if (static_cast<int32_T>(numBBoxes) == 1) {
      if (idx == 0) {
        ii_size_idx_0 = 0;
      }
    } else if (idx < 1) {
      ii_size_idx_0 = 0;
    } else {
      ii_size_idx_0 = idx;
    }
    for (i = 0; i < ii_size_idx_0; i++) {
      if (i + 1 != ii_size_idx_0) {
        if (SD->f2.ii_data[i + 1] - 1 < SD->f2.ii_data[i]) {
          y_size_idx_1 = 0;
        } else {
          c_i = SD->f2.ii_data[i];
          j2 = SD->f2.ii_data[i + 1];
          y_size_idx_1 = SD->f2.ii_data[i + 1] - SD->f2.ii_data[i];
          for (idx = 0; idx < j2 - c_i; idx++) {
            SD->f2.b_y_data[idx] = c_i + idx;
          }
        }
        b_j1 = SD->f2.locbOfUA_data[SD->f2.b_y_data[0] - 1];
        for (b_i = 0; b_i <= y_size_idx_1 - 2; b_i++) {
          c_i = SD->f2.b_y_data[b_i + 1];
          if (b_j1 > SD->f2.locbOfUA_data[c_i - 1]) {
            b_j1 = SD->f2.locbOfUA_data[c_i - 1];
          }
        }
        SD->f2.a__2_data[i] = b_j1;
      } else {
        if (static_cast<int32_T>(numBBoxes) < SD->f2.ii_data[i]) {
          y_size_idx_1 = 0;
        } else {
          c_i = SD->f2.ii_data[i];
          y_size_idx_1 =
              (static_cast<int32_T>(numBBoxes) - SD->f2.ii_data[i]) + 1;
          for (j2 = 0; j2 <= idx_size[0] - c_i; j2++) {
            SD->f2.b_y_data[j2] = c_i + j2;
          }
        }
        b_j1 = SD->f2.locbOfUA_data[SD->f2.b_y_data[0] - 1];
        for (b_i = 0; b_i <= y_size_idx_1 - 2; b_i++) {
          c_i = SD->f2.b_y_data[b_i + 1];
          if (b_j1 > SD->f2.locbOfUA_data[c_i - 1]) {
            b_j1 = SD->f2.locbOfUA_data[c_i - 1];
          }
        }
        SD->f2.a__2_data[i] = b_j1;
      }
    }
    y_outdatedOnCpu = false;
    b_bool = false;
    c_i = cpu_y->size[0];
    cpu_y->size[0] = static_cast<int32_T>(numBBoxes);
    emxEnsureCapacity_real_T(cpu_y, c_i, &m_emlrtRTEI);
    for (c_i = 0; c_i < d_size_idx_0; c_i++) {
      cpu_y->data[c_i] = SD->f2.d_data[c_i];
      b_bool = true;
    }
    if (cpu_y->size[0] != 1) {
      gpuEmxEnsureCapacity_real_T(cpu_y, &gpu_y, !b_bool);
      if (b_bool) {
        gpuEmxMemcpyCpuToGpu_real_T(&gpu_y, cpu_y);
      }
      mwCallThrustScan1D(&gpu_y.data[0], false, cpu_y->size[0]);
      y_outdatedOnCpu = true;
    }
    b_j1 = cpu_y->size[0];
    for (c_i = 0; c_i < cpu_y->size[0]; c_i++) {
      if (y_outdatedOnCpu) {
        gpuEmxMemcpyGpuToCpu_real_T(cpu_y, &gpu_y);
      }
      y_outdatedOnCpu = false;
      SD->f2.y_data[c_i] = cpu_y->data[c_i];
    }
    for (c_i = 0; c_i < b_j1; c_i++) {
      if (y_outdatedOnCpu) {
        gpuEmxMemcpyGpuToCpu_real_T(cpu_y, &gpu_y);
      }
      cpu_y->data[SD->f2.locbOfUA_data[c_i] - 1] = SD->f2.y_data[c_i];
      y_outdatedOnCpu = false;
    }
    for (i = 0; i < ii_size_idx_0; i++) {
      SD->f2.uA.data[i].f1.size[0] = 1;
      SD->f2.uA.data[i].f1.size[1] =
          SD->f2.inData.data[SD->f2.a__2_data[i] - 1].f1.size[1];
      k = SD->f2.inData.data[SD->f2.a__2_data[i] - 1].f1.size[1];
      for (c_i = 0; c_i < k; c_i++) {
        SD->f2.uA.data[i].f1.data[c_i] =
            SD->f2.inData.data[SD->f2.a__2_data[i] - 1].f1.data[c_i];
      }
    }
  }
  SD->f2.locbOfUA_data[0] = 1;
  introsort(SD->f2.locbOfUA_data, 1, rv.data);
  SD->f2.ib_data[0] = SD->f2.locbOfUA_data[0];
  k = rv.data[0].f1.size[1];
  uB.data[0].f1.size[1] = rv.data[0].f1.size[1];
  for (c_i = 0; c_i < k; c_i++) {
    uB.data[0].f1.data[c_i] = rv.data[0].f1.data[c_i];
  }
  for (c_i = 0; c_i < SD->f2.uA.size[0]; c_i++) {
    SD->f2.locbOfUA_data[c_i] = 0;
  }
  b_j1 = 1;
  i = 0;
  exitg2 = false;
  while ((!exitg2) && (i <= SD->f2.uA.size[0] - 1)) {
    j2 = SD->f2.uA.data[i].f1.size[1];
    idx = uB.data[0].f1.size[1];
    if (j2 <= uB.data[0].f1.size[1]) {
      idx = j2;
    }
    if (idx == 0) {
      b = (SD->f2.uA.data[i].f1.size[1] < uB.data[0].f1.size[1]);
    } else {
      b_i = 0;
      while ((b_i + 1 <= idx) &&
             (SD->f2.uA.data[i].f1.data[b_i] == uB.data[0].f1.data[b_i])) {
        b_i++;
      }
      if (b_i + 1 == idx + 1) {
        b = (SD->f2.uA.data[i].f1.size[1] < uB.data[0].f1.size[1]);
      } else {
        b = (SD->f2.uA.data[i].f1.data[b_i] < uB.data[0].f1.data[b_i]);
      }
    }
    if (!b) {
      b_bool = false;
      b = (SD->f2.uA.data[i].f1.size[1] == 0);
      if (b && (uB.data[0].f1.size[1] == 0)) {
        b_bool = true;
      } else if (SD->f2.uA.data[i].f1.size[1] == uB.data[0].f1.size[1]) {
        j2 = 0;
        do {
          exitg1 = 0;
          if (j2 + 1 <= uB.data[0].f1.size[1]) {
            if (SD->f2.uA.data[i].f1.data[j2] != uB.data[0].f1.data[j2]) {
              exitg1 = 1;
            } else {
              j2++;
            }
          } else {
            b_bool = true;
            exitg1 = 1;
          }
        } while (exitg1 == 0);
      }
      if (b_bool) {
        SD->f2.locbOfUA_data[i] = SD->f2.ib_data[0];
        b_j1 = 2;
      } else {
        boolean_T exitg3;
        exitg3 = false;
        while ((!exitg3) && (b_j1 <= 1)) {
          j2 = SD->f2.uA.data[i].f1.size[1];
          idx = uB.data[0].f1.size[1];
          if (j2 <= uB.data[0].f1.size[1]) {
            idx = j2;
          }
          if (idx == 0) {
            b = (SD->f2.uA.data[i].f1.size[1] > uB.data[0].f1.size[1]);
          } else {
            b_i = 0;
            while ((b_i + 1 <= idx) && (SD->f2.uA.data[i].f1.data[b_i] ==
                                        uB.data[0].f1.data[b_i])) {
              b_i++;
            }
            if (b_i + 1 == idx + 1) {
              b = (SD->f2.uA.data[i].f1.size[1] > uB.data[0].f1.size[1]);
            } else {
              b = (SD->f2.uA.data[i].f1.data[b_i] > uB.data[0].f1.data[b_i]);
            }
          }
          if (b) {
            b_j1 = 2;
          } else {
            exitg3 = true;
          }
        }
        if (b_j1 <= 1) {
          b = (SD->f2.uA.data[i].f1.size[1] == 0);
          if (b && (uB.data[0].f1.size[1] == 0)) {
            b_bool = true;
          } else if (SD->f2.uA.data[i].f1.size[1] == uB.data[0].f1.size[1]) {
            j2 = 0;
            do {
              exitg1 = 0;
              if (j2 + 1 <= uB.data[0].f1.size[1]) {
                if (SD->f2.uA.data[i].f1.data[j2] != uB.data[0].f1.data[j2]) {
                  exitg1 = 1;
                } else {
                  j2++;
                }
              } else {
                b_bool = true;
                exitg1 = 1;
              }
            } while (exitg1 == 0);
          }
          if (b_bool) {
            SD->f2.locbOfUA_data[i] = SD->f2.ib_data[0];
            b_j1 = 2;
          }
        }
      }
    }
    if (b_j1 > 1) {
      exitg2 = true;
    } else {
      i++;
    }
  }
  labelNamesMod_codes_size[0] = 1;
  labelNamesMod_codes_size[1] = cpu_y->size[0];
  k = cpu_y->size[0];
  for (c_i = 0; c_i < k; c_i++) {
    if (y_outdatedOnCpu) {
      gpuEmxMemcpyGpuToCpu_real_T(cpu_y, &gpu_y);
    }
    y_outdatedOnCpu = false;
    j2 = SD->f2.locbOfUA_data[static_cast<int32_T>(cpu_y->data[c_i]) - 1];
    if (j2 < 0) {
      j2 = 0;
    }
    labelNamesMod_codes_data[c_i] = static_cast<uint32_T>(j2);
  }
  emxFree_real_T(&cpu_y);
  emlrtHeapReferenceStackLeaveFcnR2012b(emlrtRootTLSGlobal);
  gpuEmxFree_real_T(&gpu_y);
}

} // namespace internal
} // namespace coder

// End of code generation (pointPillarsObjectDetector.cu)
