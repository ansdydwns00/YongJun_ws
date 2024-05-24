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
#include "pointpillardetect_data.h"
#include "pointpillardetect_emxutil.h"
#include "pointpillardetect_mexutil.h"
#include "pointpillardetect_types.h"
#include "rt_nonfinite.h"
#include "MWScanFunctors.h"
#include "MWScanUtility.h"
#include "MWShuffleUtility.h"
#include <cmath>

// Type Definitions
struct emxArray_cell_wrap_6_1x2 {
  cell_wrap_6 data[2];
  int32_T size[2];
};

// Variable Definitions
static emlrtRTEInfo bb_emlrtRTEI{
    11,                                                                // lineNo
    5,                                                                 // colNo
    "cumsum",                                                          // fName
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/cumsum.m" // pName
};

static emlrtRTEInfo cb_emlrtRTEI{
    44,               // lineNo
    10,               // colNo
    "cellstr_unique", // fName
    "/usr/local/MATLAB/R2024a/toolbox/matlab/datatypes/shared/codegen/+matlab/"
    "+internal/+coder/+datatypes/cellstr_unique.m" // pName
};

static const char_T cv[10]{'C', 'T',    'a', 'r',    'r',
                           'u', '\x00', 'c', '\x00', 'k'};

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

// Function Definitions
void binary_expand_op(boolean_T in1[214272], const real32_T in2[214272],
                      real_T in3, const emxArray_boolean_T *in4)
{
  int32_T aux_0_2;
  int32_T stride_0_2;
  stride_0_2 = (in4->size[2] != 1);
  aux_0_2 = 0;
  for (int32_T i{0}; i < 4; i++) {
    for (int32_T i1{0}; i1 < 248; i1++) {
      for (int32_T i2{0}; i2 < 216; i2++) {
        in1[(i2 + 216 * i1) + 53568 * i] =
            ((in2[(i2 + 216 * i1) + 53568 * i] > in3) &&
             in4->data[(i2 + 216 * i1) + 53568 * aux_0_2]);
      }
    }
    aux_0_2 += stride_0_2;
  }
}

namespace coder {
namespace internal {
void c_returnCategoricalLabels(pointpillardetectStackData *SD,
                               int32_T labelNamesMod_codes_size[2],
                               cell_wrap_6 c_labelNamesMod_categoryNames_d[],
                               int32_T c_labelNamesMod_categoryNames_s[1])
{
  emxArray_cell_wrap_6_1x2 rv;
  emxArray_cell_wrap_6_1x2 valueset;
  emxArray_real_T b_gpu_y;
  emxArray_real_T gpu_y;
  emxArray_real_T *b_cpu_y;
  emxArray_real_T *cpu_y;
  int32_T b_i;
  int32_T b_j1;
  int32_T exitg1;
  int32_T i;
  int32_T j2;
  int32_T k;
  int32_T n;
  boolean_T d_data[2];
  boolean_T b;
  boolean_T b_bool;
  gpuEmxReset_real_T(&b_gpu_y);
  gpuEmxReset_real_T(&gpu_y);
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);
  valueset.size[1] = 0;
  for (i = 0; i < 2; i++) {
    char_T v_data[5];
    n = 0;
    for (k = 0; k < 5; k++) {
      if (cv[i + (k << 1)] != 0) {
        n++;
      }
    }
    b_i = -1;
    for (k = 0; k < 5; k++) {
      char_T c;
      c = cv[i + (k << 1)];
      if (c != 0) {
        b_i++;
        v_data[b_i] = c;
      }
    }
    j2 = valueset.size[1] + 1;
    valueset.size[1]++;
    valueset.data[j2 - 1].f1.size[0] = 1;
    valueset.data[valueset.size[1] - 1].f1.size[1] = n;
    for (k = 0; k < n; k++) {
      valueset.data[valueset.size[1] - 1].f1.data[k] = v_data[k];
    }
  }
  i = valueset.size[1];
  for (b_i = 0; b_i < i; b_i++) {
    b_j1 = 0;
    while ((b_j1 + 1 <= valueset.data[b_i].f1.size[1]) &&
           bv[static_cast<uint8_T>(valueset.data[b_i].f1.data[b_j1]) & 127] &&
           (valueset.data[b_i].f1.data[b_j1] != '\x00')) {
      b_j1++;
    }
    j2 = valueset.data[b_i].f1.size[1] - 1;
    while ((j2 + 1 > 0) &&
           bv[static_cast<uint8_T>(valueset.data[b_i].f1.data[j2]) & 127] &&
           (valueset.data[b_i].f1.data[j2] != '\x00')) {
      j2--;
    }
    if (b_j1 + 1 > j2 + 1) {
      b_j1 = 0;
      j2 = -1;
    }
    rv.data[b_i].f1.size[0] = 1;
    rv.data[b_i].f1.size[1] = (j2 - b_j1) + 1;
    n = j2 - b_j1;
    for (k = 0; k <= n; k++) {
      rv.data[b_i].f1.data[k] = valueset.data[b_i].f1.data[b_j1 + k];
    }
  }
  if (valueset.size[1] != 0) {
    n = valueset.size[1];
    i = valueset.size[1];
    SD->f0.y_data[0] = 1;
    j2 = 1;
    for (k = 0; k <= n - 2; k++) {
      j2++;
      SD->f0.y_data[1] = static_cast<int8_T>(j2);
    }
    for (k = 0; k < i; k++) {
      SD->f0.idx_data[k] = SD->f0.y_data[k];
    }
    introsort(SD->f0.idx_data, valueset.size[1], rv.data);
    SD->f0.c.size[0] = valueset.size[1];
    j2 = valueset.size[1];
    for (i = 0; i < j2; i++) {
      SD->f0.c.data[i].f1.size[0] = 1;
      SD->f0.c.data[i].f1.size[1] = rv.data[SD->f0.idx_data[i] - 1].f1.size[1];
      n = rv.data[SD->f0.idx_data[i] - 1].f1.size[1];
      for (k = 0; k < n; k++) {
        SD->f0.c.data[i].f1.data[k] =
            rv.data[SD->f0.idx_data[i] - 1].f1.data[k];
      }
    }
    for (i = 0; i <= SD->f0.c.size[0] - 2; i++) {
      b_bool = false;
      b = (SD->f0.c.data[0].f1.size[1] == 0);
      if (b && (SD->f0.c.data[1].f1.size[1] == 0)) {
        b_bool = true;
      } else if (SD->f0.c.data[0].f1.size[1] == SD->f0.c.data[1].f1.size[1]) {
        j2 = 0;
        do {
          exitg1 = 0;
          if (j2 + 1 <= SD->f0.c.data[1].f1.size[1]) {
            if (SD->f0.c.data[0].f1.data[j2] != SD->f0.c.data[1].f1.data[j2]) {
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
      SD->f0.d_data[0] = !b_bool;
    }
    i = valueset.size[1];
    d_data[0] = true;
    n = valueset.size[1] - 1;
    for (k = 0; k < n; k++) {
      d_data[1] = SD->f0.d_data[0];
    }
    emxInit_real_T(&cpu_y, 1, &cb_emlrtRTEI, true);
    b_bool = false;
    k = cpu_y->size[0];
    cpu_y->size[0] = valueset.size[1];
    emxEnsureCapacity_real_T(cpu_y, k, &bb_emlrtRTEI);
    for (k = 0; k < i; k++) {
      cpu_y->data[k] = d_data[k];
      b_bool = true;
    }
    if (cpu_y->size[0] != 1) {
      gpuEmxEnsureCapacity_real_T(cpu_y, &gpu_y, !b_bool);
      if (b_bool) {
        gpuEmxMemcpyCpuToGpu_real_T(&gpu_y, cpu_y);
      }
      mwCallThrustScan1D(&gpu_y.data[0], false, 2);
    }
    emxFree_real_T(&cpu_y);
  }
  if (valueset.size[1] != 0) {
    int8_T iv2_idx_0;
    iv2_idx_0 = static_cast<int8_T>(valueset.size[1]);
    c_labelNamesMod_categoryNames_s[0] = valueset.size[1];
    for (j2 = 0; j2 < iv2_idx_0; j2++) {
      c_labelNamesMod_categoryNames_d[j2].f1.size[0] = 1;
      c_labelNamesMod_categoryNames_d[j2].f1.size[1] = 0;
    }
    j2 = valueset.size[1];
    c_labelNamesMod_categoryNames_s[0] = valueset.size[1];
    for (i = 0; i < j2; i++) {
      c_labelNamesMod_categoryNames_d[i].f1.size[0] = 1;
      n = rv.data[i].f1.size[1];
      c_labelNamesMod_categoryNames_d[i].f1.size[1] = rv.data[i].f1.size[1];
      for (b_j1 = 0; b_j1 < n; b_j1++) {
        c_labelNamesMod_categoryNames_d[i].f1.data[b_j1] =
            rv.data[i].f1.data[b_j1];
      }
    }
    n = valueset.size[1];
    i = valueset.size[1];
    SD->f0.y_data[0] = 1;
    j2 = 1;
    for (k = 0; k <= n - 2; k++) {
      j2++;
      SD->f0.y_data[1] = static_cast<int8_T>(j2);
    }
    for (k = 0; k < i; k++) {
      SD->f0.idx_data[k] = SD->f0.y_data[k];
    }
    introsort(SD->f0.idx_data, valueset.size[1], rv.data);
    SD->f0.c.size[0] = valueset.size[1];
    j2 = valueset.size[1];
    for (i = 0; i < j2; i++) {
      SD->f0.c.data[i].f1.size[0] = 1;
      SD->f0.c.data[i].f1.size[1] = rv.data[SD->f0.idx_data[i] - 1].f1.size[1];
      n = rv.data[SD->f0.idx_data[i] - 1].f1.size[1];
      for (k = 0; k < n; k++) {
        SD->f0.c.data[i].f1.data[k] =
            rv.data[SD->f0.idx_data[i] - 1].f1.data[k];
      }
    }
    for (i = 0; i <= SD->f0.c.size[0] - 2; i++) {
      b_bool = false;
      b = (SD->f0.c.data[0].f1.size[1] == 0);
      if (b && (SD->f0.c.data[1].f1.size[1] == 0)) {
        b_bool = true;
      } else if (SD->f0.c.data[0].f1.size[1] == SD->f0.c.data[1].f1.size[1]) {
        j2 = 0;
        do {
          exitg1 = 0;
          if (j2 + 1 <= SD->f0.c.data[1].f1.size[1]) {
            if (SD->f0.c.data[0].f1.data[j2] != SD->f0.c.data[1].f1.data[j2]) {
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
      SD->f0.d_data[0] = !b_bool;
    }
    i = valueset.size[1];
    d_data[0] = true;
    n = valueset.size[1] - 1;
    for (k = 0; k < n; k++) {
      d_data[1] = SD->f0.d_data[0];
    }
    emxInit_real_T(&b_cpu_y, 1, &cb_emlrtRTEI, true);
    b_bool = false;
    k = b_cpu_y->size[0];
    b_cpu_y->size[0] = valueset.size[1];
    emxEnsureCapacity_real_T(b_cpu_y, k, &bb_emlrtRTEI);
    for (k = 0; k < i; k++) {
      b_cpu_y->data[k] = d_data[k];
      b_bool = true;
    }
    if (b_cpu_y->size[0] != 1) {
      gpuEmxEnsureCapacity_real_T(b_cpu_y, &b_gpu_y, !b_bool);
      if (b_bool) {
        gpuEmxMemcpyCpuToGpu_real_T(&b_gpu_y, b_cpu_y);
      }
      mwCallThrustScan1D(&b_gpu_y.data[0], false, 2);
    }
    emxFree_real_T(&b_cpu_y);
  } else {
    c_labelNamesMod_categoryNames_s[0] = 0;
  }
  labelNamesMod_codes_size[0] = 1;
  labelNamesMod_codes_size[1] = 0;
  emlrtHeapReferenceStackLeaveFcnR2012b(emlrtRootTLSGlobal);
  gpuEmxFree_real_T(&gpu_y);
  gpuEmxFree_real_T(&b_gpu_y);
}

void c_returnCategoricalLabels(pointpillardetectStackData *SD, real_T numBBoxes,
                               const real32_T labels_data[],
                               uint32_T labelNamesMod_codes_data[],
                               int32_T labelNamesMod_codes_size[2],
                               cell_wrap_6 c_labelNamesMod_categoryNames_d[],
                               int32_T c_labelNamesMod_categoryNames_s[1])
{
  emxArray_cell_wrap_6_1x2 rv;
  emxArray_cell_wrap_6_1x2 valueset;
  emxArray_cell_wrap_6_2 uB;
  emxArray_real_T b_gpu_y;
  emxArray_real_T c_gpu_y;
  emxArray_real_T gpu_y;
  emxArray_real_T *b_cpu_y;
  emxArray_real_T *c_cpu_y;
  emxArray_real_T *cpu_y;
  int32_T b_idx_size[1];
  int32_T b_rv[1];
  int32_T idx_size[1];
  int32_T b_i;
  int32_T b_j1;
  int32_T c_i;
  int32_T d_size_idx_0;
  int32_T exitg1;
  int32_T i;
  int32_T ii_size_idx_0;
  int32_T j2;
  int32_T k;
  int32_T n;
  int32_T y_size_idx_1;
  char_T v_data[5];
  boolean_T d_data[2];
  boolean_T b;
  boolean_T b_bool;
  boolean_T exitg2;
  boolean_T y_outdatedOnCpu;
  gpuEmxReset_real_T(&b_gpu_y);
  gpuEmxReset_real_T(&gpu_y);
  gpuEmxReset_real_T(&c_gpu_y);
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);
  i = static_cast<int32_T>(numBBoxes);
  for (b_i = 0; b_i < i; b_i++) {
    real32_T f;
    n = 0;
    f = labels_data[b_i];
    for (k = 0; k < 5; k++) {
      if (cv[(static_cast<int32_T>(f) + (k << 1)) - 1] != 0) {
        n++;
      }
    }
    c_i = -1;
    for (k = 0; k < 5; k++) {
      if (cv[(static_cast<int32_T>(f) + (k << 1)) - 1] != 0) {
        c_i++;
        v_data[c_i] =
            cv[(static_cast<int32_T>(labels_data[b_i]) + (k << 1)) - 1];
      }
    }
    SD->f2.labelCells.data[b_i].f1.size[0] = 1;
    SD->f2.labelCells.data[b_i].f1.size[1] = n;
    for (k = 0; k < n; k++) {
      SD->f2.labelCells.data[b_i].f1.data[k] = v_data[k];
    }
  }
  valueset.size[1] = 0;
  for (i = 0; i < 2; i++) {
    n = 0;
    for (k = 0; k < 5; k++) {
      if (cv[i + (k << 1)] != 0) {
        n++;
      }
    }
    b_i = -1;
    for (k = 0; k < 5; k++) {
      char_T c;
      c = cv[i + (k << 1)];
      if (c != 0) {
        b_i++;
        v_data[b_i] = c;
      }
    }
    j2 = valueset.size[1] + 1;
    valueset.size[1]++;
    valueset.data[j2 - 1].f1.size[0] = 1;
    valueset.data[valueset.size[1] - 1].f1.size[1] = n;
    for (k = 0; k < n; k++) {
      valueset.data[valueset.size[1] - 1].f1.data[k] = v_data[k];
    }
  }
  c_i = static_cast<int32_T>(numBBoxes);
  for (i = 0; i < c_i; i++) {
    b_j1 = 0;
    while ((b_j1 + 1 <= SD->f2.labelCells.data[i].f1.size[1]) &&
           bv[static_cast<int32_T>(SD->f2.labelCells.data[i].f1.data[b_j1])] &&
           (SD->f2.labelCells.data[i].f1.data[b_j1] != '\x00')) {
      b_j1++;
    }
    j2 = SD->f2.labelCells.data[i].f1.size[1] - 1;
    while ((j2 + 1 > 0) &&
           bv[static_cast<int32_T>(SD->f2.labelCells.data[i].f1.data[j2])] &&
           (SD->f2.labelCells.data[i].f1.data[j2] != '\x00')) {
      j2--;
    }
    if (b_j1 + 1 > j2 + 1) {
      b_j1 = 0;
      j2 = -1;
    }
    SD->f2.inData.data[i].f1.size[0] = 1;
    SD->f2.inData.data[i].f1.size[1] = (j2 - b_j1) + 1;
    n = j2 - b_j1;
    for (k = 0; k <= n; k++) {
      SD->f2.inData.data[i].f1.data[k] =
          SD->f2.labelCells.data[i].f1.data[b_j1 + k];
    }
  }
  c_i = valueset.size[1];
  for (i = 0; i < c_i; i++) {
    b_j1 = 0;
    while ((b_j1 + 1 <= valueset.data[i].f1.size[1]) &&
           bv[static_cast<uint8_T>(valueset.data[i].f1.data[b_j1]) & 127] &&
           (valueset.data[i].f1.data[b_j1] != '\x00')) {
      b_j1++;
    }
    j2 = valueset.data[i].f1.size[1] - 1;
    while ((j2 + 1 > 0) &&
           bv[static_cast<uint8_T>(valueset.data[i].f1.data[j2]) & 127] &&
           (valueset.data[i].f1.data[j2] != '\x00')) {
      j2--;
    }
    if (b_j1 + 1 > j2 + 1) {
      b_j1 = 0;
      j2 = -1;
    }
    rv.data[i].f1.size[0] = 1;
    rv.data[i].f1.size[1] = (j2 - b_j1) + 1;
    n = j2 - b_j1;
    for (k = 0; k <= n; k++) {
      rv.data[i].f1.data[k] = valueset.data[i].f1.data[b_j1 + k];
    }
  }
  if (valueset.size[1] != 0) {
    n = valueset.size[1];
    y_size_idx_1 = valueset.size[1];
    SD->f2.b_ii_data[0] = 1;
    b_j1 = 1;
    for (k = 0; k <= n - 2; k++) {
      b_j1++;
      SD->f2.b_ii_data[1] = static_cast<int8_T>(b_j1);
    }
    for (k = 0; k < y_size_idx_1; k++) {
      SD->f2.idx_data[k] = SD->f2.b_ii_data[k];
    }
    introsort(SD->f2.idx_data, valueset.size[1], rv.data);
    SD->f2.labelCells.size[0] = valueset.size[1];
    j2 = valueset.size[1];
    for (i = 0; i < j2; i++) {
      SD->f2.labelCells.data[i].f1.size[0] = 1;
      SD->f2.labelCells.data[i].f1.size[1] =
          rv.data[SD->f2.idx_data[i] - 1].f1.size[1];
      n = rv.data[SD->f2.idx_data[i] - 1].f1.size[1];
      for (k = 0; k < n; k++) {
        SD->f2.labelCells.data[i].f1.data[k] =
            rv.data[SD->f2.idx_data[i] - 1].f1.data[k];
      }
    }
    for (i = 0; i <= SD->f2.labelCells.size[0] - 2; i++) {
      b_bool = false;
      b = (SD->f2.labelCells.data[0].f1.size[1] == 0);
      if (b && (SD->f2.labelCells.data[1].f1.size[1] == 0)) {
        b_bool = true;
      } else if (SD->f2.labelCells.data[0].f1.size[1] ==
                 SD->f2.labelCells.data[1].f1.size[1]) {
        b_j1 = 0;
        do {
          exitg1 = 0;
          if (b_j1 + 1 <= SD->f2.labelCells.data[1].f1.size[1]) {
            if (SD->f2.labelCells.data[0].f1.data[b_j1] !=
                SD->f2.labelCells.data[1].f1.data[b_j1]) {
              exitg1 = 1;
            } else {
              b_j1++;
            }
          } else {
            b_bool = true;
            exitg1 = 1;
          }
        } while (exitg1 == 0);
      }
      SD->f2.b_d_data[0] = !b_bool;
    }
    d_size_idx_0 = valueset.size[1];
    d_data[0] = true;
    n = valueset.size[1] - 1;
    for (k = 0; k < n; k++) {
      d_data[1] = SD->f2.b_d_data[0];
    }
    emxInit_real_T(&b_cpu_y, 1, &cb_emlrtRTEI, true);
    b_bool = false;
    k = b_cpu_y->size[0];
    b_cpu_y->size[0] = valueset.size[1];
    emxEnsureCapacity_real_T(b_cpu_y, k, &bb_emlrtRTEI);
    for (k = 0; k < d_size_idx_0; k++) {
      b_cpu_y->data[k] = d_data[k];
      b_bool = true;
    }
    if (b_cpu_y->size[0] != 1) {
      gpuEmxEnsureCapacity_real_T(b_cpu_y, &gpu_y, !b_bool);
      if (b_bool) {
        gpuEmxMemcpyCpuToGpu_real_T(&gpu_y, b_cpu_y);
      }
      mwCallThrustScan1D(&gpu_y.data[0], false, 2);
    }
    emxFree_real_T(&b_cpu_y);
  }
  if (valueset.size[1] != 0) {
    int8_T iv3_idx_0;
    iv3_idx_0 = static_cast<int8_T>(valueset.size[1]);
    c_labelNamesMod_categoryNames_s[0] = valueset.size[1];
    for (j2 = 0; j2 < iv3_idx_0; j2++) {
      c_labelNamesMod_categoryNames_d[j2].f1.size[0] = 1;
      c_labelNamesMod_categoryNames_d[j2].f1.size[1] = 0;
    }
    b_j1 = valueset.size[1];
    c_labelNamesMod_categoryNames_s[0] = valueset.size[1];
    for (i = 0; i < b_j1; i++) {
      c_labelNamesMod_categoryNames_d[i].f1.size[0] = 1;
      n = rv.data[i].f1.size[1];
      c_labelNamesMod_categoryNames_d[i].f1.size[1] = rv.data[i].f1.size[1];
      for (c_i = 0; c_i < n; c_i++) {
        c_labelNamesMod_categoryNames_d[i].f1.data[c_i] =
            rv.data[i].f1.data[c_i];
      }
    }
  } else {
    c_labelNamesMod_categoryNames_s[0] = 0;
  }
  emxInit_real_T(&cpu_y, 1, &cb_emlrtRTEI, true);
  if (static_cast<int32_T>(numBBoxes) == 0) {
    SD->f2.uA.size[0] = 0;
    y_outdatedOnCpu = false;
    cpu_y->size[0] = 0;
  } else {
    n = static_cast<int32_T>(numBBoxes);
    y_size_idx_1 = static_cast<int32_T>(numBBoxes);
    SD->f2.locbOfUA_data[0] = 1;
    b_j1 = 1;
    for (k = 0; k <= n - 2; k++) {
      b_j1++;
      SD->f2.locbOfUA_data[k + 1] = b_j1;
    }
    idx_size[0] = static_cast<int32_T>(numBBoxes);
    for (k = 0; k < y_size_idx_1; k++) {
      SD->f2.idx_data[k] = SD->f2.locbOfUA_data[k];
    }
    introsort(SD->f2.idx_data, static_cast<int32_T>(numBBoxes),
              SD->f2.inData.data);
    SD->f2.labelCells.size[0] = static_cast<int32_T>(numBBoxes);
    b_j1 = static_cast<int32_T>(numBBoxes);
    for (i = 0; i < b_j1; i++) {
      SD->f2.labelCells.data[i].f1.size[0] = 1;
      SD->f2.labelCells.data[i].f1.size[1] =
          SD->f2.inData.data[SD->f2.idx_data[i] - 1].f1.size[1];
      n = SD->f2.inData.data[SD->f2.idx_data[i] - 1].f1.size[1];
      for (k = 0; k < n; k++) {
        SD->f2.labelCells.data[i].f1.data[k] =
            SD->f2.inData.data[SD->f2.idx_data[i] - 1].f1.data[k];
      }
    }
    d_size_idx_0 = static_cast<int32_T>(numBBoxes) - 1;
    for (i = 0; i <= SD->f2.labelCells.size[0] - 2; i++) {
      SD->f2.b_d_data[i] = false;
      b_bool = false;
      b = (SD->f2.labelCells.data[i].f1.size[1] == 0);
      if (b && (SD->f2.labelCells.data[i + 1].f1.size[1] == 0)) {
        b_bool = true;
      } else if (SD->f2.labelCells.data[i].f1.size[1] ==
                 SD->f2.labelCells.data[i + 1].f1.size[1]) {
        b_j1 = 0;
        do {
          exitg1 = 0;
          if (b_j1 + 1 <= SD->f2.labelCells.data[i + 1].f1.size[1]) {
            if (SD->f2.labelCells.data[i].f1.data[b_j1] !=
                SD->f2.labelCells.data[i + 1].f1.data[b_j1]) {
              exitg1 = 1;
            } else {
              b_j1++;
            }
          } else {
            b_bool = true;
            exitg1 = 1;
          }
        } while (exitg1 == 0);
      }
      SD->f2.b_d_data[i] = !b_bool;
    }
    n = static_cast<int32_T>(numBBoxes);
    SD->f2.d_data[0] = true;
    for (k = 0; k < d_size_idx_0; k++) {
      SD->f2.d_data[k + 1] = SD->f2.b_d_data[k];
    }
    j2 = SD->f2.d_data[0];
    for (k = 0; k <= n - 2; k++) {
      j2 += SD->f2.d_data[k + 1];
    }
    SD->f2.uA.size[0] = static_cast<int32_T>(
        std::fmin(static_cast<real_T>(j2),
                  static_cast<real_T>(static_cast<int32_T>(numBBoxes))));
    c_i = 0;
    ii_size_idx_0 = static_cast<int32_T>(numBBoxes);
    j2 = 1;
    exitg2 = false;
    while ((!exitg2) && (j2 <= static_cast<int32_T>(numBBoxes))) {
      if (SD->f2.d_data[j2 - 1]) {
        c_i++;
        SD->f2.ii_data[c_i - 1] = j2;
        if (c_i >= static_cast<int32_T>(numBBoxes)) {
          exitg2 = true;
        } else {
          j2++;
        }
      } else {
        j2++;
      }
    }
    if (static_cast<int32_T>(numBBoxes) == 1) {
      if (c_i == 0) {
        ii_size_idx_0 = 0;
      }
    } else if (c_i < 1) {
      ii_size_idx_0 = 0;
    } else {
      ii_size_idx_0 = c_i;
    }
    for (i = 0; i < ii_size_idx_0; i++) {
      if (i + 1 != ii_size_idx_0) {
        if (SD->f2.ii_data[i + 1] - 1 < SD->f2.ii_data[i]) {
          y_size_idx_1 = 0;
        } else {
          k = SD->f2.ii_data[i];
          c_i = SD->f2.ii_data[i + 1];
          y_size_idx_1 = SD->f2.ii_data[i + 1] - SD->f2.ii_data[i];
          for (j2 = 0; j2 < c_i - k; j2++) {
            SD->f2.locbOfUA_data[j2] = k + j2;
          }
        }
        b_j1 = SD->f2.idx_data[SD->f2.locbOfUA_data[0] - 1];
        for (b_i = 0; b_i <= y_size_idx_1 - 2; b_i++) {
          k = SD->f2.locbOfUA_data[b_i + 1];
          if (b_j1 > SD->f2.idx_data[k - 1]) {
            b_j1 = SD->f2.idx_data[k - 1];
          }
        }
        SD->f2.a__2_data[i] = b_j1;
      } else {
        if (static_cast<int32_T>(numBBoxes) < SD->f2.ii_data[i]) {
          y_size_idx_1 = 0;
        } else {
          k = SD->f2.ii_data[i];
          y_size_idx_1 =
              (static_cast<int32_T>(numBBoxes) - SD->f2.ii_data[i]) + 1;
          for (c_i = 0; c_i <= idx_size[0] - k; c_i++) {
            SD->f2.locbOfUA_data[c_i] = k + c_i;
          }
        }
        b_j1 = SD->f2.idx_data[SD->f2.locbOfUA_data[0] - 1];
        for (b_i = 0; b_i <= y_size_idx_1 - 2; b_i++) {
          k = SD->f2.locbOfUA_data[b_i + 1];
          if (b_j1 > SD->f2.idx_data[k - 1]) {
            b_j1 = SD->f2.idx_data[k - 1];
          }
        }
        SD->f2.a__2_data[i] = b_j1;
      }
    }
    y_outdatedOnCpu = false;
    b_bool = false;
    k = cpu_y->size[0];
    cpu_y->size[0] = static_cast<int32_T>(numBBoxes);
    emxEnsureCapacity_real_T(cpu_y, k, &bb_emlrtRTEI);
    for (k = 0; k < n; k++) {
      cpu_y->data[k] = SD->f2.d_data[k];
      b_bool = true;
    }
    if (cpu_y->size[0] != 1) {
      gpuEmxEnsureCapacity_real_T(cpu_y, &c_gpu_y, !b_bool);
      if (b_bool) {
        gpuEmxMemcpyCpuToGpu_real_T(&c_gpu_y, cpu_y);
      }
      mwCallThrustScan1D(&c_gpu_y.data[0], false, cpu_y->size[0]);
      y_outdatedOnCpu = true;
    }
    n = cpu_y->size[0];
    for (k = 0; k < cpu_y->size[0]; k++) {
      if (y_outdatedOnCpu) {
        gpuEmxMemcpyGpuToCpu_real_T(cpu_y, &c_gpu_y);
      }
      y_outdatedOnCpu = false;
      SD->f2.y_data[k] = cpu_y->data[k];
    }
    for (k = 0; k < n; k++) {
      if (y_outdatedOnCpu) {
        gpuEmxMemcpyGpuToCpu_real_T(cpu_y, &c_gpu_y);
      }
      cpu_y->data[SD->f2.idx_data[k] - 1] = SD->f2.y_data[k];
      y_outdatedOnCpu = false;
    }
    for (i = 0; i < ii_size_idx_0; i++) {
      SD->f2.uA.data[i].f1.size[0] = 1;
      SD->f2.uA.data[i].f1.size[1] =
          SD->f2.inData.data[SD->f2.a__2_data[i] - 1].f1.size[1];
      n = SD->f2.inData.data[SD->f2.a__2_data[i] - 1].f1.size[1];
      for (k = 0; k < n; k++) {
        SD->f2.uA.data[i].f1.data[k] =
            SD->f2.inData.data[SD->f2.a__2_data[i] - 1].f1.data[k];
      }
    }
  }
  if (valueset.size[1] == 0) {
    uB.size[0] = 0;
  } else {
    n = valueset.size[1];
    y_size_idx_1 = valueset.size[1];
    SD->f2.b_ii_data[0] = 1;
    b_j1 = 1;
    for (k = 0; k <= n - 2; k++) {
      b_j1++;
      SD->f2.b_ii_data[1] = static_cast<int8_T>(b_j1);
    }
    b_idx_size[0] = valueset.size[1];
    for (k = 0; k < y_size_idx_1; k++) {
      SD->f2.idx_data[k] = SD->f2.b_ii_data[k];
    }
    introsort(SD->f2.idx_data, valueset.size[1], rv.data);
    SD->f2.labelCells.size[0] = valueset.size[1];
    j2 = valueset.size[1];
    for (i = 0; i < j2; i++) {
      SD->f2.labelCells.data[i].f1.size[0] = 1;
      SD->f2.labelCells.data[i].f1.size[1] =
          rv.data[SD->f2.idx_data[i] - 1].f1.size[1];
      n = rv.data[SD->f2.idx_data[i] - 1].f1.size[1];
      for (k = 0; k < n; k++) {
        SD->f2.labelCells.data[i].f1.data[k] =
            rv.data[SD->f2.idx_data[i] - 1].f1.data[k];
      }
    }
    for (i = 0; i <= SD->f2.labelCells.size[0] - 2; i++) {
      b_bool = false;
      b = (SD->f2.labelCells.data[0].f1.size[1] == 0);
      if (b && (SD->f2.labelCells.data[1].f1.size[1] == 0)) {
        b_bool = true;
      } else if (SD->f2.labelCells.data[0].f1.size[1] ==
                 SD->f2.labelCells.data[1].f1.size[1]) {
        b_j1 = 0;
        do {
          exitg1 = 0;
          if (b_j1 + 1 <= SD->f2.labelCells.data[1].f1.size[1]) {
            if (SD->f2.labelCells.data[0].f1.data[b_j1] !=
                SD->f2.labelCells.data[1].f1.data[b_j1]) {
              exitg1 = 1;
            } else {
              b_j1++;
            }
          } else {
            b_bool = true;
            exitg1 = 1;
          }
        } while (exitg1 == 0);
      }
      SD->f2.b_d_data[0] = !b_bool;
    }
    d_size_idx_0 = valueset.size[1];
    d_data[0] = true;
    n = valueset.size[1] - 1;
    for (k = 0; k < n; k++) {
      d_data[1] = SD->f2.b_d_data[0];
    }
    c_i = valueset.size[1];
    j2 = 1;
    for (k = 0; k <= c_i - 2; k++) {
      j2 += d_data[1];
    }
    uB.size[0] = static_cast<int32_T>(std::fmin(
        static_cast<real_T>(j2), static_cast<real_T>(valueset.size[1])));
    b_j1 = valueset.size[1];
    c_i = 0;
    ii_size_idx_0 = valueset.size[1];
    j2 = 1;
    exitg2 = false;
    while ((!exitg2) && (j2 <= b_j1)) {
      if (d_data[j2 - 1]) {
        c_i++;
        SD->f2.b_ii_data[c_i - 1] = static_cast<int8_T>(j2);
        if (c_i >= b_j1) {
          exitg2 = true;
        } else {
          j2++;
        }
      } else {
        j2++;
      }
    }
    if (valueset.size[1] == 1) {
      if (c_i == 0) {
        ii_size_idx_0 = 0;
      }
    } else if (c_i < 1) {
      ii_size_idx_0 = 0;
    } else {
      ii_size_idx_0 = c_i;
    }
    for (i = 0; i < ii_size_idx_0; i++) {
      if (i + 1 != ii_size_idx_0) {
        y_size_idx_1 = (SD->f2.b_ii_data[i + 1] - 1 >= SD->f2.b_ii_data[i]);
        for (k = 0; k < y_size_idx_1; k++) {
          SD->f2.locbOfUA_data[0] = SD->f2.idx_data[0];
        }
        SD->f2.ib_data[i] = SD->f2.locbOfUA_data[0];
      } else {
        if (b_idx_size[0] < SD->f2.b_ii_data[i]) {
          y_size_idx_1 = 0;
        } else {
          k = SD->f2.b_ii_data[i];
          y_size_idx_1 = (b_idx_size[0] - SD->f2.b_ii_data[i]) + 1;
          for (c_i = 0; c_i <= b_idx_size[0] - k; c_i++) {
            SD->f2.locbOfUA_data[c_i] = k + c_i;
          }
        }
        b_j1 = SD->f2.idx_data[SD->f2.locbOfUA_data[0] - 1];
        for (b_i = 0; b_i <= y_size_idx_1 - 2; b_i++) {
          if (b_j1 > SD->f2.idx_data[SD->f2.locbOfUA_data[1] - 1]) {
            b_j1 = SD->f2.idx_data[SD->f2.locbOfUA_data[1] - 1];
          }
        }
        SD->f2.ib_data[i] = b_j1;
      }
    }
    emxInit_real_T(&c_cpu_y, 1, &cb_emlrtRTEI, true);
    b_bool = false;
    k = c_cpu_y->size[0];
    c_cpu_y->size[0] = valueset.size[1];
    emxEnsureCapacity_real_T(c_cpu_y, k, &bb_emlrtRTEI);
    for (k = 0; k < d_size_idx_0; k++) {
      c_cpu_y->data[k] = d_data[k];
      b_bool = true;
    }
    if (c_cpu_y->size[0] != 1) {
      gpuEmxEnsureCapacity_real_T(c_cpu_y, &b_gpu_y, !b_bool);
      if (b_bool) {
        gpuEmxMemcpyCpuToGpu_real_T(&b_gpu_y, c_cpu_y);
      }
      mwCallThrustScan1D(&b_gpu_y.data[0], false, 2);
    }
    emxFree_real_T(&c_cpu_y);
    for (i = 0; i < ii_size_idx_0; i++) {
      uB.data[i].f1.size[0] = 1;
      uB.data[i].f1.size[1] = rv.data[SD->f2.ib_data[i] - 1].f1.size[1];
      n = rv.data[SD->f2.ib_data[i] - 1].f1.size[1];
      for (k = 0; k < n; k++) {
        uB.data[i].f1.data[k] = rv.data[SD->f2.ib_data[i] - 1].f1.data[k];
      }
    }
  }
  for (k = 0; k < SD->f2.uA.size[0]; k++) {
    SD->f2.locbOfUA_data[k] = 0;
  }
  if (uB.size[0] > 0) {
    j2 = 0;
    i = 0;
    exitg2 = false;
    while ((!exitg2) && (i <= SD->f2.uA.size[0] - 1)) {
      c_i = SD->f2.uA.data[i].f1.size[1];
      b_j1 = uB.data[j2].f1.size[1];
      if (c_i <= b_j1) {
        b_j1 = c_i;
      }
      if (b_j1 == 0) {
        b = (SD->f2.uA.data[i].f1.size[1] < uB.data[j2].f1.size[1]);
      } else {
        b_i = 0;
        while ((b_i + 1 <= b_j1) &&
               (SD->f2.uA.data[i].f1.data[b_i] == uB.data[j2].f1.data[b_i])) {
          b_i++;
        }
        if (b_i + 1 == b_j1 + 1) {
          b = (SD->f2.uA.data[i].f1.size[1] < uB.data[j2].f1.size[1]);
        } else {
          b = (SD->f2.uA.data[i].f1.data[b_i] < uB.data[j2].f1.data[b_i]);
        }
      }
      if (!b) {
        b_bool = false;
        b = (SD->f2.uA.data[i].f1.size[1] == 0);
        if (b && (uB.data[j2].f1.size[1] == 0)) {
          b_bool = true;
        } else if (SD->f2.uA.data[i].f1.size[1] == uB.data[j2].f1.size[1]) {
          b_j1 = 0;
          do {
            exitg1 = 0;
            if (b_j1 + 1 <= uB.data[j2].f1.size[1]) {
              if (SD->f2.uA.data[i].f1.data[b_j1] !=
                  uB.data[j2].f1.data[b_j1]) {
                exitg1 = 1;
              } else {
                b_j1++;
              }
            } else {
              b_bool = true;
              exitg1 = 1;
            }
          } while (exitg1 == 0);
        }
        if (b_bool) {
          SD->f2.locbOfUA_data[i] = SD->f2.ib_data[j2];
          j2++;
        } else {
          boolean_T exitg3;
          exitg3 = false;
          while ((!exitg3) && (j2 + 1 <= uB.size[0])) {
            c_i = SD->f2.uA.data[i].f1.size[1];
            b_j1 = uB.data[j2].f1.size[1];
            if (c_i <= b_j1) {
              b_j1 = c_i;
            }
            if (b_j1 == 0) {
              b = (SD->f2.uA.data[i].f1.size[1] > uB.data[j2].f1.size[1]);
            } else {
              b_i = 0;
              while ((b_i + 1 <= b_j1) && (SD->f2.uA.data[i].f1.data[b_i] ==
                                           uB.data[j2].f1.data[b_i])) {
                b_i++;
              }
              if (b_i + 1 == b_j1 + 1) {
                b = (SD->f2.uA.data[i].f1.size[1] > uB.data[j2].f1.size[1]);
              } else {
                b = (SD->f2.uA.data[i].f1.data[b_i] > uB.data[j2].f1.data[b_i]);
              }
            }
            if (b) {
              j2++;
            } else {
              exitg3 = true;
            }
          }
          if (j2 + 1 <= uB.size[0]) {
            b = (SD->f2.uA.data[i].f1.size[1] == 0);
            if (b && (uB.data[j2].f1.size[1] == 0)) {
              b_bool = true;
            } else if (SD->f2.uA.data[i].f1.size[1] == uB.data[j2].f1.size[1]) {
              b_j1 = 0;
              do {
                exitg1 = 0;
                if (b_j1 + 1 <= uB.data[j2].f1.size[1]) {
                  if (SD->f2.uA.data[i].f1.data[b_j1] !=
                      uB.data[j2].f1.data[b_j1]) {
                    exitg1 = 1;
                  } else {
                    b_j1++;
                  }
                } else {
                  b_bool = true;
                  exitg1 = 1;
                }
              } while (exitg1 == 0);
            }
            if (b_bool) {
              SD->f2.locbOfUA_data[i] = SD->f2.ib_data[j2];
              j2++;
            }
          }
        }
      }
      if (j2 + 1 > uB.size[0]) {
        exitg2 = true;
      } else {
        i++;
      }
    }
  }
  b_rv[0] = cpu_y->size[0];
  labelNamesMod_codes_size[0] = 1;
  labelNamesMod_codes_size[1] = cpu_y->size[0];
  for (k = 0; k < b_rv[0]; k++) {
    if (y_outdatedOnCpu) {
      gpuEmxMemcpyGpuToCpu_real_T(cpu_y, &c_gpu_y);
    }
    y_outdatedOnCpu = false;
    c_i = SD->f2.locbOfUA_data[static_cast<int32_T>(cpu_y->data[k]) - 1];
    if (c_i < 0) {
      c_i = 0;
    }
    labelNamesMod_codes_data[k] = static_cast<uint32_T>(c_i);
  }
  emxFree_real_T(&cpu_y);
  emlrtHeapReferenceStackLeaveFcnR2012b(emlrtRootTLSGlobal);
  gpuEmxFree_real_T(&c_gpu_y);
  gpuEmxFree_real_T(&gpu_y);
  gpuEmxFree_real_T(&b_gpu_y);
}

} // namespace internal
} // namespace coder

// End of code generation (pointPillarsObjectDetector.cu)
