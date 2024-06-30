/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * pointCloudBase.c
 *
 * Code generation for function 'pointCloudBase'
 *
 */

/* Include files */
#include "pointCloudBase.h"
#include "preprocessing3_data.h"
#include "preprocessing3_types.h"
#include "rt_nonfinite.h"

/* Variable Definitions */
static emlrtRSInfo p_emlrtRSI = {
    149,                            /* lineNo */
    "pointCloudBase/set.RangeData", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

static emlrtRTEInfo n_emlrtRTEI = {
    814,                            /* lineNo */
    13,                             /* colNo */
    "pointCloudBase/validateRange", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

/* Function Definitions */
void pointCloudBase_set_RangeData(const emlrtStack *sp,
                                  const pointCloud *b_this,
                                  const emxArray_real32_T *b_value)
{
  emlrtStack st;
  st.prev = sp;
  st.tls = sp->tls;
  st.site = &p_emlrtRSI;
  if ((b_value->size[0] != 0) && (b_value->size[1] != 0)) {
    int32_T k;
    uint32_T varargin_1[2];
    uint32_T varargin_2[2];
    boolean_T exitg1;
    boolean_T p;
    varargin_1[0] = (uint32_T)b_value->size[0];
    varargin_2[0] = (uint32_T)b_this->Location->size[0];
    varargin_1[1] = (uint32_T)b_value->size[1];
    varargin_2[1] = 3U;
    p = true;
    k = 0;
    exitg1 = false;
    while ((!exitg1) && (k < 2)) {
      if ((int32_T)varargin_1[k] != (int32_T)varargin_2[k]) {
        p = false;
        exitg1 = true;
      } else {
        k++;
      }
    }
    if (!p) {
      emlrtErrorWithMessageIdR2018a(&st, &n_emlrtRTEI,
                                    "vision:pointcloud:unmatchedXYZRange",
                                    "vision:pointcloud:unmatchedXYZRange", 0);
    }
  }
}

/* End of code generation (pointCloudBase.c) */
