/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: preprocessing2.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 26-Jun-2024 13:33:54
 */

/* Include Files */
#include "preprocessing2.h"
#include "pcfitplane.h"
#include "pointCloud.h"
#include "preprocessing2_data.h"
#include "preprocessing2_emxutil.h"
#include "preprocessing2_initialize.h"
#include "preprocessing2_types.h"
#include "rt_nonfinite.h"
#include "cvstCG_kdtree.h"
#include <string.h>

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
void preprocessing2(const float points[172800], const float intensity[57600],
                    const float ROI[6], float GroundMaxDistance,
                    const float GroundReferenceVector[3],
                    float GroundMaxAngularDistance, emxArray_real32_T *Points,
                    emxArray_real32_T *Intensity)
{
  static b_pointCloud ptCloud_tmp;
  void *locationPtr;
  emxArray_real32_T *b_intensity;
  emxArray_real32_T *loc;
  emxArray_real32_T *normal;
  emxArray_real32_T *nv;
  emxArray_real32_T *varargin_1;
  emxArray_real_T *auto_gen_tmp_1;
  emxArray_real_T *auto_gen_tmp_2;
  emxArray_uint8_T *c;
  pointCloud ptCld;
  pointCloud ptCloud_roi;
  pointCloud *ptCloudOut;
  double *auto_gen_tmp_2_data;
  float f;
  float f1;
  float f2;
  float f3;
  float f4;
  float f5;
  float *Points_data;
  float *normal_data;
  float *varargin_1_data;
  int b_loop_ub;
  int c_loop_ub;
  int i;
  int i1;
  int loop_ub;
  unsigned char *c_data;
  boolean_T b_ptCloud_tmp[57600];
  if (!isInitialized_preprocessing2) {
    preprocessing2_initialize();
  }
  emxInitStruct_pointCloud(&ptCld);
  emxInitStruct_pointCloud(&ptCloud_roi);
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
  ptCloud_tmp.RangeData->size[0] = 0;
  ptCloud_tmp.RangeData->size[1] = 0;
  ptCloud_tmp.PointCloudArrayData->size[0] = 1;
  ptCloud_tmp.PointCloudArrayData->size[1] = 1;
  ptCloud_tmp.Kdtree = NULL;
  ptCloud_tmp.LocationHandle = NULL;
  ptCloud_tmp.matlabCodegenIsDeleted = false;
  f = ROI[1];
  f1 = ROI[0];
  f2 = ROI[3];
  f3 = ROI[2];
  f4 = ROI[5];
  f5 = ROI[4];
  for (i = 0; i < 57600; i++) {
    float b_ptCloud_tmp_tmp;
    float f6;
    float ptCloud_tmp_tmp;
    ptCloud_tmp.Intensity->data[i] = intensity[i];
    ptCloud_tmp_tmp = ptCloud_tmp.Location[i + 57600];
    b_ptCloud_tmp_tmp = ptCloud_tmp.Location[i + 115200];
    f6 = ptCloud_tmp.Location[i];
    b_ptCloud_tmp[i] = ((f6 < f) && (f6 > f1) &&
                        ((ptCloud_tmp_tmp < f2) && (ptCloud_tmp_tmp > f3)) &&
                        ((b_ptCloud_tmp_tmp < f4) && (b_ptCloud_tmp_tmp > f5)));
  }
  pointCloud_select(&ptCloud_tmp, b_ptCloud_tmp, &ptCloud_roi);
  emxFreeStruct_pointCloud1(&ptCloud_tmp);
  emxInit_real_T(&auto_gen_tmp_1);
  emxInit_real_T(&auto_gen_tmp_2);
  pcfitplane(&ptCloud_roi, GroundMaxDistance, GroundReferenceVector,
             GroundMaxAngularDistance, auto_gen_tmp_1, auto_gen_tmp_2);
  auto_gen_tmp_2_data = auto_gen_tmp_2->data;
  emxFree_real_T(&auto_gen_tmp_1);
  emxInit_real32_T(&varargin_1, 1);
  loop_ub = auto_gen_tmp_2->size[0];
  i = varargin_1->size[0];
  varargin_1->size[0] = auto_gen_tmp_2->size[0];
  emxEnsureCapacity_real32_T(varargin_1, i);
  varargin_1_data = varargin_1->data;
  for (i = 0; i < loop_ub; i++) {
    varargin_1_data[i] = (float)auto_gen_tmp_2_data[i];
  }
  emxInit_real32_T(&normal, 2);
  i = normal->size[0] * normal->size[1];
  normal->size[0] = ptCloud_roi.Normal->size[0];
  b_loop_ub = ptCloud_roi.Normal->size[1];
  normal->size[1] = b_loop_ub;
  emxEnsureCapacity_real32_T(normal, i);
  normal_data = normal->data;
  c_loop_ub = ptCloud_roi.Normal->size[0] * ptCloud_roi.Normal->size[1];
  for (i = 0; i < c_loop_ub; i++) {
    normal_data[i] = ptCloud_roi.Normal->data[i];
  }
  emxInit_real32_T(&loc, 2);
  if (ptCloud_roi.Location->size[0] != 0) {
    i = loc->size[0] * loc->size[1];
    loc->size[0] = auto_gen_tmp_2->size[0];
    loc->size[1] = 3;
    emxEnsureCapacity_real32_T(loc, i);
    Points_data = loc->data;
    for (i = 0; i < 3; i++) {
      for (i1 = 0; i1 < loop_ub; i1++) {
        Points_data[i1 + loc->size[0] * i] =
            ptCloud_roi.Location->data[((int)varargin_1_data[i1] +
                                        ptCloud_roi.Location->size[0] * i) -
                                       1];
      }
    }
  } else {
    loc->size[0] = 0;
    loc->size[1] = 3;
  }
  emxInit_uint8_T(&c);
  if ((ptCloud_roi.Color->size[0] != 0) && (ptCloud_roi.Color->size[1] != 0)) {
    i = c->size[0] * c->size[1];
    c->size[0] = auto_gen_tmp_2->size[0];
    c->size[1] = ptCloud_roi.Color->size[1];
    emxEnsureCapacity_uint8_T(c, i);
    c_data = c->data;
    c_loop_ub = ptCloud_roi.Color->size[1];
    for (i = 0; i < c_loop_ub; i++) {
      for (i1 = 0; i1 < loop_ub; i1++) {
        c_data[i1 + c->size[0] * i] =
            ptCloud_roi.Color->data[((int)varargin_1_data[i1] +
                                     ptCloud_roi.Color->size[0] * i) -
                                    1];
      }
    }
  } else {
    c->size[0] = 0;
    c->size[1] = 0;
  }
  emxInit_real32_T(&nv, 2);
  if ((normal->size[0] != 0) && (normal->size[1] != 0)) {
    i = nv->size[0] * nv->size[1];
    nv->size[0] = auto_gen_tmp_2->size[0];
    nv->size[1] = b_loop_ub;
    emxEnsureCapacity_real32_T(nv, i);
    Points_data = nv->data;
    for (i = 0; i < b_loop_ub; i++) {
      for (i1 = 0; i1 < loop_ub; i1++) {
        Points_data[i1 + nv->size[0] * i] =
            normal_data[((int)varargin_1_data[i1] + normal->size[0] * i) - 1];
      }
    }
  } else {
    nv->size[0] = 0;
    nv->size[1] = 0;
  }
  emxInit_real32_T(&b_intensity, 1);
  if (ptCloud_roi.Intensity->size[0] != 0) {
    i = b_intensity->size[0];
    b_intensity->size[0] = auto_gen_tmp_2->size[0];
    emxEnsureCapacity_real32_T(b_intensity, i);
    Points_data = b_intensity->data;
    for (i = 0; i < loop_ub; i++) {
      Points_data[i] = ptCloud_roi.Intensity->data[(int)varargin_1_data[i] - 1];
    }
  } else {
    b_intensity->size[0] = 0;
  }
  if ((ptCloud_roi.RangeData->size[0] != 0) &&
      (ptCloud_roi.RangeData->size[1] != 0)) {
    i = normal->size[0] * normal->size[1];
    normal->size[0] = auto_gen_tmp_2->size[0];
    normal->size[1] = ptCloud_roi.RangeData->size[1];
    emxEnsureCapacity_real32_T(normal, i);
    normal_data = normal->data;
    b_loop_ub = ptCloud_roi.RangeData->size[1];
    for (i = 0; i < b_loop_ub; i++) {
      for (i1 = 0; i1 < loop_ub; i1++) {
        normal_data[i1 + normal->size[0] * i] =
            ptCloud_roi.RangeData->data[((int)varargin_1_data[i1] +
                                         ptCloud_roi.RangeData->size[0] * i) -
                                        1];
      }
    }
  } else {
    normal->size[0] = 0;
    normal->size[1] = 0;
  }
  emxFree_real32_T(&varargin_1);
  emxFree_real_T(&auto_gen_tmp_2);
  ptCloudOut = pointCloud_pointCloud(&ptCld, loc, c, nv, b_intensity);
  emxFree_real32_T(&b_intensity);
  emxFree_real32_T(&nv);
  emxFree_uint8_T(&c);
  emxFree_real32_T(&loc);
  i = ptCloudOut->RangeData->size[0] * ptCloudOut->RangeData->size[1];
  ptCloudOut->RangeData->size[0] = normal->size[0];
  ptCloudOut->RangeData->size[1] = normal->size[1];
  emxEnsureCapacity_real32_T(ptCloudOut->RangeData, i);
  loop_ub = normal->size[0] * normal->size[1];
  for (i = 0; i < loop_ub; i++) {
    ptCloudOut->RangeData->data[i] = normal_data[i];
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
  i = Intensity->size[0];
  Intensity->size[0] = ptCld.Intensity->size[0];
  emxEnsureCapacity_real32_T(Intensity, i);
  Points_data = Intensity->data;
  loop_ub = ptCld.Intensity->size[0];
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
  emxFreeStruct_pointCloud(&ptCloud_roi);
  emxFreeStruct_pointCloud(&ptCld);
}

/*
 * File trailer for preprocessing2.c
 *
 * [EOF]
 */
