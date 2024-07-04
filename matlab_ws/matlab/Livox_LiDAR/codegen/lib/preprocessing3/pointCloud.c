/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: pointCloud.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 26-Jun-2024 14:35:29
 */

/* Include Files */
#include "pointCloud.h"
#include "preprocessing3_emxutil.h"
#include "preprocessing3_types.h"
#include "rt_nonfinite.h"

/* Function Definitions */
/*
 * Arguments    : const b_pointCloud *b_this
 *                const emxArray_boolean_T *varargin_1
 *                pointCloud *iobj_0
 * Return Type  : pointCloud *
 */
pointCloud *pointCloud_select(const b_pointCloud *b_this,
                              const emxArray_boolean_T *varargin_1,
                              pointCloud *iobj_0)
{
  emxArray_int32_T *ii;
  emxArray_real32_T *intensity;
  emxArray_real32_T *nv;
  emxArray_real32_T *tempIntens;
  emxArray_uint8_T *b_value;
  emxArray_uint8_T *c;
  pointCloud *ptCloudOut;
  float *intensity_data;
  float *nv_data;
  float *tempIntens_data;
  unsigned int numPoints[2];
  int emptyDimValue_idx_0;
  int i;
  int idx;
  int itilerow;
  int jcol;
  int k;
  int nrows;
  int nx;
  int *ii_data;
  unsigned char *c_data;
  unsigned char *value_data;
  const boolean_T *varargin_1_data;
  boolean_T exitg1;
  boolean_T p;
  varargin_1_data = varargin_1->data;
  nx = varargin_1->size[0] * varargin_1->size[1];
  idx = 0;
  emxInit_int32_T(&ii);
  i = ii->size[0];
  ii->size[0] = nx;
  emxEnsureCapacity_int32_T(ii, i);
  ii_data = ii->data;
  nrows = 0;
  exitg1 = false;
  while ((!exitg1) && (nrows <= nx - 1)) {
    if (varargin_1_data[nrows]) {
      idx++;
      ii_data[idx - 1] = nrows + 1;
      if (idx >= nx) {
        exitg1 = true;
      } else {
        nrows++;
      }
    } else {
      nrows++;
    }
  }
  if (nx == 1) {
    if (idx == 0) {
      ii->size[0] = 0;
    }
  } else {
    i = ii->size[0];
    if (idx < 1) {
      ii->size[0] = 0;
    } else {
      ii->size[0] = idx;
    }
    emxEnsureCapacity_int32_T(ii, i);
    ii_data = ii->data;
  }
  emxInit_uint8_T(&c, 2);
  c_data = c->data;
  if ((b_this->Color->size[0] != 0) && (b_this->Color->size[1] != 0) &&
      (b_this->Color->size[2] != 0)) {
    emptyDimValue_idx_0 =
        (int)((unsigned int)(b_this->Color->size[0] * b_this->Color->size[1] *
                             b_this->Color->size[2]) /
              3U);
    nrows = ii->size[0];
    i = c->size[0] * c->size[1];
    c->size[0] = ii->size[0];
    c->size[1] = 3;
    emxEnsureCapacity_uint8_T(c, i);
    c_data = c->data;
    for (i = 0; i < 3; i++) {
      for (nx = 0; nx < nrows; nx++) {
        c_data[nx + c->size[0] * i] =
            b_this->Color->data[(ii_data[nx] + emptyDimValue_idx_0 * i) - 1];
      }
    }
  } else {
    c->size[0] = 0;
    c->size[1] = 0;
  }
  emxInit_real32_T(&nv, 2);
  nv_data = nv->data;
  if ((b_this->Normal->size[0] != 0) && (b_this->Normal->size[1] != 0) &&
      (b_this->Normal->size[2] != 0)) {
    emptyDimValue_idx_0 =
        (int)((unsigned int)(b_this->Normal->size[0] * b_this->Normal->size[1] *
                             b_this->Normal->size[2]) /
              3U);
    nrows = ii->size[0];
    i = nv->size[0] * nv->size[1];
    nv->size[0] = ii->size[0];
    nv->size[1] = 3;
    emxEnsureCapacity_real32_T(nv, i);
    nv_data = nv->data;
    for (i = 0; i < 3; i++) {
      for (nx = 0; nx < nrows; nx++) {
        nv_data[nx + nv->size[0] * i] =
            b_this->Normal->data[(ii_data[nx] + emptyDimValue_idx_0 * i) - 1];
      }
    }
  } else {
    nv->size[0] = 0;
    nv->size[1] = 0;
  }
  emxInit_real32_T(&intensity, 2);
  intensity_data = intensity->data;
  if ((b_this->Intensity->size[0] != 0) && (b_this->Intensity->size[1] != 0)) {
    emxInit_real32_T(&tempIntens, 1);
    nrows = ii->size[0];
    i = tempIntens->size[0];
    tempIntens->size[0] = ii->size[0];
    emxEnsureCapacity_real32_T(tempIntens, i);
    tempIntens_data = tempIntens->data;
    for (i = 0; i < nrows; i++) {
      tempIntens_data[i] = b_this->Intensity->data[ii_data[i] - 1];
    }
    if (ii->size[0] == 1) {
      i = intensity->size[0] * intensity->size[1];
      intensity->size[0] = 1;
      intensity->size[1] = ii->size[0];
      emxEnsureCapacity_real32_T(intensity, i);
      intensity_data = intensity->data;
      for (i = 0; i < nrows; i++) {
        intensity_data[intensity->size[0] * i] = tempIntens_data[i];
      }
    } else {
      i = intensity->size[0] * intensity->size[1];
      intensity->size[0] = ii->size[0];
      intensity->size[1] = 1;
      emxEnsureCapacity_real32_T(intensity, i);
      intensity_data = intensity->data;
      for (i = 0; i < nrows; i++) {
        intensity_data[i] = tempIntens_data[i];
      }
    }
    emxFree_real32_T(&tempIntens);
  } else {
    intensity->size[0] = 0;
    intensity->size[1] = 0;
  }
  ptCloudOut = iobj_0;
  iobj_0->HasKdtreeConstructed = false;
  iobj_0->HasLocationHandleAllocated = false;
  nrows = ii->size[0];
  i = iobj_0->Location->size[0] * iobj_0->Location->size[1];
  iobj_0->Location->size[0] = ii->size[0];
  iobj_0->Location->size[1] = 3;
  emxEnsureCapacity_real32_T(iobj_0->Location, i);
  for (i = 0; i < 3; i++) {
    for (nx = 0; nx < nrows; nx++) {
      iobj_0->Location->data[nx + iobj_0->Location->size[0] * i] =
          b_this->Location[(ii_data[nx] + 57600 * i) - 1];
    }
  }
  emxFree_int32_T(&ii);
  emxInit_uint8_T(&b_value, 2);
  emptyDimValue_idx_0 = iobj_0->Location->size[0];
  numPoints[0] = (unsigned int)c->size[0];
  numPoints[1] = (unsigned int)c->size[1];
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
    i = c->size[0] * emptyDimValue_idx_0;
    nx = b_value->size[0] * b_value->size[1];
    b_value->size[0] = i;
    i1 = c->size[1];
    b_value->size[1] = c->size[1];
    emxEnsureCapacity_uint8_T(b_value, nx);
    value_data = b_value->data;
    nrows = c->size[0];
    for (jcol = 0; jcol < i1; jcol++) {
      nx = jcol * nrows;
      idx = jcol * i - 1;
      for (itilerow = 0; itilerow < emptyDimValue_idx_0; itilerow++) {
        int ibcol;
        ibcol = idx + itilerow * nrows;
        for (k = 0; k < nrows; k++) {
          value_data[(ibcol + k) + 1] = c_data[nx + k];
        }
      }
    }
  } else {
    i = b_value->size[0] * b_value->size[1];
    b_value->size[0] = c->size[0];
    b_value->size[1] = c->size[1];
    emxEnsureCapacity_uint8_T(b_value, i);
    value_data = b_value->data;
    nrows = c->size[0] * c->size[1];
    for (i = 0; i < nrows; i++) {
      value_data[i] = c_data[i];
    }
  }
  emxFree_uint8_T(&c);
  i = iobj_0->Color->size[0] * iobj_0->Color->size[1];
  iobj_0->Color->size[0] = b_value->size[0];
  iobj_0->Color->size[1] = b_value->size[1];
  emxEnsureCapacity_uint8_T(iobj_0->Color, i);
  nrows = b_value->size[0] * b_value->size[1];
  for (i = 0; i < nrows; i++) {
    iobj_0->Color->data[i] = value_data[i];
  }
  emxFree_uint8_T(&b_value);
  i = iobj_0->Normal->size[0] * iobj_0->Normal->size[1];
  iobj_0->Normal->size[0] = nv->size[0];
  iobj_0->Normal->size[1] = nv->size[1];
  emxEnsureCapacity_real32_T(iobj_0->Normal, i);
  nrows = nv->size[0] * nv->size[1];
  for (i = 0; i < nrows; i++) {
    iobj_0->Normal->data[i] = nv_data[i];
  }
  emxFree_real32_T(&nv);
  i = iobj_0->Intensity->size[0] * iobj_0->Intensity->size[1];
  iobj_0->Intensity->size[0] = intensity->size[0];
  iobj_0->Intensity->size[1] = intensity->size[1];
  emxEnsureCapacity_real32_T(iobj_0->Intensity, i);
  nrows = intensity->size[0] * intensity->size[1];
  for (i = 0; i < nrows; i++) {
    iobj_0->Intensity->data[i] = intensity_data[i];
  }
  emxFree_real32_T(&intensity);
  iobj_0->Kdtree = NULL;
  iobj_0->LocationHandle = NULL;
  iobj_0->matlabCodegenIsDeleted = false;
  return ptCloudOut;
}

/*
 * File trailer for pointCloud.c
 *
 * [EOF]
 */
