//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// pointpillardetect.cu
//
// Code generation for function 'pointpillardetect'
//

// Include files
#include "pointpillardetect.h"
#include "PointCloudImpl.h"
#include "dlnetwork.h"
#include "handle.h"
#include "pointPillarsObjectDetector.h"
#include "pointpillardetect_data.h"
#include "pointpillardetect_emxutil.h"
#include "pointpillardetect_internal_types.h"
#include "pointpillardetect_mexutil.h"
#include "pointpillardetect_types.h"
#include "predict.h"
#include "rt_nonfinite.h"
#include "selectStrongestBboxMulticlass.h"
#include "MWCudaDimUtility.hpp"
#include "MWCudaMemoryFunctions.hpp"
#include "MWCudnnCustomLayerBase.hpp"
#include "MWCudnnTargetNetworkImpl.hpp"
#include "MWLaunchParametersUtilities.hpp"
#include "MWScanFunctors.h"
#include "MWScanUtility.h"
#include "MWShuffleUtility.h"
#include "MWSortFunctors.h"
#include "MWSortWithIndexUtility.h"
#include "MWTensorBase.hpp"
#include "createPillars.hpp"
#include <cmath>
#include <cstring>

// Type Definitions
struct cell_wrap_5 {
  real_T f1[10];
};

// Variable Definitions
static pretrained0_0 gobj_0;

static coder::internal::pointPillarsObjectDetector pointPillarObj;

static boolean_T pointPillarObj_not_empty;

static emlrtMCInfo emlrtMCI{
    57,                                                              // lineNo
    5,                                                               // colNo
    "repmat",                                                        // fName
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repmat.m" // pName
};

static emlrtRTEInfo emlrtRTEI{
    6,                   // lineNo
    12,                  // colNo
    "pointpillardetect", // fName
    "/home/user/ros2_ws/src/YongJun_ws/matlab/AutoL_LiDAR_ROS/"
    "pointpillardetect.m" // pName
};

static emlrtRTEInfo b_emlrtRTEI{
    85,               // lineNo
    13,               // colNo
    "pointCloudBase", // fName
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" // pName
};

static emlrtRTEInfo c_emlrtRTEI{
    144,              // lineNo
    13,               // colNo
    "pointCloudBase", // fName
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" // pName
};

static emlrtRTEInfo d_emlrtRTEI{
    11,                          // lineNo
    15,                          // colNo
    "createAnchorsPointPillars", // fName
    "/usr/local/MATLAB/R2024a/toolbox/lidar/lidar/+lidar/+internal/+cnn/"
    "createAnchorsPointPillars.m" // pName
};

static emlrtRTEInfo e_emlrtRTEI{
    11,                          // lineNo
    5,                           // colNo
    "createAnchorsPointPillars", // fName
    "/usr/local/MATLAB/R2024a/toolbox/lidar/lidar/+lidar/+internal/+cnn/"
    "createAnchorsPointPillars.m" // pName
};

static emlrtRTEInfo f_emlrtRTEI{
    107,                                                              // lineNo
    20,                                                               // colNo
    "repelem",                                                        // fName
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repelem.m" // pName
};

static emlrtRTEInfo g_emlrtRTEI{
    28,                          // lineNo
    1,                           // colNo
    "createAnchorsPointPillars", // fName
    "/usr/local/MATLAB/R2024a/toolbox/lidar/lidar/+lidar/+internal/+cnn/"
    "createAnchorsPointPillars.m" // pName
};

static emlrtRTEInfo h_emlrtRTEI{
    134,              // lineNo
    13,               // colNo
    "pointCloudBase", // fName
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" // pName
};

static emlrtRTEInfo i_emlrtRTEI{
    139,              // lineNo
    12,               // colNo
    "pointCloudBase", // fName
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" // pName
};

static emlrtRTEInfo j_emlrtRTEI{
    69,                                                              // lineNo
    28,                                                              // colNo
    "repmat",                                                        // fName
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repmat.m" // pName
};

static emlrtRTEInfo k_emlrtRTEI{
    770,              // lineNo
    17,               // colNo
    "pointCloudBase", // fName
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" // pName
};

static emlrtRTEInfo l_emlrtRTEI{
    36,                          // lineNo
    1,                           // colNo
    "createAnchorsPointPillars", // fName
    "/usr/local/MATLAB/R2024a/toolbox/lidar/lidar/+lidar/+internal/+cnn/"
    "createAnchorsPointPillars.m" // pName
};

static emlrtRTEInfo m_emlrtRTEI{
    1,                            // lineNo
    1,                            // colNo
    "pointPillarsObjectDetector", // fName
    "/home/user/Documents/MATLAB/SupportPackages/R2024a/toolbox/shared/"
    "dlcoder_base/supportpackages/shared_dl_targets/+coder/+interna"
    "l/pointPillarsObjectDetector.p" // pName
};

static emlrtRTEInfo n_emlrtRTEI{
    37,                          // lineNo
    1,                           // colNo
    "createAnchorsPointPillars", // fName
    "/usr/local/MATLAB/R2024a/toolbox/lidar/lidar/+lidar/+internal/+cnn/"
    "createAnchorsPointPillars.m" // pName
};

static emlrtRTEInfo o_emlrtRTEI{
    38,                          // lineNo
    1,                           // colNo
    "createAnchorsPointPillars", // fName
    "/usr/local/MATLAB/R2024a/toolbox/lidar/lidar/+lidar/+internal/+cnn/"
    "createAnchorsPointPillars.m" // pName
};

static emlrtRTEInfo p_emlrtRTEI{
    105,                                                          // lineNo
    24,                                                           // colNo
    "cat",                                                        // fName
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/cat.m" // pName
};

static emlrtRTEInfo q_emlrtRTEI{
    60,                                                               // lineNo
    20,                                                               // colNo
    "permute",                                                        // fName
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/permute.m" // pName
};

static emlrtRTEInfo r_emlrtRTEI{
    1,                   // lineNo
    35,                  // colNo
    "pointpillardetect", // fName
    "/home/user/ros2_ws/src/YongJun_ws/matlab/AutoL_LiDAR_ROS/"
    "pointpillardetect.m" // pName
};

static emlrtRTEInfo s_emlrtRTEI{
    12,                  // lineNo
    1,                   // colNo
    "pointpillardetect", // fName
    "/home/user/ros2_ws/src/YongJun_ws/matlab/AutoL_LiDAR_ROS/"
    "pointpillardetect.m" // pName
};

static emlrtRTEInfo t_emlrtRTEI{
    9,                           // lineNo
    1,                           // colNo
    "createAnchorsPointPillars", // fName
    "/usr/local/MATLAB/R2024a/toolbox/lidar/lidar/+lidar/+internal/+cnn/"
    "createAnchorsPointPillars.m" // pName
};

static emlrtRTEInfo u_emlrtRTEI{
    25,                          // lineNo
    1,                           // colNo
    "createAnchorsPointPillars", // fName
    "/usr/local/MATLAB/R2024a/toolbox/lidar/lidar/+lidar/+internal/+cnn/"
    "createAnchorsPointPillars.m" // pName
};

static emlrtRTEInfo v_emlrtRTEI{
    35,                          // lineNo
    1,                           // colNo
    "createAnchorsPointPillars", // fName
    "/usr/local/MATLAB/R2024a/toolbox/lidar/lidar/+lidar/+internal/+cnn/"
    "createAnchorsPointPillars.m" // pName
};

static emlrtRTEInfo w_emlrtRTEI{
    30,                          // lineNo
    1,                           // colNo
    "createAnchorsPointPillars", // fName
    "/usr/local/MATLAB/R2024a/toolbox/lidar/lidar/+lidar/+internal/+cnn/"
    "createAnchorsPointPillars.m" // pName
};

static emlrtRTEInfo x_emlrtRTEI{
    770,              // lineNo
    25,               // colNo
    "pointCloudBase", // fName
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" // pName
};

static boolean_T c_gpuConstsCopied_pointpillarde;

// Function Declarations
static void b_error(const mxArray *m, emlrtMCInfo *location);

static uint64_T computeNumIters(int32_T ub, int32_T b_ub, int32_T c_ub);

static int32_T div_s32(int32_T numerator, int32_T denominator);

static
#ifdef __CUDACC__
    __device__
#endif
        int32_T
        div_s32_device(int32_T numerator, int32_T denominator);

static void gpuEmxFree_boolean_T(emxArray_boolean_T *gpu);

static void gpuEmxMemcpyGpuToCpu_boolean_T(emxArray_boolean_T *cpu,
                                           emxArray_boolean_T *gpu);

static void gpuEmxMemcpyGpuToCpu_real32_T(emxArray_real32_T *cpu,
                                          emxArray_real32_T *gpu);

static void gpuEmxMemcpyGpuToCpu_uint8_T(emxArray_uint8_T *cpu,
                                         emxArray_uint8_T *gpu);

static void gpuEmxReset_boolean_T(emxArray_boolean_T *gpu);

static __global__ void pointpillardetect_kernel1(
    cell_wrap_5 *r1, cell_wrap_5 *r, real_T dv1_dim0, real_T dv1_dim1,
    real_T dv1_dim2, real_T dv1_dim3, real_T dv1_dim4, real_T dv1_dim5,
    real_T dv1_dim6, real_T dv1_dim7, real_T dv1_dim8, real_T dv1_dim9,
    real_T dv_dim0, real_T dv_dim1, real_T dv_dim2, real_T dv_dim3,
    real_T dv_dim4, real_T dv_dim5, real_T dv_dim6, real_T dv_dim7,
    real_T dv_dim8, real_T dv_dim9);

static __global__ void
pointpillardetect_kernel10(const emxArray_real_T anchorsDim, const int32_T b,
                           emxArray_real_T anchors3dMod,
                           int32_T anchors3dMod_dim0, int32_T anchorsDim_dim0);

static __global__ void pointpillardetect_kernel11(
    const emxArray_real_T anchors3dMod, const int32_T rowreps, const int32_T i,
    const int32_T sizes, emxArray_real_T b_anchors3dMod,
    int32_T anchors3dMod_dim0, int32_T b_anchors3dMod_dim0);

static __global__ void pointpillardetect_kernel12(
    const emxArray_real_T anchors3dMod, const int32_T ibcol,
    const int32_T rowIdx, const int32_T b_anchors3dMod,
    emxArray_real_T c_anchors3dMod, int32_T anchors3dMod_dim0,
    int32_T b_anchors3dMod_dim0);

static __global__ void
pointpillardetect_kernel13(const emxArray_real_T anchors3dMod,
                           const int32_T b_anchors3dMod, emxArray_real_T tmp2,
                           emxArray_real_T tmp1, int32_T tmp1_dim0,
                           int32_T anchors3dMod_dim0, int32_T tmp2_dim0);

static __global__ void pointpillardetect_kernel14(const emxArray_uint8_T b,
                                                  const int32_T b_b,
                                                  emxArray_uint8_T b_value);

static __global__ void
pointpillardetect_kernel15(real32_T pillarIndices[24000]);

static __global__ void
pointpillardetect_kernel16(real32_T dlPillarFeatures_Data[10800000]);

static __global__ void pointpillardetect_kernel17(
    cell_wrap_5 *r1, cell_wrap_5 *r, real_T dv1_dim0, real_T dv1_dim1,
    real_T dv1_dim2, real_T dv1_dim3, real_T dv1_dim4, real_T dv1_dim5,
    real_T dv1_dim6, real_T dv1_dim7, real_T dv1_dim8, real_T dv1_dim9,
    real_T dv_dim0, real_T dv_dim1, real_T dv_dim2, real_T dv_dim3,
    real_T dv_dim4, real_T dv_dim5, real_T dv_dim6, real_T dv_dim7,
    real_T dv_dim8, real_T dv_dim9);

static __global__ void
pointpillardetect_kernel18(real_T sparseVoxelMap[214272]);

static __global__ void
pointpillardetect_kernel19(const real32_T pillarIndices[24000], const int32_T b,
                           int32_T iv2_data[12000]);

static __global__ void pointpillardetect_kernel2(const emxArray_real_T anchors,
                                                 const int32_T b_anchors,
                                                 emxArray_real_T c_anchors,
                                                 int32_T anchors_dim0,
                                                 int32_T b_anchors_dim0);

static __global__ void
pointpillardetect_kernel20(const int32_T iv2_data[12000], const int32_T b,
                           real_T sparseVoxelMap[214272]);

static __global__ void
pointpillardetect_kernel21(const emxArray_real_T anchorMask,
                           const int32_T b_anchorMask,
                           emxArray_boolean_T c_anchorMask);

static __global__ void
pointpillardetect_kernel22(const emxArray_real_T anchorMask, const int32_T b,
                           emxArray_boolean_T b_anchorMask);

static __global__ void
pointpillardetect_kernel23(const emxArray_boolean_T anchorMask,
                           const int32_T b_anchorMask,
                           emxArray_boolean_T c_anchorMask);

static __global__ void
pointpillardetect_kernel24(const emxArray_boolean_T anchorMask,
                           const real_T threshold,
                           const real32_T predOcc[214272], boolean_T x[214272]);

static __global__ void pointpillardetect_kernel25(const int32_T ii_data[214272],
                                                  const int32_T b,
                                                  int32_T v1_data[214272]);

static __global__ void pointpillardetect_kernel26(const int32_T v1_data[214272],
                                                  const int32_T b,
                                                  int16_T vk_data[214272]);

static __global__ void
pointpillardetect_kernel27(const int16_T vk_data[214272], const int32_T b,
                           int32_T v1_data[214272],
                           int8_T varargout_6_data[214272]);

static __global__ void pointpillardetect_kernel28(const int32_T v1_data[214272],
                                                  const int32_T b,
                                                  int16_T vk_data[214272]);

static __global__ void pointpillardetect_kernel29(const int16_T vk_data[214272],
                                                  const int32_T b,
                                                  int32_T v1_data[214272]);

static __global__ void pointpillardetect_kernel3(const emxArray_real_T anchors,
                                                 const int32_T b_anchors,
                                                 emxArray_real_T c_anchors);

static __global__ void pointpillardetect_kernel30(const int16_T vk_data[214272],
                                                  const int32_T v1_data[214272],
                                                  const int32_T b,
                                                  int16_T col_data[214272],
                                                  int32_T ii_data[214272]);

static __global__ void pointpillardetect_kernel31(
    const real32_T predOcc[214272], const int8_T varargout_6_data[214272],
    const int16_T col_data[214272], const int32_T ii_data[214272],
    const int32_T b, real_T yCen_data[214272], real_T xCen_data[214272],
    real32_T confScore_data[214272]);

static __global__ void pointpillardetect_kernel32(
    const real32_T this_workspace_predHeading[214272],
    const int8_T varargout_6_data[214272], const int16_T col_data[214272],
    const int32_T ii_data[214272], const int32_T b, real32_T hdGt_data[214272]);

static __global__ void pointpillardetect_kernel33(const int32_T rowIdx,
                                                  real32_T hdGt_data[214272]);

static __global__ void pointpillardetect_kernel34(const int32_T rowIdx,
                                                  real32_T hdGt_data[214272]);

static __global__ void pointpillardetect_kernel35(real32_T predAngle[214272]);

static __global__ void pointpillardetect_kernel36(const int32_T rowIdx,
                                                  real32_T angGt_data[214272]);

static __global__ void pointpillardetect_kernel37(const int32_T rowIdx,
                                                  real32_T angGt_data[214272]);

static __global__ void pointpillardetect_kernel38(const int32_T b,
                                                  emxArray_real_T clsMat);

static __global__ void pointpillardetect_kernel39(
    const real32_T predClassification[428544], const int32_T ibcol,
    const int8_T varargout_6_data[214272], const int16_T col_data[214272],
    const int32_T ii_data[214272], const int32_T b, emxArray_real_T clsMat,
    int32_T clsMat_dim1, int32_T clsMat_dim0);

static __global__ void pointpillardetect_kernel4(const real_T dv3[248],
                                                 real_T xx[53568],
                                                 real_T yy[53568]);

static __global__ void pointpillardetect_kernel40(const int32_T clsMat,
                                                  int32_T ii_data[214272]);

static __global__ void
pointpillardetect_kernel41(const int32_T rowreps, const emxArray_real_T clsMat,
                           const int32_T rowIdx, const int32_T colIdx,
                           const int32_T b, int32_T ii_data[214272],
                           real_T xCen_data[214272]);

static __global__ void pointpillardetect_kernel42(const int32_T ii_data[214272],
                                                  const int32_T b,
                                                  real_T yCen_data[214272]);

static __global__ void pointpillardetect_kernel43(
    const real_T yCen_data[214272], const real32_T confScore_data[214272],
    const real32_T angGt_data[214272], const real32_T hGt_data[214272],
    const real32_T wGt_data[214272], const real32_T lGt_data[214272],
    const real32_T zGt_data[214272], const real32_T yGt_data[214272],
    const int32_T boxPreds_size_dim0, const real32_T xGt_data[214272],
    const int32_T b, real32_T boxPreds_data[1928448]);

static __global__ void pointpillardetect_kernel44(
    const real32_T boxPreds_data[1928448], const int32_T boxPreds_size_dim0,
    const int32_T boxPreds_size, boolean_T x_data[214272]);

static __global__ void
pointpillardetect_kernel45(const int32_T boxPreds_size_dim0, const int32_T b,
                           real32_T boxPreds_data[1928448]);

static __global__ void
pointpillardetect_kernel46(const real32_T boxPreds_data[1928448],
                           const int32_T boxPreds_size_dim0,
                           const int32_T ii_data[214272], const int32_T b,
                           real32_T hdGt_data[214272], real32_T scores_data[]);

static __global__ void
pointpillardetect_kernel47(const real32_T scores_data[],
                           const int32_T scores_size, real_T xCen_data[214272],
                           real32_T varargout_1_data[214272]);

static __global__ void pointpillardetect_kernel48(
    const real32_T boxPreds_data[1928448],
    const int32_T boxPreds_size_dim0_dup0, const int32_T ii_data[214272],
    const real_T xCen_data[214272], const int32_T boxPreds_size_dim0,
    const int32_T idx_size, real32_T b_boxPreds_data[1071360], int8_T iv23_dim0,
    int8_T iv23_dim1, int8_T iv23_dim2, int8_T iv23_dim3, int8_T iv23_dim4);

static __global__ void pointpillardetect_kernel49(
    const real32_T hdGt_data[214272], const real_T xCen_data[214272],
    const int32_T idx_size, real32_T varargout_1_data[214272]);

static __global__ void pointpillardetect_kernel5(const real_T yy[53568],
                                                 const real_T xx[53568],
                                                 real_T tmp[107136]);

static __global__ void
pointpillardetect_kernel50(const boolean_T selectedIndex_data[214272],
                           const int32_T selectedIndex_size,
                           boolean_T x_data[214272]);

static __global__ void
pointpillardetect_kernel51(const boolean_T x_data[214272],
                           const real_T xCen_data[214272], const int32_T b,
                           boolean_T selectedIndex_data[214272]);

static __global__ void pointpillardetect_kernel52(const int32_T b,
                                                  real_T bboxes_data[]);

static __global__ void pointpillardetect_kernel53(
    const real32_T boxPreds_data[1928448], const int32_T boxPreds_size_dim0,
    const int32_T ii_data[214272], const int32_T sizes, real_T bboxes_data[],
    int8_T iv27_dim0, int8_T iv27_dim1, int8_T iv27_dim2, int8_T iv27_dim3,
    int8_T iv27_dim4, int8_T iv27_dim5, int8_T iv27_dim6,
    int32_T bboxes_size_dim0);

static __global__ void
pointpillardetect_kernel54(const real32_T hdGt_data[214272],
                           const int32_T tmp_data[214272], const int32_T b,
                           real32_T varargout_1_data[214272]);

static __global__ void
pointpillardetect_kernel55(const real32_T predClassification[428544],
                           const int8_T varargout_6_data[214272],
                           const int16_T col_data[214272],
                           const int32_T ii_data[214272], const int32_T b,
                           real32_T varargout_1_data[214272]);

static __global__ void
pointpillardetect_kernel56(const real32_T varargout_1_data[214272],
                           const int32_T b, real_T xCen_data[214272]);

static __global__ void pointpillardetect_kernel57(const int32_T b,
                                                  real_T xCen_data[214272]);

static __global__ void
pointpillardetect_kernel58(const real_T xCen_data[214272], const int32_T b,
                           real_T yCen_data[214272]);

static __global__ void pointpillardetect_kernel59(const real_T threshold,
                                                  const int32_T rowIdx,
                                                  real_T yCen_data[214272]);

static __global__ void pointpillardetect_kernel6(const int32_T b,
                                                 emxArray_real_T anchors3dMod);

static __global__ void pointpillardetect_kernel60(const real_T threshold,
                                                  const int32_T rowIdx,
                                                  real_T yCen_data[214272]);

static __global__ void
pointpillardetect_kernel61(const emxArray_boolean_T anchorMask,
                           const uint8_T dv6_dim0, const int32_T dv6,
                           emxArray_boolean_T b_anchorMask);

static __global__ void pointpillardetect_kernel7(const emxArray_real_T tmp,
                                                 const int32_T sizes,
                                                 emxArray_real_T anchors3dMod,
                                                 int32_T anchors3dMod_dim0,
                                                 int32_T tmp_dim0);

static __global__ void
pointpillardetect_kernel8(const emxArray_real_T anchorsDim, const int32_T b,
                          emxArray_real_T anchors3dMod,
                          int32_T anchors3dMod_dim0, int32_T anchorsDim_dim0);

static __global__ void
pointpillardetect_kernel9(const emxArray_real_T anchorsDim, const int32_T sizes,
                          emxArray_real_T anchors3dMod,
                          int32_T anchors3dMod_dim0, int32_T anchorsDim_dim0);

// Function Definitions
static void b_error(const mxArray *m, emlrtMCInfo *location)
{
  const mxArray *pArray;
  pArray = m;
  emlrtCallMATLABR2012b(emlrtRootTLSGlobal, 0, nullptr, 1, &pArray, "error",
                        true, location);
}

static uint64_T computeNumIters(int32_T ub, int32_T b_ub, int32_T c_ub)
{
  uint64_T n;
  uint64_T numIters;
  n = 0UL;
  if (ub >= 0) {
    n = static_cast<uint64_T>(ub + 1);
  }
  numIters = n;
  n = 0UL;
  if (b_ub >= 0) {
    n = static_cast<uint64_T>(b_ub + 1);
  }
  numIters *= n;
  n = 0UL;
  if (c_ub >= 0) {
    n = static_cast<uint64_T>(c_ub + 1);
  }
  numIters *= n;
  return numIters;
}

static int32_T div_s32(int32_T numerator, int32_T denominator)
{
  int32_T quotient;
  if (denominator == 0) {
    emlrtDivisionByZeroErrorR2012b(nullptr, emlrtRootTLSGlobal);
  } else {
    uint32_T b;
    uint32_T tempAbsQuotient;
    if (numerator < 0) {
      tempAbsQuotient = ~static_cast<uint32_T>(numerator) + 1U;
    } else {
      tempAbsQuotient = static_cast<uint32_T>(numerator);
    }
    if (denominator < 0) {
      b = ~static_cast<uint32_T>(denominator) + 1U;
    } else {
      b = static_cast<uint32_T>(denominator);
    }
    tempAbsQuotient /= b;
    if ((numerator < 0) != (denominator < 0)) {
      quotient = -static_cast<int32_T>(tempAbsQuotient);
    } else {
      quotient = static_cast<int32_T>(tempAbsQuotient);
    }
  }
  return quotient;
}

static __device__ int32_T div_s32_device(int32_T numerator, int32_T denominator)
{
  int32_T quotient;
  if (denominator == 0) {
    if (numerator >= 0) {
      quotient = MAX_int32_T;
    } else {
      quotient = MIN_int32_T;
    }
  } else {
    uint32_T b;
    uint32_T tempAbsQuotient;
    if (numerator < 0) {
      tempAbsQuotient = ~static_cast<uint32_T>(numerator) + 1U;
    } else {
      tempAbsQuotient = static_cast<uint32_T>(numerator);
    }
    if (denominator < 0) {
      b = ~static_cast<uint32_T>(denominator) + 1U;
    } else {
      b = static_cast<uint32_T>(denominator);
    }
    tempAbsQuotient /= b;
    if (static_cast<int32_T>(numerator < 0) !=
        static_cast<int32_T>(denominator < 0)) {
      quotient = -static_cast<int32_T>(tempAbsQuotient);
    } else {
      quotient = static_cast<int32_T>(tempAbsQuotient);
    }
  }
  return quotient;
}

static void gpuEmxFree_boolean_T(emxArray_boolean_T *gpu)
{
  if (gpu->data != (void *)4207599121UL) {
    checkCudaError(mwCudaFree(gpu->data), __FILE__, __LINE__);
  }
  emlrtFreeMex(gpu->size);
}

static void gpuEmxMemcpyGpuToCpu_boolean_T(emxArray_boolean_T *cpu,
                                           emxArray_boolean_T *gpu)
{
  int32_T actualSize;
  actualSize = 1;
  for (int32_T i{0}; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }
  checkCudaError(
      cudaMemcpy(cpu->data, gpu->data,
                 static_cast<uint32_T>(actualSize) * sizeof(boolean_T),
                 cudaMemcpyDeviceToHost),
      __FILE__, __LINE__);
}

static void gpuEmxMemcpyGpuToCpu_real32_T(emxArray_real32_T *cpu,
                                          emxArray_real32_T *gpu)
{
  int32_T actualSize;
  actualSize = 1;
  for (int32_T i{0}; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }
  checkCudaError(
      cudaMemcpy(cpu->data, gpu->data,
                 static_cast<uint32_T>(actualSize) * sizeof(real32_T),
                 cudaMemcpyDeviceToHost),
      __FILE__, __LINE__);
}

static void gpuEmxMemcpyGpuToCpu_uint8_T(emxArray_uint8_T *cpu,
                                         emxArray_uint8_T *gpu)
{
  int32_T actualSize;
  actualSize = 1;
  for (int32_T i{0}; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }
  checkCudaError(cudaMemcpy(cpu->data, gpu->data,
                            static_cast<uint32_T>(actualSize) * sizeof(uint8_T),
                            cudaMemcpyDeviceToHost),
                 __FILE__, __LINE__);
}

static void gpuEmxReset_boolean_T(emxArray_boolean_T *gpu)
{
  std::memset(gpu, 0, sizeof(emxArray_boolean_T));
}

static __global__ __launch_bounds__(32, 1) void pointpillardetect_kernel1(
    cell_wrap_5 *r1, cell_wrap_5 *r, real_T dv1_dim0, real_T dv1_dim1,
    real_T dv1_dim2, real_T dv1_dim3, real_T dv1_dim4, real_T dv1_dim5,
    real_T dv1_dim6, real_T dv1_dim7, real_T dv1_dim8, real_T dv1_dim9,
    real_T dv_dim0, real_T dv_dim1, real_T dv_dim2, real_T dv_dim3,
    real_T dv_dim4, real_T dv_dim5, real_T dv_dim6, real_T dv_dim7,
    real_T dv_dim8, real_T dv_dim9)
{
  __shared__ real_T dv1_shared[10];
  __shared__ real_T dv_shared[10];
  int32_T i;
  if (mwGetThreadIndexWithinBlock() == 0U) {
    dv_shared[0] = dv_dim0;
    dv_shared[1] = dv_dim1;
    dv_shared[2] = dv_dim2;
    dv_shared[3] = dv_dim3;
    dv_shared[4] = dv_dim4;
    dv_shared[5] = dv_dim5;
    dv_shared[6] = dv_dim6;
    dv_shared[7] = dv_dim7;
    dv_shared[8] = dv_dim8;
    dv_shared[9] = dv_dim9;
    dv1_shared[0] = dv1_dim0;
    dv1_shared[1] = dv1_dim1;
    dv1_shared[2] = dv1_dim2;
    dv1_shared[3] = dv1_dim3;
    dv1_shared[4] = dv1_dim4;
    dv1_shared[5] = dv1_dim5;
    dv1_shared[6] = dv1_dim6;
    dv1_shared[7] = dv1_dim7;
    dv1_shared[8] = dv1_dim8;
    dv1_shared[9] = dv1_dim9;
  }
  __syncthreads();
  i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (i < 10) {
    r->f1[i] = dv_shared[i];
    r1->f1[i] = dv1_shared[i];
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel10(
    const emxArray_real_T anchorsDim, const int32_T b,
    emxArray_real_T anchors3dMod, int32_T anchors3dMod_dim0,
    int32_T anchorsDim_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    anchors3dMod.data[i + anchors3dMod_dim0 * 6] =
        anchorsDim.data[i + anchorsDim_dim0 * 4];
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel11(
    const emxArray_real_T anchors3dMod, const int32_T rowreps, const int32_T i,
    const int32_T sizes, emxArray_real_T b_anchors3dMod,
    int32_T anchors3dMod_dim0, int32_T b_anchors3dMod_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = 2UL * (static_cast<uint64_T>(sizes) + 1UL) - 1UL;
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T b_i;
    int32_T ix;
    ix = static_cast<int32_T>(idx % (static_cast<uint64_T>(sizes) + 1UL));
    b_i = static_cast<int32_T>((idx - static_cast<uint64_T>(ix)) /
                               (static_cast<uint64_T>(sizes) + 1UL));
    b_anchors3dMod.data[ix + anchors3dMod_dim0 * b_i] =
        anchors3dMod.data[(i + rowreps * ix) + b_anchors3dMod_dim0 * (4 - b_i)];
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel12(
    const emxArray_real_T anchors3dMod, const int32_T ibcol,
    const int32_T rowIdx, const int32_T b_anchors3dMod,
    emxArray_real_T c_anchors3dMod, int32_T anchors3dMod_dim0,
    int32_T b_anchors3dMod_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = 2UL * (static_cast<uint64_T>(b_anchors3dMod) + 1UL) - 1UL;
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    int32_T ix;
    ix = static_cast<int32_T>(idx %
                              (static_cast<uint64_T>(b_anchors3dMod) + 1UL));
    i = static_cast<int32_T>((idx - static_cast<uint64_T>(ix)) /
                             (static_cast<uint64_T>(b_anchors3dMod) + 1UL));
    c_anchors3dMod
        .data[((rowIdx + ibcol * ix) + anchors3dMod_dim0 * (i + 3)) - 1] =
        anchors3dMod.data[ix + b_anchors3dMod_dim0 * i];
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel13(
    const emxArray_real_T anchors3dMod, const int32_T b_anchors3dMod,
    emxArray_real_T tmp2, emxArray_real_T tmp1, int32_T tmp1_dim0,
    int32_T anchors3dMod_dim0, int32_T tmp2_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = 2UL * (static_cast<uint64_T>(b_anchors3dMod) + 1UL) - 1UL;
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    int32_T ix;
    ix = static_cast<int32_T>(idx %
                              (static_cast<uint64_T>(b_anchors3dMod) + 1UL));
    i = static_cast<int32_T>((idx - static_cast<uint64_T>(ix)) /
                             (static_cast<uint64_T>(b_anchors3dMod) + 1UL));
    tmp1.data[ix + tmp1_dim0 * i] =
        anchors3dMod.data[ix + anchors3dMod_dim0 * i] -
        anchors3dMod.data[ix + anchors3dMod_dim0 * (i + 3)] / 2.0;
    tmp2.data[ix + tmp2_dim0 * i] =
        anchors3dMod.data[ix + anchors3dMod_dim0 * i] +
        anchors3dMod.data[ix + anchors3dMod_dim0 * (i + 3)] / 2.0;
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel14(
    const emxArray_uint8_T b, const int32_T b_b, emxArray_uint8_T b_value)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    b_value.data[i] = b.data[i];
  }
}

static __global__ __launch_bounds__(224, 1) void pointpillardetect_kernel15(
    real32_T pillarIndices[24000])
{
  int32_T i;
  i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (i < 24000) {
    pillarIndices[i] = 0.0F;
  }
}

static __global__ __launch_bounds__(512, 1) void pointpillardetect_kernel16(
    real32_T dlPillarFeatures_Data[10800000])
{
  int32_T i;
  i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (i < 10800000) {
    dlPillarFeatures_Data[i] = 0.0F;
  }
}

static __global__ __launch_bounds__(32, 1) void pointpillardetect_kernel17(
    cell_wrap_5 *r1, cell_wrap_5 *r, real_T dv1_dim0, real_T dv1_dim1,
    real_T dv1_dim2, real_T dv1_dim3, real_T dv1_dim4, real_T dv1_dim5,
    real_T dv1_dim6, real_T dv1_dim7, real_T dv1_dim8, real_T dv1_dim9,
    real_T dv_dim0, real_T dv_dim1, real_T dv_dim2, real_T dv_dim3,
    real_T dv_dim4, real_T dv_dim5, real_T dv_dim6, real_T dv_dim7,
    real_T dv_dim8, real_T dv_dim9)
{
  __shared__ real_T dv1_shared[10];
  __shared__ real_T dv_shared[10];
  int32_T i;
  if (mwGetThreadIndexWithinBlock() == 0U) {
    dv_shared[0] = dv_dim0;
    dv_shared[1] = dv_dim1;
    dv_shared[2] = dv_dim2;
    dv_shared[3] = dv_dim3;
    dv_shared[4] = dv_dim4;
    dv_shared[5] = dv_dim5;
    dv_shared[6] = dv_dim6;
    dv_shared[7] = dv_dim7;
    dv_shared[8] = dv_dim8;
    dv_shared[9] = dv_dim9;
    dv1_shared[0] = dv1_dim0;
    dv1_shared[1] = dv1_dim1;
    dv1_shared[2] = dv1_dim2;
    dv1_shared[3] = dv1_dim3;
    dv1_shared[4] = dv1_dim4;
    dv1_shared[5] = dv1_dim5;
    dv1_shared[6] = dv1_dim6;
    dv1_shared[7] = dv1_dim7;
    dv1_shared[8] = dv1_dim8;
    dv1_shared[9] = dv1_dim9;
  }
  __syncthreads();
  i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (i < 10) {
    r->f1[i] = dv_shared[i];
    r1->f1[i] = dv1_shared[i];
  }
}

static __global__ __launch_bounds__(512, 1) void pointpillardetect_kernel18(
    real_T sparseVoxelMap[214272])
{
  int32_T i;
  i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (i < 214272) {
    sparseVoxelMap[i] = 0.0;
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel19(
    const real32_T pillarIndices[24000], const int32_T b,
    int32_T iv2_data[12000])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    iv2_data[i] = static_cast<int32_T>(pillarIndices[i]) +
                  432 * (static_cast<int32_T>(pillarIndices[i + 12000]) - 1);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel2(
    const emxArray_real_T anchors, const int32_T b_anchors,
    emxArray_real_T c_anchors, int32_T anchors_dim0, int32_T b_anchors_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = 5UL * (static_cast<uint64_T>(b_anchors) + 1UL) - 1UL;
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    int32_T ix;
    ix = static_cast<int32_T>(idx % (static_cast<uint64_T>(b_anchors) + 1UL));
    i = static_cast<int32_T>((idx - static_cast<uint64_T>(ix)) /
                             (static_cast<uint64_T>(b_anchors) + 1UL));
    c_anchors.data[ix + anchors_dim0 * i] =
        anchors.data[ix + b_anchors_dim0 * i];
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel20(
    const int32_T iv2_data[12000], const int32_T b,
    real_T sparseVoxelMap[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    sparseVoxelMap[iv2_data[i] - 1] = 1.0;
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel21(
    const emxArray_real_T anchorMask, const int32_T b_anchorMask,
    emxArray_boolean_T c_anchorMask)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_anchorMask);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    c_anchorMask.data[i] = (anchorMask.data[i] > 1.0);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel22(
    const emxArray_real_T anchorMask, const int32_T b,
    emxArray_boolean_T b_anchorMask)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    b_anchorMask.data[i] = (anchorMask.data[i] > 1.0);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel23(
    const emxArray_boolean_T anchorMask, const int32_T b_anchorMask,
    emxArray_boolean_T c_anchorMask)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_anchorMask);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    c_anchorMask.data[i] = anchorMask.data[i];
  }
}

static __global__ __launch_bounds__(512, 1) void pointpillardetect_kernel24(
    const emxArray_boolean_T anchorMask, const real_T threshold,
    const real32_T predOcc[214272], boolean_T x[214272])
{
  int32_T i;
  i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (i < 214272) {
    x[i] =
        ((static_cast<real_T>(predOcc[i]) > threshold) && anchorMask.data[i]);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel25(
    const int32_T ii_data[214272], const int32_T b, int32_T v1_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    v1_data[i] = ii_data[i] - 1;
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel26(
    const int32_T v1_data[214272], const int32_T b, int16_T vk_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    vk_data[i] = static_cast<int16_T>(v1_data[i] / 53568);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel27(
    const int16_T vk_data[214272], const int32_T b, int32_T v1_data[214272],
    int8_T varargout_6_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    int16_T i1;
    i = static_cast<int32_T>(idx);
    i1 = vk_data[i];
    varargout_6_data[i] = static_cast<int8_T>(static_cast<int32_T>(i1) + 1);
    v1_data[i] -= static_cast<int32_T>(i1) * 53568;
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel28(
    const int32_T v1_data[214272], const int32_T b, int16_T vk_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    vk_data[i] = static_cast<int16_T>(v1_data[i] / 216);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel29(
    const int16_T vk_data[214272], const int32_T b, int32_T v1_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    v1_data[i] -= static_cast<int32_T>(vk_data[i]) * 216;
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel3(
    const emxArray_real_T anchors, const int32_T b_anchors,
    emxArray_real_T c_anchors)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_anchors);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    c_anchors.data[i] = anchors.data[i];
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel30(
    const int16_T vk_data[214272], const int32_T v1_data[214272],
    const int32_T b, int16_T col_data[214272], int32_T ii_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    ii_data[i] = v1_data[i] + 1;
    col_data[i] = static_cast<int16_T>(static_cast<int32_T>(vk_data[i]) + 1);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel31(
    const real32_T predOcc[214272], const int8_T varargout_6_data[214272],
    const int16_T col_data[214272], const int32_T ii_data[214272],
    const int32_T b, real_T yCen_data[214272], real_T xCen_data[214272],
    real32_T confScore_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    int32_T j;
    int16_T i1;
    j = static_cast<int32_T>(idx);
    i = ii_data[j];
    i1 = col_data[j];
    confScore_data[j] =
        predOcc[((i + 216 * (static_cast<int32_T>(i1) - 1)) +
                 53568 * (static_cast<int32_T>(varargout_6_data[j]) - 1)) -
                1];
    xCen_data[j] = 0.32 * (static_cast<real_T>(i) - 1.0) + 0.16;
    yCen_data[j] = (0.32 * (static_cast<real_T>(i1) - 1.0) - 39.68) + 0.16;
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel32(
    const real32_T this_workspace_predHeading[214272],
    const int8_T varargout_6_data[214272], const int16_T col_data[214272],
    const int32_T ii_data[214272], const int32_T b, real32_T hdGt_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T j;
    j = static_cast<int32_T>(idx);
    hdGt_data[j] = this_workspace_predHeading
        [((ii_data[j] + 216 * (static_cast<int32_T>(col_data[j]) - 1)) +
          53568 * (static_cast<int32_T>(varargout_6_data[j]) - 1)) -
         1];
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel33(
    const int32_T rowIdx, real32_T hdGt_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(rowIdx);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    if (hdGt_data[i] >= 0.5F) {
      hdGt_data[i] = 1.0F;
    }
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel34(
    const int32_T rowIdx, real32_T hdGt_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(rowIdx);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    if (hdGt_data[i] < 0.5F) {
      hdGt_data[i] = -1.0F;
    }
  }
}

static __global__ __launch_bounds__(512, 1) void pointpillardetect_kernel35(
    real32_T predAngle[214272])
{
  int32_T i;
  i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (i < 214272) {
    real32_T f;
    f = predAngle[i];
    if ((f > 1.0F) || (f < -1.0F)) {
      predAngle[i] = 0.0F;
    }
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel36(
    const int32_T rowIdx, real32_T angGt_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(rowIdx);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    real32_T f;
    i = static_cast<int32_T>(idx);
    f = angGt_data[i];
    if (static_cast<real_T>(f) > 3.1415926535897931) {
      f -= 6.28318548F;
      angGt_data[i] = f;
    }
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel37(
    const int32_T rowIdx, real32_T angGt_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(rowIdx);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    real32_T f;
    i = static_cast<int32_T>(idx);
    f = angGt_data[i];
    if (static_cast<real_T>(f) < -3.1415926535897931) {
      f += 6.28318548F;
      angGt_data[i] = f;
    }
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel38(
    const int32_T b, emxArray_real_T clsMat)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    clsMat.data[i] = 0.0;
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel39(
    const real32_T predClassification[428544], const int32_T ibcol,
    const int8_T varargout_6_data[214272], const int16_T col_data[214272],
    const int32_T ii_data[214272], const int32_T b, emxArray_real_T clsMat,
    int32_T clsMat_dim1, int32_T clsMat_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T iv1[2];
    int32_T i;
    int32_T iv0;
    int32_T ix;
    int32_T j;
    i = static_cast<int32_T>(idx);
    iv0 = ii_data[i];
    ix = static_cast<int32_T>(col_data[i]);
    j = static_cast<int32_T>(varargout_6_data[i]);
    iv1[1] = clsMat_dim1;
    for (int32_T b_i{0}; b_i < iv1[1]; b_i++) {
      clsMat.data[i + clsMat_dim0 * b_i] = static_cast<real_T>(
          predClassification[(((iv0 + 216 * (ix - 1)) + 53568 * (j - 1)) +
                              53568 * ibcol * b_i) -
                             1]);
    }
  }
}

static __global__ __launch_bounds__(512, 1) void pointpillardetect_kernel4(
    const real_T dv3[248], real_T xx[53568], real_T yy[53568])
{
  uint64_T gThreadId;
  int32_T i;
  int32_T j;
  gThreadId = mwGetGlobalThreadIndex();
  i = static_cast<int32_T>(gThreadId % 216UL);
  j = static_cast<int32_T>((gThreadId - static_cast<uint64_T>(i)) / 216UL);
  if ((j < 248) && (i < 216)) {
    yy[i + 216 * j] = dv3[j];
    xx[i + 216 * j] = 0.32000000000000006 * static_cast<real_T>(i) + 0.16;
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel40(
    const int32_T clsMat, int32_T ii_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(clsMat);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    ii_data[i] = 1;
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel41(
    const int32_T rowreps, const emxArray_real_T clsMat, const int32_T rowIdx,
    const int32_T colIdx, const int32_T b, int32_T ii_data[214272],
    real_T xCen_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T iv0;
    int32_T j;
    j = static_cast<int32_T>(idx);
    iv0 = (div_s32_device(j, colIdx) * rowIdx + j) + 1;
    xCen_data[j] = clsMat.data[iv0 - 1];
    for (int32_T i{0}; i <= rowreps - 2; i++) {
      int32_T ix;
      boolean_T p;
      ix = iv0 + (i + 1) * colIdx;
      if (isnan(clsMat.data[ix - 1])) {
        p = false;
      } else {
        real_T d;
        d = xCen_data[j];
        if (isnan(d)) {
          p = true;
        } else {
          p = (d < clsMat.data[ix - 1]);
        }
      }
      if (p) {
        xCen_data[j] = clsMat.data[ix - 1];
        ii_data[j] = i + 2;
      }
    }
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel42(
    const int32_T ii_data[214272], const int32_T b, real_T yCen_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    yCen_data[i] = static_cast<real_T>(ii_data[i]);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel43(
    const real_T yCen_data[214272], const real32_T confScore_data[214272],
    const real32_T angGt_data[214272], const real32_T hGt_data[214272],
    const real32_T wGt_data[214272], const real32_T lGt_data[214272],
    const real32_T zGt_data[214272], const real32_T yGt_data[214272],
    const int32_T boxPreds_size_dim0, const real32_T xGt_data[214272],
    const int32_T b, real32_T boxPreds_data[1928448])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    boxPreds_data[i] = xGt_data[i];
    boxPreds_data[i + boxPreds_size_dim0] = yGt_data[i];
    boxPreds_data[i + boxPreds_size_dim0 * 2] = 0.5F * zGt_data[i];
    boxPreds_data[i + boxPreds_size_dim0 * 3] = lGt_data[i];
    boxPreds_data[i + boxPreds_size_dim0 * 4] = wGt_data[i];
    boxPreds_data[i + boxPreds_size_dim0 * 5] = hGt_data[i];
    boxPreds_data[i + boxPreds_size_dim0 * 6] = angGt_data[i];
    boxPreds_data[i + boxPreds_size_dim0 * 7] = confScore_data[i];
    boxPreds_data[i + boxPreds_size_dim0 * 8] =
        static_cast<real32_T>(yCen_data[i]);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel44(
    const real32_T boxPreds_data[1928448], const int32_T boxPreds_size_dim0,
    const int32_T boxPreds_size, boolean_T x_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(boxPreds_size);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    x_data[i] =
        (static_cast<real_T>(boxPreds_data[i + boxPreds_size_dim0 * 8]) > 0.15);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel45(
    const int32_T boxPreds_size_dim0, const int32_T b,
    real32_T boxPreds_data[1928448])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    boxPreds_data[i + boxPreds_size_dim0 * 6] *= 57.2957802F;
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel46(
    const real32_T boxPreds_data[1928448], const int32_T boxPreds_size_dim0,
    const int32_T ii_data[214272], const int32_T b, real32_T hdGt_data[214272],
    real32_T scores_data[])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    int32_T ix;
    i = static_cast<int32_T>(idx);
    ix = ii_data[i];
    scores_data[i] = boxPreds_data[(ix + boxPreds_size_dim0 * 7) - 1];
    hdGt_data[i] = boxPreds_data[(ix + boxPreds_size_dim0 * 8) - 1];
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel47(
    const real32_T scores_data[], const int32_T scores_size,
    real_T xCen_data[214272], real32_T varargout_1_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(scores_size);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    varargout_1_data[i] = scores_data[i];
    xCen_data[i] = 0.0;
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel48(
    const real32_T boxPreds_data[1928448],
    const int32_T boxPreds_size_dim0_dup0, const int32_T ii_data[214272],
    const real_T xCen_data[214272], const int32_T boxPreds_size_dim0,
    const int32_T idx_size, real32_T b_boxPreds_data[1071360], int8_T iv23_dim0,
    int8_T iv23_dim1, int8_T iv23_dim2, int8_T iv23_dim3, int8_T iv23_dim4)
{
  __shared__ int8_T iv23_shared[5];
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  if (mwGetThreadIndexWithinBlock() == 0U) {
    iv23_shared[0] = iv23_dim0;
    iv23_shared[1] = iv23_dim1;
    iv23_shared[2] = iv23_dim2;
    iv23_shared[3] = iv23_dim3;
    iv23_shared[4] = iv23_dim4;
  }
  __syncthreads();
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = 5UL * (static_cast<uint64_T>(idx_size) + 1UL) - 1UL;
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    int32_T ix;
    ix = static_cast<int32_T>(idx % (static_cast<uint64_T>(idx_size) + 1UL));
    i = static_cast<int32_T>((idx - static_cast<uint64_T>(ix)) /
                             (static_cast<uint64_T>(idx_size) + 1UL));
    b_boxPreds_data[ix + boxPreds_size_dim0 * i] =
        boxPreds_data[(ii_data[static_cast<int32_T>(xCen_data[ix]) - 1] +
                       boxPreds_size_dim0_dup0 *
                           static_cast<int32_T>(iv23_shared[i])) -
                      1];
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel49(
    const real32_T hdGt_data[214272], const real_T xCen_data[214272],
    const int32_T idx_size, real32_T varargout_1_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(idx_size);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    varargout_1_data[i] = hdGt_data[static_cast<int32_T>(xCen_data[i]) - 1];
  }
}

static __global__ __launch_bounds__(512, 1) void pointpillardetect_kernel5(
    const real_T yy[53568], const real_T xx[53568], real_T tmp[107136])
{
  int32_T j;
  j = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (j < 53568) {
    tmp[j] = xx[j];
    tmp[j + 53568] = yy[j];
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel50(
    const boolean_T selectedIndex_data[214272],
    const int32_T selectedIndex_size, boolean_T x_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(selectedIndex_size);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    x_data[i] = selectedIndex_data[i];
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel51(
    const boolean_T x_data[214272], const real_T xCen_data[214272],
    const int32_T b, boolean_T selectedIndex_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    selectedIndex_data[static_cast<int32_T>(xCen_data[i]) - 1] = x_data[i];
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel52(
    const int32_T b, real_T bboxes_data[])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    bboxes_data[i] = 0.0;
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel53(
    const real32_T boxPreds_data[1928448], const int32_T boxPreds_size_dim0,
    const int32_T ii_data[214272], const int32_T sizes, real_T bboxes_data[],
    int8_T iv27_dim0, int8_T iv27_dim1, int8_T iv27_dim2, int8_T iv27_dim3,
    int8_T iv27_dim4, int8_T iv27_dim5, int8_T iv27_dim6,
    int32_T bboxes_size_dim0)
{
  __shared__ int8_T iv27_shared[7];
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  if (mwGetThreadIndexWithinBlock() == 0U) {
    iv27_shared[0] = iv27_dim0;
    iv27_shared[1] = iv27_dim1;
    iv27_shared[2] = iv27_dim2;
    iv27_shared[3] = iv27_dim3;
    iv27_shared[4] = iv27_dim4;
    iv27_shared[5] = iv27_dim5;
    iv27_shared[6] = iv27_dim6;
  }
  __syncthreads();
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = 7UL * (static_cast<uint64_T>(sizes) + 1UL) - 1UL;
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    int32_T ix;
    ix = static_cast<int32_T>(idx % (static_cast<uint64_T>(sizes) + 1UL));
    i = static_cast<int32_T>((idx - static_cast<uint64_T>(ix)) /
                             (static_cast<uint64_T>(sizes) + 1UL));
    bboxes_data[ix + bboxes_size_dim0 * static_cast<int32_T>(iv27_shared[i])] =
        static_cast<real_T>(
            boxPreds_data[(ii_data[ix] + boxPreds_size_dim0 * i) - 1]);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel54(
    const real32_T hdGt_data[214272], const int32_T tmp_data[214272],
    const int32_T b, real32_T varargout_1_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    varargout_1_data[i] = hdGt_data[tmp_data[i]];
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel55(
    const real32_T predClassification[428544],
    const int8_T varargout_6_data[214272], const int16_T col_data[214272],
    const int32_T ii_data[214272], const int32_T b,
    real32_T varargout_1_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T j;
    j = static_cast<int32_T>(idx);
    varargout_1_data[j] = predClassification
        [((ii_data[j] + 216 * (static_cast<int32_T>(col_data[j]) - 1)) +
          53568 * (static_cast<int32_T>(varargout_6_data[j]) - 1)) -
         1];
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel56(
    const real32_T varargout_1_data[214272], const int32_T b,
    real_T xCen_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    xCen_data[i] = -static_cast<real_T>(varargout_1_data[i]);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel57(
    const int32_T b, real_T xCen_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T j;
    j = static_cast<int32_T>(idx);
    xCen_data[j] = exp(xCen_data[j]);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel58(
    const real_T xCen_data[214272], const int32_T b, real_T yCen_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    yCen_data[i] = 1.0 / (xCen_data[i] + 1.0);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel59(
    const real_T threshold, const int32_T rowIdx, real_T yCen_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(rowIdx);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    if (yCen_data[i] >= threshold) {
      yCen_data[i] = 1.0;
    }
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel6(
    const int32_T b, emxArray_real_T anchors3dMod)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    anchors3dMod.data[i] = 0.0;
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel60(
    const real_T threshold, const int32_T rowIdx, real_T yCen_data[214272])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(rowIdx);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    if (yCen_data[i] < threshold) {
      yCen_data[i] = 0.0;
    }
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel61(
    const emxArray_boolean_T anchorMask, const uint8_T dv6_dim0,
    const int32_T dv6, emxArray_boolean_T b_anchorMask)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = 53568UL * (static_cast<uint64_T>(dv6) + 1UL) - 1UL;
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    uint64_T tmpIndex;
    int32_T iv0;
    int32_T ix;
    int32_T j;
    ix = static_cast<int32_T>(idx % (static_cast<uint64_T>(dv6) + 1UL));
    tmpIndex =
        (idx - static_cast<uint64_T>(ix)) / (static_cast<uint64_T>(dv6) + 1UL);
    iv0 = static_cast<int32_T>(tmpIndex % 216UL);
    tmpIndex = (tmpIndex - static_cast<uint64_T>(iv0)) / 216UL;
    j = static_cast<int32_T>(tmpIndex);
    b_anchorMask.data[(iv0 + 216 * j) + 53568 * ix] =
        anchorMask.data[(ix + static_cast<int32_T>(dv6_dim0) * iv0) +
                        static_cast<int32_T>(dv6_dim0) * 216 * j];
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel7(
    const emxArray_real_T tmp, const int32_T sizes,
    emxArray_real_T anchors3dMod, int32_T anchors3dMod_dim0, int32_T tmp_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = 2UL * (static_cast<uint64_T>(sizes) + 1UL) - 1UL;
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    int32_T ix;
    ix = static_cast<int32_T>(idx % (static_cast<uint64_T>(sizes) + 1UL));
    i = static_cast<int32_T>((idx - static_cast<uint64_T>(ix)) /
                             (static_cast<uint64_T>(sizes) + 1UL));
    anchors3dMod.data[ix + anchors3dMod_dim0 * i] = tmp.data[ix + tmp_dim0 * i];
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel8(
    const emxArray_real_T anchorsDim, const int32_T b,
    emxArray_real_T anchors3dMod, int32_T anchors3dMod_dim0,
    int32_T anchorsDim_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    anchors3dMod.data[i + anchors3dMod_dim0 * 2] =
        anchorsDim.data[i + anchorsDim_dim0 * 3];
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillardetect_kernel9(
    const emxArray_real_T anchorsDim, const int32_T sizes,
    emxArray_real_T anchors3dMod, int32_T anchors3dMod_dim0,
    int32_T anchorsDim_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = 3UL * (static_cast<uint64_T>(sizes) + 1UL) - 1UL;
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T i;
    int32_T ix;
    ix = static_cast<int32_T>(idx % (static_cast<uint64_T>(sizes) + 1UL));
    i = static_cast<int32_T>((idx - static_cast<uint64_T>(ix)) /
                             (static_cast<uint64_T>(sizes) + 1UL));
    anchors3dMod.data[ix + anchors3dMod_dim0 * (i + 3)] =
        anchorsDim.data[ix + anchorsDim_dim0 * i];
  }
}

void MWScatterLayer_pretrained0_01::cleanupLayer()
{
}

void MWResize2DLayer_pretrained0_01::cleanupLayer()
{
}

void MWResize2DLayer_pretrained0_02::cleanupLayer()
{
}

void MWScatterLayer_pretrained0_01::createCustomLayer(
    MWCudnnTarget::MWTargetNetworkImpl *targetImpl, MWTensorBase *b,
    MWTensorBase *c, const char_T *d, int32_T e)
{
  setupTensors(2, 1, b, c, d, e);
  setupLayer(targetImpl);
}

void MWResize2DLayer_pretrained0_01::createCustomLayer(
    MWCudnnTarget::MWTargetNetworkImpl *targetImpl, MWTensorBase *b,
    const char_T *c, int32_T d)
{
  setupTensors(1, 1, b, c, d);
  setupLayer(targetImpl);
}

void MWResize2DLayer_pretrained0_02::createCustomLayer(
    MWCudnnTarget::MWTargetNetworkImpl *targetImpl, MWTensorBase *b,
    const char_T *c, int32_T d)
{
  setupTensors(1, 1, b, c, d);
  setupLayer(targetImpl);
}

void MWResize2DLayer_pretrained0_01::predict()
{
  reorderInputData(getInputTensor(0), 0);
  coder::internal::l_dlnetwork_layerPredictWithCol(
      m_ntwkImpl->getPermuteBuffer(0), m_ntwkImpl->getPermuteBuffer(1));
  reorderOutputData(getOutputTensor(0), 1);
}

void MWScatterLayer_pretrained0_01::predict()
{
  reorderInputData(getInputTensor(0), 0);
  reorderInputData(getInputTensor(1), 1);
  coder::internal::l_dlnetwork_layerPredictWithCol(
      m_ntwkImpl->getPermuteBuffer(0), m_ntwkImpl->getPermuteBuffer(1),
      m_ntwkImpl->getPermuteBuffer(2));
  reorderOutputData(getOutputTensor(0), 2);
}

void MWResize2DLayer_pretrained0_02::predict()
{
  reorderInputData(getInputTensor(0), 0);
  coder::internal::m_dlnetwork_layerPredictWithCol(
      m_ntwkImpl->getPermuteBuffer(0), m_ntwkImpl->getPermuteBuffer(1));
  reorderOutputData(getOutputTensor(0), 1);
}

void MWScatterLayer_pretrained0_01::propagateSize()
{
  int32_T batchSize;
  MWTensorBase::DIMSLABEL b_layout[5]{MWTensorBase::S, MWTensorBase::N,
                                      MWTensorBase::C, MWTensorBase::H,
                                      MWTensorBase::W};
  MWTensorBase::DIMSLABEL c_layout[5]{MWTensorBase::S, MWTensorBase::N,
                                      MWTensorBase::C, MWTensorBase::H,
                                      MWTensorBase::W};
  MWTensorBase::DIMSLABEL d_layout[5]{MWTensorBase::S, MWTensorBase::N,
                                      MWTensorBase::C, MWTensorBase::H,
                                      MWTensorBase::W};
  MWTensorBase::DIMSLABEL layout[5]{MWTensorBase::S, MWTensorBase::N,
                                    MWTensorBase::C, MWTensorBase::W,
                                    MWTensorBase::H};
  batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(432, 496, 64, batchSize, 1, 0);
  setupInputDescriptors(getInputTensor(0), b_layout, layout);
  setupInputDescriptors(getInputTensor(1), c_layout, layout);
  setupOutputDescriptors(getOutputTensor(0), layout, d_layout);
}

void MWResize2DLayer_pretrained0_01::propagateSize()
{
  int32_T batchSize;
  MWTensorBase::DIMSLABEL b_layout[5]{MWTensorBase::S, MWTensorBase::N,
                                      MWTensorBase::C, MWTensorBase::H,
                                      MWTensorBase::W};
  MWTensorBase::DIMSLABEL c_layout[5]{MWTensorBase::S, MWTensorBase::N,
                                      MWTensorBase::C, MWTensorBase::H,
                                      MWTensorBase::W};
  MWTensorBase::DIMSLABEL layout[5]{MWTensorBase::S, MWTensorBase::N,
                                    MWTensorBase::C, MWTensorBase::W,
                                    MWTensorBase::H};
  batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(216, 248, 128, batchSize, 1, 0);
  setupInputDescriptors(getInputTensor(0), b_layout, layout);
  setupOutputDescriptors(getOutputTensor(0), layout, c_layout);
}

void MWResize2DLayer_pretrained0_02::propagateSize()
{
  int32_T batchSize;
  MWTensorBase::DIMSLABEL b_layout[5]{MWTensorBase::S, MWTensorBase::N,
                                      MWTensorBase::C, MWTensorBase::H,
                                      MWTensorBase::W};
  MWTensorBase::DIMSLABEL c_layout[5]{MWTensorBase::S, MWTensorBase::N,
                                      MWTensorBase::C, MWTensorBase::H,
                                      MWTensorBase::W};
  MWTensorBase::DIMSLABEL layout[5]{MWTensorBase::S, MWTensorBase::N,
                                    MWTensorBase::C, MWTensorBase::W,
                                    MWTensorBase::H};
  batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(216, 248, 128, batchSize, 1, 0);
  setupInputDescriptors(getInputTensor(0), b_layout, layout);
  setupOutputDescriptors(getOutputTensor(0), layout, c_layout);
}

void pointpillardetect(pointpillardetectStackData *SD,
                       const emxArray_real32_T *dataLoc,
                       const emxArray_real32_T *dataInt, real_T threshold,
                       real_T cpu_bboxes_data[], int32_T bboxes_size[2],
                       real32_T cpu_scores_data[], int32_T scores_size[1],
                       coder::categorical *labels)
{
  static const real_T cpu_dv3[248]{-39.52,
                                   -39.2,
                                   -38.88,
                                   -38.56,
                                   -38.24,
                                   -37.92,
                                   -37.6,
                                   -37.28,
                                   -36.96,
                                   -36.64,
                                   -36.32,
                                   -36.0,
                                   -35.68,
                                   -35.36,
                                   -35.04,
                                   -34.72,
                                   -34.4,
                                   -34.08,
                                   -33.76,
                                   -33.44,
                                   -33.12,
                                   -32.8,
                                   -32.480000000000004,
                                   -32.160000000000004,
                                   -31.84,
                                   -31.52,
                                   -31.2,
                                   -30.88,
                                   -30.560000000000002,
                                   -30.240000000000002,
                                   -29.92,
                                   -29.6,
                                   -29.28,
                                   -28.96,
                                   -28.64,
                                   -28.32,
                                   -28.0,
                                   -27.68,
                                   -27.36,
                                   -27.04,
                                   -26.72,
                                   -26.400000000000002,
                                   -26.080000000000002,
                                   -25.76,
                                   -25.44,
                                   -25.12,
                                   -24.8,
                                   -24.48,
                                   -24.16,
                                   -23.84,
                                   -23.52,
                                   -23.2,
                                   -22.88,
                                   -22.56,
                                   -22.240000000000002,
                                   -21.92,
                                   -21.6,
                                   -21.28,
                                   -20.96,
                                   -20.64,
                                   -20.32,
                                   -20.0,
                                   -19.68,
                                   -19.36,
                                   -19.04,
                                   -18.72,
                                   -18.400000000000002,
                                   -18.080000000000002,
                                   -17.76,
                                   -17.44,
                                   -17.12,
                                   -16.8,
                                   -16.48,
                                   -16.16,
                                   -15.84,
                                   -15.52,
                                   -15.200000000000001,
                                   -14.88,
                                   -14.56,
                                   -14.24,
                                   -13.92,
                                   -13.6,
                                   -13.280000000000001,
                                   -12.96,
                                   -12.64,
                                   -12.32,
                                   -12.0,
                                   -11.68,
                                   -11.36,
                                   -11.040000000000001,
                                   -10.72,
                                   -10.4,
                                   -10.08,
                                   -9.76,
                                   -9.44,
                                   -9.120000000000001,
                                   -8.8,
                                   -8.48,
                                   -8.16,
                                   -7.84,
                                   -7.5200000000000005,
                                   -7.2,
                                   -6.88,
                                   -6.5600000000000005,
                                   -6.24,
                                   -5.92,
                                   -5.6000000000000005,
                                   -5.28,
                                   -4.96,
                                   -4.64,
                                   -4.32,
                                   -4.0,
                                   -3.68,
                                   -3.36,
                                   -3.04,
                                   -2.72,
                                   -2.4,
                                   -2.08,
                                   -1.76,
                                   -1.44,
                                   -1.12,
                                   -0.8,
                                   -0.48,
                                   -0.16,
                                   0.16,
                                   0.48,
                                   0.8,
                                   1.12,
                                   1.44,
                                   1.76,
                                   2.08,
                                   2.4,
                                   2.72,
                                   3.04,
                                   3.36,
                                   3.68,
                                   4.0,
                                   4.32,
                                   4.64,
                                   4.96,
                                   5.28,
                                   5.6000000000000005,
                                   5.92,
                                   6.24,
                                   6.5600000000000005,
                                   6.88,
                                   7.2,
                                   7.5200000000000005,
                                   7.84,
                                   8.16,
                                   8.48,
                                   8.8,
                                   9.120000000000001,
                                   9.44,
                                   9.76,
                                   10.08,
                                   10.4,
                                   10.72,
                                   11.040000000000001,
                                   11.36,
                                   11.68,
                                   12.0,
                                   12.32,
                                   12.64,
                                   12.96,
                                   13.280000000000001,
                                   13.6,
                                   13.92,
                                   14.24,
                                   14.56,
                                   14.88,
                                   15.200000000000001,
                                   15.52,
                                   15.84,
                                   16.16,
                                   16.48,
                                   16.8,
                                   17.12,
                                   17.44,
                                   17.76,
                                   18.080000000000002,
                                   18.400000000000002,
                                   18.72,
                                   19.04,
                                   19.36,
                                   19.68,
                                   20.0,
                                   20.32,
                                   20.64,
                                   20.96,
                                   21.28,
                                   21.6,
                                   21.92,
                                   22.240000000000002,
                                   22.56,
                                   22.88,
                                   23.2,
                                   23.52,
                                   23.84,
                                   24.16,
                                   24.48,
                                   24.8,
                                   25.12,
                                   25.44,
                                   25.76,
                                   26.080000000000002,
                                   26.400000000000002,
                                   26.72,
                                   27.04,
                                   27.36,
                                   27.68,
                                   28.0,
                                   28.32,
                                   28.64,
                                   28.96,
                                   29.28,
                                   29.6,
                                   29.92,
                                   30.240000000000002,
                                   30.560000000000002,
                                   30.88,
                                   31.2,
                                   31.52,
                                   31.84,
                                   32.160000000000004,
                                   32.480000000000004,
                                   32.8,
                                   33.12,
                                   33.44,
                                   33.76,
                                   34.08,
                                   34.4,
                                   34.72,
                                   35.04,
                                   35.36,
                                   35.68,
                                   36.0,
                                   36.32,
                                   36.64,
                                   36.96,
                                   37.28,
                                   37.6,
                                   37.92,
                                   38.24,
                                   38.56,
                                   38.88,
                                   39.2,
                                   39.52};
  static const real_T dv[10]{1.912377555486092,
                             1.912377555486092,
                             4.540055829946871,
                             4.540055829946871,
                             1.7084437636761454,
                             1.7084437636761454,
                             -1.78,
                             -1.78,
                             0.0,
                             1.5707963267948966};
  static const real_T dv1[10]{2.1634333333333342,
                              2.1634333333333342,
                              5.901875,
                              5.901875,
                              2.2756435185185189,
                              2.2756435185185189,
                              -1.78,
                              -1.78,
                              0.0,
                              1.5707963267948966};
  static const int32_T iv[2]{1, 15};
  static const int32_T iv1[2]{1, 15};
  static const char_T u[15]{'M', 'A', 'T', 'L', 'A', 'B', ':', 'p',
                            'm', 'a', 'x', 's', 'i', 'z', 'e'};
  static const int8_T iv27[7]{0, 1, 2, 3, 4, 5, 8};
  static const int8_T iv23[5]{0, 1, 3, 4, 6};
  static const int8_T dv8[3]{2, 3, 1};
  cell_wrap_5 rv[2];
  cell_wrap_5 cpu_r;
  cell_wrap_5 cpu_r1;
  cell_wrap_5 *gpu_r;
  cell_wrap_5 *gpu_r1;
  coder::b_pointCloud ptCloud;
  coder::pointCloud ptCloudUnorg;
  dim3 block;
  dim3 grid;
  emxArray_boolean_T b_gpu_anchorMask;
  emxArray_boolean_T c_gpu_anchorMask;
  emxArray_boolean_T d_gpu_anchorMask;
  emxArray_boolean_T gpu_indices;
  emxArray_boolean_T *b_cpu_anchorMask;
  emxArray_boolean_T *c_cpu_anchorMask;
  emxArray_boolean_T *cpu_indices;
  emxArray_boolean_T *d_cpu_anchorMask;
  emxArray_cell_wrap_40 *newAnchors;
  emxArray_real32_T gpu_intensity;
  emxArray_real32_T gpu_location;
  emxArray_real32_T gpu_normals;
  emxArray_real32_T gpu_rangeData;
  emxArray_real32_T *cpu_intensity;
  emxArray_real32_T *cpu_location;
  emxArray_real32_T *cpu_normals;
  emxArray_real32_T *cpu_rangeData;
  emxArray_real32_T *dataIn;
  emxArray_real_T b_gpu_anchors;
  emxArray_real_T b_gpu_anchors3dMod;
  emxArray_real_T b_gpu_tmp;
  emxArray_real_T gpu_anchorMask;
  emxArray_real_T gpu_anchors;
  emxArray_real_T gpu_anchors3dMod;
  emxArray_real_T gpu_anchorsDim;
  emxArray_real_T gpu_clsMat;
  emxArray_real_T gpu_tmp1;
  emxArray_real_T gpu_tmp2;
  emxArray_real_T *b_cpu_anchors;
  emxArray_real_T *b_cpu_anchors3dMod;
  emxArray_real_T *cpu_anchorMask;
  emxArray_real_T *cpu_anchors;
  emxArray_real_T *cpu_anchors3dMod;
  emxArray_real_T *cpu_anchorsDim;
  emxArray_real_T *cpu_clsMat;
  emxArray_real_T *cpu_tmp;
  emxArray_real_T *cpu_tmp1;
  emxArray_real_T *cpu_tmp2;
  emxArray_uint8_T gpu_b;
  emxArray_uint8_T gpu_value;
  emxArray_uint8_T *cpu_b;
  emxArray_uint8_T *cpu_value;
  const mxArray *b_y;
  const mxArray *m;
  const mxArray *m1;
  const mxArray *y;
  real_T(*gpu_sparseVoxelMap)[214272];
  real_T(*gpu_xCen_data)[214272];
  real_T(*gpu_yCen_data)[214272];
  real_T(*gpu_tmp)[107136];
  real_T(*gpu_xx)[53568];
  real_T(*gpu_yy)[53568];
  real_T numPillars;
  real_T *gpu_bboxes_data;
  int32_T(*gpu_ii_data)[214272];
  int32_T(*gpu_tmp_data)[214272];
  int32_T(*gpu_v1_data)[214272];
  int32_T(*gpu_iv2_data)[12000];
  int32_T boxPreds_size[2];
  int32_T sizes[2];
  int32_T sz[2];
  int32_T colIdx;
  int32_T i;
  int32_T ibcol;
  int32_T itilerow;
  int32_T k;
  int32_T ntilerows;
  int32_T rowIdx;
  int32_T rowreps;
  real32_T(*gpu_dlPillarFeatures_Data)[10800000];
  real32_T(*gpu_boxPreds_data)[1928448];
  real32_T(*b_gpu_boxPreds_data)[1071360];
  real32_T(*gpu_fv1)[642816];
  real32_T(*gpu_fv2)[642816];
  real32_T(*gpu_predClassification)[428544];
  real32_T(*gpu_angGt_data)[214272];
  real32_T(*gpu_confScore_data)[214272];
  real32_T(*gpu_hGt_data)[214272];
  real32_T(*gpu_hdGt_data)[214272];
  real32_T(*gpu_lGt_data)[214272];
  real32_T(*gpu_predAngle)[214272];
  real32_T(*gpu_predOcc)[214272];
  real32_T(*gpu_this_workspace_predHeading)[214272];
  real32_T(*gpu_varargout_1_data)[214272];
  real32_T(*gpu_wGt_data)[214272];
  real32_T(*gpu_xGt_data)[214272];
  real32_T(*gpu_yGt_data)[214272];
  real32_T(*gpu_zGt_data)[214272];
  real32_T cpu_pillarIndices[24000];
  real32_T(*gpu_pillarIndices)[24000];
  real32_T *gpu_scores_data;
  uint32_T numPoints[2];
  int16_T(*gpu_col_data)[214272];
  int16_T(*gpu_vk_data)[214272];
  int8_T(*gpu_varargout_6_data)[214272];
  int8_T input_sizes_idx_1;
  boolean_T(*gpu_selectedIndex_data)[214272];
  boolean_T(*gpu_x)[214272];
  boolean_T(*gpu_x_data)[214272];
  boolean_T angGt_data_outdatedOnGpu;
  boolean_T empty_non_axis_sizes;
  boolean_T exitg1;
  boolean_T hGt_data_outdatedOnGpu;
  boolean_T indices_outdatedOnCpu;
  boolean_T indices_outdatedOnGpu;
  boolean_T intensity_outdatedOnCpu;
  boolean_T lGt_data_outdatedOnGpu;
  boolean_T location_outdatedOnCpu;
  boolean_T location_outdatedOnGpu;
  boolean_T normals_outdatedOnCpu;
  boolean_T normals_outdatedOnGpu;
  boolean_T rangeData_outdatedOnCpu;
  boolean_T rangeData_outdatedOnGpu;
  boolean_T tmp_data_outdatedOnGpu;
  boolean_T validLaunchParams;
  boolean_T value_outdatedOnCpu;
  boolean_T value_outdatedOnGpu;
  boolean_T wGt_data_outdatedOnGpu;
  boolean_T xGt_data_outdatedOnGpu;
  boolean_T yGt_data_outdatedOnGpu;
  boolean_T zGt_data_outdatedOnGpu;
  if (!c_gpuConstsCopied_pointpillarde) {
    c_gpuConstsCopied_pointpillarde = true;
    checkCudaError(cudaMemcpy(*global_gpu_dv3, cpu_dv3, sizeof(real_T[248]),
                              cudaMemcpyHostToDevice),
                   __FILE__, __LINE__);
  }
  checkCudaError(mwCudaMalloc(&gpu_tmp_data, 857088UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_selectedIndex_data, 214272UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&b_gpu_boxPreds_data, 4285440UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_x_data, 214272UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_boxPreds_data, 7713792UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_varargout_1_data, 857088UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_angGt_data, 857088UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_hdGt_data, 857088UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_hGt_data, 857088UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_wGt_data, 857088UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_lGt_data, 857088UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_zGt_data, 857088UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_yGt_data, 857088UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_xGt_data, 857088UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_confScore_data, 857088UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_yCen_data, 1714176UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_xCen_data, 1714176UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_col_data, 428544UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_varargout_6_data, 214272UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_vk_data, 428544UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_v1_data, 857088UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_ii_data, 857088UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_x, 214272UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_iv2_data, 48000UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_sparseVoxelMap, 1714176UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_predAngle, 857088UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_this_workspace_predHeading, 857088UL),
                 __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_predClassification, 1714176UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_predOcc, 857088UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_fv2, 2571264UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_fv1, 2571264UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_dlPillarFeatures_Data, 43200000UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_pillarIndices, 96000UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_tmp, 857088UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_xx, 428544UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_yy, 428544UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_r1, 80UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_r, 80UL), __FILE__, __LINE__);
  gpuEmxReset_real_T(&b_gpu_anchors3dMod);
  gpuEmxReset_real_T(&b_gpu_anchors);
  gpuEmxReset_real_T(&gpu_clsMat);
  gpuEmxReset_boolean_T(&d_gpu_anchorMask);
  gpuEmxReset_boolean_T(&c_gpu_anchorMask);
  gpuEmxReset_boolean_T(&b_gpu_anchorMask);
  gpuEmxReset_real_T(&gpu_anchorMask);
  gpuEmxReset_real_T(&gpu_tmp2);
  gpuEmxReset_real_T(&gpu_tmp1);
  gpuEmxReset_uint8_T(&gpu_b);
  gpuEmxReset_real_T(&gpu_anchorsDim);
  gpuEmxReset_real_T(&gpu_anchors3dMod);
  gpuEmxReset_real_T(&b_gpu_tmp);
  gpuEmxReset_real32_T(&gpu_rangeData);
  gpuEmxReset_real32_T(&gpu_intensity);
  gpuEmxReset_real32_T(&gpu_normals);
  gpuEmxReset_uint8_T(&gpu_value);
  gpuEmxReset_real32_T(&gpu_location);
  gpuEmxReset_boolean_T(&gpu_indices);
  gpuEmxReset_real_T(&gpu_anchors);
  checkCudaError(mwCudaMalloc(&gpu_scores_data, 214272U * sizeof(real32_T)),
                 __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_bboxes_data, 1928448U * sizeof(real_T)),
                 __FILE__, __LINE__);
  tmp_data_outdatedOnGpu = false;
  angGt_data_outdatedOnGpu = false;
  hGt_data_outdatedOnGpu = false;
  wGt_data_outdatedOnGpu = false;
  lGt_data_outdatedOnGpu = false;
  zGt_data_outdatedOnGpu = false;
  yGt_data_outdatedOnGpu = false;
  xGt_data_outdatedOnGpu = false;
  rangeData_outdatedOnCpu = false;
  rangeData_outdatedOnGpu = false;
  intensity_outdatedOnCpu = false;
  normals_outdatedOnCpu = false;
  normals_outdatedOnGpu = false;
  value_outdatedOnCpu = false;
  value_outdatedOnGpu = false;
  location_outdatedOnCpu = false;
  location_outdatedOnGpu = false;
  indices_outdatedOnCpu = false;
  indices_outdatedOnGpu = false;
  empty_non_axis_sizes = true;
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);
  emxInitStruct_pointCloud(&ptCloud, &s_emlrtRTEI, true);
  emxInit_real_T(&cpu_anchors, 2, &t_emlrtRTEI, true);
  emxInitStruct_pointCloud1(&ptCloudUnorg, &m_emlrtRTEI, true);
  emxInit_boolean_T(&cpu_indices, 1, &r_emlrtRTEI, true);
  emxInit_real32_T(&cpu_location, 2, &r_emlrtRTEI, true);
  emxInit_uint8_T(&cpu_value, 2, &k_emlrtRTEI, true);
  emxInit_real32_T(&cpu_normals, 2, &r_emlrtRTEI, true);
  emxInit_real32_T(&cpu_intensity, 2, &r_emlrtRTEI, true);
  emxInit_real32_T(&cpu_rangeData, 2, &r_emlrtRTEI, true);
  emxInit_real_T(&cpu_tmp, 2, &u_emlrtRTEI, true);
  emxInit_real_T(&cpu_anchors3dMod, 2, &v_emlrtRTEI, true);
  emxInit_real_T(&cpu_anchorsDim, 2, &w_emlrtRTEI, true);
  emxInit_uint8_T(&cpu_b, 2, &x_emlrtRTEI, true);
  emxInit_real_T(&cpu_tmp1, 2, &n_emlrtRTEI, true);
  emxInit_real_T(&cpu_tmp2, 2, &o_emlrtRTEI, true);
  emxInit_real32_T(&dataIn, 2, &m_emlrtRTEI, true);
  emxInit_real_T(&cpu_anchorMask, 1, &m_emlrtRTEI, true);
  emxInit_boolean_T(&b_cpu_anchorMask, 1, &m_emlrtRTEI, true);
  emxInit_cell_wrap_40(&newAnchors, 2, &m_emlrtRTEI, true);
  emxInit_boolean_T(&c_cpu_anchorMask, 3, &m_emlrtRTEI, true);
  emxInit_boolean_T(&d_cpu_anchorMask, 3, &m_emlrtRTEI, true);
  emxInit_real_T(&cpu_clsMat, 2, &m_emlrtRTEI, true);
  emxInit_real_T(&b_cpu_anchors, 2, &d_emlrtRTEI, true);
  emxInit_real_T(&b_cpu_anchors3dMod, 2, &l_emlrtRTEI, true);
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);
  emlrtPushHeapReferenceStackR2021a(
      emlrtRootTLSGlobal, false, &ptCloud,
      (void *)static_cast<void (*)(coder::b_pointCloud *)>(
          &coder::handle_matlabCodegenDestructor),
      nullptr, nullptr, nullptr);
  ptCloud.matlabCodegenIsDeleted = true;
  //  Predict the output of network and extract the confidence, x, y,
  //  width, height, and class.
  //  load the deep learning network for prediction
  if (!pointPillarObj_not_empty) {
    pointPillarObj.AnchorsBEV->size[0] = 0;
    pointPillarObj.AnchorsBEV->size[1] = 4;
    coder::internal::dlnetwork_setup(&gobj_0);
    gobj_0.matlabCodegenIsDeleted = false;
    pointPillarObj.Network = &gobj_0;
    pointpillardetect_kernel1<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(
        gpu_r1, gpu_r, dv1[0], dv1[1], dv1[2], dv1[3], dv1[4], dv1[5], dv1[6],
        dv1[7], dv1[8], dv1[9], dv[0], dv[1], dv[2], dv[3], dv[4], dv[5], dv[6],
        dv[7], dv[8], dv[9]);
    checkCudaError(cudaMemcpy(&cpu_r, gpu_r, 80UL, cudaMemcpyDeviceToHost),
                   __FILE__, __LINE__);
    rv[0] = cpu_r;
    checkCudaError(cudaMemcpy(&cpu_r1, gpu_r1, 80UL, cudaMemcpyDeviceToHost),
                   __FILE__, __LINE__);
    rv[1] = cpu_r1;
    normals_outdatedOnGpu = false;
    cpu_anchors->size[0] = 0;
    cpu_anchors->size[1] = 5;
    for (i = 0; i < 2; i++) {
      ntilerows = b_cpu_anchors->size[0] * b_cpu_anchors->size[1];
      b_cpu_anchors->size[0] = cpu_anchors->size[0] + 2;
      b_cpu_anchors->size[1] = 5;
      emxEnsureCapacity_real_T(b_cpu_anchors, ntilerows, &d_emlrtRTEI);
      rowreps = cpu_anchors->size[0] - 1;
      mwGetLaunchParameters1D(computeNumIters(4, rowreps), &grid, &block,
                              2147483647U);
      if (empty_non_axis_sizes) {
        gpuEmxEnsureCapacity_real_T(cpu_anchors, &gpu_anchors, true);
      }
      gpuEmxEnsureCapacity_real_T(b_cpu_anchors, &b_gpu_anchors, true);
      empty_non_axis_sizes = false;
      validLaunchParams = mwValidateLaunchParameters(grid, block);
      if (validLaunchParams) {
        pointpillardetect_kernel2<<<grid, block>>>(
            gpu_anchors, rowreps, b_gpu_anchors, b_cpu_anchors->size[0U],
            cpu_anchors->size[0U]);
      }
      rangeData_outdatedOnCpu = false;
      normals_outdatedOnGpu = true;
      for (ntilerows = 0; ntilerows < 5; ntilerows++) {
        if (normals_outdatedOnGpu) {
          gpuEmxMemcpyGpuToCpu_real_T(b_cpu_anchors, &b_gpu_anchors);
        }
        b_cpu_anchors
            ->data[cpu_anchors->size[0] + b_cpu_anchors->size[0] * ntilerows] =
            rv[i].f1[ntilerows << 1];
        b_cpu_anchors
            ->data[(cpu_anchors->size[0] + b_cpu_anchors->size[0] * ntilerows) +
                   1] = rv[i].f1[(ntilerows << 1) + 1];
        normals_outdatedOnGpu = false;
        rangeData_outdatedOnCpu = true;
        empty_non_axis_sizes = true;
      }
      ntilerows = cpu_anchors->size[0] * cpu_anchors->size[1];
      cpu_anchors->size[0] = b_cpu_anchors->size[0];
      cpu_anchors->size[1] = 5;
      emxEnsureCapacity_real_T(cpu_anchors, ntilerows, &e_emlrtRTEI);
      rowreps = b_cpu_anchors->size[0] * 5 - 1;
      mwGetLaunchParameters1D(computeNumIters(rowreps), &grid, &block,
                              2147483647U);
      if (empty_non_axis_sizes) {
        gpuEmxEnsureCapacity_real_T(b_cpu_anchors, &b_gpu_anchors,
                                    !rangeData_outdatedOnCpu);
      }
      gpuEmxEnsureCapacity_real_T(cpu_anchors, &gpu_anchors, true);
      empty_non_axis_sizes = false;
      if (rangeData_outdatedOnCpu) {
        gpuEmxMemcpyCpuToGpu_real_T(&b_gpu_anchors, b_cpu_anchors);
      }
      validLaunchParams = mwValidateLaunchParameters(grid, block);
      if (validLaunchParams) {
        pointpillardetect_kernel3<<<grid, block>>>(b_gpu_anchors, rowreps,
                                                   gpu_anchors);
      }
      normals_outdatedOnGpu = true;
    }
    pointpillardetect_kernel4<<<dim3(105U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
        *global_gpu_dv3, *gpu_xx, *gpu_yy);
    pointpillardetect_kernel5<<<dim3(105U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
        *gpu_yy, *gpu_xx, *gpu_tmp);
    rangeData_outdatedOnGpu = true;
    empty_non_axis_sizes = false;
    ntilerows = cpu_tmp->size[0] * cpu_tmp->size[1];
    cpu_tmp->size[0] = 53568 * cpu_anchors->size[0];
    cpu_tmp->size[1] = 2;
    emxEnsureCapacity_real_T(cpu_tmp, ntilerows, &f_emlrtRTEI);
    if (53568 * cpu_anchors->size[0] != 0) {
      rowreps = cpu_anchors->size[0];
      for (ntilerows = 0; ntilerows < 2; ntilerows++) {
        rowIdx = -1;
        for (i = 0; i < 53568; i++) {
          for (k = 0; k < rowreps; k++) {
            if (rangeData_outdatedOnGpu) {
              checkCudaError(cudaMemcpy(SD->f3.cpu_tmp, *gpu_tmp, 857088UL,
                                        cudaMemcpyDeviceToHost),
                             __FILE__, __LINE__);
            }
            rangeData_outdatedOnGpu = false;
            cpu_tmp->data[((rowIdx + k) + cpu_tmp->size[0] * ntilerows) + 1] =
                SD->f3.cpu_tmp[i + 53568 * ntilerows];
            empty_non_axis_sizes = true;
          }
          if (rowreps - 1 >= 0) {
            rowIdx += rowreps;
          }
        }
      }
    }
    numPillars = 53568.0 * static_cast<real_T>(cpu_anchors->size[0]);
    ntilerows = cpu_anchors3dMod->size[0] * cpu_anchors3dMod->size[1];
    cpu_anchors3dMod->size[0] = static_cast<int32_T>(numPillars);
    cpu_anchors3dMod->size[1] = 7;
    emxEnsureCapacity_real_T(cpu_anchors3dMod, ntilerows, &g_emlrtRTEI);
    rowreps = static_cast<int32_T>(numPillars) * 7 - 1;
    mwGetLaunchParameters1D(computeNumIters(rowreps), &grid, &block,
                            2147483647U);
    gpuEmxEnsureCapacity_real_T(cpu_anchors3dMod, &gpu_anchors3dMod, true);
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillardetect_kernel6<<<grid, block>>>(rowreps, gpu_anchors3dMod);
    }
    mwGetLaunchParameters1D(
        computeNumIters(1, static_cast<int32_T>(numPillars) - 1), &grid, &block,
        2147483647U);
    gpuEmxEnsureCapacity_real_T(cpu_tmp, &b_gpu_tmp, !empty_non_axis_sizes);
    if (empty_non_axis_sizes) {
      gpuEmxMemcpyCpuToGpu_real_T(&b_gpu_tmp, cpu_tmp);
    }
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillardetect_kernel7<<<grid, block>>>(
          b_gpu_tmp, static_cast<int32_T>(numPillars) - 1, gpu_anchors3dMod,
          cpu_anchors3dMod->size[0U], cpu_tmp->size[0U]);
    }
    colIdx = cpu_anchors->size[0] * 53568;
    if (!(colIdx == static_cast<real_T>(cpu_anchors->size[0]) * 53568.0)) {
      y = nullptr;
      m = emlrtCreateCharArray(2, &iv[0]);
      emlrtInitCharArrayR2013a(emlrtRootTLSGlobal, 15, m, &u[0]);
      emlrtAssign(&y, m);
      b_error(y, &emlrtMCI);
    }
    empty_non_axis_sizes = false;
    ntilerows = cpu_anchorsDim->size[0] * cpu_anchorsDim->size[1];
    cpu_anchorsDim->size[0] = colIdx;
    cpu_anchorsDim->size[1] = 5;
    emxEnsureCapacity_real_T(cpu_anchorsDim, ntilerows, &j_emlrtRTEI);
    colIdx = cpu_anchors->size[0];
    for (i = 0; i < 5; i++) {
      rowreps = i * colIdx;
      rowIdx = i * (colIdx * 53568);
      for (itilerow = 0; itilerow < 53568; itilerow++) {
        ibcol = rowIdx + itilerow * colIdx;
        for (k = 0; k < colIdx; k++) {
          if (normals_outdatedOnGpu) {
            gpuEmxMemcpyGpuToCpu_real_T(cpu_anchors, &gpu_anchors);
          }
          normals_outdatedOnGpu = false;
          cpu_anchorsDim->data[ibcol + k] = cpu_anchors->data[rowreps + k];
          empty_non_axis_sizes = true;
        }
      }
    }
    rowreps = cpu_anchors3dMod->size[0];
    mwGetLaunchParameters1D(computeNumIters(rowreps - 1), &grid, &block,
                            2147483647U);
    gpuEmxEnsureCapacity_real_T(cpu_anchorsDim, &gpu_anchorsDim,
                                !empty_non_axis_sizes);
    if (empty_non_axis_sizes) {
      gpuEmxMemcpyCpuToGpu_real_T(&gpu_anchorsDim, cpu_anchorsDim);
    }
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillardetect_kernel8<<<grid, block>>>(
          gpu_anchorsDim, rowreps - 1, gpu_anchors3dMod,
          cpu_anchors3dMod->size[0U], cpu_anchorsDim->size[0U]);
    }
    sizes[0] = cpu_anchors3dMod->size[0];
    mwGetLaunchParameters1D(computeNumIters(2, sizes[0] - 1), &grid, &block,
                            2147483647U);
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillardetect_kernel9<<<grid, block>>>(
          gpu_anchorsDim, sizes[0] - 1, gpu_anchors3dMod,
          cpu_anchors3dMod->size[0U], cpu_anchorsDim->size[0U]);
    }
    rowreps = cpu_anchors3dMod->size[0];
    mwGetLaunchParameters1D(computeNumIters(rowreps - 1), &grid, &block,
                            2147483647U);
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillardetect_kernel10<<<grid, block>>>(
          gpu_anchorsDim, rowreps - 1, gpu_anchors3dMod,
          cpu_anchors3dMod->size[0U], cpu_anchorsDim->size[0U]);
    }
    if (cpu_anchors3dMod->size[0] < 2) {
      i = 0;
      rowreps = 1;
      rowIdx = 1;
      ibcol = 1;
      colIdx = 0;
    } else {
      i = 1;
      rowreps = 2;
      rowIdx = 2;
      ibcol = 2;
      colIdx = cpu_anchors3dMod->size[0];
    }
    sizes[0] = div_s32(colIdx - rowIdx, ibcol) + 1;
    ntilerows = b_cpu_anchors3dMod->size[0] * b_cpu_anchors3dMod->size[1];
    b_cpu_anchors3dMod->size[0] = sizes[0];
    b_cpu_anchors3dMod->size[1] = 2;
    emxEnsureCapacity_real_T(b_cpu_anchors3dMod, ntilerows, &l_emlrtRTEI);
    mwGetLaunchParameters1D(computeNumIters(1, sizes[0] - 1), &grid, &block,
                            2147483647U);
    gpuEmxEnsureCapacity_real_T(b_cpu_anchors3dMod, &b_gpu_anchors3dMod, true);
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillardetect_kernel11<<<grid, block>>>(
          gpu_anchors3dMod, rowreps, i, sizes[0] - 1, b_gpu_anchors3dMod,
          b_cpu_anchors3dMod->size[0U], cpu_anchors3dMod->size[0U]);
    }
    rowreps = b_cpu_anchors3dMod->size[0] - 1;
    mwGetLaunchParameters1D(computeNumIters(1, rowreps), &grid, &block,
                            2147483647U);
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillardetect_kernel12<<<grid, block>>>(
          b_gpu_anchors3dMod, ibcol, rowIdx, rowreps, gpu_anchors3dMod,
          cpu_anchors3dMod->size[0U], b_cpu_anchors3dMod->size[0U]);
    }
    ntilerows = cpu_tmp1->size[0] * cpu_tmp1->size[1];
    cpu_tmp1->size[0] = cpu_anchors3dMod->size[0];
    cpu_tmp1->size[1] = 2;
    emxEnsureCapacity_real_T(cpu_tmp1, ntilerows, &n_emlrtRTEI);
    ntilerows = cpu_tmp2->size[0] * cpu_tmp2->size[1];
    cpu_tmp2->size[0] = cpu_anchors3dMod->size[0];
    cpu_tmp2->size[1] = 2;
    emxEnsureCapacity_real_T(cpu_tmp2, ntilerows, &o_emlrtRTEI);
    rowreps = cpu_anchors3dMod->size[0] - 1;
    mwGetLaunchParameters1D(computeNumIters(1, rowreps), &grid, &block,
                            2147483647U);
    gpuEmxEnsureCapacity_real_T(cpu_tmp2, &gpu_tmp2, true);
    gpuEmxEnsureCapacity_real_T(cpu_tmp1, &gpu_tmp1, true);
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillardetect_kernel13<<<grid, block>>>(
          gpu_anchors3dMod, rowreps, gpu_tmp2, gpu_tmp1, cpu_tmp1->size[0U],
          cpu_anchors3dMod->size[0U], cpu_tmp2->size[0U]);
    }
    rangeData_outdatedOnCpu = true;
    rangeData_outdatedOnGpu = true;
    ntilerows =
        pointPillarObj.AnchorsBEV->size[0] * pointPillarObj.AnchorsBEV->size[1];
    pointPillarObj.AnchorsBEV->size[0] = cpu_tmp1->size[0];
    pointPillarObj.AnchorsBEV->size[1] = 4;
    emxEnsureCapacity_real_T(pointPillarObj.AnchorsBEV, ntilerows,
                             &p_emlrtRTEI);
    rowreps = cpu_tmp1->size[0] << 1;
    for (ntilerows = 0; ntilerows < rowreps; ntilerows++) {
      if (rangeData_outdatedOnCpu) {
        gpuEmxMemcpyGpuToCpu_real_T(cpu_tmp1, &gpu_tmp1);
      }
      rangeData_outdatedOnCpu = false;
      pointPillarObj.AnchorsBEV->data[ntilerows] = cpu_tmp1->data[ntilerows];
    }
    if (rowreps - 1 < 0) {
      colIdx = -1;
    } else {
      colIdx = rowreps + -1;
    }
    rowreps = cpu_tmp2->size[0] << 1;
    for (ntilerows = 0; ntilerows < rowreps; ntilerows++) {
      if (rangeData_outdatedOnGpu) {
        gpuEmxMemcpyGpuToCpu_real_T(cpu_tmp2, &gpu_tmp2);
      }
      rangeData_outdatedOnGpu = false;
      pointPillarObj.AnchorsBEV->data[(colIdx + ntilerows) + 1] =
          cpu_tmp2->data[ntilerows];
    }
    pointPillarObj_not_empty = true;
  }
  ptCloud.HasKdtreeConstructed = false;
  ptCloud.HasLocationHandleAllocated = false;
  ntilerows = ptCloud.Location->size[0] * ptCloud.Location->size[1];
  ptCloud.Location->size[0] = dataLoc->size[0];
  ptCloud.Location->size[1] = 3;
  emxEnsureCapacity_real32_T(ptCloud.Location, ntilerows, &b_emlrtRTEI);
  for (ntilerows = 0; ntilerows < dataLoc->size[0] * 3; ntilerows++) {
    ptCloud.Location->data[ntilerows] = dataLoc->data[ntilerows];
  }
  ptCloud.Color->size[0] = 0;
  ptCloud.Color->size[1] = 0;
  ptCloud.Normal->size[0] = 0;
  ptCloud.Normal->size[1] = 0;
  ntilerows = ptCloud.Intensity->size[0];
  ptCloud.Intensity->size[0] = dataInt->size[0];
  emxEnsureCapacity_real32_T(ptCloud.Intensity, ntilerows, &c_emlrtRTEI);
  for (ntilerows = 0; ntilerows < dataInt->size[0]; ntilerows++) {
    ptCloud.Intensity->data[ntilerows] = dataInt->data[ntilerows];
  }
  ptCloud.RangeData->size[0] = 0;
  ptCloud.RangeData->size[1] = 0;
  ptCloud.PointCloudArrayData->size[0] = 1;
  ptCloud.PointCloudArrayData->size[1] = 1;
  ptCloud.Kdtree = nullptr;
  ptCloud.LocationHandle = nullptr;
  ptCloud.matlabCodegenIsDeleted = false;
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);
  emlrtPushHeapReferenceStackR2021a(
      emlrtRootTLSGlobal, false, &ptCloudUnorg,
      (void *)static_cast<void (*)(coder::pointCloud *)>(
          &coder::handle_matlabCodegenDestructor),
      nullptr, nullptr, nullptr);
  ptCloudUnorg.matlabCodegenIsDeleted = true;
  coder::vision::internal::codegen::gpu::d_PointCloudImpl_extractValidPo(
      ptCloud.Location, cpu_indices, &indices_outdatedOnCpu, &gpu_indices,
      &indices_outdatedOnGpu);
  coder::vision::internal::codegen::gpu::PointCloudImpl_subsetImpl(
      ptCloud.Location, ptCloud.Color, ptCloud.Normal, ptCloud.Intensity,
      ptCloud.RangeData, cpu_indices, &gpu_indices, &indices_outdatedOnGpu,
      cpu_location, &location_outdatedOnCpu, &gpu_location,
      &location_outdatedOnGpu, cpu_value, &value_outdatedOnCpu, &gpu_value,
      &value_outdatedOnGpu, cpu_normals, &normals_outdatedOnCpu, &gpu_normals,
      &normals_outdatedOnGpu, cpu_intensity, &intensity_outdatedOnCpu,
      &gpu_intensity, &empty_non_axis_sizes, cpu_rangeData,
      &rangeData_outdatedOnCpu, &gpu_rangeData, &rangeData_outdatedOnGpu);
  ptCloudUnorg.HasKdtreeConstructed = false;
  ptCloudUnorg.HasLocationHandleAllocated = false;
  ntilerows = ptCloudUnorg.Location->size[0] * ptCloudUnorg.Location->size[1];
  ptCloudUnorg.Location->size[0] = cpu_location->size[0];
  ptCloudUnorg.Location->size[1] = 3;
  emxEnsureCapacity_real32_T(ptCloudUnorg.Location, ntilerows, &b_emlrtRTEI);
  for (ntilerows = 0; ntilerows < cpu_location->size[0] * 3; ntilerows++) {
    if (location_outdatedOnCpu) {
      gpuEmxMemcpyGpuToCpu_real32_T(cpu_location, &gpu_location);
    }
    location_outdatedOnCpu = false;
    ptCloudUnorg.Location->data[ntilerows] = cpu_location->data[ntilerows];
  }
  for (rowreps = 0; rowreps < 2; rowreps++) {
    numPoints[rowreps] = static_cast<uint32_T>(cpu_value->size[rowreps]);
  }
  empty_non_axis_sizes = true;
  k = 0;
  exitg1 = false;
  while ((!exitg1) && (k < 2)) {
    if (static_cast<int32_T>(numPoints[k]) != (k << 1) + 1) {
      empty_non_axis_sizes = false;
      exitg1 = true;
    } else {
      k++;
    }
  }
  if (empty_non_axis_sizes) {
    numPoints[0] = static_cast<uint32_T>(ptCloudUnorg.Location->size[0]);
    colIdx = cpu_value->size[0] * static_cast<int32_T>(numPoints[0]);
    if (!(colIdx == static_cast<real_T>(cpu_value->size[0]) *
                        static_cast<real_T>(numPoints[0]))) {
      b_y = nullptr;
      m1 = emlrtCreateCharArray(2, &iv1[0]);
      emlrtInitCharArrayR2013a(emlrtRootTLSGlobal, 15, m1, &u[0]);
      emlrtAssign(&b_y, m1);
      b_error(b_y, &emlrtMCI);
    }
    empty_non_axis_sizes = false;
    ntilerows = cpu_b->size[0] * cpu_b->size[1];
    cpu_b->size[0] = colIdx;
    cpu_b->size[1] = 3;
    emxEnsureCapacity_uint8_T(cpu_b, ntilerows, &j_emlrtRTEI);
    colIdx = cpu_value->size[0];
    ntilerows = static_cast<int32_T>(numPoints[0]);
    for (i = 0; i < 3; i++) {
      rowreps = i * colIdx;
      rowIdx = i * (colIdx * ntilerows);
      for (itilerow = 0; itilerow < ntilerows; itilerow++) {
        ibcol = rowIdx + itilerow * colIdx;
        for (k = 0; k < colIdx; k++) {
          if (value_outdatedOnCpu) {
            gpuEmxMemcpyGpuToCpu_uint8_T(cpu_value, &gpu_value);
          }
          value_outdatedOnCpu = false;
          cpu_b->data[ibcol + k] = cpu_value->data[rowreps + k];
          empty_non_axis_sizes = true;
        }
      }
    }
    ntilerows = cpu_value->size[0] * cpu_value->size[1];
    cpu_value->size[0] = cpu_b->size[0];
    cpu_value->size[1] = 3;
    emxEnsureCapacity_uint8_T(cpu_value, ntilerows, &k_emlrtRTEI);
    rowreps = cpu_b->size[0] * 3 - 1;
    mwGetLaunchParameters1D(computeNumIters(rowreps), &grid, &block,
                            2147483647U);
    gpuEmxEnsureCapacity_uint8_T(cpu_b, &gpu_b, !empty_non_axis_sizes);
    gpuEmxEnsureCapacity_uint8_T(cpu_value, &gpu_value, true);
    if (empty_non_axis_sizes) {
      gpuEmxMemcpyCpuToGpu_uint8_T(&gpu_b, cpu_b);
    }
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillardetect_kernel14<<<grid, block>>>(gpu_b, rowreps, gpu_value);
    }
    value_outdatedOnCpu = true;
  }
  ntilerows = ptCloudUnorg.Color->size[0] * ptCloudUnorg.Color->size[1];
  ptCloudUnorg.Color->size[0] = cpu_value->size[0];
  ptCloudUnorg.Color->size[1] = 3;
  emxEnsureCapacity_uint8_T(ptCloudUnorg.Color, ntilerows, &h_emlrtRTEI);
  for (ntilerows = 0; ntilerows < cpu_value->size[0] * 3; ntilerows++) {
    if (value_outdatedOnCpu) {
      gpuEmxMemcpyGpuToCpu_uint8_T(cpu_value, &gpu_value);
    }
    value_outdatedOnCpu = false;
    ptCloudUnorg.Color->data[ntilerows] = cpu_value->data[ntilerows];
  }
  ntilerows = ptCloudUnorg.Normal->size[0] * ptCloudUnorg.Normal->size[1];
  ptCloudUnorg.Normal->size[0] = cpu_normals->size[0];
  ptCloudUnorg.Normal->size[1] = 3;
  emxEnsureCapacity_real32_T(ptCloudUnorg.Normal, ntilerows, &i_emlrtRTEI);
  for (ntilerows = 0; ntilerows < cpu_normals->size[0] * 3; ntilerows++) {
    if (normals_outdatedOnCpu) {
      gpuEmxMemcpyGpuToCpu_real32_T(cpu_normals, &gpu_normals);
    }
    normals_outdatedOnCpu = false;
    ptCloudUnorg.Normal->data[ntilerows] = cpu_normals->data[ntilerows];
  }
  ntilerows = ptCloudUnorg.Intensity->size[0] * ptCloudUnorg.Intensity->size[1];
  ptCloudUnorg.Intensity->size[0] = cpu_intensity->size[0];
  ptCloudUnorg.Intensity->size[1] = 1;
  emxEnsureCapacity_real32_T(ptCloudUnorg.Intensity, ntilerows, &c_emlrtRTEI);
  for (ntilerows = 0; ntilerows < cpu_intensity->size[0]; ntilerows++) {
    if (intensity_outdatedOnCpu) {
      gpuEmxMemcpyGpuToCpu_real32_T(cpu_intensity, &gpu_intensity);
    }
    intensity_outdatedOnCpu = false;
    ptCloudUnorg.Intensity->data[ntilerows] = cpu_intensity->data[ntilerows];
  }
  ptCloudUnorg.Kdtree = nullptr;
  ptCloudUnorg.LocationHandle = nullptr;
  ptCloudUnorg.matlabCodegenIsDeleted = false;
  if (ptCloudUnorg.Location->size[0] != 0) {
    colIdx = ptCloudUnorg.Location->size[0];
  } else if ((ptCloudUnorg.Intensity->size[0] != 0) &&
             (ptCloudUnorg.Intensity->size[1] != 0)) {
    colIdx = ptCloudUnorg.Intensity->size[0];
  } else {
    colIdx = 0;
    if (ptCloudUnorg.Intensity->size[0] > 0) {
      colIdx = ptCloudUnorg.Intensity->size[0];
    }
  }
  empty_non_axis_sizes = (colIdx == 0);
  if (empty_non_axis_sizes || (ptCloudUnorg.Location->size[0] != 0)) {
    input_sizes_idx_1 = 3;
  } else {
    input_sizes_idx_1 = 0;
  }
  if (empty_non_axis_sizes || ((ptCloudUnorg.Intensity->size[0] != 0) &&
                               (ptCloudUnorg.Intensity->size[1] != 0))) {
    sizes[1] = ptCloudUnorg.Intensity->size[1];
  } else {
    sizes[1] = 0;
  }
  ntilerows = dataIn->size[0] * dataIn->size[1];
  dataIn->size[0] = colIdx;
  dataIn->size[1] = input_sizes_idx_1 + sizes[1];
  emxEnsureCapacity_real32_T(dataIn, ntilerows, &m_emlrtRTEI);
  rowreps = input_sizes_idx_1;
  for (ntilerows = 0; ntilerows < rowreps; ntilerows++) {
    for (rowIdx = 0; rowIdx < colIdx; rowIdx++) {
      dataIn->data[rowIdx + dataIn->size[0] * ntilerows] =
          ptCloudUnorg.Location->data[rowIdx + colIdx * ntilerows];
    }
  }
  rowreps = sizes[1];
  for (ntilerows = 0; ntilerows < rowreps; ntilerows++) {
    for (rowIdx = 0; rowIdx < colIdx; rowIdx++) {
      dataIn->data[rowIdx + dataIn->size[0] * (ntilerows + input_sizes_idx_1)] =
          ptCloudUnorg.Intensity->data[rowIdx + colIdx * ntilerows];
    }
  }
  pointpillardetect_kernel15<<<dim3(108U, 1U, 1U), dim3(224U, 1U, 1U)>>>(
      *gpu_pillarIndices);
  pointpillardetect_kernel16<<<dim3(21094U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
      *gpu_dlPillarFeatures_Data);
  checkCudaError(cudaMemcpy(SD->f3.cpu_dlPillarFeatures_Data,
                            *gpu_dlPillarFeatures_Data, 43200000UL,
                            cudaMemcpyDeviceToHost),
                 __FILE__, __LINE__);
  checkCudaError(cudaMemcpy(cpu_pillarIndices, *gpu_pillarIndices, 96000UL,
                            cudaMemcpyDeviceToHost),
                 __FILE__, __LINE__);
  createPillarsImplSingle(&SD->f3.cpu_dlPillarFeatures_Data[0],
                          &cpu_pillarIndices[0], &dataIn->data[0],
                          dataIn->size[0], 100, 12000, 0.16F, 0.16F, 0.0F,
                          69.12F, -39.68F, 39.68F, -5.0F, 5.0F);
  checkCudaError(cudaMemcpy(*gpu_pillarIndices, cpu_pillarIndices, 96000UL,
                            cudaMemcpyHostToDevice),
                 __FILE__, __LINE__);
  checkCudaError(cudaMemcpy(*gpu_dlPillarFeatures_Data,
                            SD->f3.cpu_dlPillarFeatures_Data, 43200000UL,
                            cudaMemcpyHostToDevice),
                 __FILE__, __LINE__);
  coder::internal::dlnetwork_predict(
      pointPillarObj.Network, *gpu_pillarIndices, *gpu_dlPillarFeatures_Data,
      *gpu_fv1, *gpu_fv2, *gpu_predOcc, *gpu_predClassification,
      *gpu_this_workspace_predHeading, *gpu_predAngle);
  location_outdatedOnGpu = true;
  indices_outdatedOnCpu = true;
  pointpillardetect_kernel17<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(
      gpu_r1, gpu_r, dv1[0], dv1[1], dv1[2], dv1[3], dv1[4], dv1[5], dv1[6],
      dv1[7], dv1[8], dv1[9], dv[0], dv[1], dv[2], dv[3], dv[4], dv[5], dv[6],
      dv[7], dv[8], dv[9]);
  checkCudaError(cudaMemcpy(&cpu_r, gpu_r, 80UL, cudaMemcpyDeviceToHost),
                 __FILE__, __LINE__);
  rv[0] = cpu_r;
  checkCudaError(cudaMemcpy(&cpu_r1, gpu_r1, 80UL, cudaMemcpyDeviceToHost),
                 __FILE__, __LINE__);
  rv[1] = cpu_r1;
  pointpillardetect_kernel18<<<dim3(419U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
      *gpu_sparseVoxelMap);
  rowreps = 0;
  for (k = 0; k < 24000; k++) {
    if (cpu_pillarIndices[k] != 0.0F) {
      rowreps++;
    }
  }
  numPillars = static_cast<real_T>(rowreps) / 2.0;
  if (numPillars < 1.0) {
    rowreps = 0;
  } else {
    rowreps = static_cast<int32_T>(numPillars);
  }
  mwGetLaunchParameters1D(computeNumIters(rowreps - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillardetect_kernel19<<<grid, block>>>(*gpu_pillarIndices, rowreps - 1,
                                                *gpu_iv2_data);
  }
  mwGetLaunchParameters1D(computeNumIters(rowreps - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillardetect_kernel20<<<grid, block>>>(*gpu_iv2_data, rowreps - 1,
                                                *gpu_sparseVoxelMap);
  }
  mwCallThrustScanNDEdge(&(*gpu_sparseVoxelMap)[0], 432, false, 214272);
  for (rowreps = 0; rowreps < 2; rowreps++) {
    sz[rowreps] = (rowreps << 6) + 432;
  }
  mwCallThrustScanNDOther(&(*gpu_sparseVoxelMap)[0], 2, &sz[0], 1, false,
                          214272, false);
  empty_non_axis_sizes = true;
  rangeData_outdatedOnCpu = false;
  ntilerows = cpu_anchorMask->size[0];
  cpu_anchorMask->size[0] = pointPillarObj.AnchorsBEV->size[0];
  emxEnsureCapacity_real_T(cpu_anchorMask, ntilerows, &m_emlrtRTEI);
  for (ntilerows = 0; ntilerows < pointPillarObj.AnchorsBEV->size[0];
       ntilerows++) {
    cpu_anchorMask->data[ntilerows] = 0.0;
    rangeData_outdatedOnCpu = true;
  }
  colIdx = pointPillarObj.AnchorsBEV->size[0];
  for (k = 0; k < colIdx; k++) {
    real_T xmaxGrid;
    real_T ymaxGrid;
    real_T yminGrid;
    numPillars =
        std::fmax(std::floor(pointPillarObj.AnchorsBEV->data[k] / 0.16), 1.0);
    yminGrid = std::fmax(
        std::floor((pointPillarObj.AnchorsBEV
                        ->data[k + pointPillarObj.AnchorsBEV->size[0]] -
                    -39.68) /
                   0.16),
        1.0);
    xmaxGrid = std::fmin(
        std::floor(pointPillarObj.AnchorsBEV
                       ->data[k + pointPillarObj.AnchorsBEV->size[0] * 2] /
                   0.16),
        432.0);
    ymaxGrid = std::fmin(
        std::floor((pointPillarObj.AnchorsBEV
                        ->data[k + pointPillarObj.AnchorsBEV->size[0] * 3] -
                    -39.68) /
                   0.16),
        496.0);
    if (empty_non_axis_sizes) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_sparseVoxelMap, *gpu_sparseVoxelMap,
                                1714176UL, cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    empty_non_axis_sizes = false;
    cpu_anchorMask->data[k] =
        ((SD->f3
              .cpu_sparseVoxelMap[(static_cast<int32_T>(xmaxGrid) +
                                   432 * (static_cast<int32_T>(ymaxGrid) - 1)) -
                                  1] -
          SD->f3
              .cpu_sparseVoxelMap[(static_cast<int32_T>(xmaxGrid) +
                                   432 * (static_cast<int32_T>(yminGrid) - 1)) -
                                  1]) -
         SD->f3
             .cpu_sparseVoxelMap[(static_cast<int32_T>(numPillars) +
                                  432 * (static_cast<int32_T>(ymaxGrid) - 1)) -
                                 1]) +
        SD->f3.cpu_sparseVoxelMap[(static_cast<int32_T>(numPillars) +
                                   432 * (static_cast<int32_T>(yminGrid) - 1)) -
                                  1];
    rangeData_outdatedOnCpu = true;
  }
  ntilerows = b_cpu_anchorMask->size[0];
  b_cpu_anchorMask->size[0] = cpu_anchorMask->size[0];
  emxEnsureCapacity_boolean_T(b_cpu_anchorMask, ntilerows, &m_emlrtRTEI);
  rowreps = cpu_anchorMask->size[0] - 1;
  mwGetLaunchParameters1D(computeNumIters(rowreps), &grid, &block, 2147483647U);
  gpuEmxEnsureCapacity_real_T(cpu_anchorMask, &gpu_anchorMask,
                              !rangeData_outdatedOnCpu);
  gpuEmxEnsureCapacity_boolean_T(b_cpu_anchorMask, &b_gpu_anchorMask, true);
  if (rangeData_outdatedOnCpu) {
    gpuEmxMemcpyCpuToGpu_real_T(&gpu_anchorMask, cpu_anchorMask);
  }
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillardetect_kernel21<<<grid, block>>>(gpu_anchorMask, rowreps,
                                                b_gpu_anchorMask);
  }
  ibcol = 0;
  for (i = 0; i < 2; i++) {
    ibcol += 2;
  }
  ntilerows = newAnchors->size[0] * newAnchors->size[1];
  newAnchors->size[0] = 1;
  newAnchors->size[1] = ibcol;
  emxEnsureCapacity_cell_wrap_40(newAnchors, ntilerows, &m_emlrtRTEI);
  for (i = 0; i < 2; i++) {
    for (ntilerows = 0; ntilerows < 2; ntilerows++) {
      numPillars = static_cast<real_T>(ntilerows + i * 2) + 1.0;
      for (rowreps = 0; rowreps < 5; rowreps++) {
        newAnchors->data[static_cast<int32_T>(numPillars) - 1].f1[rowreps] =
            rv[i].f1[ntilerows + (rowreps << 1)];
      }
    }
  }
  ntilerows = c_cpu_anchorMask->size[0] * c_cpu_anchorMask->size[1] *
              c_cpu_anchorMask->size[2];
  c_cpu_anchorMask->size[0] = ibcol;
  c_cpu_anchorMask->size[1] = 216;
  c_cpu_anchorMask->size[2] = 248;
  emxEnsureCapacity_boolean_T(c_cpu_anchorMask, ntilerows, &m_emlrtRTEI);
  rowreps = ibcol * 216 * 248 - 1;
  mwGetLaunchParameters1D(computeNumIters(rowreps), &grid, &block, 2147483647U);
  gpuEmxEnsureCapacity_boolean_T(c_cpu_anchorMask, &c_gpu_anchorMask, true);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillardetect_kernel22<<<grid, block>>>(gpu_anchorMask, rowreps,
                                                c_gpu_anchorMask);
  }
  empty_non_axis_sizes = true;
  if (c_cpu_anchorMask->size[0] != 0) {
    rowreps = 0;
    k = 0;
    exitg1 = false;
    while ((!exitg1) && (k + 1 < 4)) {
      if (c_cpu_anchorMask->size[dv8[k] - 1] != 1) {
        if (rowreps > dv8[k]) {
          empty_non_axis_sizes = false;
          exitg1 = true;
        } else {
          rowreps = dv8[k];
          k++;
        }
      } else {
        k++;
      }
    }
  }
  if (empty_non_axis_sizes) {
    ntilerows = d_cpu_anchorMask->size[0] * d_cpu_anchorMask->size[1] *
                d_cpu_anchorMask->size[2];
    d_cpu_anchorMask->size[0] = 216;
    d_cpu_anchorMask->size[1] = 248;
    d_cpu_anchorMask->size[2] = c_cpu_anchorMask->size[0];
    emxEnsureCapacity_boolean_T(d_cpu_anchorMask, ntilerows, &m_emlrtRTEI);
    rowreps = 53568 * c_cpu_anchorMask->size[0] - 1;
    mwGetLaunchParameters1D(computeNumIters(rowreps), &grid, &block,
                            2147483647U);
    gpuEmxEnsureCapacity_boolean_T(d_cpu_anchorMask, &d_gpu_anchorMask, true);
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillardetect_kernel23<<<grid, block>>>(b_gpu_anchorMask, rowreps,
                                                  d_gpu_anchorMask);
    }
  } else {
    ntilerows = d_cpu_anchorMask->size[0] * d_cpu_anchorMask->size[1] *
                d_cpu_anchorMask->size[2];
    d_cpu_anchorMask->size[0] = 216;
    d_cpu_anchorMask->size[1] = 248;
    d_cpu_anchorMask->size[2] = c_cpu_anchorMask->size[0];
    emxEnsureCapacity_boolean_T(d_cpu_anchorMask, ntilerows, &q_emlrtRTEI);
    mwGetLaunchParameters1D(computeNumIters(247, 215, ibcol - 1), &grid, &block,
                            2147483647U);
    gpuEmxEnsureCapacity_boolean_T(d_cpu_anchorMask, &d_gpu_anchorMask, true);
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillardetect_kernel61<<<grid, block>>>(b_gpu_anchorMask,
                                                  static_cast<uint8_T>(ibcol),
                                                  ibcol - 1, d_gpu_anchorMask);
    }
  }
  if (d_cpu_anchorMask->size[2] == 4) {
    pointpillardetect_kernel24<<<dim3(419U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
        d_gpu_anchorMask, threshold, *gpu_predOcc, *gpu_x);
    empty_non_axis_sizes = true;
  } else {
    checkCudaError(cudaMemcpy(SD->f3.cpu_predOcc, *gpu_predOcc, 857088UL,
                              cudaMemcpyDeviceToHost),
                   __FILE__, __LINE__);
    gpuEmxMemcpyGpuToCpu_boolean_T(d_cpu_anchorMask, &d_gpu_anchorMask);
    binary_expand_op(SD->f3.cpu_x, SD->f3.cpu_predOcc, threshold,
                     d_cpu_anchorMask);
    empty_non_axis_sizes = false;
  }
  rowIdx = 0;
  normals_outdatedOnGpu = false;
  colIdx = 1;
  exitg1 = false;
  while ((!exitg1) && (colIdx < 214273)) {
    if (empty_non_axis_sizes) {
      checkCudaError(
          cudaMemcpy(SD->f3.cpu_x, *gpu_x, 214272UL, cudaMemcpyDeviceToHost),
          __FILE__, __LINE__);
    }
    empty_non_axis_sizes = false;
    if (SD->f3.cpu_x[colIdx - 1]) {
      rowIdx++;
      SD->f3.cpu_ii_data[rowIdx - 1] = colIdx;
      normals_outdatedOnGpu = true;
      if (rowIdx >= 214272) {
        exitg1 = true;
      } else {
        colIdx++;
      }
    } else {
      colIdx++;
    }
  }
  if (rowIdx < 1) {
    k = 0;
  } else {
    k = rowIdx;
  }
  mwGetLaunchParameters1D(computeNumIters(k - 1), &grid, &block, 2147483647U);
  if (normals_outdatedOnGpu) {
    checkCudaError(cudaMemcpy(*gpu_ii_data, SD->f3.cpu_ii_data, 857088UL,
                              cudaMemcpyHostToDevice),
                   __FILE__, __LINE__);
  }
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillardetect_kernel25<<<grid, block>>>(*gpu_ii_data, k - 1,
                                                *gpu_v1_data);
  }
  mwGetLaunchParameters1D(computeNumIters(k - 1), &grid, &block, 2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillardetect_kernel26<<<grid, block>>>(*gpu_v1_data, k - 1,
                                                *gpu_vk_data);
  }
  mwGetLaunchParameters1D(computeNumIters(k - 1), &grid, &block, 2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillardetect_kernel27<<<grid, block>>>(
        *gpu_vk_data, k - 1, *gpu_v1_data, *gpu_varargout_6_data);
  }
  normals_outdatedOnGpu = true;
  mwGetLaunchParameters1D(computeNumIters(k - 1), &grid, &block, 2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillardetect_kernel28<<<grid, block>>>(*gpu_v1_data, k - 1,
                                                *gpu_vk_data);
  }
  mwGetLaunchParameters1D(computeNumIters(k - 1), &grid, &block, 2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillardetect_kernel29<<<grid, block>>>(*gpu_vk_data, k - 1,
                                                *gpu_v1_data);
  }
  mwGetLaunchParameters1D(computeNumIters(k - 1), &grid, &block, 2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillardetect_kernel30<<<grid, block>>>(
        *gpu_vk_data, *gpu_v1_data, k - 1, *gpu_col_data, *gpu_ii_data);
  }
  value_outdatedOnGpu = true;
  location_outdatedOnCpu = true;
  mwGetLaunchParameters1D(computeNumIters(k - 1), &grid, &block, 2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillardetect_kernel31<<<grid, block>>>(
        *gpu_predOcc, *gpu_varargout_6_data, *gpu_col_data, *gpu_ii_data, k - 1,
        *gpu_yCen_data, *gpu_xCen_data, *gpu_confScore_data);
  }
  rangeData_outdatedOnCpu = true;
  rangeData_outdatedOnGpu = true;
  for (itilerow = 0; itilerow < k; itilerow++) {
    if (normals_outdatedOnGpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_varargout_6_data,
                                *gpu_varargout_6_data, 214272UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    normals_outdatedOnGpu = false;
    input_sizes_idx_1 = SD->f3.cpu_varargout_6_data[itilerow];
    if (location_outdatedOnGpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_fv2, *gpu_fv2, 2571264UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    location_outdatedOnGpu = false;
    if (value_outdatedOnGpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_ii_data, *gpu_ii_data, 857088UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    value_outdatedOnGpu = false;
    if (location_outdatedOnCpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_col_data, *gpu_col_data, 428544UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    location_outdatedOnCpu = false;
    if (rangeData_outdatedOnCpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_xCen_data, *gpu_xCen_data, 1714176UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    rangeData_outdatedOnCpu = false;
    SD->f3.cpu_xGt_data[itilerow] =
        SD->f3.cpu_fv2[((SD->f3.cpu_ii_data[itilerow] +
                         216 * (SD->f3.cpu_col_data[itilerow] - 1)) +
                        53568 * (input_sizes_idx_1 - 1)) -
                       1] *
            static_cast<real32_T>(
                std::sqrt(newAnchors->data[input_sizes_idx_1 - 1].f1[0] *
                              newAnchors->data[input_sizes_idx_1 - 1].f1[0] +
                          newAnchors->data[input_sizes_idx_1 - 1].f1[1] *
                              newAnchors->data[input_sizes_idx_1 - 1].f1[1])) +
        static_cast<real32_T>(SD->f3.cpu_xCen_data[itilerow]);
    xGt_data_outdatedOnGpu = true;
  }
  for (itilerow = 0; itilerow < k; itilerow++) {
    if (normals_outdatedOnGpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_varargout_6_data,
                                *gpu_varargout_6_data, 214272UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    normals_outdatedOnGpu = false;
    input_sizes_idx_1 = SD->f3.cpu_varargout_6_data[itilerow];
    if (location_outdatedOnGpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_fv2, *gpu_fv2, 2571264UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    location_outdatedOnGpu = false;
    if (value_outdatedOnGpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_ii_data, *gpu_ii_data, 857088UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    value_outdatedOnGpu = false;
    if (location_outdatedOnCpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_col_data, *gpu_col_data, 428544UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    location_outdatedOnCpu = false;
    if (rangeData_outdatedOnGpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_yCen_data, *gpu_yCen_data, 1714176UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    rangeData_outdatedOnGpu = false;
    SD->f3.cpu_yGt_data[itilerow] =
        SD->f3.cpu_fv2[(((SD->f3.cpu_ii_data[itilerow] +
                          216 * (SD->f3.cpu_col_data[itilerow] - 1)) +
                         53568 * (input_sizes_idx_1 - 1)) +
                        53568 * ibcol) -
                       1] *
            static_cast<real32_T>(
                std::sqrt(newAnchors->data[input_sizes_idx_1 - 1].f1[0] *
                              newAnchors->data[input_sizes_idx_1 - 1].f1[0] +
                          newAnchors->data[input_sizes_idx_1 - 1].f1[1] *
                              newAnchors->data[input_sizes_idx_1 - 1].f1[1])) +
        static_cast<real32_T>(SD->f3.cpu_yCen_data[itilerow]);
    yGt_data_outdatedOnGpu = true;
  }
  for (itilerow = 0; itilerow < k; itilerow++) {
    if (normals_outdatedOnGpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_varargout_6_data,
                                *gpu_varargout_6_data, 214272UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    normals_outdatedOnGpu = false;
    input_sizes_idx_1 = SD->f3.cpu_varargout_6_data[itilerow];
    if (location_outdatedOnGpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_fv2, *gpu_fv2, 2571264UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    location_outdatedOnGpu = false;
    if (value_outdatedOnGpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_ii_data, *gpu_ii_data, 857088UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    value_outdatedOnGpu = false;
    if (location_outdatedOnCpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_col_data, *gpu_col_data, 428544UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    location_outdatedOnCpu = false;
    SD->f3.cpu_zGt_data[itilerow] =
        SD->f3.cpu_fv2[(((SD->f3.cpu_ii_data[itilerow] +
                          216 * (SD->f3.cpu_col_data[itilerow] - 1)) +
                         53568 * (input_sizes_idx_1 - 1)) +
                        53568 * ibcol * 2) -
                       1] *
            static_cast<real32_T>(
                newAnchors->data[input_sizes_idx_1 - 1].f1[2]) +
        static_cast<real32_T>(newAnchors->data[input_sizes_idx_1 - 1].f1[3]);
    zGt_data_outdatedOnGpu = true;
  }
  for (itilerow = 0; itilerow < k; itilerow++) {
    if (normals_outdatedOnGpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_varargout_6_data,
                                *gpu_varargout_6_data, 214272UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    normals_outdatedOnGpu = false;
    input_sizes_idx_1 = SD->f3.cpu_varargout_6_data[itilerow];
    if (indices_outdatedOnCpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_fv1, *gpu_fv1, 2571264UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    indices_outdatedOnCpu = false;
    if (value_outdatedOnGpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_ii_data, *gpu_ii_data, 857088UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    value_outdatedOnGpu = false;
    if (location_outdatedOnCpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_col_data, *gpu_col_data, 428544UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    location_outdatedOnCpu = false;
    SD->f3.cpu_lGt_data[itilerow] =
        std::exp(SD->f3.cpu_fv1[((SD->f3.cpu_ii_data[itilerow] +
                                  216 * (SD->f3.cpu_col_data[itilerow] - 1)) +
                                 53568 * (input_sizes_idx_1 - 1)) -
                                1]) *
        static_cast<real32_T>(newAnchors->data[input_sizes_idx_1 - 1].f1[0]);
    lGt_data_outdatedOnGpu = true;
  }
  for (itilerow = 0; itilerow < k; itilerow++) {
    if (normals_outdatedOnGpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_varargout_6_data,
                                *gpu_varargout_6_data, 214272UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    normals_outdatedOnGpu = false;
    input_sizes_idx_1 = SD->f3.cpu_varargout_6_data[itilerow];
    if (indices_outdatedOnCpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_fv1, *gpu_fv1, 2571264UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    indices_outdatedOnCpu = false;
    if (value_outdatedOnGpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_ii_data, *gpu_ii_data, 857088UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    value_outdatedOnGpu = false;
    if (location_outdatedOnCpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_col_data, *gpu_col_data, 428544UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    location_outdatedOnCpu = false;
    SD->f3.cpu_wGt_data[itilerow] =
        std::exp(SD->f3.cpu_fv1[(((SD->f3.cpu_ii_data[itilerow] +
                                   216 * (SD->f3.cpu_col_data[itilerow] - 1)) +
                                  53568 * (input_sizes_idx_1 - 1)) +
                                 53568 * ibcol) -
                                1]) *
        static_cast<real32_T>(newAnchors->data[input_sizes_idx_1 - 1].f1[1]);
    wGt_data_outdatedOnGpu = true;
  }
  for (itilerow = 0; itilerow < k; itilerow++) {
    if (normals_outdatedOnGpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_varargout_6_data,
                                *gpu_varargout_6_data, 214272UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    normals_outdatedOnGpu = false;
    input_sizes_idx_1 = SD->f3.cpu_varargout_6_data[itilerow];
    if (indices_outdatedOnCpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_fv1, *gpu_fv1, 2571264UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    indices_outdatedOnCpu = false;
    if (value_outdatedOnGpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_ii_data, *gpu_ii_data, 857088UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    value_outdatedOnGpu = false;
    if (location_outdatedOnCpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_col_data, *gpu_col_data, 428544UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    location_outdatedOnCpu = false;
    SD->f3.cpu_hGt_data[itilerow] =
        std::exp(SD->f3.cpu_fv1[(((SD->f3.cpu_ii_data[itilerow] +
                                   216 * (SD->f3.cpu_col_data[itilerow] - 1)) +
                                  53568 * (input_sizes_idx_1 - 1)) +
                                 53568 * ibcol * 2) -
                                1]) *
        static_cast<real32_T>(newAnchors->data[input_sizes_idx_1 - 1].f1[2]);
    hGt_data_outdatedOnGpu = true;
  }
  mwGetLaunchParameters1D(computeNumIters(k - 1), &grid, &block, 2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillardetect_kernel32<<<grid, block>>>(
        *gpu_this_workspace_predHeading, *gpu_varargout_6_data, *gpu_col_data,
        *gpu_ii_data, k - 1, *gpu_hdGt_data);
  }
  mwGetLaunchParameters1D(computeNumIters(k - 1), &grid, &block, 2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillardetect_kernel33<<<grid, block>>>(k - 1, *gpu_hdGt_data);
  }
  mwGetLaunchParameters1D(computeNumIters(k - 1), &grid, &block, 2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillardetect_kernel34<<<grid, block>>>(k - 1, *gpu_hdGt_data);
  }
  empty_non_axis_sizes = true;
  pointpillardetect_kernel35<<<dim3(419U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
      *gpu_predAngle);
  rangeData_outdatedOnCpu = true;
  for (itilerow = 0; itilerow < k; itilerow++) {
    if (normals_outdatedOnGpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_varargout_6_data,
                                *gpu_varargout_6_data, 214272UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    normals_outdatedOnGpu = false;
    input_sizes_idx_1 = SD->f3.cpu_varargout_6_data[itilerow];
    if (empty_non_axis_sizes) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_hdGt_data, *gpu_hdGt_data, 857088UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    empty_non_axis_sizes = false;
    if (rangeData_outdatedOnCpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_predAngle, *gpu_predAngle, 857088UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    rangeData_outdatedOnCpu = false;
    if (value_outdatedOnGpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_ii_data, *gpu_ii_data, 857088UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    value_outdatedOnGpu = false;
    if (location_outdatedOnCpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_col_data, *gpu_col_data, 428544UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    location_outdatedOnCpu = false;
    SD->f3.cpu_angGt_data[itilerow] =
        SD->f3.cpu_hdGt_data[itilerow] *
            std::asin(
                SD->f3.cpu_predAngle[((SD->f3.cpu_ii_data[itilerow] +
                                       216 * (SD->f3.cpu_col_data[itilerow] -
                                              1)) +
                                      53568 * (input_sizes_idx_1 - 1)) -
                                     1]) +
        static_cast<real32_T>(newAnchors->data[input_sizes_idx_1 - 1].f1[4]);
    angGt_data_outdatedOnGpu = true;
  }
  mwGetLaunchParameters1D(computeNumIters(k - 1), &grid, &block, 2147483647U);
  if (angGt_data_outdatedOnGpu) {
    checkCudaError(cudaMemcpy(*gpu_angGt_data, SD->f3.cpu_angGt_data, 857088UL,
                              cudaMemcpyHostToDevice),
                   __FILE__, __LINE__);
  }
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillardetect_kernel36<<<grid, block>>>(k - 1, *gpu_angGt_data);
  }
  mwGetLaunchParameters1D(computeNumIters(k - 1), &grid, &block, 2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillardetect_kernel37<<<grid, block>>>(k - 1, *gpu_angGt_data);
  }
  colIdx = 53568 * ibcol;
  if (colIdx > 0) {
    colIdx = 428544 / colIdx;
    ntilerows = cpu_clsMat->size[0] * cpu_clsMat->size[1];
    cpu_clsMat->size[0] = k;
    cpu_clsMat->size[1] = colIdx;
    emxEnsureCapacity_real_T(cpu_clsMat, ntilerows, &m_emlrtRTEI);
    rowreps = k * colIdx - 1;
    mwGetLaunchParameters1D(computeNumIters(rowreps), &grid, &block,
                            2147483647U);
    gpuEmxEnsureCapacity_real_T(cpu_clsMat, &gpu_clsMat, true);
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillardetect_kernel38<<<grid, block>>>(rowreps, gpu_clsMat);
    }
    mwGetLaunchParameters1D(computeNumIters(k - 1), &grid, &block, 2147483647U);
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillardetect_kernel39<<<grid, block>>>(
          *gpu_predClassification, ibcol, *gpu_varargout_6_data, *gpu_col_data,
          *gpu_ii_data, k - 1, gpu_clsMat, cpu_clsMat->size[1U],
          cpu_clsMat->size[0U]);
    }
    ibcol = cpu_clsMat->size[0];
    rowreps = cpu_clsMat->size[0] - 1;
    mwGetLaunchParameters1D(computeNumIters(rowreps), &grid, &block,
                            2147483647U);
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillardetect_kernel40<<<grid, block>>>(rowreps, *gpu_ii_data);
    }
    if (cpu_clsMat->size[0] != 0) {
      rowreps = cpu_clsMat->size[1];
      colIdx = cpu_clsMat->size[0];
      rowIdx = cpu_clsMat->size[0] * (cpu_clsMat->size[1] - 1);
      mwGetLaunchParameters1D(computeNumIters(colIdx - 1), &grid, &block,
                              2147483647U);
      validLaunchParams = mwValidateLaunchParameters(grid, block);
      if (validLaunchParams) {
        pointpillardetect_kernel41<<<grid, block>>>(
            rowreps, gpu_clsMat, rowIdx, colIdx, colIdx - 1, *gpu_ii_data,
            *gpu_xCen_data);
      }
    }
    mwGetLaunchParameters1D(computeNumIters(ibcol - 1), &grid, &block,
                            2147483647U);
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillardetect_kernel42<<<grid, block>>>(*gpu_ii_data, ibcol - 1,
                                                  *gpu_yCen_data);
    }
  } else {
    mwGetLaunchParameters1D(computeNumIters(k - 1), &grid, &block, 2147483647U);
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillardetect_kernel55<<<grid, block>>>(
          *gpu_predClassification, *gpu_varargout_6_data, *gpu_col_data,
          *gpu_ii_data, k - 1, *gpu_varargout_1_data);
    }
    mwGetLaunchParameters1D(computeNumIters(k - 1), &grid, &block, 2147483647U);
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillardetect_kernel56<<<grid, block>>>(*gpu_varargout_1_data, k - 1,
                                                  *gpu_xCen_data);
    }
    mwGetLaunchParameters1D(computeNumIters(k - 1), &grid, &block, 2147483647U);
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillardetect_kernel57<<<grid, block>>>(k - 1, *gpu_xCen_data);
    }
    mwGetLaunchParameters1D(computeNumIters(k - 1), &grid, &block, 2147483647U);
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillardetect_kernel58<<<grid, block>>>(*gpu_xCen_data, k - 1,
                                                  *gpu_yCen_data);
    }
    mwGetLaunchParameters1D(computeNumIters(k - 1), &grid, &block, 2147483647U);
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillardetect_kernel59<<<grid, block>>>(threshold, k - 1,
                                                  *gpu_yCen_data);
    }
    mwGetLaunchParameters1D(computeNumIters(k - 1), &grid, &block, 2147483647U);
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillardetect_kernel60<<<grid, block>>>(threshold, k - 1,
                                                  *gpu_yCen_data);
    }
  }
  mwGetLaunchParameters1D(computeNumIters(k - 1), &grid, &block, 2147483647U);
  if (hGt_data_outdatedOnGpu) {
    checkCudaError(cudaMemcpy(*gpu_hGt_data, SD->f3.cpu_hGt_data, 857088UL,
                              cudaMemcpyHostToDevice),
                   __FILE__, __LINE__);
  }
  if (wGt_data_outdatedOnGpu) {
    checkCudaError(cudaMemcpy(*gpu_wGt_data, SD->f3.cpu_wGt_data, 857088UL,
                              cudaMemcpyHostToDevice),
                   __FILE__, __LINE__);
  }
  if (lGt_data_outdatedOnGpu) {
    checkCudaError(cudaMemcpy(*gpu_lGt_data, SD->f3.cpu_lGt_data, 857088UL,
                              cudaMemcpyHostToDevice),
                   __FILE__, __LINE__);
  }
  if (zGt_data_outdatedOnGpu) {
    checkCudaError(cudaMemcpy(*gpu_zGt_data, SD->f3.cpu_zGt_data, 857088UL,
                              cudaMemcpyHostToDevice),
                   __FILE__, __LINE__);
  }
  if (yGt_data_outdatedOnGpu) {
    checkCudaError(cudaMemcpy(*gpu_yGt_data, SD->f3.cpu_yGt_data, 857088UL,
                              cudaMemcpyHostToDevice),
                   __FILE__, __LINE__);
  }
  if (xGt_data_outdatedOnGpu) {
    checkCudaError(cudaMemcpy(*gpu_xGt_data, SD->f3.cpu_xGt_data, 857088UL,
                              cudaMemcpyHostToDevice),
                   __FILE__, __LINE__);
  }
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillardetect_kernel43<<<grid, block>>>(
        *gpu_yCen_data, *gpu_confScore_data, *gpu_angGt_data, *gpu_hGt_data,
        *gpu_wGt_data, *gpu_lGt_data, *gpu_zGt_data, *gpu_yGt_data, k,
        *gpu_xGt_data, k - 1, *gpu_boxPreds_data);
  }
  if (k != 0) {
    mwGetLaunchParameters1D(computeNumIters(k - 1), &grid, &block, 2147483647U);
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillardetect_kernel44<<<grid, block>>>(*gpu_boxPreds_data, k, k - 1,
                                                  *gpu_x_data);
    }
    empty_non_axis_sizes = true;
    rowIdx = 0;
    normals_outdatedOnGpu = false;
    itilerow = k;
    colIdx = 1;
    exitg1 = false;
    while ((!exitg1) && (colIdx <= k)) {
      if (empty_non_axis_sizes) {
        checkCudaError(cudaMemcpy(SD->f3.cpu_x_data, *gpu_x_data, 214272UL,
                                  cudaMemcpyDeviceToHost),
                       __FILE__, __LINE__);
      }
      empty_non_axis_sizes = false;
      if (SD->f3.cpu_x_data[colIdx - 1]) {
        rowIdx++;
        SD->f3.cpu_ii_data[rowIdx - 1] = colIdx;
        normals_outdatedOnGpu = true;
        if (rowIdx >= k) {
          exitg1 = true;
        } else {
          colIdx++;
        }
      } else {
        colIdx++;
      }
    }
    if (k == 1) {
      if (rowIdx == 0) {
        normals_outdatedOnGpu = false;
        itilerow = 0;
      }
    } else if (rowIdx < 1) {
      itilerow = 0;
    } else {
      itilerow = rowIdx;
    }
    mwGetLaunchParameters1D(computeNumIters(k - 1), &grid, &block, 2147483647U);
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillardetect_kernel45<<<grid, block>>>(k, k - 1, *gpu_boxPreds_data);
    }
    if (itilerow != 0) {
      int32_T selectedIndex_size[1];
      scores_size[0] = itilerow;
      mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                              2147483647U);
      if (normals_outdatedOnGpu) {
        checkCudaError(cudaMemcpy(*gpu_ii_data, SD->f3.cpu_ii_data, 857088UL,
                                  cudaMemcpyHostToDevice),
                       __FILE__, __LINE__);
      }
      validLaunchParams = mwValidateLaunchParameters(grid, block);
      if (validLaunchParams) {
        pointpillardetect_kernel46<<<grid, block>>>(
            *gpu_boxPreds_data, k, *gpu_ii_data, itilerow - 1, *gpu_hdGt_data,
            gpu_scores_data);
      }
      rangeData_outdatedOnCpu = true;
      colIdx = 2;
      if (itilerow != 1) {
        colIdx = 1;
      }
      sz[0] = itilerow;
      sz[1] = 1;
      rowreps = scores_size[0] - 1;
      mwGetLaunchParameters1D(computeNumIters(rowreps), &grid, &block,
                              2147483647U);
      validLaunchParams = mwValidateLaunchParameters(grid, block);
      if (validLaunchParams) {
        pointpillardetect_kernel47<<<grid, block>>>(
            gpu_scores_data, rowreps, *gpu_xCen_data, *gpu_varargout_1_data);
      }
      gpu_thrust_sort_with_index(&(*gpu_varargout_1_data)[0],
                                 &(*gpu_xCen_data)[0], 2, &sz[0], colIdx, 'd',
                                 false);
      boxPreds_size[0] = itilerow;
      boxPreds_size[1] = 5;
      mwGetLaunchParameters1D(computeNumIters(4, itilerow - 1), &grid, &block,
                              2147483647U);
      validLaunchParams = mwValidateLaunchParameters(grid, block);
      if (validLaunchParams) {
        pointpillardetect_kernel48<<<grid, block>>>(
            *gpu_boxPreds_data, k, *gpu_ii_data, *gpu_xCen_data, itilerow,
            itilerow - 1, *b_gpu_boxPreds_data, iv23[0], iv23[1], iv23[2],
            iv23[3], iv23[4]);
      }
      mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                              2147483647U);
      validLaunchParams = mwValidateLaunchParameters(grid, block);
      if (validLaunchParams) {
        pointpillardetect_kernel49<<<grid, block>>>(
            *gpu_hdGt_data, *gpu_xCen_data, itilerow - 1,
            *gpu_varargout_1_data);
      }
      checkCudaError(cudaMemcpy(SD->f3.cpu_boxPreds_data, *b_gpu_boxPreds_data,
                                4285440UL, cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
      checkCudaError(cudaMemcpy(SD->f3.cpu_xGt_data, *gpu_varargout_1_data,
                                857088UL, cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
      coder::b_selectStrongestBboxCodegen(
          SD, SD->f3.cpu_boxPreds_data, boxPreds_size, SD->f3.cpu_xGt_data,
          SD->f3.cpu_selectedIndex_data, selectedIndex_size);
      mwGetLaunchParameters1D(computeNumIters(selectedIndex_size[0] - 1), &grid,
                              &block, 2147483647U);
      checkCudaError(cudaMemcpy(*gpu_selectedIndex_data,
                                SD->f3.cpu_selectedIndex_data, 214272UL,
                                cudaMemcpyHostToDevice),
                     __FILE__, __LINE__);
      validLaunchParams = mwValidateLaunchParameters(grid, block);
      if (validLaunchParams) {
        pointpillardetect_kernel50<<<grid, block>>>(
            *gpu_selectedIndex_data, selectedIndex_size[0] - 1, *gpu_x_data);
      }
      mwGetLaunchParameters1D(computeNumIters(selectedIndex_size[0] - 1), &grid,
                              &block, 2147483647U);
      validLaunchParams = mwValidateLaunchParameters(grid, block);
      if (validLaunchParams) {
        pointpillardetect_kernel51<<<grid, block>>>(*gpu_x_data, *gpu_xCen_data,
                                                    selectedIndex_size[0] - 1,
                                                    *gpu_selectedIndex_data);
      }
      rangeData_outdatedOnGpu = true;
      rowIdx = selectedIndex_size[0] - 1;
      rowreps = 0;
      colIdx = 0;
      for (i = 0; i <= rowIdx; i++) {
        if (rangeData_outdatedOnGpu) {
          checkCudaError(cudaMemcpy(SD->f3.cpu_selectedIndex_data,
                                    *gpu_selectedIndex_data, 214272UL,
                                    cudaMemcpyDeviceToHost),
                         __FILE__, __LINE__);
        }
        rangeData_outdatedOnGpu = false;
        if (SD->f3.cpu_selectedIndex_data[i]) {
          rowreps++;
          if (rangeData_outdatedOnCpu) {
            checkCudaError(cudaMemcpy(cpu_scores_data, gpu_scores_data,
                                      static_cast<uint32_T>(scores_size[0]) *
                                          sizeof(real32_T),
                                      cudaMemcpyDeviceToHost),
                           __FILE__, __LINE__);
          }
          cpu_scores_data[colIdx] = cpu_scores_data[i];
          rangeData_outdatedOnCpu = false;
          colIdx++;
        }
      }
      scores_size[0] = rowreps;
      ibcol = selectedIndex_size[0];
      rowIdx = 0;
      normals_outdatedOnGpu = false;
      itilerow = selectedIndex_size[0];
      colIdx = 1;
      exitg1 = false;
      while ((!exitg1) && (colIdx <= ibcol)) {
        if (rangeData_outdatedOnGpu) {
          checkCudaError(cudaMemcpy(SD->f3.cpu_selectedIndex_data,
                                    *gpu_selectedIndex_data, 214272UL,
                                    cudaMemcpyDeviceToHost),
                         __FILE__, __LINE__);
        }
        rangeData_outdatedOnGpu = false;
        if (SD->f3.cpu_selectedIndex_data[colIdx - 1]) {
          rowIdx++;
          SD->f3.cpu_ii_data[rowIdx - 1] = colIdx;
          normals_outdatedOnGpu = true;
          if (rowIdx >= ibcol) {
            exitg1 = true;
          } else {
            colIdx++;
          }
        } else {
          colIdx++;
        }
      }
      if (selectedIndex_size[0] == 1) {
        if (rowIdx == 0) {
          normals_outdatedOnGpu = false;
          itilerow = 0;
        }
      } else if (rowIdx < 1) {
        itilerow = 0;
      } else {
        itilerow = rowIdx;
      }
      bboxes_size[0] = itilerow;
      bboxes_size[1] = 9;
      rowreps = itilerow * 9 - 1;
      mwGetLaunchParameters1D(computeNumIters(rowreps), &grid, &block,
                              2147483647U);
      validLaunchParams = mwValidateLaunchParameters(grid, block);
      if (validLaunchParams) {
        pointpillardetect_kernel52<<<grid, block>>>(rowreps, gpu_bboxes_data);
      }
      mwGetLaunchParameters1D(computeNumIters(6, itilerow - 1), &grid, &block,
                              2147483647U);
      if (normals_outdatedOnGpu) {
        checkCudaError(cudaMemcpy(*gpu_ii_data, SD->f3.cpu_ii_data, 857088UL,
                                  cudaMemcpyHostToDevice),
                       __FILE__, __LINE__);
      }
      validLaunchParams = mwValidateLaunchParameters(grid, block);
      if (validLaunchParams) {
        pointpillardetect_kernel53<<<grid, block>>>(
            *gpu_boxPreds_data, k, *gpu_ii_data, itilerow - 1, gpu_bboxes_data,
            iv27[0], iv27[1], iv27[2], iv27[3], iv27[4], iv27[5], iv27[6],
            bboxes_size[0]);
      }
      empty_non_axis_sizes = true;
      rowIdx = selectedIndex_size[0] - 1;
      rowreps = 0;
      for (i = 0; i <= rowIdx; i++) {
        if (rangeData_outdatedOnGpu) {
          checkCudaError(cudaMemcpy(SD->f3.cpu_selectedIndex_data,
                                    *gpu_selectedIndex_data, 214272UL,
                                    cudaMemcpyDeviceToHost),
                         __FILE__, __LINE__);
        }
        rangeData_outdatedOnGpu = false;
        if (SD->f3.cpu_selectedIndex_data[i]) {
          rowreps++;
        }
      }
      colIdx = 0;
      for (i = 0; i <= rowIdx; i++) {
        if (rangeData_outdatedOnGpu) {
          checkCudaError(cudaMemcpy(SD->f3.cpu_selectedIndex_data,
                                    *gpu_selectedIndex_data, 214272UL,
                                    cudaMemcpyDeviceToHost),
                         __FILE__, __LINE__);
        }
        rangeData_outdatedOnGpu = false;
        if (SD->f3.cpu_selectedIndex_data[i]) {
          SD->f3.cpu_tmp_data[colIdx] = i;
          tmp_data_outdatedOnGpu = true;
          colIdx++;
        }
      }
      mwGetLaunchParameters1D(computeNumIters(rowreps - 1), &grid, &block,
                              2147483647U);
      if (tmp_data_outdatedOnGpu) {
        checkCudaError(cudaMemcpy(*gpu_tmp_data, SD->f3.cpu_tmp_data, 857088UL,
                                  cudaMemcpyHostToDevice),
                       __FILE__, __LINE__);
      }
      validLaunchParams = mwValidateLaunchParameters(grid, block);
      if (validLaunchParams) {
        pointpillardetect_kernel54<<<grid, block>>>(
            *gpu_hdGt_data, *gpu_tmp_data, rowreps - 1, *gpu_varargout_1_data);
      }
      checkCudaError(cudaMemcpy(SD->f3.cpu_xGt_data, *gpu_varargout_1_data,
                                857088UL, cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
      coder::internal::c_returnCategoricalLabels(
          SD, static_cast<real_T>(bboxes_size[0]), SD->f3.cpu_xGt_data,
          labels->codes.data, labels->codes.size, labels->categoryNames.data,
          labels->categoryNames.size);
    } else {
      empty_non_axis_sizes = false;
      bboxes_size[0] = 0;
      bboxes_size[1] = 9;
      rangeData_outdatedOnCpu = false;
      scores_size[0] = 0;
      coder::internal::c_returnCategoricalLabels(SD, labels->codes.size,
                                                 labels->categoryNames.data,
                                                 labels->categoryNames.size);
    }
  } else {
    empty_non_axis_sizes = false;
    bboxes_size[0] = 0;
    bboxes_size[1] = 9;
    rangeData_outdatedOnCpu = false;
    scores_size[0] = 0;
    coder::internal::c_returnCategoricalLabels(SD, labels->codes.size,
                                               labels->categoryNames.data,
                                               labels->categoryNames.size);
  }
  coder::handle_matlabCodegenDestructor(&ptCloudUnorg);
  emlrtHeapReferenceStackLeaveFcnR2012b(emlrtRootTLSGlobal);
  coder::handle_matlabCodegenDestructor(&ptCloud);
  emlrtHeapReferenceStackLeaveFcnR2012b(emlrtRootTLSGlobal);
  emxFree_real_T(&b_cpu_anchors3dMod);
  emxFree_real_T(&b_cpu_anchors);
  emxFree_real_T(&cpu_clsMat);
  emxFree_boolean_T(&d_cpu_anchorMask);
  emxFree_boolean_T(&c_cpu_anchorMask);
  emxFree_cell_wrap_40(&newAnchors);
  emxFree_boolean_T(&b_cpu_anchorMask);
  emxFree_real_T(&cpu_anchorMask);
  emxFree_real32_T(&dataIn);
  emxFree_real_T(&cpu_tmp2);
  emxFree_real_T(&cpu_tmp1);
  emxFree_uint8_T(&cpu_b);
  emxFree_real_T(&cpu_anchorsDim);
  emxFree_real_T(&cpu_anchors3dMod);
  emxFree_real_T(&cpu_tmp);
  emxFree_real32_T(&cpu_rangeData);
  emxFree_real32_T(&cpu_intensity);
  emxFree_real32_T(&cpu_normals);
  emxFree_uint8_T(&cpu_value);
  emxFree_real32_T(&cpu_location);
  emxFree_boolean_T(&cpu_indices);
  emxFreeStruct_pointCloud1(&ptCloudUnorg);
  emxFree_real_T(&cpu_anchors);
  emxFreeStruct_pointCloud(&ptCloud);
  emlrtHeapReferenceStackLeaveFcnR2012b(emlrtRootTLSGlobal);
  if (empty_non_axis_sizes) {
    checkCudaError(
        cudaMemcpy(cpu_bboxes_data, gpu_bboxes_data,
                   static_cast<uint32_T>(bboxes_size[0] * 9) * sizeof(real_T),
                   cudaMemcpyDeviceToHost),
        __FILE__, __LINE__);
  }
  if (rangeData_outdatedOnCpu) {
    checkCudaError(
        cudaMemcpy(cpu_scores_data, gpu_scores_data,
                   static_cast<uint32_T>(scores_size[0]) * sizeof(real32_T),
                   cudaMemcpyDeviceToHost),
        __FILE__, __LINE__);
  }
  checkCudaError(mwCudaFree(gpu_bboxes_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(gpu_scores_data), __FILE__, __LINE__);
  gpuEmxFree_real_T(&gpu_anchors);
  gpuEmxFree_boolean_T(&gpu_indices);
  gpuEmxFree_real32_T(&gpu_location);
  gpuEmxFree_uint8_T(&gpu_value);
  gpuEmxFree_real32_T(&gpu_normals);
  gpuEmxFree_real32_T(&gpu_intensity);
  gpuEmxFree_real32_T(&gpu_rangeData);
  gpuEmxFree_real_T(&b_gpu_tmp);
  gpuEmxFree_real_T(&gpu_anchors3dMod);
  gpuEmxFree_real_T(&gpu_anchorsDim);
  gpuEmxFree_uint8_T(&gpu_b);
  gpuEmxFree_real_T(&gpu_tmp1);
  gpuEmxFree_real_T(&gpu_tmp2);
  gpuEmxFree_real_T(&gpu_anchorMask);
  gpuEmxFree_boolean_T(&b_gpu_anchorMask);
  gpuEmxFree_boolean_T(&c_gpu_anchorMask);
  gpuEmxFree_boolean_T(&d_gpu_anchorMask);
  gpuEmxFree_real_T(&gpu_clsMat);
  gpuEmxFree_real_T(&b_gpu_anchors);
  gpuEmxFree_real_T(&b_gpu_anchors3dMod);
  checkCudaError(mwCudaFree(gpu_r), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(gpu_r1), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_yy), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_xx), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_tmp), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_pillarIndices), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_dlPillarFeatures_Data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_fv1), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_fv2), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_predOcc), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_predClassification), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_this_workspace_predHeading), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaFree(*gpu_predAngle), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_sparseVoxelMap), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_iv2_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_x), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_ii_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_v1_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_vk_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_varargout_6_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_col_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_xCen_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_yCen_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_confScore_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_xGt_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_yGt_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_zGt_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_lGt_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_wGt_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_hGt_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_hdGt_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_angGt_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_varargout_1_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_boxPreds_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_x_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*b_gpu_boxPreds_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_selectedIndex_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_tmp_data), __FILE__, __LINE__);
}

void pointpillardetect_delete()
{
  if (!gobj_0.matlabCodegenIsDeleted) {
    gobj_0.matlabCodegenIsDeleted = true;
    coder::internal::dlnetwork_delete(&gobj_0);
  }
}

void pointpillardetect_emx_free()
{
  c_emxFreeStruct_pointPillarsObj(&pointPillarObj);
}

void pointpillardetect_emx_init()
{
  c_emxInitStruct_pointPillarsObj(&pointPillarObj, &emlrtRTEI, false);
}

void pointpillardetect_init()
{
  pointPillarObj_not_empty = false;
}

void pointpillardetect_new()
{
  gobj_0.matlabCodegenIsDeleted = true;
}

// End of code generation (pointpillardetect.cu)
