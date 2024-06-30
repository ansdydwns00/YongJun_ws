/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: pcfitplane.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 26-Jun-2024 13:33:54
 */

/* Include Files */
#include "pcfitplane.h"
#include "find.h"
#include "msac.h"
#include "pointCloud.h"
#include "preprocessing2_emxutil.h"
#include "preprocessing2_types.h"
#include "rt_nonfinite.h"
#include "cvstCG_kdtree.h"
#include "rt_nonfinite.h"
#include <math.h>
#include <xmmintrin.h>

/* Function Definitions */
/*
 * Arguments    : const float model_data[]
 *                const emxArray_real32_T *points
 *                emxArray_real32_T *dis
 * Return Type  : void
 */
void evalPlane(const float model_data[], const emxArray_real32_T *points,
               emxArray_real32_T *dis)
{
  emxArray_real32_T *y;
  const float *points_data;
  float model;
  float *dis_data;
  float *y_data;
  int b_i;
  int i;
  int m_tmp;
  int vectorUB;
  points_data = points->data;
  m_tmp = points->size[0];
  emxInit_real32_T(&y, 1);
  i = y->size[0];
  y->size[0] = points->size[0];
  emxEnsureCapacity_real32_T(y, i);
  y_data = y->data;
  for (b_i = 0; b_i < m_tmp; b_i++) {
    y_data[b_i] = (points_data[b_i] * model_data[0] +
                   points_data[points->size[0] + b_i] * model_data[1]) +
                  points_data[(points->size[0] << 1) + b_i] * model_data[2];
  }
  model = model_data[3];
  b_i = (y->size[0] / 4) << 2;
  vectorUB = b_i - 4;
  for (i = 0; i <= vectorUB; i += 4) {
    __m128 r;
    r = _mm_loadu_ps(&y_data[i]);
    _mm_storeu_ps(&y_data[i], _mm_add_ps(r, _mm_set1_ps(model)));
  }
  for (i = b_i; i < m_tmp; i++) {
    y_data[i] += model;
  }
  b_i = y->size[0];
  i = dis->size[0];
  dis->size[0] = y->size[0];
  emxEnsureCapacity_real32_T(dis, i);
  dis_data = dis->data;
  for (vectorUB = 0; vectorUB < b_i; vectorUB++) {
    dis_data[vectorUB] = fabsf(y_data[vectorUB]);
  }
  emxFree_real32_T(&y);
}

/*
 * Arguments    : const pointCloud *varargin_1
 *                float varargin_2
 *                const float varargin_3[3]
 *                float varargin_4
 *                emxArray_real_T *inlierIndices
 *                emxArray_real_T *outlierIndices
 * Return Type  : void
 */
void pcfitplane(const pointCloud *varargin_1, float varargin_2,
                const float varargin_3[3], float varargin_4,
                emxArray_real_T *inlierIndices, emxArray_real_T *outlierIndices)
{
  emxArray_boolean_T *flag;
  emxArray_boolean_T *tf;
  emxArray_int32_T *nz;
  emxArray_int32_T *r;
  emxArray_int32_T *r1;
  emxArray_int32_T *r2;
  emxArray_int32_T *r3;
  emxArray_real32_T *b_intensity;
  emxArray_real32_T *intensity;
  emxArray_real32_T *loc;
  emxArray_real32_T *normal;
  emxArray_real32_T *nv;
  emxArray_uint8_T *c;
  pointCloud pc;
  pointCloud *b_pc;
  double *inlierIndices_data;
  float modelParams_data[4];
  float *intensity_data;
  float *loc_data;
  float *normal_data;
  int modelParams_size[2];
  int i;
  int j;
  int k;
  int loop_ub;
  int trueCount;
  int xoffset;
  int *nz_data;
  unsigned char *c_data;
  boolean_T *tf_data;
  emxInitStruct_pointCloud(&pc);
  pc.matlabCodegenIsDeleted = true;
  emxInit_boolean_T(&tf, 2);
  i = varargin_1->Location->size[0];
  trueCount = tf->size[0] * tf->size[1];
  tf->size[0] = i;
  tf->size[1] = 3;
  emxEnsureCapacity_boolean_T(tf, trueCount);
  tf_data = tf->data;
  loop_ub = varargin_1->Location->size[0] * 3;
  for (trueCount = 0; trueCount < loop_ub; trueCount++) {
    tf_data[trueCount] = ((!rtIsInfF(varargin_1->Location->data[trueCount])) &&
                          (!rtIsNaNF(varargin_1->Location->data[trueCount])));
  }
  emxInit_int32_T(&nz);
  nz_data = nz->data;
  if (tf->size[0] == 0) {
    nz->size[0] = 0;
  } else {
    trueCount = nz->size[0];
    nz->size[0] = i;
    emxEnsureCapacity_int32_T(nz, trueCount);
    nz_data = nz->data;
    for (j = 0; j < i; j++) {
      nz_data[j] = tf_data[j];
    }
    for (k = 0; k < 2; k++) {
      xoffset = (k + 1) * i;
      for (j = 0; j < i; j++) {
        nz_data[j] += tf_data[xoffset + j];
      }
    }
  }
  emxFree_boolean_T(&tf);
  emxInit_boolean_T(&flag, 1);
  loop_ub = nz->size[0];
  i = flag->size[0];
  flag->size[0] = nz->size[0];
  emxEnsureCapacity_boolean_T(flag, i);
  tf_data = flag->data;
  for (i = 0; i < loop_ub; i++) {
    tf_data[i] = (nz_data[i] == 3);
  }
  emxInit_real32_T(&normal, 2);
  i = normal->size[0] * normal->size[1];
  normal->size[0] = varargin_1->Normal->size[0];
  loop_ub = varargin_1->Normal->size[1];
  normal->size[1] = loop_ub;
  emxEnsureCapacity_real32_T(normal, i);
  normal_data = normal->data;
  xoffset = varargin_1->Normal->size[0] * varargin_1->Normal->size[1];
  for (i = 0; i < xoffset; i++) {
    normal_data[i] = varargin_1->Normal->data[i];
  }
  emxInit_real32_T(&intensity, 1);
  i = intensity->size[0];
  intensity->size[0] = varargin_1->Intensity->size[0];
  emxEnsureCapacity_real32_T(intensity, i);
  intensity_data = intensity->data;
  xoffset = varargin_1->Intensity->size[0];
  for (i = 0; i < xoffset; i++) {
    intensity_data[i] = varargin_1->Intensity->data[i];
  }
  emxInit_real32_T(&loc, 2);
  if (varargin_1->Location->size[0] != 0) {
    xoffset = flag->size[0] - 1;
    trueCount = 0;
    for (i = 0; i <= xoffset; i++) {
      if (tf_data[i]) {
        trueCount++;
      }
    }
    emxInit_int32_T(&r);
    i = r->size[0];
    r->size[0] = trueCount;
    emxEnsureCapacity_int32_T(r, i);
    nz_data = r->data;
    k = 0;
    for (i = 0; i <= xoffset; i++) {
      if (tf_data[i]) {
        nz_data[k] = i;
        k++;
      }
    }
    xoffset = r->size[0];
    i = loc->size[0] * loc->size[1];
    loc->size[0] = r->size[0];
    loc->size[1] = 3;
    emxEnsureCapacity_real32_T(loc, i);
    loc_data = loc->data;
    for (i = 0; i < 3; i++) {
      for (trueCount = 0; trueCount < xoffset; trueCount++) {
        loc_data[trueCount + loc->size[0] * i] =
            varargin_1->Location
                ->data[nz_data[trueCount] + varargin_1->Location->size[0] * i];
      }
    }
    emxFree_int32_T(&r);
  } else {
    loc->size[0] = 0;
    loc->size[1] = 3;
  }
  emxInit_uint8_T(&c);
  if ((varargin_1->Color->size[0] != 0) && (varargin_1->Color->size[1] != 0)) {
    xoffset = flag->size[0] - 1;
    trueCount = 0;
    for (i = 0; i <= xoffset; i++) {
      if (tf_data[i]) {
        trueCount++;
      }
    }
    emxInit_int32_T(&r1);
    i = r1->size[0];
    r1->size[0] = trueCount;
    emxEnsureCapacity_int32_T(r1, i);
    nz_data = r1->data;
    k = 0;
    for (i = 0; i <= xoffset; i++) {
      if (tf_data[i]) {
        nz_data[k] = i;
        k++;
      }
    }
    xoffset = r1->size[0];
    i = c->size[0] * c->size[1];
    c->size[0] = r1->size[0];
    c->size[1] = varargin_1->Color->size[1];
    emxEnsureCapacity_uint8_T(c, i);
    c_data = c->data;
    k = varargin_1->Color->size[1];
    for (i = 0; i < k; i++) {
      for (trueCount = 0; trueCount < xoffset; trueCount++) {
        c_data[trueCount + c->size[0] * i] =
            varargin_1->Color
                ->data[nz_data[trueCount] + varargin_1->Color->size[0] * i];
      }
    }
    emxFree_int32_T(&r1);
  } else {
    c->size[0] = 0;
    c->size[1] = 0;
  }
  emxInit_real32_T(&nv, 2);
  if ((normal->size[0] != 0) && (normal->size[1] != 0)) {
    xoffset = flag->size[0] - 1;
    trueCount = 0;
    for (i = 0; i <= xoffset; i++) {
      if (tf_data[i]) {
        trueCount++;
      }
    }
    emxInit_int32_T(&r2);
    i = r2->size[0];
    r2->size[0] = trueCount;
    emxEnsureCapacity_int32_T(r2, i);
    nz_data = r2->data;
    k = 0;
    for (i = 0; i <= xoffset; i++) {
      if (tf_data[i]) {
        nz_data[k] = i;
        k++;
      }
    }
    xoffset = r2->size[0];
    i = nv->size[0] * nv->size[1];
    nv->size[0] = r2->size[0];
    nv->size[1] = loop_ub;
    emxEnsureCapacity_real32_T(nv, i);
    loc_data = nv->data;
    for (i = 0; i < loop_ub; i++) {
      for (trueCount = 0; trueCount < xoffset; trueCount++) {
        loc_data[trueCount + nv->size[0] * i] =
            normal_data[nz_data[trueCount] + normal->size[0] * i];
      }
    }
    emxFree_int32_T(&r2);
  } else {
    nv->size[0] = 0;
    nv->size[1] = 0;
  }
  emxInit_real32_T(&b_intensity, 1);
  if (intensity->size[0] != 0) {
    xoffset = flag->size[0] - 1;
    trueCount = 0;
    for (i = 0; i <= xoffset; i++) {
      if (tf_data[i]) {
        trueCount++;
      }
    }
    i = b_intensity->size[0];
    b_intensity->size[0] = trueCount;
    emxEnsureCapacity_real32_T(b_intensity, i);
    loc_data = b_intensity->data;
    k = 0;
    for (i = 0; i <= xoffset; i++) {
      if (tf_data[i]) {
        loc_data[k] = intensity_data[i];
        k++;
      }
    }
  } else {
    b_intensity->size[0] = 0;
  }
  if ((varargin_1->RangeData->size[0] != 0) &&
      (varargin_1->RangeData->size[1] != 0)) {
    xoffset = flag->size[0] - 1;
    trueCount = 0;
    for (i = 0; i <= xoffset; i++) {
      if (tf_data[i]) {
        trueCount++;
      }
    }
    emxInit_int32_T(&r3);
    i = r3->size[0];
    r3->size[0] = trueCount;
    emxEnsureCapacity_int32_T(r3, i);
    nz_data = r3->data;
    k = 0;
    for (i = 0; i <= xoffset; i++) {
      if (tf_data[i]) {
        nz_data[k] = i;
        k++;
      }
    }
    loop_ub = r3->size[0];
    i = normal->size[0] * normal->size[1];
    normal->size[0] = r3->size[0];
    normal->size[1] = varargin_1->RangeData->size[1];
    emxEnsureCapacity_real32_T(normal, i);
    normal_data = normal->data;
    xoffset = varargin_1->RangeData->size[1];
    for (i = 0; i < xoffset; i++) {
      for (trueCount = 0; trueCount < loop_ub; trueCount++) {
        normal_data[trueCount + normal->size[0] * i] =
            varargin_1->RangeData
                ->data[nz_data[trueCount] + varargin_1->RangeData->size[0] * i];
      }
    }
    emxFree_int32_T(&r3);
  } else {
    normal->size[0] = 0;
    normal->size[1] = 0;
  }
  b_pc = pointCloud_pointCloud(&pc, loc, c, nv, b_intensity);
  emxFree_real32_T(&b_intensity);
  emxFree_real32_T(&nv);
  emxFree_uint8_T(&c);
  emxFree_real32_T(&loc);
  i = b_pc->RangeData->size[0] * b_pc->RangeData->size[1];
  b_pc->RangeData->size[0] = normal->size[0];
  b_pc->RangeData->size[1] = normal->size[1];
  emxEnsureCapacity_real32_T(b_pc->RangeData, i);
  loop_ub = normal->size[0] * normal->size[1];
  for (i = 0; i < loop_ub; i++) {
    b_pc->RangeData->data[i] = normal_data[i];
  }
  emxFree_real32_T(&normal);
  eml_find(flag, nz);
  nz_data = nz->data;
  xoffset = b_pc->Location->size[0];
  xoffset = (xoffset < 3);
  modelParams_size[0] = 1;
  modelParams_size[1] = 4;
  modelParams_data[0] = 0.0F;
  modelParams_data[1] = 0.0F;
  modelParams_data[2] = 0.0F;
  modelParams_data[3] = 0.0F;
  if (xoffset == 0) {
    double normAxis_data[3];
    double denorm_data_idx_0;
    boolean_T isFound;
    denorm_data_idx_0 = sqrt(((double)varargin_3[0] * varargin_3[0] +
                              (double)varargin_3[1] * varargin_3[1]) +
                             (double)varargin_3[2] * varargin_3[2]);
    normAxis_data[0] = varargin_3[0] / denorm_data_idx_0;
    normAxis_data[1] = varargin_3[1] / denorm_data_idx_0;
    normAxis_data[2] = varargin_3[2] / denorm_data_idx_0;
    isFound = msac(pc.Location, varargin_2, normAxis_data,
                   varargin_4 * 3.1415926535897931 / 180.0, modelParams_data,
                   modelParams_size);
    if (isFound) {
      loop_ub = modelParams_size[0] * modelParams_size[1];
      if (fabsf(acosf(fminf(
              1.0F,
              fmaxf(-1.0F,
                    ((float)normAxis_data[0] * modelParams_data[0] +
                     (float)normAxis_data[1] * modelParams_data[1]) +
                        (float)normAxis_data[2] * modelParams_data[2])))) >
          1.5707963267948966) {
        k = (loop_ub / 4) << 2;
        j = k - 4;
        for (i = 0; i <= j; i += 4) {
          __m128 r4;
          r4 = _mm_loadu_ps(&modelParams_data[0]);
          _mm_storeu_ps(&modelParams_data[0],
                        _mm_mul_ps(r4, _mm_set1_ps(-1.0F)));
        }
        for (i = k; i < loop_ub; i++) {
          modelParams_data[i] = -modelParams_data[i];
        }
      }
    } else {
      xoffset = 2;
    }
  }
  if ((modelParams_size[0] == 0) || (modelParams_size[1] == 0)) {
    modelParams_data[0] = 0.0F;
    modelParams_data[1] = 0.0F;
    modelParams_data[2] = 0.0F;
    modelParams_data[3] = 0.0F;
  }
  if (xoffset == 0) {
    evalPlane(modelParams_data, pc.Location, intensity);
    intensity_data = intensity->data;
    j = intensity->size[0] - 1;
    trueCount = 0;
    for (i = 0; i <= j; i++) {
      if (intensity_data[i] < varargin_2) {
        trueCount++;
      }
    }
    i = inlierIndices->size[0];
    inlierIndices->size[0] = trueCount;
    emxEnsureCapacity_real_T(inlierIndices, i);
    inlierIndices_data = inlierIndices->data;
    k = 0;
    for (i = 0; i <= j; i++) {
      if (intensity_data[i] < varargin_2) {
        inlierIndices_data[k] = nz_data[i];
        k++;
      }
    }
    xoffset = varargin_1->Location->size[0];
    i = flag->size[0];
    flag->size[0] = xoffset;
    emxEnsureCapacity_boolean_T(flag, i);
    tf_data = flag->data;
    for (i = 0; i < xoffset; i++) {
      tf_data[i] = true;
    }
    trueCount = 0;
    k = 0;
    for (i = 0; i <= j; i++) {
      if (intensity_data[i] < varargin_2) {
        xoffset = trueCount + 1;
        trueCount++;
        nz_data[k] = nz_data[i];
        k = xoffset;
      }
    }
    i = nz->size[0];
    nz->size[0] = trueCount;
    emxEnsureCapacity_int32_T(nz, i);
    nz_data = nz->data;
    for (i = 0; i < trueCount; i++) {
      tf_data[nz_data[i] - 1] = false;
    }
    eml_find(flag, nz);
    nz_data = nz->data;
    loop_ub = nz->size[0];
    i = outlierIndices->size[0];
    outlierIndices->size[0] = nz->size[0];
    emxEnsureCapacity_real_T(outlierIndices, i);
    inlierIndices_data = outlierIndices->data;
    for (i = 0; i < loop_ub; i++) {
      inlierIndices_data[i] = nz_data[i];
    }
  } else {
    inlierIndices->size[0] = 0;
    outlierIndices->size[0] = 0;
  }
  emxFree_real32_T(&intensity);
  emxFree_int32_T(&nz);
  emxFree_boolean_T(&flag);
  if (!pc.matlabCodegenIsDeleted) {
    void *locationPtr;
    if (pc.HasLocationHandleAllocated) {
      locationPtr = pc.LocationHandle;
      kdtreeDeleteLocationDataPointer_single(locationPtr);
    }
    if (pc.HasKdtreeConstructed) {
      locationPtr = pc.Kdtree;
      kdtreeDeleteObj_single(locationPtr);
    }
  }
  emxFreeStruct_pointCloud(&pc);
}

/*
 * File trailer for pcfitplane.c
 *
 * [EOF]
 */
