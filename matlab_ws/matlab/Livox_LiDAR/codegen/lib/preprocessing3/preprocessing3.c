/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: preprocessing3.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 26-Jun-2024 14:35:29
 */

/* Include Files */
#include "preprocessing3.h"
#include "convertFromCartesianToSphericalCoordinate.h"
#include "pointCloud.h"
#include "preprocessing3_emxutil.h"
#include "preprocessing3_types.h"
#include "rt_nonfinite.h"
#include "cvstCG_kdtree.h"
#include "labelRangeDataGroundRemovalUtilsCore_api.hpp"
#include <string.h>

/* Function Definitions */
/*
 * Arguments    : const float points[172800]
 *                const float intensity[57600]
 *                emxArray_real32_T *Points
 *                emxArray_real32_T *Intensity
 * Return Type  : void
 */
void preprocessing3(const float points[172800], const float intensity[57600],
                    emxArray_real32_T *Points, emxArray_real32_T *Intensity)
{
  static b_pointCloud ptCloud_tmp;
  static float fv[172800];
  emxArray_boolean_T *b_groundIdx;
  emxArray_boolean_T *groundIdx;
  emxArray_real32_T *rangeData;
  pointCloud ptCld;
  float *Points_data;
  int i;
  int loop_ub;
  boolean_T *b_groundIdx_data;
  boolean_T *groundIdx_data;
  emxInitStruct_pointCloud(&ptCld);
  ptCld.matlabCodegenIsDeleted = true;
  emxInitStruct_pointCloud1(&ptCloud_tmp);
  ptCloud_tmp.HasKdtreeConstructed = false;
  ptCloud_tmp.HasLocationHandleAllocated = false;
  memcpy(&ptCloud_tmp.Location[0], &points[0], 172800U * sizeof(float));
  ptCloud_tmp.Color->size[0] = 0;
  ptCloud_tmp.Color->size[1] = 0;
  ptCloud_tmp.Color->size[2] = 0;
  ptCloud_tmp.Normal->size[0] = 0;
  ptCloud_tmp.Normal->size[1] = 0;
  ptCloud_tmp.Normal->size[2] = 0;
  i = ptCloud_tmp.Intensity->size[0] * ptCloud_tmp.Intensity->size[1];
  ptCloud_tmp.Intensity->size[0] = 32;
  ptCloud_tmp.Intensity->size[1] = 1800;
  emxEnsureCapacity_real32_T(ptCloud_tmp.Intensity, i);
  for (i = 0; i < 57600; i++) {
    ptCloud_tmp.Intensity->data[i] = intensity[i];
  }
  ptCloud_tmp.PointCloudArrayData->size[0] = 1;
  ptCloud_tmp.PointCloudArrayData->size[1] = 1;
  ptCloud_tmp.Kdtree = NULL;
  ptCloud_tmp.LocationHandle = NULL;
  ptCloud_tmp.matlabCodegenIsDeleted = false;
  /*  indices = findPointsInROI(ptCloud_tmp,ROI); */
  /*  ptCloud_roi = select(ptCloud_tmp,indices); */
  c_convertFromCartesianToSpheric(points, fv);
  i = ptCloud_tmp.RangeData->size[0] * ptCloud_tmp.RangeData->size[1] *
      ptCloud_tmp.RangeData->size[2];
  ptCloud_tmp.RangeData->size[0] = 32;
  ptCloud_tmp.RangeData->size[1] = 1800;
  ptCloud_tmp.RangeData->size[2] = 3;
  emxEnsureCapacity_real32_T(ptCloud_tmp.RangeData, i);
  for (i = 0; i < 172800; i++) {
    ptCloud_tmp.RangeData->data[i] = fv[i];
  }
  emxInit_real32_T(&rangeData, 3);
  i = rangeData->size[0] * rangeData->size[1] * rangeData->size[2];
  rangeData->size[0] = 32;
  rangeData->size[1] = 1800;
  rangeData->size[2] = 3;
  emxEnsureCapacity_real32_T(rangeData, i);
  Points_data = rangeData->data;
  for (i = 0; i < 172800; i++) {
    Points_data[i] = ptCloud_tmp.RangeData->data[i];
  }
  emxInit_boolean_T(&groundIdx);
  i = groundIdx->size[0] * groundIdx->size[1];
  groundIdx->size[0] = 32;
  groundIdx->size[1] = 1800;
  emxEnsureCapacity_boolean_T(groundIdx, i);
  groundIdx_data = groundIdx->data;
  for (i = 0; i < 57600; i++) {
    groundIdx_data[i] = false;
  }
  preprocessAndSegmentGround_single(&Points_data[0], 32, 1800,
                                    &groundIdx_data[0], 0.52359879F,
                                    0.34906587F, 1.0F);
  emxFree_real32_T(&rangeData);
  emxInit_boolean_T(&b_groundIdx);
  i = b_groundIdx->size[0] * b_groundIdx->size[1];
  b_groundIdx->size[0] = 32;
  b_groundIdx->size[1] = 1800;
  emxEnsureCapacity_boolean_T(b_groundIdx, i);
  b_groundIdx_data = b_groundIdx->data;
  for (i = 0; i < 57600; i++) {
    b_groundIdx_data[i] = !groundIdx_data[i];
  }
  emxFree_boolean_T(&groundIdx);
  pointCloud_select(&ptCloud_tmp, b_groundIdx, &ptCld);
  emxFree_boolean_T(&b_groundIdx);
  emxFreeStruct_pointCloud1(&ptCloud_tmp);
  i = Points->size[0] * Points->size[1];
  Points->size[0] = ptCld.Location->size[0];
  Points->size[1] = 3;
  emxEnsureCapacity_real32_T(Points, i);
  Points_data = Points->data;
  loop_ub = ptCld.Location->size[0] * 3;
  for (i = 0; i < loop_ub; i++) {
    Points_data[i] = ptCld.Location->data[i];
  }
  i = Intensity->size[0] * Intensity->size[1];
  Intensity->size[0] = ptCld.Intensity->size[0];
  Intensity->size[1] = ptCld.Intensity->size[1];
  emxEnsureCapacity_real32_T(Intensity, i);
  Points_data = Intensity->data;
  loop_ub = ptCld.Intensity->size[0] * ptCld.Intensity->size[1];
  for (i = 0; i < loop_ub; i++) {
    Points_data[i] = ptCld.Intensity->data[i];
  }
  if (!ptCld.matlabCodegenIsDeleted) {
    void *locationPtr;
    if (ptCld.HasLocationHandleAllocated) {
      locationPtr = ptCld.LocationHandle;
      kdtreeDeleteLocationDataPointer_single(locationPtr);
    }
    if (ptCld.HasKdtreeConstructed) {
      locationPtr = ptCld.Kdtree;
      kdtreeDeleteObj_single(locationPtr);
    }
  }
  emxFreeStruct_pointCloud(&ptCld);
}

/*
 * File trailer for preprocessing3.c
 *
 * [EOF]
 */
