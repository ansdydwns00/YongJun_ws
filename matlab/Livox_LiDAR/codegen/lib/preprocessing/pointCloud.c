/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: pointCloud.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 26-Jun-2024 13:22:25
 */

/* Include Files */
#include "pointCloud.h"
#include "preprocessing_emxutil.h"
#include "preprocessing_types.h"
#include "rt_nonfinite.h"

/* Function Definitions */
/*
 * Arguments    : const b_pointCloud *b_this
 *                const float varargin_1[6]
 *                emxArray_uint32_T *indices
 * Return Type  : void
 */
void pointCloud_findPointsInROI(const b_pointCloud *b_this,
                                const float varargin_1[6],
                                emxArray_uint32_T *indices)
{
  emxArray_uint16_T *ii;
  double roi[6];
  double d;
  double d1;
  double d2;
  double d3;
  double d4;
  double d5;
  int i;
  int idx;
  int ptIter;
  unsigned int *indices_data;
  unsigned short *ii_data;
  boolean_T inROI[57600];
  boolean_T exitg1;
  for (i = 0; i < 2; i++) {
    roi[3 * i] = varargin_1[i];
    roi[3 * i + 1] = varargin_1[i + 2];
    roi[3 * i + 2] = varargin_1[i + 4];
  }
  d = roi[0];
  d1 = roi[3];
  d2 = roi[1];
  d3 = roi[4];
  d4 = roi[2];
  d5 = roi[5];
  for (ptIter = 0; ptIter < 57600; ptIter++) {
    double b_inROI_tmp;
    double inROI_tmp;
    float f;
    inROI_tmp = b_this->Location[ptIter + 57600];
    b_inROI_tmp = b_this->Location[ptIter + 115200];
    f = b_this->Location[ptIter];
    inROI[ptIter] =
        ((f >= d) && (f <= d1) && (inROI_tmp >= d2) && (inROI_tmp <= d3) &&
         (b_inROI_tmp >= d4) && (b_inROI_tmp <= d5));
  }
  idx = 0;
  emxInit_uint16_T(&ii);
  i = ii->size[0];
  ii->size[0] = 57600;
  emxEnsureCapacity_uint16_T(ii, i);
  ii_data = ii->data;
  ptIter = 0;
  exitg1 = false;
  while ((!exitg1) && (ptIter < 57600)) {
    if (inROI[ptIter]) {
      idx++;
      ii_data[idx - 1] = (unsigned short)(ptIter + 1);
      if (idx >= 57600) {
        exitg1 = true;
      } else {
        ptIter++;
      }
    } else {
      ptIter++;
    }
  }
  if (idx < 1) {
    ptIter = 0;
  } else {
    ptIter = idx;
  }
  i = ii->size[0];
  ii->size[0] = ptIter;
  emxEnsureCapacity_uint16_T(ii, i);
  ii_data = ii->data;
  i = indices->size[0];
  indices->size[0] = ptIter;
  emxEnsureCapacity_uint32_T(indices, i);
  indices_data = indices->data;
  for (i = 0; i < ptIter; i++) {
    indices_data[i] = ii_data[i];
  }
  emxFree_uint16_T(&ii);
}

/*
 * Arguments    : pointCloud *b_this
 *                const emxArray_real32_T *varargin_1
 *                const emxArray_uint8_T *varargin_3
 *                const emxArray_real32_T *varargin_5
 *                const emxArray_real32_T *varargin_7
 * Return Type  : pointCloud *
 */
pointCloud *pointCloud_pointCloud(pointCloud *b_this,
                                  const emxArray_real32_T *varargin_1,
                                  const emxArray_uint8_T *varargin_3,
                                  const emxArray_real32_T *varargin_5,
                                  const emxArray_real32_T *varargin_7)
{
  emxArray_uint8_T *b_value;
  pointCloud *c_this;
  const float *varargin_1_data;
  const float *varargin_5_data;
  const float *varargin_7_data;
  unsigned int numPoints[2];
  int i;
  int itilerow;
  int jcol;
  int k;
  int nrows;
  int xyzPoints_size_idx_0;
  const unsigned char *varargin_3_data;
  unsigned char *value_data;
  boolean_T exitg1;
  boolean_T p;
  varargin_7_data = varargin_7->data;
  varargin_5_data = varargin_5->data;
  varargin_3_data = varargin_3->data;
  varargin_1_data = varargin_1->data;
  c_this = b_this;
  c_this->HasKdtreeConstructed = false;
  c_this->HasLocationHandleAllocated = false;
  i = c_this->Location->size[0] * c_this->Location->size[1];
  c_this->Location->size[0] = varargin_1->size[0];
  c_this->Location->size[1] = 3;
  emxEnsureCapacity_real32_T(c_this->Location, i);
  nrows = varargin_1->size[0] * 3;
  for (i = 0; i < nrows; i++) {
    c_this->Location->data[i] = varargin_1_data[i];
  }
  emxInit_uint8_T(&b_value);
  xyzPoints_size_idx_0 = c_this->Location->size[0];
  numPoints[0] = (unsigned int)varargin_3->size[0];
  numPoints[1] = (unsigned int)varargin_3->size[1];
  p = true;
  k = 0;
  exitg1 = false;
  while ((!exitg1) && (k < 2)) {
    if ((int)numPoints[k] != (k << 1) + 1) {
      p = false;
      exitg1 = true;
    } else {
      k++;
    }
  }
  if (p) {
    int i1;
    i = varargin_3->size[0] * xyzPoints_size_idx_0;
    nrows = b_value->size[0] * b_value->size[1];
    b_value->size[0] = i;
    i1 = varargin_3->size[1];
    b_value->size[1] = varargin_3->size[1];
    emxEnsureCapacity_uint8_T(b_value, nrows);
    value_data = b_value->data;
    nrows = varargin_3->size[0];
    for (jcol = 0; jcol < i1; jcol++) {
      int iacol;
      int ibmat;
      iacol = jcol * nrows;
      ibmat = jcol * i - 1;
      for (itilerow = 0; itilerow < xyzPoints_size_idx_0; itilerow++) {
        int ibcol;
        ibcol = ibmat + itilerow * nrows;
        for (k = 0; k < nrows; k++) {
          value_data[(ibcol + k) + 1] = varargin_3_data[iacol + k];
        }
      }
    }
  } else {
    i = b_value->size[0] * b_value->size[1];
    b_value->size[0] = varargin_3->size[0];
    b_value->size[1] = varargin_3->size[1];
    emxEnsureCapacity_uint8_T(b_value, i);
    value_data = b_value->data;
    nrows = varargin_3->size[0] * varargin_3->size[1];
    for (i = 0; i < nrows; i++) {
      value_data[i] = varargin_3_data[i];
    }
  }
  i = c_this->Color->size[0] * c_this->Color->size[1];
  c_this->Color->size[0] = b_value->size[0];
  c_this->Color->size[1] = b_value->size[1];
  emxEnsureCapacity_uint8_T(c_this->Color, i);
  nrows = b_value->size[0] * b_value->size[1];
  for (i = 0; i < nrows; i++) {
    c_this->Color->data[i] = value_data[i];
  }
  emxFree_uint8_T(&b_value);
  i = c_this->Normal->size[0] * c_this->Normal->size[1];
  c_this->Normal->size[0] = varargin_5->size[0];
  c_this->Normal->size[1] = varargin_5->size[1];
  emxEnsureCapacity_real32_T(c_this->Normal, i);
  nrows = varargin_5->size[0] * varargin_5->size[1];
  for (i = 0; i < nrows; i++) {
    c_this->Normal->data[i] = varargin_5_data[i];
  }
  nrows = varargin_7->size[0];
  i = c_this->Intensity->size[0];
  c_this->Intensity->size[0] = varargin_7->size[0];
  emxEnsureCapacity_real32_T(c_this->Intensity, i);
  for (i = 0; i < nrows; i++) {
    c_this->Intensity->data[i] = varargin_7_data[i];
  }
  c_this->RangeData->size[0] = 0;
  c_this->RangeData->size[1] = 0;
  c_this->PointCloudArrayData->size[0] = 1;
  c_this->PointCloudArrayData->size[1] = 1;
  c_this->Kdtree = NULL;
  c_this->LocationHandle = NULL;
  c_this->matlabCodegenIsDeleted = false;
  return c_this;
}

/*
 * Arguments    : const b_pointCloud *b_this
 *                const emxArray_uint32_T *varargin_1
 *                pointCloud *iobj_0
 * Return Type  : pointCloud *
 */
pointCloud *pointCloud_select(const b_pointCloud *b_this,
                              const emxArray_uint32_T *varargin_1,
                              pointCloud *iobj_0)
{
  emxArray_real32_T *intensity;
  emxArray_real32_T *loc;
  emxArray_real32_T *nv;
  emxArray_real32_T *r;
  emxArray_uint8_T *c;
  pointCloud *ptCloudOut;
  float *loc_data;
  const unsigned int *varargin_1_data;
  int b_loop_ub;
  int i;
  int i1;
  int loop_ub;
  unsigned char *c_data;
  varargin_1_data = varargin_1->data;
  emxInit_real32_T(&loc, 2);
  loop_ub = varargin_1->size[0];
  i = loc->size[0] * loc->size[1];
  loc->size[0] = varargin_1->size[0];
  loc->size[1] = 3;
  emxEnsureCapacity_real32_T(loc, i);
  loc_data = loc->data;
  for (i = 0; i < 3; i++) {
    for (i1 = 0; i1 < loop_ub; i1++) {
      loc_data[i1 + loc->size[0] * i] =
          b_this->Location[((int)varargin_1_data[i1] + 57600 * i) - 1];
    }
  }
  emxInit_uint8_T(&c);
  if ((b_this->Color->size[0] != 0) && (b_this->Color->size[1] != 0)) {
    i = c->size[0] * c->size[1];
    c->size[0] = varargin_1->size[0];
    b_loop_ub = b_this->Color->size[1];
    c->size[1] = b_loop_ub;
    emxEnsureCapacity_uint8_T(c, i);
    c_data = c->data;
    for (i = 0; i < b_loop_ub; i++) {
      for (i1 = 0; i1 < loop_ub; i1++) {
        c_data[i1 + c->size[0] * i] =
            b_this->Color
                ->data[((int)varargin_1_data[i1] + b_this->Color->size[0] * i) -
                       1];
      }
    }
  } else {
    c->size[0] = 0;
    c->size[1] = 0;
  }
  emxInit_real32_T(&nv, 2);
  if ((b_this->Normal->size[0] != 0) && (b_this->Normal->size[1] != 0)) {
    i = nv->size[0] * nv->size[1];
    nv->size[0] = varargin_1->size[0];
    b_loop_ub = b_this->Normal->size[1];
    nv->size[1] = b_loop_ub;
    emxEnsureCapacity_real32_T(nv, i);
    loc_data = nv->data;
    for (i = 0; i < b_loop_ub; i++) {
      for (i1 = 0; i1 < loop_ub; i1++) {
        loc_data[i1 + nv->size[0] * i] =
            b_this->Normal->data[((int)varargin_1_data[i1] +
                                  b_this->Normal->size[0] * i) -
                                 1];
      }
    }
  } else {
    nv->size[0] = 0;
    nv->size[1] = 0;
  }
  emxInit_real32_T(&intensity, 1);
  if (b_this->Intensity->size[0] != 0) {
    i = intensity->size[0];
    intensity->size[0] = varargin_1->size[0];
    emxEnsureCapacity_real32_T(intensity, i);
    loc_data = intensity->data;
    for (i = 0; i < loop_ub; i++) {
      loc_data[i] = b_this->Intensity->data[(int)varargin_1_data[i] - 1];
    }
  } else {
    intensity->size[0] = 0;
  }
  emxInit_real32_T(&r, 2);
  loc_data = r->data;
  if ((b_this->RangeData->size[0] != 0) && (b_this->RangeData->size[1] != 0)) {
    i = r->size[0] * r->size[1];
    r->size[0] = varargin_1->size[0];
    b_loop_ub = b_this->RangeData->size[1];
    r->size[1] = b_loop_ub;
    emxEnsureCapacity_real32_T(r, i);
    loc_data = r->data;
    for (i = 0; i < b_loop_ub; i++) {
      for (i1 = 0; i1 < loop_ub; i1++) {
        loc_data[i1 + r->size[0] * i] =
            b_this->RangeData->data[((int)varargin_1_data[i1] +
                                     b_this->RangeData->size[0] * i) -
                                    1];
      }
    }
  } else {
    r->size[0] = 0;
    r->size[1] = 0;
  }
  ptCloudOut = pointCloud_pointCloud(iobj_0, loc, c, nv, intensity);
  emxFree_real32_T(&intensity);
  emxFree_real32_T(&nv);
  emxFree_uint8_T(&c);
  emxFree_real32_T(&loc);
  i = ptCloudOut->RangeData->size[0] * ptCloudOut->RangeData->size[1];
  ptCloudOut->RangeData->size[0] = r->size[0];
  ptCloudOut->RangeData->size[1] = r->size[1];
  emxEnsureCapacity_real32_T(ptCloudOut->RangeData, i);
  loop_ub = r->size[0] * r->size[1];
  for (i = 0; i < loop_ub; i++) {
    ptCloudOut->RangeData->data[i] = loc_data[i];
  }
  emxFree_real32_T(&r);
  return ptCloudOut;
}

/*
 * File trailer for pointCloud.c
 *
 * [EOF]
 */
