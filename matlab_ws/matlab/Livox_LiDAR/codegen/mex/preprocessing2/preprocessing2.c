/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * preprocessing2.c
 *
 * Code generation for function 'preprocessing2'
 *
 */

/* Include files */
#include "preprocessing2.h"
#include "handle.h"
#include "pcfitplane.h"
#include "pointCloud.h"
#include "preprocessing2_data.h"
#include "preprocessing2_emxutil.h"
#include "preprocessing2_types.h"
#include "rt_nonfinite.h"
#include <string.h>

/* Variable Definitions */
static emlrtRSInfo emlrtRSI = {
    3,                                                         /* lineNo */
    "preprocessing2",                                          /* fcnName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing2.m" /* pathName */
};

static emlrtRSInfo b_emlrtRSI = {
    12,                                                        /* lineNo */
    "preprocessing2",                                          /* fcnName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing2.m" /* pathName */
};

static emlrtRSInfo c_emlrtRSI = {
    14,                                                        /* lineNo */
    "preprocessing2",                                          /* fcnName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing2.m" /* pathName */
};

static emlrtRSInfo d_emlrtRSI = {
    16,                                                        /* lineNo */
    "preprocessing2",                                          /* fcnName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing2.m" /* pathName */
};

static emlrtRSInfo e_emlrtRSI = {
    21,                                                        /* lineNo */
    "preprocessing2",                                          /* fcnName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing2.m" /* pathName */
};

static emlrtRSInfo t_emlrtRSI = {
    1,                       /* lineNo */
    "dts_cast_with_warning", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/coder/float2fixed/dtslib/"
    "dts_cast_with_warning.p" /* pathName */
};

static emlrtRSInfo u_emlrtRSI = {
    1,                 /* lineNo */
    "is_whole_number", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/coder/float2fixed/dtslib/dts_cast.p" /* pathName
                                                                            */
};

static emlrtRSInfo lb_emlrtRSI = {
    1,          /* lineNo */
    "dts_cast", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/coder/float2fixed/dtslib/dts_cast.p" /* pathName
                                                                            */
};

static emlrtRTEInfo bb_emlrtRTEI = {
    1,          /* lineNo */
    1,          /* colNo */
    "dts_cast", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/coder/float2fixed/dtslib/dts_cast.p" /* pName
                                                                            */
};

static emlrtRTEInfo cb_emlrtRTEI = {
    18,                                                        /* lineNo */
    5,                                                         /* colNo */
    "preprocessing2",                                          /* fName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing2.m" /* pName */
};

static emlrtRTEInfo db_emlrtRTEI = {
    19,                                                        /* lineNo */
    5,                                                         /* colNo */
    "preprocessing2",                                          /* fName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing2.m" /* pName */
};

static emlrtRTEInfo eb_emlrtRTEI = {
    16,                                                        /* lineNo */
    5,                                                         /* colNo */
    "preprocessing2",                                          /* fName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing2.m" /* pName */
};

static emlrtRTEInfo fb_emlrtRTEI = {
    12,                                                        /* lineNo */
    5,                                                         /* colNo */
    "preprocessing2",                                          /* fName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing2.m" /* pName */
};

static emlrtRTEInfo gb_emlrtRTEI = {
    3,                                                         /* lineNo */
    5,                                                         /* colNo */
    "preprocessing2",                                          /* fName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing2.m" /* pName */
};

static emlrtRTEInfo hb_emlrtRTEI = {
    1,                                                         /* lineNo */
    31,                                                        /* colNo */
    "preprocessing2",                                          /* fName */
    "/home/aiv/YongJun_ws/matlab/Livox_LiDAR/preprocessing2.m" /* pName */
};

/* Function Definitions */
void preprocessing2(preprocessing2StackData *SD, const emlrtStack *sp,
                    const real32_T points[172800],
                    const real32_T intensity[57600], const real32_T ROI[6],
                    real32_T GroundMaxDistance,
                    const real32_T GroundReferenceVector[3],
                    real32_T GroundMaxAngularDistance,
                    emxArray_real32_T *Points, emxArray_real32_T *Intensity)
{
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack st;
  emxArray_real32_T *b_auto_gen_tmp_2;
  emxArray_real_T *auto_gen_tmp_1;
  emxArray_real_T *auto_gen_tmp_2;
  pointCloud ptCld;
  pointCloud ptCloud_roi;
  real_T *auto_gen_tmp_2_data;
  int32_T i;
  int32_T loop_ub;
  real32_T f;
  real32_T f1;
  real32_T f2;
  real32_T f3;
  real32_T f4;
  real32_T f5;
  real32_T *Points_data;
  boolean_T ptCloud_tmp[57600];
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  d_st.prev = &c_st;
  d_st.tls = c_st.tls;
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtConstCTX)sp);
  emxInitStruct_pointCloud(sp, &ptCld, &eb_emlrtRTEI);
  emxInitStruct_pointCloud(sp, &ptCloud_roi, &fb_emlrtRTEI);
  emxInitStruct_pointCloud1(sp, &SD->f0.ptCloud_tmp, &gb_emlrtRTEI);
  emxInit_real_T(sp, &auto_gen_tmp_1, &hb_emlrtRTEI);
  emxInit_real_T(sp, &auto_gen_tmp_2, &hb_emlrtRTEI);
  emxInit_real32_T(sp, &b_auto_gen_tmp_2, 1, &bb_emlrtRTEI);
  emlrtPushHeapReferenceStackR2021a((emlrtCTX)sp, true, &SD->f0.ptCloud_tmp,
                                    (void *)&handle_matlabCodegenDestructor,
                                    NULL, NULL, NULL);
  SD->f0.ptCloud_tmp.matlabCodegenIsDeleted = true;
  emlrtPushHeapReferenceStackR2021a((emlrtCTX)sp, true, &ptCld,
                                    (void *)&b_handle_matlabCodegenDestructo,
                                    NULL, NULL, NULL);
  ptCld.matlabCodegenIsDeleted = true;
  emlrtPushHeapReferenceStackR2021a((emlrtCTX)sp, true, &ptCloud_roi,
                                    (void *)&b_handle_matlabCodegenDestructo,
                                    NULL, NULL, NULL);
  ptCloud_roi.matlabCodegenIsDeleted = true;
  covrtLogFcn(&emlrtCoverageInstance, 0U, 0U);
  covrtLogBasicBlock(&emlrtCoverageInstance, 0U, 0U);
  st.site = &emlrtRSI;
  b_st.site = &emlrtRSI;
  SD->f0.ptCloud_tmp.HasKdtreeConstructed = false;
  SD->f0.ptCloud_tmp.HasLocationHandleAllocated = false;
  c_st.site = &f_emlrtRSI;
  SD->f0.ptCloud_tmp.Color->size[0] = 0;
  SD->f0.ptCloud_tmp.Color->size[1] = 0;
  memcpy(&SD->f0.ptCloud_tmp.Location[0], &points[0],
         172800U * sizeof(real32_T));
  SD->f0.ptCloud_tmp.Normal->size[0] = 0;
  SD->f0.ptCloud_tmp.Normal->size[1] = 0;
  d_st.site = &l_emlrtRSI;
  i = SD->f0.ptCloud_tmp.Intensity->size[0];
  SD->f0.ptCloud_tmp.Intensity->size[0] = 57600;
  emxEnsureCapacity_real32_T(&d_st, SD->f0.ptCloud_tmp.Intensity, i,
                             &ab_emlrtRTEI);
  for (i = 0; i < 57600; i++) {
    SD->f0.ptCloud_tmp.Intensity->data[i] = intensity[i];
  }
  SD->f0.ptCloud_tmp.RangeData->size[0] = 0;
  SD->f0.ptCloud_tmp.RangeData->size[1] = 0;
  c_st.site = &g_emlrtRSI;
  SD->f0.ptCloud_tmp.PointCloudArrayData->size[0] = 1;
  SD->f0.ptCloud_tmp.PointCloudArrayData->size[1] = 1;
  c_st.site = &h_emlrtRSI;
  SD->f0.ptCloud_tmp.Kdtree = NULL;
  SD->f0.ptCloud_tmp.LocationHandle = NULL;
  SD->f0.ptCloud_tmp.matlabCodegenIsDeleted = false;
  b_st.site = &t_emlrtRSI;
  c_st.site = &u_emlrtRSI;
  st.site = &b_emlrtRSI;
  f = ROI[1];
  f1 = ROI[0];
  f2 = ROI[3];
  f3 = ROI[2];
  f4 = ROI[5];
  f5 = ROI[4];
  for (i = 0; i < 57600; i++) {
    real32_T b_ptCloud_tmp_tmp;
    real32_T ptCloud_tmp_tmp;
    ptCloud_tmp_tmp = SD->f0.ptCloud_tmp.Location[i + 57600];
    b_ptCloud_tmp_tmp = SD->f0.ptCloud_tmp.Location[i + 115200];
    ptCloud_tmp[i] = ((SD->f0.ptCloud_tmp.Location[i] < f) &&
                      (SD->f0.ptCloud_tmp.Location[i] > f1) &&
                      ((ptCloud_tmp_tmp < f2) && (ptCloud_tmp_tmp > f3)) &&
                      ((b_ptCloud_tmp_tmp < f4) && (b_ptCloud_tmp_tmp > f5)));
  }
  b_st.site = &b_emlrtRSI;
  pointCloud_select(&b_st, &SD->f0.ptCloud_tmp, ptCloud_tmp, &ptCloud_roi);
  b_st.site = &t_emlrtRSI;
  c_st.site = &lb_emlrtRSI;
  st.site = &c_emlrtRSI;
  pcfitplane(&st, &ptCloud_roi, GroundMaxDistance, GroundReferenceVector,
             GroundMaxAngularDistance, auto_gen_tmp_1, auto_gen_tmp_2);
  auto_gen_tmp_2_data = auto_gen_tmp_2->data;
  st.site = &c_emlrtRSI;
  b_st.site = &t_emlrtRSI;
  c_st.site = &lb_emlrtRSI;
  st.site = &d_emlrtRSI;
  loop_ub = auto_gen_tmp_2->size[0];
  i = b_auto_gen_tmp_2->size[0];
  b_auto_gen_tmp_2->size[0] = auto_gen_tmp_2->size[0];
  emxEnsureCapacity_real32_T(&st, b_auto_gen_tmp_2, i, &bb_emlrtRTEI);
  Points_data = b_auto_gen_tmp_2->data;
  for (i = 0; i < loop_ub; i++) {
    Points_data[i] = (real32_T)auto_gen_tmp_2_data[i];
  }
  b_st.site = &d_emlrtRSI;
  b_pointCloud_select(&b_st, &ptCloud_roi, b_auto_gen_tmp_2, &ptCld);
  b_st.site = &t_emlrtRSI;
  c_st.site = &lb_emlrtRSI;
  i = Points->size[0] * Points->size[1];
  Points->size[0] = ptCld.Location->size[0];
  Points->size[1] = 3;
  emxEnsureCapacity_real32_T(sp, Points, i, &cb_emlrtRTEI);
  Points_data = Points->data;
  loop_ub = ptCld.Location->size[0] * 3;
  for (i = 0; i < loop_ub; i++) {
    Points_data[i] = ptCld.Location->data[i];
  }
  loop_ub = ptCld.Intensity->size[0];
  i = Intensity->size[0];
  Intensity->size[0] = loop_ub;
  emxEnsureCapacity_real32_T(sp, Intensity, i, &db_emlrtRTEI);
  Points_data = Intensity->data;
  for (i = 0; i < loop_ub; i++) {
    Points_data[i] = ptCld.Intensity->data[i];
  }
  st.site = &e_emlrtRSI;
  b_handle_matlabCodegenDestructo(&st, &ptCloud_roi);
  st.site = &e_emlrtRSI;
  b_handle_matlabCodegenDestructo(&st, &ptCld);
  st.site = &e_emlrtRSI;
  handle_matlabCodegenDestructor(&st, &SD->f0.ptCloud_tmp);
  emxFree_real32_T(sp, &b_auto_gen_tmp_2);
  emxFree_real_T(sp, &auto_gen_tmp_2);
  emxFree_real_T(sp, &auto_gen_tmp_1);
  emxFreeStruct_pointCloud1(sp, &SD->f0.ptCloud_tmp);
  emxFreeStruct_pointCloud(sp, &ptCloud_roi);
  emxFreeStruct_pointCloud(sp, &ptCld);
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtConstCTX)sp);
}

/* End of code generation (preprocessing2.c) */
