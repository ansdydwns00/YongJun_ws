/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * preprocessing3.c
 *
 * Code generation for function 'preprocessing3'
 *
 */

/* Include files */
#include "preprocessing3.h"
#include "convertFromCartesianToSphericalCoordinate.h"
#include "handle.h"
#include "pointCloud.h"
#include "preprocessing3_data.h"
#include "preprocessing3_emxutil.h"
#include "preprocessing3_types.h"
#include "rt_nonfinite.h"
#include "labelRangeDataGroundRemovalUtilsCore_api.hpp"
#include <string.h>

/* Variable Definitions */
static emlrtRSInfo emlrtRSI = {
    6,                                                         /* lineNo */
    "preprocessing3",                                          /* fcnName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing3.m" /* pathName */
};

static emlrtRSInfo b_emlrtRSI = {
    13,                                                        /* lineNo */
    "preprocessing3",                                          /* fcnName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing3.m" /* pathName */
};

static emlrtRSInfo c_emlrtRSI = {
    14,                                                        /* lineNo */
    "preprocessing3",                                          /* fcnName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing3.m" /* pathName */
};

static emlrtRSInfo d_emlrtRSI = {
    19,                                                        /* lineNo */
    "preprocessing3",                                          /* fcnName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing3.m" /* pathName */
};

static emlrtRSInfo f_emlrtRSI = {
    34,                      /* lineNo */
    "pointCloud/pointCloud", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

static emlrtRSInfo q_emlrtRSI = {
    1,                       /* lineNo */
    "dts_cast_with_warning", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/coder/float2fixed/dtslib/"
    "dts_cast_with_warning.p" /* pathName */
};

static emlrtRSInfo r_emlrtRSI = {
    1,          /* lineNo */
    "dts_cast", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/coder/float2fixed/dtslib/dts_cast.p" /* pathName
                                                                            */
};

static emlrtRSInfo s_emlrtRSI = {
    7,                            /* lineNo */
    "segmentGroundFromLidarData", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/"
    "segmentGroundFromLidarData.m" /* pathName */
};

static emlrtRSInfo t_emlrtRSI = {
    21,                           /* lineNo */
    "segmentGroundFromLidarData", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/"
    "segmentGroundFromLidarData.m" /* pathName */
};

static emlrtRSInfo u_emlrtRSI = {
    35,                           /* lineNo */
    "segmentGroundFromLidarData", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/"
    "segmentGroundFromLidarData.m" /* pathName */
};

static emlrtRTEInfo emlrtRTEI = {
    14,               /* lineNo */
    37,               /* colNo */
    "validatescalar", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/+valattr/"
    "validatescalar.m" /* pName */
};

static emlrtRTEInfo q_emlrtRTEI = {
    149,              /* lineNo */
    13,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

static emlrtRTEInfo r_emlrtRTEI = {
    36,                           /* lineNo */
    37,                           /* colNo */
    "segmentGroundFromLidarData", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/vision/vision/"
    "segmentGroundFromLidarData.m" /* pName */
};

static emlrtRTEInfo s_emlrtRTEI = {
    13,                                                        /* lineNo */
    17,                                                        /* colNo */
    "preprocessing3",                                          /* fName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing3.m" /* pName */
};

static emlrtRTEInfo t_emlrtRTEI = {
    14,                                                        /* lineNo */
    32,                                                        /* colNo */
    "preprocessing3",                                          /* fName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing3.m" /* pName */
};

static emlrtRTEInfo u_emlrtRTEI = {
    16,                                                        /* lineNo */
    5,                                                         /* colNo */
    "preprocessing3",                                          /* fName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing3.m" /* pName */
};

static emlrtRTEInfo v_emlrtRTEI = {
    17,                                                        /* lineNo */
    5,                                                         /* colNo */
    "preprocessing3",                                          /* fName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing3.m" /* pName */
};

static emlrtRTEInfo w_emlrtRTEI = {
    14,                                                        /* lineNo */
    5,                                                         /* colNo */
    "preprocessing3",                                          /* fName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing3.m" /* pName */
};

static emlrtRTEInfo x_emlrtRTEI = {
    6,                                                         /* lineNo */
    5,                                                         /* colNo */
    "preprocessing3",                                          /* fName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing3.m" /* pName */
};

static emlrtRTEInfo y_emlrtRTEI = {
    13,                                                        /* lineNo */
    5,                                                         /* colNo */
    "preprocessing3",                                          /* fName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing3.m" /* pName */
};

/* Function Definitions */
void preprocessing3(preprocessing3StackData *SD, const emlrtStack *sp,
                    const real32_T points[172800],
                    const real32_T intensity[57600], emxArray_real32_T *Points,
                    emxArray_real32_T *Intensity)
{
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack st;
  emxArray_boolean_T *b_groundIdx;
  emxArray_boolean_T *groundIdx;
  emxArray_real32_T *rangeData;
  pointCloud ptCld;
  int32_T i;
  int32_T i1;
  int32_T i2;
  int32_T loop_ub;
  int32_T loop_ub_tmp;
  real32_T *Points_data;
  boolean_T b;
  boolean_T b1;
  boolean_T n;
  boolean_T *b_groundIdx_data;
  boolean_T *groundIdx_data;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  d_st.prev = &c_st;
  d_st.tls = c_st.tls;
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtConstCTX)sp);
  emxInitStruct_pointCloud(sp, &ptCld, &w_emlrtRTEI);
  emxInitStruct_pointCloud1(sp, &SD->f1.ptCloud_tmp, &x_emlrtRTEI);
  emxInit_boolean_T(sp, &groundIdx, &y_emlrtRTEI);
  emxInit_real32_T(sp, &rangeData, 3, &r_emlrtRTEI);
  emxInit_boolean_T(sp, &b_groundIdx, &t_emlrtRTEI);
  emlrtPushHeapReferenceStackR2021a((emlrtCTX)sp, true, &SD->f1.ptCloud_tmp,
                                    (void *)&handle_matlabCodegenDestructor,
                                    NULL, NULL, NULL);
  SD->f1.ptCloud_tmp.matlabCodegenIsDeleted = true;
  emlrtPushHeapReferenceStackR2021a((emlrtCTX)sp, true, &ptCld,
                                    (void *)&b_handle_matlabCodegenDestructo,
                                    NULL, NULL, NULL);
  ptCld.matlabCodegenIsDeleted = true;
  covrtLogFcn(&emlrtCoverageInstance, 0U, 0U);
  covrtLogBasicBlock(&emlrtCoverageInstance, 0U, 0U);
  st.site = &emlrtRSI;
  b_st.site = &emlrtRSI;
  SD->f1.ptCloud_tmp.HasKdtreeConstructed = false;
  SD->f1.ptCloud_tmp.HasLocationHandleAllocated = false;
  c_st.site = &e_emlrtRSI;
  memcpy(&SD->f1.ptCloud_tmp.Location[0], &points[0],
         172800U * sizeof(real32_T));
  SD->f1.ptCloud_tmp.Color->size[0] = 0;
  SD->f1.ptCloud_tmp.Color->size[1] = 0;
  SD->f1.ptCloud_tmp.Color->size[2] = 0;
  SD->f1.ptCloud_tmp.Normal->size[0] = 0;
  SD->f1.ptCloud_tmp.Normal->size[1] = 0;
  SD->f1.ptCloud_tmp.Normal->size[2] = 0;
  d_st.site = &k_emlrtRSI;
  i = SD->f1.ptCloud_tmp.Intensity->size[0] *
      SD->f1.ptCloud_tmp.Intensity->size[1];
  SD->f1.ptCloud_tmp.Intensity->size[0] = 32;
  SD->f1.ptCloud_tmp.Intensity->size[1] = 1800;
  emxEnsureCapacity_real32_T(&d_st, SD->f1.ptCloud_tmp.Intensity, i,
                             &p_emlrtRTEI);
  for (i = 0; i < 57600; i++) {
    SD->f1.ptCloud_tmp.Intensity->data[i] = intensity[i];
  }
  SD->f1.ptCloud_tmp.RangeData->size[0] = 0;
  SD->f1.ptCloud_tmp.RangeData->size[1] = 0;
  SD->f1.ptCloud_tmp.RangeData->size[2] = 0;
  c_st.site = &f_emlrtRSI;
  SD->f1.ptCloud_tmp.PointCloudArrayData->size[0] = 1;
  SD->f1.ptCloud_tmp.PointCloudArrayData->size[1] = 1;
  c_st.site = &g_emlrtRSI;
  SD->f1.ptCloud_tmp.Kdtree = NULL;
  SD->f1.ptCloud_tmp.LocationHandle = NULL;
  SD->f1.ptCloud_tmp.matlabCodegenIsDeleted = false;
  b_st.site = &q_emlrtRSI;
  c_st.site = &r_emlrtRSI;
  /*  indices = findPointsInROI(ptCloud_tmp,ROI); */
  /*  ptCloud_roi = select(ptCloud_tmp,indices); */
  st.site = &b_emlrtRSI;
  b_st.site = &s_emlrtRSI;
  c_st.site = &v_emlrtRSI;
  n = (SD->f1.ptCloud_tmp.PointCloudArrayData->size[0] *
           SD->f1.ptCloud_tmp.PointCloudArrayData->size[1] ==
       1);
  if (!n) {
    emlrtErrorWithMessageIdR2018a(
        &c_st, &emlrtRTEI, "Coder:toolbox:ValidateattributesexpectedScalar",
        "MATLAB:segmentGroundFromLidarData:expectedScalar", 3, 4, 7, "ptCloud");
  }
  n = (SD->f1.ptCloud_tmp.RangeData->size[0] == 0);
  b = (SD->f1.ptCloud_tmp.RangeData->size[1] == 0);
  b1 = (SD->f1.ptCloud_tmp.RangeData->size[2] == 0);
  if (n || b || b1) {
    b_st.site = &t_emlrtRSI;
    c_st.site = &t_emlrtRSI;
    c_convertFromCartesianToSpheric(SD, &c_st, SD->f1.ptCloud_tmp.Location,
                                    SD->f1.value);
    i = SD->f1.ptCloud_tmp.RangeData->size[0] *
        SD->f1.ptCloud_tmp.RangeData->size[1] *
        SD->f1.ptCloud_tmp.RangeData->size[2];
    SD->f1.ptCloud_tmp.RangeData->size[0] = 32;
    SD->f1.ptCloud_tmp.RangeData->size[1] = 1800;
    SD->f1.ptCloud_tmp.RangeData->size[2] = 3;
    emxEnsureCapacity_real32_T(&b_st, SD->f1.ptCloud_tmp.RangeData, i,
                               &q_emlrtRTEI);
    for (i = 0; i < 172800; i++) {
      SD->f1.ptCloud_tmp.RangeData->data[i] = SD->f1.value[i];
    }
  }
  b_st.site = &u_emlrtRSI;
  i = SD->f1.ptCloud_tmp.RangeData->size[0];
  i1 = rangeData->size[0] * rangeData->size[1] * rangeData->size[2];
  rangeData->size[0] = i;
  i2 = SD->f1.ptCloud_tmp.RangeData->size[1];
  rangeData->size[1] = i2;
  rangeData->size[2] = SD->f1.ptCloud_tmp.RangeData->size[2];
  emxEnsureCapacity_real32_T(&b_st, rangeData, i1, &r_emlrtRTEI);
  Points_data = rangeData->data;
  loop_ub_tmp = SD->f1.ptCloud_tmp.RangeData->size[0] *
                SD->f1.ptCloud_tmp.RangeData->size[1];
  loop_ub = loop_ub_tmp * SD->f1.ptCloud_tmp.RangeData->size[2];
  for (i1 = 0; i1 < loop_ub; i1++) {
    Points_data[i1] = SD->f1.ptCloud_tmp.RangeData->data[i1];
  }
  i1 = groundIdx->size[0] * groundIdx->size[1];
  groundIdx->size[0] = i;
  groundIdx->size[1] = i2;
  emxEnsureCapacity_boolean_T(&b_st, groundIdx, i1, &s_emlrtRTEI);
  groundIdx_data = groundIdx->data;
  for (i = 0; i < loop_ub_tmp; i++) {
    groundIdx_data[i] = false;
  }
  preprocessAndSegmentGround_single(&Points_data[0], rangeData->size[0],
                                    rangeData->size[1], &groundIdx_data[0],
                                    0.52359879F, 0.34906587F, 1.0F);
  st.site = &c_emlrtRSI;
  i = b_groundIdx->size[0] * b_groundIdx->size[1];
  b_groundIdx->size[0] = groundIdx->size[0];
  b_groundIdx->size[1] = groundIdx->size[1];
  emxEnsureCapacity_boolean_T(&st, b_groundIdx, i, &t_emlrtRTEI);
  b_groundIdx_data = b_groundIdx->data;
  loop_ub = groundIdx->size[0] * groundIdx->size[1];
  for (i = 0; i < loop_ub; i++) {
    b_groundIdx_data[i] = !groundIdx_data[i];
  }
  b_st.site = &c_emlrtRSI;
  pointCloud_select(&b_st, &SD->f1.ptCloud_tmp, b_groundIdx, &ptCld);
  b_st.site = &q_emlrtRSI;
  c_st.site = &r_emlrtRSI;
  i = Points->size[0] * Points->size[1];
  Points->size[0] = ptCld.Location->size[0];
  Points->size[1] = 3;
  emxEnsureCapacity_real32_T(sp, Points, i, &u_emlrtRTEI);
  Points_data = Points->data;
  loop_ub = ptCld.Location->size[0] * 3;
  for (i = 0; i < loop_ub; i++) {
    Points_data[i] = ptCld.Location->data[i];
  }
  i = Intensity->size[0] * Intensity->size[1];
  Intensity->size[0] = ptCld.Intensity->size[0];
  Intensity->size[1] = ptCld.Intensity->size[1];
  emxEnsureCapacity_real32_T(sp, Intensity, i, &v_emlrtRTEI);
  Points_data = Intensity->data;
  loop_ub = ptCld.Intensity->size[0] * ptCld.Intensity->size[1];
  for (i = 0; i < loop_ub; i++) {
    Points_data[i] = ptCld.Intensity->data[i];
  }
  st.site = &d_emlrtRSI;
  b_handle_matlabCodegenDestructo(&st, &ptCld);
  st.site = &d_emlrtRSI;
  handle_matlabCodegenDestructor(&st, &SD->f1.ptCloud_tmp);
  emxFree_boolean_T(sp, &b_groundIdx);
  emxFree_real32_T(sp, &rangeData);
  emxFree_boolean_T(sp, &groundIdx);
  emxFreeStruct_pointCloud1(sp, &SD->f1.ptCloud_tmp);
  emxFreeStruct_pointCloud(sp, &ptCld);
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtConstCTX)sp);
}

/* End of code generation (preprocessing3.c) */
