/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: preprocessing.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 26-Jun-2024 13:22:25
 */

/* Include Files */
#include "preprocessing.h"
#include "find.h"
#include "msac.h"
#include "pcfitplane.h"
#include "pointCloud.h"
#include "preprocessing_data.h"
#include "preprocessing_emxutil.h"
#include "preprocessing_initialize.h"
#include "preprocessing_types.h"
#include "rt_nonfinite.h"
#include "cvstCG_kdtree.h"
#include "rt_nonfinite.h"
#include <math.h>
#include <string.h>
#include <xmmintrin.h>

/* Function Definitions */
/*
 * Arguments    : const float points[172800]
 *                const float intensity[57600]
 *                const float ROI[6]
 *                float GroundMaxDistance
 *                const float GroundReferenceVector[3]
 *                float GroundMaxAngularDistance
 *                emxArray_real32_T *Points
 *                emxArray_real32_T *Intensity
 * Return Type  : void
 */
void preprocessing(const float points[172800], const float intensity[57600],
                   const float ROI[6], float GroundMaxDistance,
                   const float GroundReferenceVector[3],
                   float GroundMaxAngularDistance, emxArray_real32_T *Points,
                   emxArray_real32_T *Intensity)
{
  static b_pointCloud ptCloud_tmp;
  void *locationPtr;
  emxArray_boolean_T *flag;
  emxArray_boolean_T *tf;
  emxArray_int32_T *nz;
  emxArray_int32_T *r;
  emxArray_int32_T *r1;
  emxArray_int32_T *r2;
  emxArray_int32_T *r3;
  emxArray_real32_T *b_intensity;
  emxArray_real32_T *c_intensity;
  emxArray_real32_T *loc;
  emxArray_real32_T *normal;
  emxArray_real32_T *nv;
  emxArray_real32_T *outliers;
  emxArray_uint32_T *indices;
  emxArray_uint8_T *c;
  pointCloud pc;
  pointCloud ptCld;
  pointCloud ptCloud_roi;
  pointCloud *b_pc;
  float modelParams_data[4];
  float *Points_data;
  float *intensity_data;
  float *normal_data;
  float *outliers_data;
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
  if (!isInitialized_preprocessing) {
    preprocessing_initialize();
  }
  emxInitStruct_pointCloud(&ptCld);
  emxInitStruct_pointCloud(&ptCloud_roi);
  emxInitStruct_pointCloud(&pc);
  ptCld.matlabCodegenIsDeleted = true;
  ptCloud_roi.matlabCodegenIsDeleted = true;
  emxInitStruct_pointCloud1(&ptCloud_tmp);
  ptCloud_tmp.HasKdtreeConstructed = false;
  ptCloud_tmp.HasLocationHandleAllocated = false;
  ptCloud_tmp.Color->size[0] = 0;
  ptCloud_tmp.Color->size[1] = 0;
  memcpy(&ptCloud_tmp.Location[0], &points[0], 172800U * sizeof(float));
  ptCloud_tmp.Normal->size[0] = 0;
  ptCloud_tmp.Normal->size[1] = 0;
  i = ptCloud_tmp.Intensity->size[0];
  ptCloud_tmp.Intensity->size[0] = 57600;
  emxEnsureCapacity_real32_T(ptCloud_tmp.Intensity, i);
  for (i = 0; i < 57600; i++) {
    ptCloud_tmp.Intensity->data[i] = intensity[i];
  }
  ptCloud_tmp.RangeData->size[0] = 0;
  ptCloud_tmp.RangeData->size[1] = 0;
  ptCloud_tmp.PointCloudArrayData->size[0] = 1;
  ptCloud_tmp.PointCloudArrayData->size[1] = 1;
  ptCloud_tmp.Kdtree = NULL;
  ptCloud_tmp.LocationHandle = NULL;
  ptCloud_tmp.matlabCodegenIsDeleted = false;
  emxInit_uint32_T(&indices);
  pointCloud_findPointsInROI(&ptCloud_tmp, ROI, indices);
  pointCloud_select(&ptCloud_tmp, indices, &ptCloud_roi);
  emxFree_uint32_T(&indices);
  emxFreeStruct_pointCloud1(&ptCloud_tmp);
  pc.matlabCodegenIsDeleted = true;
  emxInit_boolean_T(&tf, 2);
  i = ptCloud_roi.Location->size[0];
  trueCount = tf->size[0] * tf->size[1];
  tf->size[0] = i;
  tf->size[1] = 3;
  emxEnsureCapacity_boolean_T(tf, trueCount);
  tf_data = tf->data;
  xoffset = ptCloud_roi.Location->size[0] * 3;
  for (trueCount = 0; trueCount < xoffset; trueCount++) {
    tf_data[trueCount] = ((!rtIsInfF(ptCloud_roi.Location->data[trueCount])) &&
                          (!rtIsNaNF(ptCloud_roi.Location->data[trueCount])));
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
  normal->size[0] = ptCloud_roi.Normal->size[0];
  loop_ub = ptCloud_roi.Normal->size[1];
  normal->size[1] = loop_ub;
  emxEnsureCapacity_real32_T(normal, i);
  normal_data = normal->data;
  xoffset = ptCloud_roi.Normal->size[0] * ptCloud_roi.Normal->size[1];
  for (i = 0; i < xoffset; i++) {
    normal_data[i] = ptCloud_roi.Normal->data[i];
  }
  emxInit_real32_T(&b_intensity, 1);
  xoffset = ptCloud_roi.Intensity->size[0];
  i = b_intensity->size[0];
  b_intensity->size[0] = xoffset;
  emxEnsureCapacity_real32_T(b_intensity, i);
  intensity_data = b_intensity->data;
  for (i = 0; i < xoffset; i++) {
    intensity_data[i] = ptCloud_roi.Intensity->data[i];
  }
  emxInit_real32_T(&loc, 2);
  if (ptCloud_roi.Location->size[0] != 0) {
    k = flag->size[0] - 1;
    trueCount = 0;
    for (i = 0; i <= k; i++) {
      if (tf_data[i]) {
        trueCount++;
      }
    }
    emxInit_int32_T(&r);
    i = r->size[0];
    r->size[0] = trueCount;
    emxEnsureCapacity_int32_T(r, i);
    nz_data = r->data;
    j = 0;
    for (i = 0; i <= k; i++) {
      if (tf_data[i]) {
        nz_data[j] = i;
        j++;
      }
    }
    xoffset = r->size[0];
    i = loc->size[0] * loc->size[1];
    loc->size[0] = r->size[0];
    loc->size[1] = 3;
    emxEnsureCapacity_real32_T(loc, i);
    Points_data = loc->data;
    for (i = 0; i < 3; i++) {
      for (trueCount = 0; trueCount < xoffset; trueCount++) {
        Points_data[trueCount + loc->size[0] * i] =
            ptCloud_roi.Location
                ->data[nz_data[trueCount] + ptCloud_roi.Location->size[0] * i];
      }
    }
    emxFree_int32_T(&r);
  } else {
    loc->size[0] = 0;
    loc->size[1] = 3;
  }
  emxInit_uint8_T(&c);
  if ((ptCloud_roi.Color->size[0] != 0) && (ptCloud_roi.Color->size[1] != 0)) {
    k = flag->size[0] - 1;
    trueCount = 0;
    for (i = 0; i <= k; i++) {
      if (tf_data[i]) {
        trueCount++;
      }
    }
    emxInit_int32_T(&r1);
    i = r1->size[0];
    r1->size[0] = trueCount;
    emxEnsureCapacity_int32_T(r1, i);
    nz_data = r1->data;
    j = 0;
    for (i = 0; i <= k; i++) {
      if (tf_data[i]) {
        nz_data[j] = i;
        j++;
      }
    }
    xoffset = r1->size[0];
    i = c->size[0] * c->size[1];
    c->size[0] = r1->size[0];
    j = ptCloud_roi.Color->size[1];
    c->size[1] = j;
    emxEnsureCapacity_uint8_T(c, i);
    c_data = c->data;
    for (i = 0; i < j; i++) {
      for (trueCount = 0; trueCount < xoffset; trueCount++) {
        c_data[trueCount + c->size[0] * i] =
            ptCloud_roi.Color
                ->data[nz_data[trueCount] + ptCloud_roi.Color->size[0] * i];
      }
    }
    emxFree_int32_T(&r1);
  } else {
    c->size[0] = 0;
    c->size[1] = 0;
  }
  emxInit_real32_T(&nv, 2);
  if ((normal->size[0] != 0) && (normal->size[1] != 0)) {
    k = flag->size[0] - 1;
    trueCount = 0;
    for (i = 0; i <= k; i++) {
      if (tf_data[i]) {
        trueCount++;
      }
    }
    emxInit_int32_T(&r2);
    i = r2->size[0];
    r2->size[0] = trueCount;
    emxEnsureCapacity_int32_T(r2, i);
    nz_data = r2->data;
    j = 0;
    for (i = 0; i <= k; i++) {
      if (tf_data[i]) {
        nz_data[j] = i;
        j++;
      }
    }
    xoffset = r2->size[0];
    i = nv->size[0] * nv->size[1];
    nv->size[0] = r2->size[0];
    nv->size[1] = loop_ub;
    emxEnsureCapacity_real32_T(nv, i);
    Points_data = nv->data;
    for (i = 0; i < loop_ub; i++) {
      for (trueCount = 0; trueCount < xoffset; trueCount++) {
        Points_data[trueCount + nv->size[0] * i] =
            normal_data[nz_data[trueCount] + normal->size[0] * i];
      }
    }
    emxFree_int32_T(&r2);
  } else {
    nv->size[0] = 0;
    nv->size[1] = 0;
  }
  emxInit_real32_T(&c_intensity, 1);
  if (b_intensity->size[0] != 0) {
    k = flag->size[0] - 1;
    trueCount = 0;
    for (i = 0; i <= k; i++) {
      if (tf_data[i]) {
        trueCount++;
      }
    }
    i = c_intensity->size[0];
    c_intensity->size[0] = trueCount;
    emxEnsureCapacity_real32_T(c_intensity, i);
    Points_data = c_intensity->data;
    j = 0;
    for (i = 0; i <= k; i++) {
      if (tf_data[i]) {
        Points_data[j] = intensity_data[i];
        j++;
      }
    }
  } else {
    c_intensity->size[0] = 0;
  }
  if ((ptCloud_roi.RangeData->size[0] != 0) &&
      (ptCloud_roi.RangeData->size[1] != 0)) {
    k = flag->size[0] - 1;
    trueCount = 0;
    for (i = 0; i <= k; i++) {
      if (tf_data[i]) {
        trueCount++;
      }
    }
    emxInit_int32_T(&r3);
    i = r3->size[0];
    r3->size[0] = trueCount;
    emxEnsureCapacity_int32_T(r3, i);
    nz_data = r3->data;
    j = 0;
    for (i = 0; i <= k; i++) {
      if (tf_data[i]) {
        nz_data[j] = i;
        j++;
      }
    }
    loop_ub = r3->size[0];
    i = normal->size[0] * normal->size[1];
    normal->size[0] = r3->size[0];
    xoffset = ptCloud_roi.RangeData->size[1];
    normal->size[1] = xoffset;
    emxEnsureCapacity_real32_T(normal, i);
    normal_data = normal->data;
    for (i = 0; i < xoffset; i++) {
      for (trueCount = 0; trueCount < loop_ub; trueCount++) {
        normal_data[trueCount + normal->size[0] * i] =
            ptCloud_roi.RangeData
                ->data[nz_data[trueCount] + ptCloud_roi.RangeData->size[0] * i];
      }
    }
    emxFree_int32_T(&r3);
  } else {
    normal->size[0] = 0;
    normal->size[1] = 0;
  }
  b_pc = pointCloud_pointCloud(&pc, loc, c, nv, c_intensity);
  i = b_pc->RangeData->size[0] * b_pc->RangeData->size[1];
  b_pc->RangeData->size[0] = normal->size[0];
  b_pc->RangeData->size[1] = normal->size[1];
  emxEnsureCapacity_real32_T(b_pc->RangeData, i);
  loop_ub = normal->size[0] * normal->size[1];
  for (i = 0; i < loop_ub; i++) {
    b_pc->RangeData->data[i] = normal_data[i];
  }
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
    denorm_data_idx_0 =
        sqrt(((double)GroundReferenceVector[0] * GroundReferenceVector[0] +
              (double)GroundReferenceVector[1] * GroundReferenceVector[1]) +
             (double)GroundReferenceVector[2] * GroundReferenceVector[2]);
    normAxis_data[0] = GroundReferenceVector[0] / denorm_data_idx_0;
    normAxis_data[1] = GroundReferenceVector[1] / denorm_data_idx_0;
    normAxis_data[2] = GroundReferenceVector[2] / denorm_data_idx_0;
    isFound = msac(pc.Location, GroundMaxDistance, normAxis_data,
                   GroundMaxAngularDistance * 3.1415926535897931 / 180.0,
                   modelParams_data, modelParams_size);
    if (isFound) {
      loop_ub = modelParams_size[0] * modelParams_size[1];
      if (fabsf(acosf(fminf(
              1.0F,
              fmaxf(-1.0F,
                    ((float)normAxis_data[0] * modelParams_data[0] +
                     (float)normAxis_data[1] * modelParams_data[1]) +
                        (float)normAxis_data[2] * modelParams_data[2])))) >
          1.5707963267948966) {
        j = (loop_ub / 4) << 2;
        k = j - 4;
        for (i = 0; i <= k; i += 4) {
          __m128 r4;
          r4 = _mm_loadu_ps(&modelParams_data[0]);
          _mm_storeu_ps(&modelParams_data[0],
                        _mm_mul_ps(r4, _mm_set1_ps(-1.0F)));
        }
        for (i = j; i < loop_ub; i++) {
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
    evalPlane(modelParams_data, pc.Location, b_intensity);
    intensity_data = b_intensity->data;
    xoffset = ptCloud_roi.Location->size[0];
    i = flag->size[0];
    flag->size[0] = xoffset;
    emxEnsureCapacity_boolean_T(flag, i);
    tf_data = flag->data;
    for (i = 0; i < xoffset; i++) {
      tf_data[i] = true;
    }
    k = b_intensity->size[0] - 1;
    trueCount = 0;
    j = 0;
    for (i = 0; i <= k; i++) {
      if (intensity_data[i] < GroundMaxDistance) {
        xoffset = trueCount + 1;
        trueCount++;
        nz_data[j] = nz_data[i];
        j = xoffset;
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
  } else {
    nz->size[0] = 0;
  }
  emxFree_boolean_T(&flag);
  if (!pc.matlabCodegenIsDeleted) {
    if (pc.HasLocationHandleAllocated) {
      locationPtr = pc.LocationHandle;
      kdtreeDeleteLocationDataPointer_single(locationPtr);
    }
    if (pc.HasKdtreeConstructed) {
      locationPtr = pc.Kdtree;
      kdtreeDeleteObj_single(locationPtr);
    }
  }
  emxInit_real32_T(&outliers, 1);
  loop_ub = nz->size[0];
  i = outliers->size[0];
  outliers->size[0] = nz->size[0];
  emxEnsureCapacity_real32_T(outliers, i);
  outliers_data = outliers->data;
  for (i = 0; i < loop_ub; i++) {
    outliers_data[i] = (float)nz_data[i];
  }
  i = normal->size[0] * normal->size[1];
  normal->size[0] = ptCloud_roi.Normal->size[0];
  xoffset = ptCloud_roi.Normal->size[1];
  normal->size[1] = xoffset;
  emxEnsureCapacity_real32_T(normal, i);
  normal_data = normal->data;
  j = ptCloud_roi.Normal->size[0] * ptCloud_roi.Normal->size[1];
  for (i = 0; i < j; i++) {
    normal_data[i] = ptCloud_roi.Normal->data[i];
  }
  j = ptCloud_roi.Intensity->size[0];
  i = b_intensity->size[0];
  b_intensity->size[0] = j;
  emxEnsureCapacity_real32_T(b_intensity, i);
  intensity_data = b_intensity->data;
  for (i = 0; i < j; i++) {
    intensity_data[i] = ptCloud_roi.Intensity->data[i];
  }
  if (ptCloud_roi.Location->size[0] != 0) {
    i = loc->size[0] * loc->size[1];
    loc->size[0] = nz->size[0];
    loc->size[1] = 3;
    emxEnsureCapacity_real32_T(loc, i);
    Points_data = loc->data;
    for (i = 0; i < 3; i++) {
      for (trueCount = 0; trueCount < loop_ub; trueCount++) {
        Points_data[trueCount + loc->size[0] * i] =
            ptCloud_roi.Location->data[((int)outliers_data[trueCount] +
                                        ptCloud_roi.Location->size[0] * i) -
                                       1];
      }
    }
  } else {
    loc->size[0] = 0;
    loc->size[1] = 3;
  }
  if ((ptCloud_roi.Color->size[0] != 0) && (ptCloud_roi.Color->size[1] != 0)) {
    i = c->size[0] * c->size[1];
    c->size[0] = nz->size[0];
    j = ptCloud_roi.Color->size[1];
    c->size[1] = j;
    emxEnsureCapacity_uint8_T(c, i);
    c_data = c->data;
    for (i = 0; i < j; i++) {
      for (trueCount = 0; trueCount < loop_ub; trueCount++) {
        c_data[trueCount + c->size[0] * i] =
            ptCloud_roi.Color->data[((int)outliers_data[trueCount] +
                                     ptCloud_roi.Color->size[0] * i) -
                                    1];
      }
    }
  } else {
    c->size[0] = 0;
    c->size[1] = 0;
  }
  if ((normal->size[0] != 0) && (normal->size[1] != 0)) {
    i = nv->size[0] * nv->size[1];
    nv->size[0] = nz->size[0];
    nv->size[1] = xoffset;
    emxEnsureCapacity_real32_T(nv, i);
    Points_data = nv->data;
    for (i = 0; i < xoffset; i++) {
      for (trueCount = 0; trueCount < loop_ub; trueCount++) {
        Points_data[trueCount + nv->size[0] * i] =
            normal_data[((int)outliers_data[trueCount] + normal->size[0] * i) -
                        1];
      }
    }
  } else {
    nv->size[0] = 0;
    nv->size[1] = 0;
  }
  if (b_intensity->size[0] != 0) {
    i = c_intensity->size[0];
    c_intensity->size[0] = nz->size[0];
    emxEnsureCapacity_real32_T(c_intensity, i);
    Points_data = c_intensity->data;
    for (i = 0; i < loop_ub; i++) {
      Points_data[i] = intensity_data[(int)outliers_data[i] - 1];
    }
  } else {
    c_intensity->size[0] = 0;
  }
  emxFree_real32_T(&b_intensity);
  if ((ptCloud_roi.RangeData->size[0] != 0) &&
      (ptCloud_roi.RangeData->size[1] != 0)) {
    i = normal->size[0] * normal->size[1];
    normal->size[0] = nz->size[0];
    xoffset = ptCloud_roi.RangeData->size[1];
    normal->size[1] = xoffset;
    emxEnsureCapacity_real32_T(normal, i);
    normal_data = normal->data;
    for (i = 0; i < xoffset; i++) {
      for (trueCount = 0; trueCount < loop_ub; trueCount++) {
        normal_data[trueCount + normal->size[0] * i] =
            ptCloud_roi.RangeData->data[((int)outliers_data[trueCount] +
                                         ptCloud_roi.RangeData->size[0] * i) -
                                        1];
      }
    }
  } else {
    normal->size[0] = 0;
    normal->size[1] = 0;
  }
  emxFree_int32_T(&nz);
  emxFree_real32_T(&outliers);
  b_pc = pointCloud_pointCloud(&ptCld, loc, c, nv, c_intensity);
  emxFree_real32_T(&c_intensity);
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
  i = Points->size[0] * Points->size[1];
  Points->size[0] = ptCld.Location->size[0];
  Points->size[1] = 3;
  emxEnsureCapacity_real32_T(Points, i);
  Points_data = Points->data;
  loop_ub = ptCld.Location->size[0] * 3;
  for (i = 0; i < loop_ub; i++) {
    Points_data[i] = ptCld.Location->data[i];
  }
  loop_ub = ptCld.Intensity->size[0];
  i = Intensity->size[0];
  Intensity->size[0] = loop_ub;
  emxEnsureCapacity_real32_T(Intensity, i);
  Points_data = Intensity->data;
  for (i = 0; i < loop_ub; i++) {
    Points_data[i] = ptCld.Intensity->data[i];
  }
  if (!ptCloud_roi.matlabCodegenIsDeleted) {
    if (ptCloud_roi.HasLocationHandleAllocated) {
      locationPtr = ptCloud_roi.LocationHandle;
      kdtreeDeleteLocationDataPointer_single(locationPtr);
    }
    if (ptCloud_roi.HasKdtreeConstructed) {
      locationPtr = ptCloud_roi.Kdtree;
      kdtreeDeleteObj_single(locationPtr);
    }
  }
  if (!ptCld.matlabCodegenIsDeleted) {
    if (ptCld.HasLocationHandleAllocated) {
      locationPtr = ptCld.LocationHandle;
      kdtreeDeleteLocationDataPointer_single(locationPtr);
    }
    if (ptCld.HasKdtreeConstructed) {
      locationPtr = ptCld.Kdtree;
      kdtreeDeleteObj_single(locationPtr);
    }
  }
  emxFreeStruct_pointCloud(&pc);
  emxFreeStruct_pointCloud(&ptCloud_roi);
  emxFreeStruct_pointCloud(&ptCld);
}

/*
 * File trailer for preprocessing.c
 *
 * [EOF]
 */
