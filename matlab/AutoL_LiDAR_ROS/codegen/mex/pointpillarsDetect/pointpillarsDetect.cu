//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// pointpillarsDetect.cu
//
// Code generation for function 'pointpillarsDetect'
//

// Include files
#include "pointpillarsDetect.h"
#include "PointCloudImpl.h"
#include "dlnetwork.h"
#include "handle.h"
#include "pointPillarsObjectDetector.h"
#include "pointpillarsDetect_data.h"
#include "pointpillarsDetect_emxutil.h"
#include "pointpillarsDetect_internal_types.h"
#include "pointpillarsDetect_mexutil.h"
#include "pointpillarsDetect_types.h"
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
struct cell_wrap_40 {
  real_T f1[5];
};

// Variable Definitions
static detector0_0 gobj_0;

static coder::internal::pointPillarsObjectDetector pointPillarObj;

static boolean_T pointPillarObj_not_empty;

static emlrtMCInfo emlrtMCI{
    57,                                                              // lineNo
    5,                                                               // colNo
    "repmat",                                                        // fName
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repmat.m" // pName
};

static emlrtRTEInfo emlrtRTEI{
    85,               // lineNo
    13,               // colNo
    "pointCloudBase", // fName
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" // pName
};

static emlrtRTEInfo b_emlrtRTEI{
    144,              // lineNo
    13,               // colNo
    "pointCloudBase", // fName
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" // pName
};

static emlrtRTEInfo c_emlrtRTEI{
    134,              // lineNo
    13,               // colNo
    "pointCloudBase", // fName
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" // pName
};

static emlrtRTEInfo d_emlrtRTEI{
    139,              // lineNo
    12,               // colNo
    "pointCloudBase", // fName
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" // pName
};

static emlrtRTEInfo e_emlrtRTEI{
    69,                                                              // lineNo
    28,                                                              // colNo
    "repmat",                                                        // fName
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repmat.m" // pName
};

static emlrtRTEInfo f_emlrtRTEI{
    770,              // lineNo
    17,               // colNo
    "pointCloudBase", // fName
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" // pName
};

static emlrtRTEInfo g_emlrtRTEI{
    1,                            // lineNo
    1,                            // colNo
    "pointPillarsObjectDetector", // fName
    "/home/aiv/Documents/MATLAB/SupportPackages/R2024a/toolbox/shared/"
    "dlcoder_base/supportpackages/shared_dl_targets/+coder/+internal"
    "/pointPillarsObjectDetector.p" // pName
};

static emlrtRTEInfo h_emlrtRTEI{
    1,                                                                 // lineNo
    35,                                                                // colNo
    "pointpillarsDetect",                                              // fName
    "/home/aiv/YongJun_ws/matlab/AutoL_LiDAR_ROS/pointpillarsDetect.m" // pName
};

static emlrtRTEInfo i_emlrtRTEI{
    12,                                                                // lineNo
    1,                                                                 // colNo
    "pointpillarsDetect",                                              // fName
    "/home/aiv/YongJun_ws/matlab/AutoL_LiDAR_ROS/pointpillarsDetect.m" // pName
};

static emlrtRTEInfo j_emlrtRTEI{
    770,              // lineNo
    25,               // colNo
    "pointCloudBase", // fName
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" // pName
};

static boolean_T c_gpuConstsCopied_pointpillarsD;

// Function Declarations
static void b_error(const mxArray *m, emlrtMCInfo *location);

static void gpuEmxFree_boolean_T(emxArray_boolean_T *gpu);

static void gpuEmxMemcpyGpuToCpu_real32_T(emxArray_real32_T *cpu,
                                          emxArray_real32_T *gpu);

static void gpuEmxMemcpyGpuToCpu_uint8_T(emxArray_uint8_T *cpu,
                                         emxArray_uint8_T *gpu);

static void gpuEmxReset_boolean_T(emxArray_boolean_T *gpu);

static __global__ void
pointpillarsDetect_kernel1(real_T anchors_data[10], real_T dv1_dim0,
                           real_T dv1_dim1, real_T dv1_dim2, real_T dv1_dim3,
                           real_T dv1_dim4, real_T dv1_dim5, real_T dv1_dim6,
                           real_T dv1_dim7, real_T dv1_dim8, real_T dv1_dim9);

static __global__ void
pointpillarsDetect_kernel10(const real_T anchorsDim_data[535680],
                            real_T anchors3dMod_data[749952]);

static __global__ void
pointpillarsDetect_kernel11(const real_T anchors3dMod_data[749952],
                            real_T anchorMask_data[107136]);

static __global__ void
pointpillarsDetect_kernel12(const real_T anchorMask_data[107136],
                            real_T anchors3dMod_data[749952]);

static __global__ void
pointpillarsDetect_kernel13(const real_T anchors3dMod_data[749952],
                            real_T tmp2_data[214272], real_T tmp_data[214272]);

static __global__ void pointpillarsDetect_kernel14(const emxArray_uint8_T b,
                                                   const int32_T b_b,
                                                   emxArray_uint8_T b_value);

static __global__ void
pointpillarsDetect_kernel15(real32_T pillarIndices[24000]);

static __global__ void
pointpillarsDetect_kernel16(real32_T dlPillarFeatures_Data[10800000]);

static __global__ void
pointpillarsDetect_kernel17(real_T sparseVoxelMap[214272]);

static __global__ void
pointpillarsDetect_kernel18(const real32_T pillarIndices[24000],
                            const int32_T b, int32_T iv1_data[12000]);

static __global__ void
pointpillarsDetect_kernel19(const real_T anchorMask_data[107136],
                            boolean_T b_anchorMask_data[107136]);

static __global__ void pointpillarsDetect_kernel2(const real_T dv2[248],
                                                  real_T xx[53568],
                                                  real_T yy[53568]);

static __global__ void
pointpillarsDetect_kernel20(const boolean_T anchorMask_data[107136],
                            boolean_T b_anchorMask_data[107136]);

static __global__ void pointpillarsDetect_kernel21(
    const boolean_T anchorMask_data[107136], const real_T threshold,
    const real32_T predOcc[107136], boolean_T x[107136]);

static __global__ void
pointpillarsDetect_kernel22(const int32_T ii_data[107136], const int32_T b,
                            int32_T v1_data[107136]);

static __global__ void
pointpillarsDetect_kernel23(const int32_T v1_data[107136], const int32_T b,
                            int16_T vk_data[107136]);

static __global__ void
pointpillarsDetect_kernel24(const int16_T vk_data[107136], const int32_T b,
                            int32_T v1_data[107136],
                            int8_T varargout_6_data[107136]);

static __global__ void
pointpillarsDetect_kernel25(const int32_T v1_data[107136], const int32_T b,
                            int16_T vk_data[107136]);

static __global__ void
pointpillarsDetect_kernel26(const int16_T vk_data[107136], const int32_T b,
                            int32_T v1_data[107136]);

static __global__ void
pointpillarsDetect_kernel27(const int16_T vk_data[107136],
                            const int32_T v1_data[107136], const int32_T b,
                            int16_T col_data[107136], int32_T ii_data[107136]);

static __global__ void pointpillarsDetect_kernel28(
    const real32_T predOcc[107136], const int8_T varargout_6_data[107136],
    const int16_T col_data[107136], const int32_T ii_data[107136],
    const int32_T b, real_T yCen_data[107136], real_T anchorMask_data[107136],
    real32_T confScore_data[107136]);

static __global__ void pointpillarsDetect_kernel29(
    const real_T anchorMask_data[107136], const cell_wrap_40 newAnchors_data[2],
    const real32_T fv2[321408], const int16_T col_data[107136],
    const int32_T ii_data[107136], const int8_T varargout_6_data[107136],
    const int32_T b, real32_T xGt_data[107136]);

static __global__ void pointpillarsDetect_kernel3(const real_T yy[53568],
                                                  const real_T xx[53568],
                                                  real_T tmp[107136]);

static __global__ void pointpillarsDetect_kernel30(
    const real_T yCen_data[107136], const cell_wrap_40 newAnchors_data[2],
    const real32_T fv2[321408], const int16_T col_data[107136],
    const int32_T ii_data[107136], const int8_T varargout_6_data[107136],
    const int32_T b, real32_T yGt_data[107136]);

static __global__ void pointpillarsDetect_kernel31(
    const cell_wrap_40 newAnchors_data[2], const real32_T fv2[321408],
    const int16_T col_data[107136], const int32_T ii_data[107136],
    const int8_T varargout_6_data[107136], const int32_T b,
    real32_T zGt_data[107136]);

static __global__ void pointpillarsDetect_kernel32(
    const cell_wrap_40 newAnchors_data[2], const real32_T fv1[321408],
    const int16_T col_data[107136], const int32_T ii_data[107136],
    const int8_T varargout_6_data[107136], const int32_T b,
    real32_T lGt_data[107136]);

static __global__ void pointpillarsDetect_kernel33(
    const cell_wrap_40 newAnchors_data[2], const real32_T fv1[321408],
    const int16_T col_data[107136], const int32_T ii_data[107136],
    const int8_T varargout_6_data[107136], const int32_T b,
    real32_T wGt_data[107136]);

static __global__ void pointpillarsDetect_kernel34(
    const cell_wrap_40 newAnchors_data[2], const real32_T fv1[321408],
    const int16_T col_data[107136], const int32_T ii_data[107136],
    const int8_T varargout_6_data[107136], const int32_T b,
    real32_T hGt_data[107136]);

static __global__ void pointpillarsDetect_kernel35(
    const real32_T this_workspace_predHeading[107136],
    const int8_T varargout_6_data[107136], const int16_T col_data[107136],
    const int32_T ii_data[107136], const int32_T b, real32_T hdGt_data[107136]);

static __global__ void pointpillarsDetect_kernel36(const int32_T rowIdx,
                                                   real32_T hdGt_data[107136]);

static __global__ void pointpillarsDetect_kernel37(const int32_T rowIdx,
                                                   real32_T hdGt_data[107136]);

static __global__ void pointpillarsDetect_kernel38(real32_T predAngle[107136]);

static __global__ void pointpillarsDetect_kernel39(
    const cell_wrap_40 newAnchors_data[2], const real32_T predAngle[107136],
    const int16_T col_data[107136], const int32_T ii_data[107136],
    const real32_T hdGt_data[107136], const int8_T varargout_6_data[107136],
    const int32_T b, real32_T angGt_data[107136]);

static __global__ void pointpillarsDetect_kernel4(const real_T tmp[107136],
                                                  const int32_T initAuxVar,
                                                  real_T tmp_data[214272]);

static __global__ void pointpillarsDetect_kernel40(const int32_T rowIdx,
                                                   real32_T angGt_data[107136]);

static __global__ void pointpillarsDetect_kernel41(const int32_T rowIdx,
                                                   real32_T angGt_data[107136]);

static __global__ void pointpillarsDetect_kernel42(
    const real32_T c_this_workspace_predClassifica[107136],
    const int8_T varargout_6_data[107136], const int16_T col_data[107136],
    const int32_T ii_data[107136], const int32_T b,
    real32_T varargout_1_data[107136]);

static __global__ void
pointpillarsDetect_kernel43(const real32_T varargout_1_data[107136],
                            const int32_T b, real_T anchorMask_data[107136]);

static __global__ void
pointpillarsDetect_kernel44(const int32_T b, real_T anchorMask_data[107136]);

static __global__ void
pointpillarsDetect_kernel45(const real_T anchorMask_data[107136],
                            const int32_T b, real_T yCen_data[107136]);

static __global__ void pointpillarsDetect_kernel46(const real_T threshold,
                                                   const int32_T rowIdx,
                                                   real_T yCen_data[107136]);

static __global__ void pointpillarsDetect_kernel47(const real_T threshold,
                                                   const int32_T rowIdx,
                                                   real_T yCen_data[107136]);

static __global__ void pointpillarsDetect_kernel48(
    const real_T yCen_data[107136], const real32_T confScore_data[107136],
    const real32_T angGt_data[107136], const real32_T hGt_data[107136],
    const real32_T wGt_data[107136], const real32_T lGt_data[107136],
    const real32_T zGt_data[107136], const real32_T yGt_data[107136],
    const int32_T boxPreds_size_dim0, const real32_T xGt_data[107136],
    const int32_T b, real32_T boxPreds_data[964224]);

static __global__ void pointpillarsDetect_kernel49(
    const real32_T boxPreds_data[964224], const int32_T boxPreds_size_dim0,
    const int32_T boxPreds_size, boolean_T anchorMask_data[107136]);

static __global__ void
pointpillarsDetect_kernel5(real_T anchors3dMod_data[749952]);

static __global__ void
pointpillarsDetect_kernel50(const int32_T boxPreds_size_dim0, const int32_T b,
                            real32_T boxPreds_data[964224]);

static __global__ void
pointpillarsDetect_kernel51(const real32_T boxPreds_data[964224],
                            const int32_T boxPreds_size_dim0,
                            const int32_T ii_data[107136], const int32_T b,
                            real32_T hdGt_data[107136], real32_T scores_data[]);

static __global__ void pointpillarsDetect_kernel52(
    const real32_T scores_data[], const int32_T scores_size,
    real_T anchorMask_data[107136], real32_T varargout_1_data[107136]);

static __global__ void pointpillarsDetect_kernel53(
    const real32_T boxPreds_data[964224], const int32_T boxPreds_size_dim0_dup0,
    const int32_T ii_data[107136], const real_T anchorMask_data[107136],
    const int32_T boxPreds_size_dim0, const int32_T idx_size,
    real32_T b_boxPreds_data[535680], int8_T iv23_dim0, int8_T iv23_dim1,
    int8_T iv23_dim2, int8_T iv23_dim3, int8_T iv23_dim4);

static __global__ void
pointpillarsDetect_kernel54(const real32_T hdGt_data[107136],
                            const real_T anchorMask_data[107136],
                            const int32_T b, real32_T varargout_1_data[107136]);

static __global__ void
pointpillarsDetect_kernel55(const boolean_T selectedIndex_data[107136],
                            const int32_T selectedIndex_size,
                            boolean_T anchorMask_data[107136]);

static __global__ void pointpillarsDetect_kernel56(const int32_T b,
                                                   real_T bboxes_data[]);

static __global__ void
pointpillarsDetect_kernel57(const boolean_T anchorMask_data[107136],
                            boolean_T b_anchorMask_data[107136]);

static __global__ void
pointpillarsDetect_kernel6(const real_T tmp_data[214272],
                           real_T anchors3dMod_data[749952]);

static __global__ void
pointpillarsDetect_kernel7(const real_T anchors_data[10],
                           real_T anchorsDim_data[535680]);

static __global__ void
pointpillarsDetect_kernel8(const real_T anchorsDim_data[535680],
                           real_T anchors3dMod_data[749952]);

static __global__ void
pointpillarsDetect_kernel9(const real_T anchorsDim_data[535680],
                           real_T anchors3dMod_data[749952]);

// Function Definitions
static void b_error(const mxArray *m, emlrtMCInfo *location)
{
  const mxArray *pArray;
  pArray = m;
  emlrtCallMATLABR2012b(emlrtRootTLSGlobal, 0, nullptr, 1, &pArray, "error",
                        true, location);
}

static void gpuEmxFree_boolean_T(emxArray_boolean_T *gpu)
{
  if (gpu->data != (void *)4207599121UL) {
    checkCudaError(mwCudaFree(gpu->data), __FILE__, __LINE__);
  }
  emlrtFreeMex(gpu->size);
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

static __global__ __launch_bounds__(32, 1) void pointpillarsDetect_kernel1(
    real_T anchors_data[10], real_T dv1_dim0, real_T dv1_dim1, real_T dv1_dim2,
    real_T dv1_dim3, real_T dv1_dim4, real_T dv1_dim5, real_T dv1_dim6,
    real_T dv1_dim7, real_T dv1_dim8, real_T dv1_dim9)
{
  __shared__ real_T dv1_shared[10];
  uint64_T gThreadId;
  int32_T ibcol;
  int32_T ibmat;
  if (mwGetThreadIndexWithinBlock() == 0U) {
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
  gThreadId = mwGetGlobalThreadIndex();
  ibcol = static_cast<int32_T>(gThreadId % 2UL);
  ibmat =
      static_cast<int32_T>((gThreadId - static_cast<uint64_T>(ibcol)) / 2UL);
  if ((ibmat < 5) && (ibcol < 2)) {
    anchors_data[ibcol + 2 * ibmat] = dv1_shared[ibcol + (ibmat << 1)];
  }
}

static __global__ __launch_bounds__(512, 1) void pointpillarsDetect_kernel10(
    const real_T anchorsDim_data[535680], real_T anchors3dMod_data[749952])
{
  int32_T ibmat;
  ibmat = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (ibmat < 107136) {
    anchors3dMod_data[ibmat + 642816] = anchorsDim_data[ibmat + 428544];
  }
}

static __global__ __launch_bounds__(512, 1) void pointpillarsDetect_kernel11(
    const real_T anchors3dMod_data[749952], real_T anchorMask_data[107136])
{
  uint64_T gThreadId;
  int32_T ibcol;
  int32_T ibmat;
  gThreadId = mwGetGlobalThreadIndex();
  ibcol = static_cast<int32_T>(gThreadId % 53568UL);
  ibmat = static_cast<int32_T>((gThreadId - static_cast<uint64_T>(ibcol)) /
                               53568UL);
  if ((ibmat < 2) && (ibcol < 53568)) {
    anchorMask_data[ibcol + 53568 * ibmat] =
        anchors3dMod_data[((ibcol << 1) + 107136 * (4 - ibmat)) + 1];
  }
}

static __global__ __launch_bounds__(512, 1) void pointpillarsDetect_kernel12(
    const real_T anchorMask_data[107136], real_T anchors3dMod_data[749952])
{
  uint64_T gThreadId;
  int32_T ibcol;
  int32_T ibmat;
  gThreadId = mwGetGlobalThreadIndex();
  ibcol = static_cast<int32_T>(gThreadId % 53568UL);
  ibmat = static_cast<int32_T>((gThreadId - static_cast<uint64_T>(ibcol)) /
                               53568UL);
  if ((ibmat < 2) && (ibcol < 53568)) {
    anchors3dMod_data[((ibcol << 1) + 107136 * (ibmat + 3)) + 1] =
        anchorMask_data[ibcol + 53568 * ibmat];
  }
}

static __global__ __launch_bounds__(512, 1) void pointpillarsDetect_kernel13(
    const real_T anchors3dMod_data[749952], real_T tmp2_data[214272],
    real_T tmp_data[214272])
{
  uint64_T gThreadId;
  int32_T ibcol;
  int32_T ibmat;
  gThreadId = mwGetGlobalThreadIndex();
  ibcol = static_cast<int32_T>(gThreadId % 107136UL);
  ibmat = static_cast<int32_T>((gThreadId - static_cast<uint64_T>(ibcol)) /
                               107136UL);
  if ((ibmat < 2) && (ibcol < 107136)) {
    real_T d;
    real_T d1;
    d = anchors3dMod_data[ibcol + 107136 * ibmat];
    d1 = anchors3dMod_data[ibcol + 107136 * (ibmat + 3)];
    tmp_data[ibcol + 107136 * ibmat] = d - d1 / 2.0;
    tmp2_data[ibcol + 107136 * ibmat] = d + d1 / 2.0;
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel14(
    const emxArray_uint8_T b, const int32_T b_b, emxArray_uint8_T b_value)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T ibmat;
    ibmat = static_cast<int32_T>(idx);
    b_value.data[ibmat] = b.data[ibmat];
  }
}

static __global__ __launch_bounds__(224, 1) void pointpillarsDetect_kernel15(
    real32_T pillarIndices[24000])
{
  int32_T ibmat;
  ibmat = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (ibmat < 24000) {
    pillarIndices[ibmat] = 0.0F;
  }
}

static __global__ __launch_bounds__(512, 1) void pointpillarsDetect_kernel16(
    real32_T dlPillarFeatures_Data[10800000])
{
  int32_T ibmat;
  ibmat = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (ibmat < 10800000) {
    dlPillarFeatures_Data[ibmat] = 0.0F;
  }
}

static __global__ __launch_bounds__(512, 1) void pointpillarsDetect_kernel17(
    real_T sparseVoxelMap[214272])
{
  int32_T ibmat;
  ibmat = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (ibmat < 214272) {
    sparseVoxelMap[ibmat] = 0.0;
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel18(
    const real32_T pillarIndices[24000], const int32_T b,
    int32_T iv1_data[12000])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T ibmat;
    ibmat = static_cast<int32_T>(idx);
    iv1_data[ibmat] =
        static_cast<int32_T>(pillarIndices[ibmat]) +
        432 * (static_cast<int32_T>(pillarIndices[ibmat + 12000]) - 1);
  }
}

static __global__ __launch_bounds__(512, 1) void pointpillarsDetect_kernel19(
    const real_T anchorMask_data[107136], boolean_T b_anchorMask_data[107136])
{
  int32_T ibmat;
  ibmat = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (ibmat < 107136) {
    b_anchorMask_data[ibmat] = (anchorMask_data[ibmat] > 1.0);
  }
}

static __global__ __launch_bounds__(512, 1) void pointpillarsDetect_kernel2(
    const real_T dv2[248], real_T xx[53568], real_T yy[53568])
{
  uint64_T gThreadId;
  int32_T ibcol;
  int32_T ibmat;
  gThreadId = mwGetGlobalThreadIndex();
  ibmat = static_cast<int32_T>(gThreadId % 216UL);
  ibcol =
      static_cast<int32_T>((gThreadId - static_cast<uint64_T>(ibmat)) / 216UL);
  if ((ibcol < 248) && (ibmat < 216)) {
    yy[ibmat + 216 * ibcol] = dv2[ibcol];
    xx[ibmat + 216 * ibcol] =
        0.32000000000000006 * static_cast<real_T>(ibmat) + 0.16;
  }
}

static __global__ __launch_bounds__(512, 1) void pointpillarsDetect_kernel20(
    const boolean_T anchorMask_data[107136],
    boolean_T b_anchorMask_data[107136])
{
  int32_T ibmat;
  ibmat = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (ibmat < 107136) {
    b_anchorMask_data[ibmat] = anchorMask_data[ibmat];
  }
}

static __global__ __launch_bounds__(512, 1) void pointpillarsDetect_kernel21(
    const boolean_T anchorMask_data[107136], const real_T threshold,
    const real32_T predOcc[107136], boolean_T x[107136])
{
  int32_T ibmat;
  ibmat = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (ibmat < 107136) {
    x[ibmat] = ((static_cast<real_T>(predOcc[ibmat]) > threshold) &&
                anchorMask_data[ibmat]);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel22(
    const int32_T ii_data[107136], const int32_T b, int32_T v1_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T ibmat;
    ibmat = static_cast<int32_T>(idx);
    v1_data[ibmat] = ii_data[ibmat] - 1;
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel23(
    const int32_T v1_data[107136], const int32_T b, int16_T vk_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T ibmat;
    ibmat = static_cast<int32_T>(idx);
    vk_data[ibmat] = static_cast<int16_T>(v1_data[ibmat] / 53568);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel24(
    const int16_T vk_data[107136], const int32_T b, int32_T v1_data[107136],
    int8_T varargout_6_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T ibmat;
    int16_T i;
    ibmat = static_cast<int32_T>(idx);
    i = vk_data[ibmat];
    varargout_6_data[ibmat] = static_cast<int8_T>(static_cast<int32_T>(i) + 1);
    v1_data[ibmat] -= static_cast<int32_T>(i) * 53568;
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel25(
    const int32_T v1_data[107136], const int32_T b, int16_T vk_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T ibmat;
    ibmat = static_cast<int32_T>(idx);
    vk_data[ibmat] = static_cast<int16_T>(v1_data[ibmat] / 216);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel26(
    const int16_T vk_data[107136], const int32_T b, int32_T v1_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T ibmat;
    ibmat = static_cast<int32_T>(idx);
    v1_data[ibmat] -= static_cast<int32_T>(vk_data[ibmat]) * 216;
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel27(
    const int16_T vk_data[107136], const int32_T v1_data[107136],
    const int32_T b, int16_T col_data[107136], int32_T ii_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T ibmat;
    ibmat = static_cast<int32_T>(idx);
    ii_data[ibmat] = v1_data[ibmat] + 1;
    col_data[ibmat] =
        static_cast<int16_T>(static_cast<int32_T>(vk_data[ibmat]) + 1);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel28(
    const real32_T predOcc[107136], const int8_T varargout_6_data[107136],
    const int16_T col_data[107136], const int32_T ii_data[107136],
    const int32_T b, real_T yCen_data[107136], real_T anchorMask_data[107136],
    real32_T confScore_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T ibmat;
    int32_T k;
    int16_T i;
    k = static_cast<int32_T>(idx);
    ibmat = ii_data[k];
    i = col_data[k];
    confScore_data[k] =
        predOcc[((ibmat + 216 * (static_cast<int32_T>(i) - 1)) +
                 53568 * (static_cast<int32_T>(varargout_6_data[k]) - 1)) -
                1];
    anchorMask_data[k] = 0.32 * (static_cast<real_T>(ibmat) - 1.0) + 0.16;
    yCen_data[k] = (0.32 * (static_cast<real_T>(i) - 1.0) - 39.68) + 0.16;
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel29(
    const real_T anchorMask_data[107136], const cell_wrap_40 newAnchors_data[2],
    const real32_T fv2[321408], const int16_T col_data[107136],
    const int32_T ii_data[107136], const int8_T varargout_6_data[107136],
    const int32_T b, real32_T xGt_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T k;
    int8_T i1;
    k = static_cast<int32_T>(idx);
    i1 = varargout_6_data[k];
    xGt_data[k] =
        fv2[((ii_data[k] + 216 * (static_cast<int32_T>(col_data[k]) - 1)) +
             53568 * (static_cast<int32_T>(i1) - 1)) -
            1] *
            static_cast<real32_T>(
                sqrt(newAnchors_data[static_cast<int32_T>(i1) - 1].f1[0] *
                         newAnchors_data[static_cast<int32_T>(i1) - 1].f1[0] +
                     newAnchors_data[static_cast<int32_T>(i1) - 1].f1[1] *
                         newAnchors_data[static_cast<int32_T>(i1) - 1].f1[1])) +
        static_cast<real32_T>(anchorMask_data[k]);
  }
}

static __global__ __launch_bounds__(512, 1) void pointpillarsDetect_kernel3(
    const real_T yy[53568], const real_T xx[53568], real_T tmp[107136])
{
  int32_T ibcol;
  ibcol = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (ibcol < 53568) {
    tmp[ibcol] = xx[ibcol];
    tmp[ibcol + 53568] = yy[ibcol];
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel30(
    const real_T yCen_data[107136], const cell_wrap_40 newAnchors_data[2],
    const real32_T fv2[321408], const int16_T col_data[107136],
    const int32_T ii_data[107136], const int8_T varargout_6_data[107136],
    const int32_T b, real32_T yGt_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T k;
    int8_T i1;
    k = static_cast<int32_T>(idx);
    i1 = varargout_6_data[k];
    yGt_data[k] =
        fv2[((ii_data[k] + 216 * (static_cast<int32_T>(col_data[k]) - 1)) +
             53568 * (static_cast<int32_T>(i1) - 1)) +
            107135] *
            static_cast<real32_T>(
                sqrt(newAnchors_data[static_cast<int32_T>(i1) - 1].f1[0] *
                         newAnchors_data[static_cast<int32_T>(i1) - 1].f1[0] +
                     newAnchors_data[static_cast<int32_T>(i1) - 1].f1[1] *
                         newAnchors_data[static_cast<int32_T>(i1) - 1].f1[1])) +
        static_cast<real32_T>(yCen_data[k]);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel31(
    const cell_wrap_40 newAnchors_data[2], const real32_T fv2[321408],
    const int16_T col_data[107136], const int32_T ii_data[107136],
    const int8_T varargout_6_data[107136], const int32_T b,
    real32_T zGt_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T k;
    int8_T i1;
    k = static_cast<int32_T>(idx);
    i1 = varargout_6_data[k];
    zGt_data[k] =
        fv2[((ii_data[k] + 216 * (static_cast<int32_T>(col_data[k]) - 1)) +
             53568 * (static_cast<int32_T>(i1) - 1)) +
            214271] *
            static_cast<real32_T>(
                newAnchors_data[static_cast<int32_T>(i1) - 1].f1[2]) +
        static_cast<real32_T>(
            newAnchors_data[static_cast<int32_T>(i1) - 1].f1[3]);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel32(
    const cell_wrap_40 newAnchors_data[2], const real32_T fv1[321408],
    const int16_T col_data[107136], const int32_T ii_data[107136],
    const int8_T varargout_6_data[107136], const int32_T b,
    real32_T lGt_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T k;
    int8_T i1;
    k = static_cast<int32_T>(idx);
    i1 = varargout_6_data[k];
    lGt_data[k] =
        expf(fv1[((ii_data[k] + 216 * (static_cast<int32_T>(col_data[k]) - 1)) +
                  53568 * (static_cast<int32_T>(i1) - 1)) -
                 1]) *
        static_cast<real32_T>(
            newAnchors_data[static_cast<int32_T>(i1) - 1].f1[0]);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel33(
    const cell_wrap_40 newAnchors_data[2], const real32_T fv1[321408],
    const int16_T col_data[107136], const int32_T ii_data[107136],
    const int8_T varargout_6_data[107136], const int32_T b,
    real32_T wGt_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T k;
    int8_T i1;
    k = static_cast<int32_T>(idx);
    i1 = varargout_6_data[k];
    wGt_data[k] =
        expf(fv1[((ii_data[k] + 216 * (static_cast<int32_T>(col_data[k]) - 1)) +
                  53568 * (static_cast<int32_T>(i1) - 1)) +
                 107135]) *
        static_cast<real32_T>(
            newAnchors_data[static_cast<int32_T>(i1) - 1].f1[1]);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel34(
    const cell_wrap_40 newAnchors_data[2], const real32_T fv1[321408],
    const int16_T col_data[107136], const int32_T ii_data[107136],
    const int8_T varargout_6_data[107136], const int32_T b,
    real32_T hGt_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T k;
    int8_T i1;
    k = static_cast<int32_T>(idx);
    i1 = varargout_6_data[k];
    hGt_data[k] =
        expf(fv1[((ii_data[k] + 216 * (static_cast<int32_T>(col_data[k]) - 1)) +
                  53568 * (static_cast<int32_T>(i1) - 1)) +
                 214271]) *
        static_cast<real32_T>(
            newAnchors_data[static_cast<int32_T>(i1) - 1].f1[2]);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel35(
    const real32_T this_workspace_predHeading[107136],
    const int8_T varargout_6_data[107136], const int16_T col_data[107136],
    const int32_T ii_data[107136], const int32_T b, real32_T hdGt_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T k;
    k = static_cast<int32_T>(idx);
    hdGt_data[k] = this_workspace_predHeading
        [((ii_data[k] + 216 * (static_cast<int32_T>(col_data[k]) - 1)) +
          53568 * (static_cast<int32_T>(varargout_6_data[k]) - 1)) -
         1];
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel36(
    const int32_T rowIdx, real32_T hdGt_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(rowIdx);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T ibmat;
    ibmat = static_cast<int32_T>(idx);
    if (hdGt_data[ibmat] >= 0.5F) {
      hdGt_data[ibmat] = 1.0F;
    }
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel37(
    const int32_T rowIdx, real32_T hdGt_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(rowIdx);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T ibmat;
    ibmat = static_cast<int32_T>(idx);
    if (hdGt_data[ibmat] < 0.5F) {
      hdGt_data[ibmat] = -1.0F;
    }
  }
}

static __global__ __launch_bounds__(512, 1) void pointpillarsDetect_kernel38(
    real32_T predAngle[107136])
{
  int32_T ibmat;
  ibmat = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (ibmat < 107136) {
    real32_T f;
    f = predAngle[ibmat];
    if ((f > 1.0F) || (f < -1.0F)) {
      predAngle[ibmat] = 0.0F;
    }
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel39(
    const cell_wrap_40 newAnchors_data[2], const real32_T predAngle[107136],
    const int16_T col_data[107136], const int32_T ii_data[107136],
    const real32_T hdGt_data[107136], const int8_T varargout_6_data[107136],
    const int32_T b, real32_T angGt_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T k;
    int8_T i1;
    k = static_cast<int32_T>(idx);
    i1 = varargout_6_data[k];
    angGt_data[k] =
        hdGt_data[k] *
            asinf(predAngle[((ii_data[k] +
                              216 * (static_cast<int32_T>(col_data[k]) - 1)) +
                             53568 * (static_cast<int32_T>(i1) - 1)) -
                            1]) +
        static_cast<real32_T>(
            newAnchors_data[static_cast<int32_T>(i1) - 1].f1[4]);
  }
}

static __global__ __launch_bounds__(512, 1) void pointpillarsDetect_kernel4(
    const real_T tmp[107136], const int32_T initAuxVar, real_T tmp_data[214272])
{
  uint64_T gThreadId;
  int32_T iacol;
  int32_T ibmat;
  gThreadId = mwGetGlobalThreadIndex();
  ibmat = static_cast<int32_T>(gThreadId % 53568UL);
  iacol = static_cast<int32_T>((gThreadId - static_cast<uint64_T>(ibmat)) /
                               53568UL);
  if ((iacol < 2) && (ibmat < 53568)) {
    real_T numPillars;
    int32_T colIdx;
    int32_T rowIdx;
    colIdx = (initAuxVar + iacol) + 1;
    rowIdx = ibmat * 2 + -1;
    numPillars = tmp[ibmat + 53568 * iacol];
    tmp_data[(rowIdx + 107136 * colIdx) + 1] = numPillars;
    tmp_data[(rowIdx + 107136 * colIdx) + 2] = numPillars;
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel40(
    const int32_T rowIdx, real32_T angGt_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(rowIdx);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T ibmat;
    real32_T f;
    ibmat = static_cast<int32_T>(idx);
    f = angGt_data[ibmat];
    if (static_cast<real_T>(f) > 3.1415926535897931) {
      f -= 6.28318548F;
      angGt_data[ibmat] = f;
    }
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel41(
    const int32_T rowIdx, real32_T angGt_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(rowIdx);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T ibmat;
    real32_T f;
    ibmat = static_cast<int32_T>(idx);
    f = angGt_data[ibmat];
    if (static_cast<real_T>(f) < -3.1415926535897931) {
      f += 6.28318548F;
      angGt_data[ibmat] = f;
    }
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel42(
    const real32_T c_this_workspace_predClassifica[107136],
    const int8_T varargout_6_data[107136], const int16_T col_data[107136],
    const int32_T ii_data[107136], const int32_T b,
    real32_T varargout_1_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T k;
    k = static_cast<int32_T>(idx);
    varargout_1_data[k] = c_this_workspace_predClassifica
        [((ii_data[k] + 216 * (static_cast<int32_T>(col_data[k]) - 1)) +
          53568 * (static_cast<int32_T>(varargout_6_data[k]) - 1)) -
         1];
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel43(
    const real32_T varargout_1_data[107136], const int32_T b,
    real_T anchorMask_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T ibmat;
    ibmat = static_cast<int32_T>(idx);
    anchorMask_data[ibmat] = -static_cast<real_T>(varargout_1_data[ibmat]);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel44(
    const int32_T b, real_T anchorMask_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T k;
    k = static_cast<int32_T>(idx);
    anchorMask_data[k] = exp(anchorMask_data[k]);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel45(
    const real_T anchorMask_data[107136], const int32_T b,
    real_T yCen_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T ibmat;
    ibmat = static_cast<int32_T>(idx);
    yCen_data[ibmat] = 1.0 / (anchorMask_data[ibmat] + 1.0);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel46(
    const real_T threshold, const int32_T rowIdx, real_T yCen_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(rowIdx);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T ibmat;
    ibmat = static_cast<int32_T>(idx);
    if (yCen_data[ibmat] >= threshold) {
      yCen_data[ibmat] = 1.0;
    }
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel47(
    const real_T threshold, const int32_T rowIdx, real_T yCen_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(rowIdx);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T ibmat;
    ibmat = static_cast<int32_T>(idx);
    if (yCen_data[ibmat] < threshold) {
      yCen_data[ibmat] = 0.0;
    }
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel48(
    const real_T yCen_data[107136], const real32_T confScore_data[107136],
    const real32_T angGt_data[107136], const real32_T hGt_data[107136],
    const real32_T wGt_data[107136], const real32_T lGt_data[107136],
    const real32_T zGt_data[107136], const real32_T yGt_data[107136],
    const int32_T boxPreds_size_dim0, const real32_T xGt_data[107136],
    const int32_T b, real32_T boxPreds_data[964224])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T ibmat;
    ibmat = static_cast<int32_T>(idx);
    boxPreds_data[ibmat] = xGt_data[ibmat];
    boxPreds_data[ibmat + boxPreds_size_dim0] = yGt_data[ibmat];
    boxPreds_data[ibmat + boxPreds_size_dim0 * 2] = 0.5F * zGt_data[ibmat];
    boxPreds_data[ibmat + boxPreds_size_dim0 * 3] = lGt_data[ibmat];
    boxPreds_data[ibmat + boxPreds_size_dim0 * 4] = wGt_data[ibmat];
    boxPreds_data[ibmat + boxPreds_size_dim0 * 5] = hGt_data[ibmat];
    boxPreds_data[ibmat + boxPreds_size_dim0 * 6] = angGt_data[ibmat];
    boxPreds_data[ibmat + boxPreds_size_dim0 * 7] = confScore_data[ibmat];
    boxPreds_data[ibmat + boxPreds_size_dim0 * 8] =
        static_cast<real32_T>(yCen_data[ibmat]);
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel49(
    const real32_T boxPreds_data[964224], const int32_T boxPreds_size_dim0,
    const int32_T boxPreds_size, boolean_T anchorMask_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(boxPreds_size);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T ibmat;
    ibmat = static_cast<int32_T>(idx);
    anchorMask_data[ibmat] =
        (static_cast<real_T>(boxPreds_data[ibmat + boxPreds_size_dim0 * 8]) >
         0.15);
  }
}

static __global__ __launch_bounds__(512, 1) void pointpillarsDetect_kernel5(
    real_T anchors3dMod_data[749952])
{
  int32_T ibmat;
  ibmat = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (ibmat < 749952) {
    anchors3dMod_data[ibmat] = 0.0;
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel50(
    const int32_T boxPreds_size_dim0, const int32_T b,
    real32_T boxPreds_data[964224])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T ibmat;
    ibmat = static_cast<int32_T>(idx);
    boxPreds_data[ibmat + boxPreds_size_dim0 * 6] *= 57.2957802F;
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel51(
    const real32_T boxPreds_data[964224], const int32_T boxPreds_size_dim0,
    const int32_T ii_data[107136], const int32_T b, real32_T hdGt_data[107136],
    real32_T scores_data[])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T ibcol;
    int32_T ibmat;
    ibmat = static_cast<int32_T>(idx);
    ibcol = ii_data[ibmat];
    scores_data[ibmat] = boxPreds_data[(ibcol + boxPreds_size_dim0 * 7) - 1];
    hdGt_data[ibmat] = boxPreds_data[(ibcol + boxPreds_size_dim0 * 8) - 1];
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel52(
    const real32_T scores_data[], const int32_T scores_size,
    real_T anchorMask_data[107136], real32_T varargout_1_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(scores_size);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T ibmat;
    ibmat = static_cast<int32_T>(idx);
    varargout_1_data[ibmat] = scores_data[ibmat];
    anchorMask_data[ibmat] = 0.0;
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel53(
    const real32_T boxPreds_data[964224], const int32_T boxPreds_size_dim0_dup0,
    const int32_T ii_data[107136], const real_T anchorMask_data[107136],
    const int32_T boxPreds_size_dim0, const int32_T idx_size,
    real32_T b_boxPreds_data[535680], int8_T iv23_dim0, int8_T iv23_dim1,
    int8_T iv23_dim2, int8_T iv23_dim3, int8_T iv23_dim4)
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
    int32_T ibcol;
    int32_T ibmat;
    ibcol = static_cast<int32_T>(idx % (static_cast<uint64_T>(idx_size) + 1UL));
    ibmat = static_cast<int32_T>((idx - static_cast<uint64_T>(ibcol)) /
                                 (static_cast<uint64_T>(idx_size) + 1UL));
    b_boxPreds_data[ibcol + boxPreds_size_dim0 * ibmat] = boxPreds_data
        [(ii_data[static_cast<int32_T>(anchorMask_data[ibcol]) - 1] +
          boxPreds_size_dim0_dup0 * static_cast<int32_T>(iv23_shared[ibmat])) -
         1];
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel54(
    const real32_T hdGt_data[107136], const real_T anchorMask_data[107136],
    const int32_T b, real32_T varargout_1_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T ibmat;
    ibmat = static_cast<int32_T>(idx);
    varargout_1_data[ibmat] =
        hdGt_data[static_cast<int32_T>(anchorMask_data[ibmat]) - 1];
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel55(
    const boolean_T selectedIndex_data[107136],
    const int32_T selectedIndex_size, boolean_T anchorMask_data[107136])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(selectedIndex_size);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T ibmat;
    ibmat = static_cast<int32_T>(idx);
    anchorMask_data[ibmat] = selectedIndex_data[ibmat];
  }
}

static __global__ __launch_bounds__(1024, 1) void pointpillarsDetect_kernel56(
    const int32_T b, real_T bboxes_data[])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b);
  for (uint64_T idx{gThreadId}; idx <= loopEnd; idx += gStride) {
    int32_T ibmat;
    ibmat = static_cast<int32_T>(idx);
    bboxes_data[ibmat] = 0.0;
  }
}

static __global__ __launch_bounds__(512, 1) void pointpillarsDetect_kernel57(
    const boolean_T anchorMask_data[107136],
    boolean_T b_anchorMask_data[107136])
{
  uint64_T gThreadId;
  int32_T ibcol;
  int32_T ibmat;
  int32_T k;
  gThreadId = mwGetGlobalThreadIndex();
  ibcol = static_cast<int32_T>(gThreadId % 2UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(ibcol)) / 2UL;
  ibmat = static_cast<int32_T>(gThreadId % 216UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(ibmat)) / 216UL;
  k = static_cast<int32_T>(gThreadId);
  if ((k < 248) && (ibmat < 216) && (ibcol < 2)) {
    b_anchorMask_data[(ibmat + 216 * k) + 53568 * ibcol] =
        anchorMask_data[(ibcol + 2 * ibmat) + 432 * k];
  }
}

static __global__ __launch_bounds__(512, 1) void pointpillarsDetect_kernel6(
    const real_T tmp_data[214272], real_T anchors3dMod_data[749952])
{
  uint64_T gThreadId;
  int32_T ibcol;
  int32_T ibmat;
  gThreadId = mwGetGlobalThreadIndex();
  ibcol = static_cast<int32_T>(gThreadId % 107136UL);
  ibmat = static_cast<int32_T>((gThreadId - static_cast<uint64_T>(ibcol)) /
                               107136UL);
  if ((ibmat < 2) && (ibcol < 107136)) {
    anchors3dMod_data[ibcol + 107136 * ibmat] =
        tmp_data[ibcol + 107136 * ibmat];
  }
}

static __global__ __launch_bounds__(512, 1) void pointpillarsDetect_kernel7(
    const real_T anchors_data[10], real_T anchorsDim_data[535680])
{
  uint64_T gThreadId;
  int32_T itilerow;
  int32_T jcol;
  int32_T k;
  gThreadId = mwGetGlobalThreadIndex();
  k = static_cast<int32_T>(gThreadId % 2UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(k)) / 2UL;
  itilerow = static_cast<int32_T>(gThreadId % 53568UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(itilerow)) / 53568UL;
  jcol = static_cast<int32_T>(gThreadId);
  if ((jcol < 5) && (itilerow < 53568) && (k < 2)) {
    anchorsDim_data[(jcol * 107136 + (itilerow << 1)) + k] =
        anchors_data[(jcol << 1) + k];
  }
}

static __global__ __launch_bounds__(512, 1) void pointpillarsDetect_kernel8(
    const real_T anchorsDim_data[535680], real_T anchors3dMod_data[749952])
{
  int32_T ibmat;
  ibmat = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (ibmat < 107136) {
    anchors3dMod_data[ibmat + 214272] = anchorsDim_data[ibmat + 321408];
  }
}

static __global__ __launch_bounds__(512, 1) void pointpillarsDetect_kernel9(
    const real_T anchorsDim_data[535680], real_T anchors3dMod_data[749952])
{
  uint64_T gThreadId;
  int32_T ibcol;
  int32_T ibmat;
  gThreadId = mwGetGlobalThreadIndex();
  ibcol = static_cast<int32_T>(gThreadId % 107136UL);
  ibmat = static_cast<int32_T>((gThreadId - static_cast<uint64_T>(ibcol)) /
                               107136UL);
  if ((ibmat < 3) && (ibcol < 107136)) {
    anchors3dMod_data[ibcol + 107136 * (ibmat + 3)] =
        anchorsDim_data[ibcol + 107136 * ibmat];
  }
}

void MWScatterLayer_detector0_01::cleanupLayer()
{
}

void MWResize2DLayer_detector0_01::cleanupLayer()
{
}

void MWResize2DLayer_detector0_02::cleanupLayer()
{
}

void MWScatterLayer_detector0_01::createCustomLayer(
    MWCudnnTarget::MWTargetNetworkImpl *targetImpl, MWTensorBase *b,
    MWTensorBase *c, const char_T *d, int32_T e)
{
  setupTensors(2, 1, b, c, d, e);
  setupLayer(targetImpl);
}

void MWResize2DLayer_detector0_01::createCustomLayer(
    MWCudnnTarget::MWTargetNetworkImpl *targetImpl, MWTensorBase *b,
    const char_T *c, int32_T d)
{
  setupTensors(1, 1, b, c, d);
  setupLayer(targetImpl);
}

void MWResize2DLayer_detector0_02::createCustomLayer(
    MWCudnnTarget::MWTargetNetworkImpl *targetImpl, MWTensorBase *b,
    const char_T *c, int32_T d)
{
  setupTensors(1, 1, b, c, d);
  setupLayer(targetImpl);
}

void MWResize2DLayer_detector0_01::predict()
{
  reorderInputData(getInputTensor(0), 0);
  coder::internal::l_dlnetwork_layerPredictWithCol(
      m_ntwkImpl->getPermuteBuffer(0), m_ntwkImpl->getPermuteBuffer(1));
  reorderOutputData(getOutputTensor(0), 1);
}

void MWResize2DLayer_detector0_02::predict()
{
  reorderInputData(getInputTensor(0), 0);
  coder::internal::m_dlnetwork_layerPredictWithCol(
      m_ntwkImpl->getPermuteBuffer(0), m_ntwkImpl->getPermuteBuffer(1));
  reorderOutputData(getOutputTensor(0), 1);
}

void MWScatterLayer_detector0_01::predict()
{
  reorderInputData(getInputTensor(0), 0);
  reorderInputData(getInputTensor(1), 1);
  coder::internal::l_dlnetwork_layerPredictWithCol(
      m_ntwkImpl->getPermuteBuffer(0), m_ntwkImpl->getPermuteBuffer(1),
      m_ntwkImpl->getPermuteBuffer(2));
  reorderOutputData(getOutputTensor(0), 2);
}

void MWScatterLayer_detector0_01::propagateSize()
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

void MWResize2DLayer_detector0_01::propagateSize()
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

void MWResize2DLayer_detector0_02::propagateSize()
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

void pointpillarsDetect(pointpillarsDetectStackData *SD,
                        const emxArray_real32_T *dataLoc,
                        const emxArray_real32_T *dataInt, real_T threshold,
                        real_T cpu_bboxes_data[], int32_T bboxes_size[2],
                        real32_T cpu_scores_data[], int32_T scores_size[1],
                        coder::categorical *labels)
{
  static const real_T cpu_dv2[248]{-39.52,
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
  static const real_T dv1[10]{0.824900632523975,
                              0.824900632523975,
                              0.93545500918179725,
                              0.93545500918179725,
                              1.7943301367067914,
                              1.7943301367067914,
                              -1.78,
                              -1.78,
                              0.0,
                              1.5707963267948966};
  static const int32_T iv[2]{1, 15};
  static const char_T u[15]{'M', 'A', 'T', 'L', 'A', 'B', ':', 'p',
                            'm', 'a', 'x', 's', 'i', 'z', 'e'};
  static const int8_T iv27[7]{0, 1, 2, 3, 4, 5, 8};
  static const int8_T iv23[5]{0, 1, 3, 4, 6};
  static const int8_T dv4[3]{2, 3, 1};
  cell_wrap_40 cpu_newAnchors_data[2];
  cell_wrap_40(*gpu_newAnchors_data)[2];
  coder::b_pointCloud ptCloud;
  coder::pointCloud ptCloudUnorg;
  dim3 block;
  dim3 grid;
  emxArray_boolean_T gpu_indices;
  emxArray_boolean_T *cpu_indices;
  emxArray_real32_T gpu_intensity;
  emxArray_real32_T gpu_location;
  emxArray_real32_T gpu_normals;
  emxArray_real32_T gpu_rangeData;
  emxArray_real32_T *cpu_intensity;
  emxArray_real32_T *cpu_location;
  emxArray_real32_T *cpu_normals;
  emxArray_real32_T *cpu_rangeData;
  emxArray_real32_T *dataIn;
  emxArray_uint8_T gpu_b;
  emxArray_uint8_T gpu_value;
  emxArray_uint8_T *cpu_b;
  emxArray_uint8_T *cpu_value;
  const mxArray *m;
  const mxArray *y;
  real_T(*gpu_anchors3dMod_data)[749952];
  real_T(*gpu_anchorsDim_data)[535680];
  real_T(*gpu_sparseVoxelMap)[214272];
  real_T(*gpu_tmp2_data)[214272];
  real_T(*gpu_tmp_data)[214272];
  real_T(*gpu_anchorMask_data)[107136];
  real_T(*gpu_tmp)[107136];
  real_T(*gpu_yCen_data)[107136];
  real_T(*gpu_xx)[53568];
  real_T(*gpu_yy)[53568];
  real_T(*gpu_anchors_data)[10];
  real_T numPillars;
  real_T *gpu_bboxes_data;
  int32_T(*gpu_ii_data)[107136];
  int32_T(*gpu_v1_data)[107136];
  int32_T cpu_iv1_data[12000];
  int32_T(*gpu_iv1_data)[12000];
  int32_T boxPreds_size[2];
  int32_T outsize[2];
  int32_T colIdx;
  int32_T iacol;
  int32_T ibcol;
  int32_T ibmat;
  int32_T itilerow;
  int32_T jcol;
  int32_T nx;
  int32_T rowIdx;
  real32_T(*gpu_dlPillarFeatures_Data)[10800000];
  real32_T(*gpu_boxPreds_data)[964224];
  real32_T(*b_gpu_boxPreds_data)[535680];
  real32_T(*gpu_fv1)[321408];
  real32_T(*gpu_fv2)[321408];
  real32_T(*c_gpu_this_workspace_predClassi)[107136];
  real32_T(*gpu_angGt_data)[107136];
  real32_T(*gpu_confScore_data)[107136];
  real32_T(*gpu_hGt_data)[107136];
  real32_T(*gpu_hdGt_data)[107136];
  real32_T(*gpu_lGt_data)[107136];
  real32_T(*gpu_predAngle)[107136];
  real32_T(*gpu_predOcc)[107136];
  real32_T(*gpu_this_workspace_predHeading)[107136];
  real32_T(*gpu_varargout_1_data)[107136];
  real32_T(*gpu_wGt_data)[107136];
  real32_T(*gpu_xGt_data)[107136];
  real32_T(*gpu_yGt_data)[107136];
  real32_T(*gpu_zGt_data)[107136];
  real32_T cpu_pillarIndices[24000];
  real32_T(*gpu_pillarIndices)[24000];
  real32_T *gpu_scores_data;
  uint32_T numPoints[2];
  int16_T(*gpu_col_data)[107136];
  int16_T(*gpu_vk_data)[107136];
  int8_T(*gpu_varargout_6_data)[107136];
  int8_T input_sizes_idx_1;
  boolean_T(*b_gpu_anchorMask_data)[107136];
  boolean_T(*c_gpu_anchorMask_data)[107136];
  boolean_T(*gpu_selectedIndex_data)[107136];
  boolean_T(*gpu_x)[107136];
  boolean_T empty_non_axis_sizes;
  boolean_T exitg1;
  boolean_T indices_outdatedOnCpu;
  boolean_T indices_outdatedOnGpu;
  boolean_T intensity_outdatedOnCpu;
  boolean_T location_outdatedOnCpu;
  boolean_T location_outdatedOnGpu;
  boolean_T normals_outdatedOnCpu;
  boolean_T normals_outdatedOnGpu;
  boolean_T rangeData_outdatedOnCpu;
  boolean_T rangeData_outdatedOnGpu;
  boolean_T validLaunchParams;
  boolean_T value_outdatedOnCpu;
  boolean_T value_outdatedOnGpu;
  if (!c_gpuConstsCopied_pointpillarsD) {
    c_gpuConstsCopied_pointpillarsD = true;
    checkCudaError(cudaMemcpy(*global_gpu_dv2, cpu_dv2, sizeof(real_T[248]),
                              cudaMemcpyHostToDevice),
                   __FILE__, __LINE__);
  }
  checkCudaError(mwCudaMalloc(&gpu_selectedIndex_data, 107136UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&b_gpu_boxPreds_data, 2142720UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_boxPreds_data, 3856896UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_varargout_1_data, 428544UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_angGt_data, 428544UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_hdGt_data, 428544UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_hGt_data, 428544UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_wGt_data, 428544UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_lGt_data, 428544UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_zGt_data, 428544UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_yGt_data, 428544UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_xGt_data, 428544UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_confScore_data, 428544UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_yCen_data, 857088UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_col_data, 214272UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_varargout_6_data, 107136UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_vk_data, 214272UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_v1_data, 428544UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_ii_data, 428544UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_x, 107136UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&c_gpu_anchorMask_data, 107136UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_newAnchors_data, 80UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&b_gpu_anchorMask_data, 107136UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_iv1_data, 48000UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_sparseVoxelMap, 1714176UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_predAngle, 428544UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_this_workspace_predHeading, 428544UL),
                 __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&c_gpu_this_workspace_predClassi, 428544UL),
                 __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_predOcc, 428544UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_fv2, 1285632UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_fv1, 1285632UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_dlPillarFeatures_Data, 43200000UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_pillarIndices, 96000UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_tmp2_data, 1714176UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_anchorMask_data, 857088UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_anchorsDim_data, 4285440UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_anchors3dMod_data, 5999616UL), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_tmp_data, 1714176UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_tmp, 857088UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_xx, 428544UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_yy, 428544UL), __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_anchors_data, 80UL), __FILE__, __LINE__);
  gpuEmxReset_uint8_T(&gpu_b);
  gpuEmxReset_real32_T(&gpu_rangeData);
  gpuEmxReset_real32_T(&gpu_intensity);
  gpuEmxReset_real32_T(&gpu_normals);
  gpuEmxReset_uint8_T(&gpu_value);
  gpuEmxReset_real32_T(&gpu_location);
  gpuEmxReset_boolean_T(&gpu_indices);
  checkCudaError(mwCudaMalloc(&gpu_scores_data, 107136U * sizeof(real32_T)),
                 __FILE__, __LINE__);
  checkCudaError(mwCudaMalloc(&gpu_bboxes_data, 964224U * sizeof(real_T)),
                 __FILE__, __LINE__);
  rangeData_outdatedOnCpu = false;
  rangeData_outdatedOnGpu = false;
  intensity_outdatedOnCpu = false;
  empty_non_axis_sizes = false;
  normals_outdatedOnCpu = false;
  normals_outdatedOnGpu = false;
  value_outdatedOnCpu = false;
  value_outdatedOnGpu = false;
  location_outdatedOnCpu = false;
  location_outdatedOnGpu = false;
  indices_outdatedOnCpu = false;
  indices_outdatedOnGpu = false;
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);
  emxInitStruct_pointCloud(&ptCloud, &i_emlrtRTEI, true);
  emxInitStruct_pointCloud1(&ptCloudUnorg, &g_emlrtRTEI, true);
  emxInit_boolean_T(&cpu_indices, 1, &h_emlrtRTEI, true);
  emxInit_real32_T(&cpu_location, 2, &h_emlrtRTEI, true);
  emxInit_uint8_T(&cpu_value, 2, &f_emlrtRTEI, true);
  emxInit_real32_T(&cpu_normals, 2, &h_emlrtRTEI, true);
  emxInit_real32_T(&cpu_intensity, 2, &h_emlrtRTEI, true);
  emxInit_real32_T(&cpu_rangeData, 2, &h_emlrtRTEI, true);
  emxInit_uint8_T(&cpu_b, 2, &j_emlrtRTEI, true);
  emxInit_real32_T(&dataIn, 2, &g_emlrtRTEI, true);
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
    coder::internal::dlnetwork_setup(&gobj_0);
    gobj_0.matlabCodegenIsDeleted = false;
    pointPillarObj.Network = &gobj_0;
    pointpillarsDetect_kernel1<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(
        *gpu_anchors_data, dv1[0], dv1[1], dv1[2], dv1[3], dv1[4], dv1[5],
        dv1[6], dv1[7], dv1[8], dv1[9]);
    pointpillarsDetect_kernel2<<<dim3(105U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
        *global_gpu_dv2, *gpu_xx, *gpu_yy);
    pointpillarsDetect_kernel3<<<dim3(105U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
        *gpu_yy, *gpu_xx, *gpu_tmp);
    pointpillarsDetect_kernel4<<<dim3(210U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
        *gpu_tmp, -1, *gpu_tmp_data);
    pointpillarsDetect_kernel5<<<dim3(1465U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
        *gpu_anchors3dMod_data);
    pointpillarsDetect_kernel6<<<dim3(419U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
        *gpu_tmp_data, *gpu_anchors3dMod_data);
    pointpillarsDetect_kernel7<<<dim3(1047U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
        *gpu_anchors_data, *gpu_anchorsDim_data);
    pointpillarsDetect_kernel8<<<dim3(210U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
        *gpu_anchorsDim_data, *gpu_anchors3dMod_data);
    pointpillarsDetect_kernel9<<<dim3(628U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
        *gpu_anchorsDim_data, *gpu_anchors3dMod_data);
    pointpillarsDetect_kernel10<<<dim3(210U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
        *gpu_anchorsDim_data, *gpu_anchors3dMod_data);
    pointpillarsDetect_kernel11<<<dim3(210U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
        *gpu_anchors3dMod_data, *gpu_anchorMask_data);
    pointpillarsDetect_kernel12<<<dim3(210U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
        *gpu_anchorMask_data, *gpu_anchors3dMod_data);
    pointpillarsDetect_kernel13<<<dim3(419U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
        *gpu_anchors3dMod_data, *gpu_tmp2_data, *gpu_tmp_data);
    empty_non_axis_sizes = true;
    rangeData_outdatedOnCpu = true;
    pointPillarObj.AnchorsBEV.size[0] = 107136;
    pointPillarObj.AnchorsBEV.size[1] = 4;
    for (iacol = 0; iacol < 214272; iacol++) {
      if (empty_non_axis_sizes) {
        checkCudaError(cudaMemcpy(SD->f3.cpu_tmp_data, *gpu_tmp_data, 1714176UL,
                                  cudaMemcpyDeviceToHost),
                       __FILE__, __LINE__);
      }
      empty_non_axis_sizes = false;
      pointPillarObj.AnchorsBEV.data[iacol] = SD->f3.cpu_tmp_data[iacol];
    }
    for (iacol = 0; iacol < 214272; iacol++) {
      if (rangeData_outdatedOnCpu) {
        checkCudaError(cudaMemcpy(SD->f3.cpu_tmp2_data, *gpu_tmp2_data,
                                  1714176UL, cudaMemcpyDeviceToHost),
                       __FILE__, __LINE__);
      }
      rangeData_outdatedOnCpu = false;
      pointPillarObj.AnchorsBEV.data[iacol + 214272] =
          SD->f3.cpu_tmp2_data[iacol];
    }
    pointPillarObj_not_empty = true;
  }
  ptCloud.HasKdtreeConstructed = false;
  ptCloud.HasLocationHandleAllocated = false;
  ibmat = ptCloud.Location->size[0] * ptCloud.Location->size[1];
  ptCloud.Location->size[0] = dataLoc->size[0];
  ptCloud.Location->size[1] = 3;
  emxEnsureCapacity_real32_T(ptCloud.Location, ibmat, &emlrtRTEI);
  for (ibmat = 0; ibmat < dataLoc->size[0] * 3; ibmat++) {
    ptCloud.Location->data[ibmat] = dataLoc->data[ibmat];
  }
  ptCloud.Color->size[0] = 0;
  ptCloud.Color->size[1] = 0;
  ptCloud.Normal->size[0] = 0;
  ptCloud.Normal->size[1] = 0;
  ibmat = ptCloud.Intensity->size[0];
  ptCloud.Intensity->size[0] = dataInt->size[0];
  emxEnsureCapacity_real32_T(ptCloud.Intensity, ibmat, &b_emlrtRTEI);
  for (ibmat = 0; ibmat < dataInt->size[0]; ibmat++) {
    ptCloud.Intensity->data[ibmat] = dataInt->data[ibmat];
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
  ibmat = ptCloudUnorg.Location->size[0] * ptCloudUnorg.Location->size[1];
  ptCloudUnorg.Location->size[0] = cpu_location->size[0];
  ptCloudUnorg.Location->size[1] = 3;
  emxEnsureCapacity_real32_T(ptCloudUnorg.Location, ibmat, &emlrtRTEI);
  for (ibmat = 0; ibmat < cpu_location->size[0] * 3; ibmat++) {
    if (location_outdatedOnCpu) {
      gpuEmxMemcpyGpuToCpu_real32_T(cpu_location, &gpu_location);
    }
    location_outdatedOnCpu = false;
    ptCloudUnorg.Location->data[ibmat] = cpu_location->data[ibmat];
  }
  for (ibmat = 0; ibmat < 2; ibmat++) {
    numPoints[ibmat] = static_cast<uint32_T>(cpu_value->size[ibmat]);
  }
  empty_non_axis_sizes = true;
  nx = 0;
  exitg1 = false;
  while ((!exitg1) && (nx < 2)) {
    if (static_cast<int32_T>(numPoints[nx]) != (nx << 1) + 1) {
      empty_non_axis_sizes = false;
      exitg1 = true;
    } else {
      nx++;
    }
  }
  if (empty_non_axis_sizes) {
    numPoints[0] = static_cast<uint32_T>(ptCloudUnorg.Location->size[0]);
    outsize[0] = cpu_value->size[0] * static_cast<int32_T>(numPoints[0]);
    if (!(outsize[0] == static_cast<real_T>(cpu_value->size[0]) *
                            static_cast<real_T>(numPoints[0]))) {
      y = nullptr;
      m = emlrtCreateCharArray(2, &iv[0]);
      emlrtInitCharArrayR2013a(emlrtRootTLSGlobal, 15, m, &u[0]);
      emlrtAssign(&y, m);
      b_error(y, &emlrtMCI);
    }
    empty_non_axis_sizes = false;
    ibmat = cpu_b->size[0] * cpu_b->size[1];
    cpu_b->size[0] = outsize[0];
    cpu_b->size[1] = 3;
    emxEnsureCapacity_uint8_T(cpu_b, ibmat, &e_emlrtRTEI);
    colIdx = cpu_value->size[0];
    rowIdx = static_cast<int32_T>(numPoints[0]);
    for (jcol = 0; jcol < 3; jcol++) {
      iacol = jcol * colIdx;
      ibmat = jcol * (colIdx * rowIdx);
      for (itilerow = 0; itilerow < rowIdx; itilerow++) {
        ibcol = ibmat + itilerow * colIdx;
        for (nx = 0; nx < colIdx; nx++) {
          if (value_outdatedOnCpu) {
            gpuEmxMemcpyGpuToCpu_uint8_T(cpu_value, &gpu_value);
          }
          value_outdatedOnCpu = false;
          cpu_b->data[ibcol + nx] = cpu_value->data[iacol + nx];
          empty_non_axis_sizes = true;
        }
      }
    }
    ibmat = cpu_value->size[0] * cpu_value->size[1];
    cpu_value->size[0] = cpu_b->size[0];
    cpu_value->size[1] = 3;
    emxEnsureCapacity_uint8_T(cpu_value, ibmat, &f_emlrtRTEI);
    nx = cpu_b->size[0] * 3 - 1;
    mwGetLaunchParameters1D(computeNumIters(nx), &grid, &block, 2147483647U);
    gpuEmxEnsureCapacity_uint8_T(cpu_b, &gpu_b, !empty_non_axis_sizes);
    gpuEmxEnsureCapacity_uint8_T(cpu_value, &gpu_value, true);
    if (empty_non_axis_sizes) {
      gpuEmxMemcpyCpuToGpu_uint8_T(&gpu_b, cpu_b);
    }
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillarsDetect_kernel14<<<grid, block>>>(gpu_b, nx, gpu_value);
    }
    value_outdatedOnCpu = true;
  }
  ibmat = ptCloudUnorg.Color->size[0] * ptCloudUnorg.Color->size[1];
  ptCloudUnorg.Color->size[0] = cpu_value->size[0];
  ptCloudUnorg.Color->size[1] = 3;
  emxEnsureCapacity_uint8_T(ptCloudUnorg.Color, ibmat, &c_emlrtRTEI);
  for (ibmat = 0; ibmat < cpu_value->size[0] * 3; ibmat++) {
    if (value_outdatedOnCpu) {
      gpuEmxMemcpyGpuToCpu_uint8_T(cpu_value, &gpu_value);
    }
    value_outdatedOnCpu = false;
    ptCloudUnorg.Color->data[ibmat] = cpu_value->data[ibmat];
  }
  ibmat = ptCloudUnorg.Normal->size[0] * ptCloudUnorg.Normal->size[1];
  ptCloudUnorg.Normal->size[0] = cpu_normals->size[0];
  ptCloudUnorg.Normal->size[1] = 3;
  emxEnsureCapacity_real32_T(ptCloudUnorg.Normal, ibmat, &d_emlrtRTEI);
  for (ibmat = 0; ibmat < cpu_normals->size[0] * 3; ibmat++) {
    if (normals_outdatedOnCpu) {
      gpuEmxMemcpyGpuToCpu_real32_T(cpu_normals, &gpu_normals);
    }
    normals_outdatedOnCpu = false;
    ptCloudUnorg.Normal->data[ibmat] = cpu_normals->data[ibmat];
  }
  ibmat = ptCloudUnorg.Intensity->size[0] * ptCloudUnorg.Intensity->size[1];
  ptCloudUnorg.Intensity->size[0] = cpu_intensity->size[0];
  ptCloudUnorg.Intensity->size[1] = 1;
  emxEnsureCapacity_real32_T(ptCloudUnorg.Intensity, ibmat, &b_emlrtRTEI);
  for (ibmat = 0; ibmat < cpu_intensity->size[0]; ibmat++) {
    if (intensity_outdatedOnCpu) {
      gpuEmxMemcpyGpuToCpu_real32_T(cpu_intensity, &gpu_intensity);
    }
    intensity_outdatedOnCpu = false;
    ptCloudUnorg.Intensity->data[ibmat] = cpu_intensity->data[ibmat];
  }
  ptCloudUnorg.Kdtree = nullptr;
  ptCloudUnorg.LocationHandle = nullptr;
  ptCloudUnorg.matlabCodegenIsDeleted = false;
  if (ptCloudUnorg.Location->size[0] != 0) {
    iacol = ptCloudUnorg.Location->size[0];
  } else if ((ptCloudUnorg.Intensity->size[0] != 0) &&
             (ptCloudUnorg.Intensity->size[1] != 0)) {
    iacol = ptCloudUnorg.Intensity->size[0];
  } else {
    iacol = 0;
    if (ptCloudUnorg.Intensity->size[0] > 0) {
      iacol = ptCloudUnorg.Intensity->size[0];
    }
  }
  empty_non_axis_sizes = (iacol == 0);
  if (empty_non_axis_sizes || (ptCloudUnorg.Location->size[0] != 0)) {
    input_sizes_idx_1 = 3;
  } else {
    input_sizes_idx_1 = 0;
  }
  if (empty_non_axis_sizes || ((ptCloudUnorg.Intensity->size[0] != 0) &&
                               (ptCloudUnorg.Intensity->size[1] != 0))) {
    colIdx = ptCloudUnorg.Intensity->size[1];
  } else {
    colIdx = 0;
  }
  ibmat = dataIn->size[0] * dataIn->size[1];
  dataIn->size[0] = iacol;
  dataIn->size[1] = input_sizes_idx_1 + colIdx;
  emxEnsureCapacity_real32_T(dataIn, ibmat, &g_emlrtRTEI);
  rowIdx = input_sizes_idx_1;
  for (ibmat = 0; ibmat < rowIdx; ibmat++) {
    for (ibcol = 0; ibcol < iacol; ibcol++) {
      dataIn->data[ibcol + dataIn->size[0] * ibmat] =
          ptCloudUnorg.Location->data[ibcol + iacol * ibmat];
    }
  }
  for (ibmat = 0; ibmat < colIdx; ibmat++) {
    for (ibcol = 0; ibcol < iacol; ibcol++) {
      dataIn->data[ibcol + dataIn->size[0] * (ibmat + input_sizes_idx_1)] =
          ptCloudUnorg.Intensity->data[ibcol + iacol * ibmat];
    }
  }
  pointpillarsDetect_kernel15<<<dim3(108U, 1U, 1U), dim3(224U, 1U, 1U)>>>(
      *gpu_pillarIndices);
  pointpillarsDetect_kernel16<<<dim3(21094U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
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
      *gpu_fv1, *gpu_fv2, *gpu_predOcc, *c_gpu_this_workspace_predClassi,
      *gpu_this_workspace_predHeading, *gpu_predAngle);
  pointpillarsDetect_kernel17<<<dim3(419U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
      *gpu_sparseVoxelMap);
  empty_non_axis_sizes = false;
  rangeData_outdatedOnGpu = true;
  iacol = 0;
  for (nx = 0; nx < 24000; nx++) {
    if (cpu_pillarIndices[nx] != 0.0F) {
      iacol++;
    }
  }
  numPillars = static_cast<real_T>(iacol) / 2.0;
  if (numPillars < 1.0) {
    ibmat = 0;
  } else {
    ibmat = static_cast<int32_T>(numPillars);
  }
  nx = ibmat;
  mwGetLaunchParameters1D(computeNumIters(ibmat - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel18<<<grid, block>>>(*gpu_pillarIndices, ibmat - 1,
                                                 *gpu_iv1_data);
  }
  rangeData_outdatedOnCpu = true;
  for (ibmat = 0; ibmat < nx; ibmat++) {
    if (rangeData_outdatedOnGpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_sparseVoxelMap, *gpu_sparseVoxelMap,
                                1714176UL, cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    if (rangeData_outdatedOnCpu) {
      checkCudaError(cudaMemcpy(cpu_iv1_data, *gpu_iv1_data, 48000UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    rangeData_outdatedOnCpu = false;
    SD->f3.cpu_sparseVoxelMap[cpu_iv1_data[ibmat] - 1] = 1.0;
    rangeData_outdatedOnGpu = false;
    empty_non_axis_sizes = true;
  }
  if (empty_non_axis_sizes) {
    checkCudaError(cudaMemcpy(*gpu_sparseVoxelMap, SD->f3.cpu_sparseVoxelMap,
                              1714176UL, cudaMemcpyHostToDevice),
                   __FILE__, __LINE__);
  }
  mwCallThrustScanNDEdge(&(*gpu_sparseVoxelMap)[0], 432, false, 214272);
  for (ibmat = 0; ibmat < 2; ibmat++) {
    outsize[ibmat] = (ibmat << 6) + 432;
  }
  mwCallThrustScanNDOther(&(*gpu_sparseVoxelMap)[0], 2, &outsize[0], 1, false,
                          214272, false);
  rangeData_outdatedOnGpu = true;
  empty_non_axis_sizes = false;
  for (nx = 0; nx < 107136; nx++) {
    real_T xmaxGrid;
    real_T ymaxGrid;
    real_T yminGrid;
    numPillars =
        std::fmax(std::floor(pointPillarObj.AnchorsBEV.data[nx] / 0.16), 1.0);
    yminGrid = std::fmax(
        std::floor((pointPillarObj.AnchorsBEV.data[nx + 107136] - -39.68) /
                   0.16),
        1.0);
    xmaxGrid = std::fmin(
        std::floor(pointPillarObj.AnchorsBEV.data[nx + 214272] / 0.16), 432.0);
    ymaxGrid = std::fmin(
        std::floor((pointPillarObj.AnchorsBEV.data[nx + 321408] - -39.68) /
                   0.16),
        496.0);
    if (rangeData_outdatedOnGpu) {
      checkCudaError(cudaMemcpy(SD->f3.cpu_sparseVoxelMap, *gpu_sparseVoxelMap,
                                1714176UL, cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
    }
    rangeData_outdatedOnGpu = false;
    SD->f3.cpu_anchorMask_data[nx] =
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
    empty_non_axis_sizes = true;
  }
  if (empty_non_axis_sizes) {
    checkCudaError(cudaMemcpy(*gpu_anchorMask_data, SD->f3.cpu_anchorMask_data,
                              857088UL, cudaMemcpyHostToDevice),
                   __FILE__, __LINE__);
  }
  pointpillarsDetect_kernel19<<<dim3(210U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
      *gpu_anchorMask_data, *b_gpu_anchorMask_data);
  rangeData_outdatedOnCpu = false;
  for (iacol = 0; iacol < 2; iacol++) {
    numPillars = static_cast<real_T>(iacol) + 1.0;
    for (ibmat = 0; ibmat < 5; ibmat++) {
      cpu_newAnchors_data[static_cast<int32_T>(numPillars) - 1].f1[ibmat] =
          dv1[iacol + (ibmat << 1)];
      rangeData_outdatedOnCpu = true;
    }
  }
  empty_non_axis_sizes = true;
  colIdx = 0;
  nx = 0;
  exitg1 = false;
  while ((!exitg1) && (nx + 1 < 4)) {
    if (colIdx > dv4[nx]) {
      empty_non_axis_sizes = false;
      exitg1 = true;
    } else {
      colIdx = dv4[nx];
      nx++;
    }
  }
  if (empty_non_axis_sizes) {
    pointpillarsDetect_kernel20<<<dim3(210U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
        *b_gpu_anchorMask_data, *c_gpu_anchorMask_data);
  } else {
    pointpillarsDetect_kernel57<<<dim3(210U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
        *b_gpu_anchorMask_data, *c_gpu_anchorMask_data);
  }
  pointpillarsDetect_kernel21<<<dim3(210U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
      *c_gpu_anchorMask_data, threshold, *gpu_predOcc, *gpu_x);
  empty_non_axis_sizes = true;
  rowIdx = 0;
  rangeData_outdatedOnGpu = false;
  iacol = 1;
  exitg1 = false;
  while ((!exitg1) && (iacol < 107137)) {
    if (empty_non_axis_sizes) {
      checkCudaError(
          cudaMemcpy(SD->f3.cpu_x, *gpu_x, 107136UL, cudaMemcpyDeviceToHost),
          __FILE__, __LINE__);
    }
    empty_non_axis_sizes = false;
    if (SD->f3.cpu_x[iacol - 1]) {
      rowIdx++;
      SD->f3.cpu_ii_data[rowIdx - 1] = iacol;
      rangeData_outdatedOnGpu = true;
      if (rowIdx >= 107136) {
        exitg1 = true;
      } else {
        iacol++;
      }
    } else {
      iacol++;
    }
  }
  if (rowIdx < 1) {
    itilerow = 0;
  } else {
    itilerow = rowIdx;
  }
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  if (rangeData_outdatedOnGpu) {
    checkCudaError(cudaMemcpy(*gpu_ii_data, SD->f3.cpu_ii_data, 428544UL,
                              cudaMemcpyHostToDevice),
                   __FILE__, __LINE__);
  }
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel22<<<grid, block>>>(*gpu_ii_data, itilerow - 1,
                                                 *gpu_v1_data);
  }
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel23<<<grid, block>>>(*gpu_v1_data, itilerow - 1,
                                                 *gpu_vk_data);
  }
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel24<<<grid, block>>>(
        *gpu_vk_data, itilerow - 1, *gpu_v1_data, *gpu_varargout_6_data);
  }
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel25<<<grid, block>>>(*gpu_v1_data, itilerow - 1,
                                                 *gpu_vk_data);
  }
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel26<<<grid, block>>>(*gpu_vk_data, itilerow - 1,
                                                 *gpu_v1_data);
  }
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel27<<<grid, block>>>(
        *gpu_vk_data, *gpu_v1_data, itilerow - 1, *gpu_col_data, *gpu_ii_data);
  }
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel28<<<grid, block>>>(
        *gpu_predOcc, *gpu_varargout_6_data, *gpu_col_data, *gpu_ii_data,
        itilerow - 1, *gpu_yCen_data, *gpu_anchorMask_data,
        *gpu_confScore_data);
  }
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  if (rangeData_outdatedOnCpu) {
    checkCudaError(cudaMemcpy(*gpu_newAnchors_data, cpu_newAnchors_data, 80UL,
                              cudaMemcpyHostToDevice),
                   __FILE__, __LINE__);
  }
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel29<<<grid, block>>>(
        *gpu_anchorMask_data, *gpu_newAnchors_data, *gpu_fv2, *gpu_col_data,
        *gpu_ii_data, *gpu_varargout_6_data, itilerow - 1, *gpu_xGt_data);
  }
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel30<<<grid, block>>>(
        *gpu_yCen_data, *gpu_newAnchors_data, *gpu_fv2, *gpu_col_data,
        *gpu_ii_data, *gpu_varargout_6_data, itilerow - 1, *gpu_yGt_data);
  }
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel31<<<grid, block>>>(
        *gpu_newAnchors_data, *gpu_fv2, *gpu_col_data, *gpu_ii_data,
        *gpu_varargout_6_data, itilerow - 1, *gpu_zGt_data);
  }
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel32<<<grid, block>>>(
        *gpu_newAnchors_data, *gpu_fv1, *gpu_col_data, *gpu_ii_data,
        *gpu_varargout_6_data, itilerow - 1, *gpu_lGt_data);
  }
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel33<<<grid, block>>>(
        *gpu_newAnchors_data, *gpu_fv1, *gpu_col_data, *gpu_ii_data,
        *gpu_varargout_6_data, itilerow - 1, *gpu_wGt_data);
  }
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel34<<<grid, block>>>(
        *gpu_newAnchors_data, *gpu_fv1, *gpu_col_data, *gpu_ii_data,
        *gpu_varargout_6_data, itilerow - 1, *gpu_hGt_data);
  }
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel35<<<grid, block>>>(
        *gpu_this_workspace_predHeading, *gpu_varargout_6_data, *gpu_col_data,
        *gpu_ii_data, itilerow - 1, *gpu_hdGt_data);
  }
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel36<<<grid, block>>>(itilerow - 1, *gpu_hdGt_data);
  }
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel37<<<grid, block>>>(itilerow - 1, *gpu_hdGt_data);
  }
  pointpillarsDetect_kernel38<<<dim3(210U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
      *gpu_predAngle);
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel39<<<grid, block>>>(
        *gpu_newAnchors_data, *gpu_predAngle, *gpu_col_data, *gpu_ii_data,
        *gpu_hdGt_data, *gpu_varargout_6_data, itilerow - 1, *gpu_angGt_data);
  }
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel40<<<grid, block>>>(itilerow - 1, *gpu_angGt_data);
  }
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel41<<<grid, block>>>(itilerow - 1, *gpu_angGt_data);
  }
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel42<<<grid, block>>>(
        *c_gpu_this_workspace_predClassi, *gpu_varargout_6_data, *gpu_col_data,
        *gpu_ii_data, itilerow - 1, *gpu_varargout_1_data);
  }
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel43<<<grid, block>>>(
        *gpu_varargout_1_data, itilerow - 1, *gpu_anchorMask_data);
  }
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel44<<<grid, block>>>(itilerow - 1,
                                                 *gpu_anchorMask_data);
  }
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel45<<<grid, block>>>(*gpu_anchorMask_data,
                                                 itilerow - 1, *gpu_yCen_data);
  }
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel46<<<grid, block>>>(threshold, itilerow - 1,
                                                 *gpu_yCen_data);
  }
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel47<<<grid, block>>>(threshold, itilerow - 1,
                                                 *gpu_yCen_data);
  }
  mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                          2147483647U);
  validLaunchParams = mwValidateLaunchParameters(grid, block);
  if (validLaunchParams) {
    pointpillarsDetect_kernel48<<<grid, block>>>(
        *gpu_yCen_data, *gpu_confScore_data, *gpu_angGt_data, *gpu_hGt_data,
        *gpu_wGt_data, *gpu_lGt_data, *gpu_zGt_data, *gpu_yGt_data, itilerow,
        *gpu_xGt_data, itilerow - 1, *gpu_boxPreds_data);
  }
  if (itilerow != 0) {
    mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                            2147483647U);
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillarsDetect_kernel49<<<grid, block>>>(
          *gpu_boxPreds_data, itilerow, itilerow - 1, *b_gpu_anchorMask_data);
    }
    normals_outdatedOnGpu = true;
    rowIdx = 0;
    rangeData_outdatedOnGpu = false;
    jcol = itilerow;
    iacol = 1;
    exitg1 = false;
    while ((!exitg1) && (iacol <= itilerow)) {
      if (normals_outdatedOnGpu) {
        checkCudaError(cudaMemcpy(SD->f3.b_cpu_anchorMask_data,
                                  *b_gpu_anchorMask_data, 107136UL,
                                  cudaMemcpyDeviceToHost),
                       __FILE__, __LINE__);
      }
      normals_outdatedOnGpu = false;
      if (SD->f3.b_cpu_anchorMask_data[iacol - 1]) {
        rowIdx++;
        SD->f3.cpu_ii_data[rowIdx - 1] = iacol;
        rangeData_outdatedOnGpu = true;
        if (rowIdx >= itilerow) {
          exitg1 = true;
        } else {
          iacol++;
        }
      } else {
        iacol++;
      }
    }
    if (itilerow == 1) {
      if (rowIdx == 0) {
        rangeData_outdatedOnGpu = false;
        jcol = 0;
      }
    } else if (rowIdx < 1) {
      jcol = 0;
    } else {
      jcol = rowIdx;
    }
    mwGetLaunchParameters1D(computeNumIters(itilerow - 1), &grid, &block,
                            2147483647U);
    validLaunchParams = mwValidateLaunchParameters(grid, block);
    if (validLaunchParams) {
      pointpillarsDetect_kernel50<<<grid, block>>>(itilerow, itilerow - 1,
                                                   *gpu_boxPreds_data);
    }
    value_outdatedOnGpu = true;
    if (jcol != 0) {
      int32_T selectedIndex_size[1];
      scores_size[0] = jcol;
      mwGetLaunchParameters1D(computeNumIters(jcol - 1), &grid, &block,
                              2147483647U);
      if (rangeData_outdatedOnGpu) {
        checkCudaError(cudaMemcpy(*gpu_ii_data, SD->f3.cpu_ii_data, 428544UL,
                                  cudaMemcpyHostToDevice),
                       __FILE__, __LINE__);
      }
      validLaunchParams = mwValidateLaunchParameters(grid, block);
      if (validLaunchParams) {
        pointpillarsDetect_kernel51<<<grid, block>>>(
            *gpu_boxPreds_data, itilerow, *gpu_ii_data, jcol - 1,
            *gpu_hdGt_data, gpu_scores_data);
      }
      rangeData_outdatedOnCpu = true;
      colIdx = 2;
      if (jcol != 1) {
        colIdx = 1;
      }
      outsize[0] = jcol;
      outsize[1] = 1;
      nx = scores_size[0] - 1;
      mwGetLaunchParameters1D(computeNumIters(nx), &grid, &block, 2147483647U);
      validLaunchParams = mwValidateLaunchParameters(grid, block);
      if (validLaunchParams) {
        pointpillarsDetect_kernel52<<<grid, block>>>(
            gpu_scores_data, nx, *gpu_anchorMask_data, *gpu_varargout_1_data);
      }
      gpu_thrust_sort_with_index(&(*gpu_varargout_1_data)[0],
                                 &(*gpu_anchorMask_data)[0], 2, &outsize[0],
                                 colIdx, 'd', false);
      empty_non_axis_sizes = true;
      boxPreds_size[0] = jcol;
      boxPreds_size[1] = 5;
      mwGetLaunchParameters1D(computeNumIters(4, jcol - 1), &grid, &block,
                              2147483647U);
      validLaunchParams = mwValidateLaunchParameters(grid, block);
      if (validLaunchParams) {
        pointpillarsDetect_kernel53<<<grid, block>>>(
            *gpu_boxPreds_data, itilerow, *gpu_ii_data, *gpu_anchorMask_data,
            jcol, jcol - 1, *b_gpu_boxPreds_data, iv23[0], iv23[1], iv23[2],
            iv23[3], iv23[4]);
      }
      mwGetLaunchParameters1D(computeNumIters(jcol - 1), &grid, &block,
                              2147483647U);
      validLaunchParams = mwValidateLaunchParameters(grid, block);
      if (validLaunchParams) {
        pointpillarsDetect_kernel54<<<grid, block>>>(
            *gpu_hdGt_data, *gpu_anchorMask_data, jcol - 1,
            *gpu_varargout_1_data);
      }
      checkCudaError(cudaMemcpy(SD->f3.b_cpu_boxPreds_data,
                                *b_gpu_boxPreds_data, 2142720UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
      checkCudaError(cudaMemcpy(SD->f3.cpu_varargout_1_data,
                                *gpu_varargout_1_data, 428544UL,
                                cudaMemcpyDeviceToHost),
                     __FILE__, __LINE__);
      coder::b_selectStrongestBboxCodegen(
          SD, SD->f3.b_cpu_boxPreds_data, boxPreds_size,
          SD->f3.cpu_varargout_1_data, SD->f3.cpu_selectedIndex_data,
          selectedIndex_size);
      nx = selectedIndex_size[0];
      mwGetLaunchParameters1D(computeNumIters(selectedIndex_size[0] - 1), &grid,
                              &block, 2147483647U);
      checkCudaError(cudaMemcpy(*gpu_selectedIndex_data,
                                SD->f3.cpu_selectedIndex_data, 107136UL,
                                cudaMemcpyHostToDevice),
                     __FILE__, __LINE__);
      validLaunchParams = mwValidateLaunchParameters(grid, block);
      if (validLaunchParams) {
        pointpillarsDetect_kernel55<<<grid, block>>>(*gpu_selectedIndex_data,
                                                     selectedIndex_size[0] - 1,
                                                     *b_gpu_anchorMask_data);
      }
      normals_outdatedOnGpu = true;
      for (ibmat = 0; ibmat < nx; ibmat++) {
        if (empty_non_axis_sizes) {
          checkCudaError(cudaMemcpy(SD->f3.cpu_anchorMask_data,
                                    *gpu_anchorMask_data, 857088UL,
                                    cudaMemcpyDeviceToHost),
                         __FILE__, __LINE__);
        }
        empty_non_axis_sizes = false;
        if (normals_outdatedOnGpu) {
          checkCudaError(cudaMemcpy(SD->f3.b_cpu_anchorMask_data,
                                    *b_gpu_anchorMask_data, 107136UL,
                                    cudaMemcpyDeviceToHost),
                         __FILE__, __LINE__);
        }
        normals_outdatedOnGpu = false;
        SD->f3.cpu_selectedIndex_data[static_cast<int32_T>(
                                          SD->f3.cpu_anchorMask_data[ibmat]) -
                                      1] = SD->f3.b_cpu_anchorMask_data[ibmat];
      }
      rowIdx = selectedIndex_size[0] - 1;
      iacol = 0;
      colIdx = 0;
      for (ibmat = 0; ibmat <= rowIdx; ibmat++) {
        if (SD->f3.cpu_selectedIndex_data[ibmat]) {
          iacol++;
          if (rangeData_outdatedOnCpu) {
            checkCudaError(cudaMemcpy(cpu_scores_data, gpu_scores_data,
                                      static_cast<uint32_T>(scores_size[0]) *
                                          sizeof(real32_T),
                                      cudaMemcpyDeviceToHost),
                           __FILE__, __LINE__);
          }
          cpu_scores_data[colIdx] = cpu_scores_data[ibmat];
          rangeData_outdatedOnCpu = false;
          colIdx++;
        }
      }
      scores_size[0] = iacol;
      nx = selectedIndex_size[0];
      rowIdx = 0;
      jcol = selectedIndex_size[0];
      iacol = 1;
      exitg1 = false;
      while ((!exitg1) && (iacol <= nx)) {
        if (SD->f3.cpu_selectedIndex_data[iacol - 1]) {
          rowIdx++;
          SD->f3.cpu_ii_data[rowIdx - 1] = iacol;
          if (rowIdx >= nx) {
            exitg1 = true;
          } else {
            iacol++;
          }
        } else {
          iacol++;
        }
      }
      if (selectedIndex_size[0] == 1) {
        if (rowIdx == 0) {
          jcol = 0;
        }
      } else if (rowIdx < 1) {
        jcol = 0;
      } else {
        jcol = rowIdx;
      }
      bboxes_size[0] = jcol;
      bboxes_size[1] = 9;
      nx = jcol * 9 - 1;
      mwGetLaunchParameters1D(computeNumIters(nx), &grid, &block, 2147483647U);
      validLaunchParams = mwValidateLaunchParameters(grid, block);
      if (validLaunchParams) {
        pointpillarsDetect_kernel56<<<grid, block>>>(nx, gpu_bboxes_data);
      }
      empty_non_axis_sizes = true;
      for (ibmat = 0; ibmat < 7; ibmat++) {
        for (ibcol = 0; ibcol < jcol; ibcol++) {
          if (empty_non_axis_sizes) {
            checkCudaError(
                cudaMemcpy(cpu_bboxes_data, gpu_bboxes_data,
                           static_cast<uint32_T>(bboxes_size[0] * 9) *
                               sizeof(real_T),
                           cudaMemcpyDeviceToHost),
                __FILE__, __LINE__);
          }
          if (value_outdatedOnGpu) {
            checkCudaError(cudaMemcpy(SD->f3.cpu_boxPreds_data,
                                      *gpu_boxPreds_data, 3856896UL,
                                      cudaMemcpyDeviceToHost),
                           __FILE__, __LINE__);
          }
          value_outdatedOnGpu = false;
          cpu_bboxes_data[ibcol + bboxes_size[0] * iv27[ibmat]] =
              SD->f3.cpu_boxPreds_data[(SD->f3.cpu_ii_data[ibcol] +
                                        itilerow * ibmat) -
                                       1];
          empty_non_axis_sizes = false;
        }
      }
      coder::internal::c_returnCategoricalLabels(
          SD, static_cast<real_T>(bboxes_size[0]), labels->codes.data,
          labels->codes.size, labels->categoryNames.data,
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
  emxFree_real32_T(&dataIn);
  emxFree_uint8_T(&cpu_b);
  emxFree_real32_T(&cpu_rangeData);
  emxFree_real32_T(&cpu_intensity);
  emxFree_real32_T(&cpu_normals);
  emxFree_uint8_T(&cpu_value);
  emxFree_real32_T(&cpu_location);
  emxFree_boolean_T(&cpu_indices);
  emxFreeStruct_pointCloud1(&ptCloudUnorg);
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
  gpuEmxFree_boolean_T(&gpu_indices);
  gpuEmxFree_real32_T(&gpu_location);
  gpuEmxFree_uint8_T(&gpu_value);
  gpuEmxFree_real32_T(&gpu_normals);
  gpuEmxFree_real32_T(&gpu_intensity);
  gpuEmxFree_real32_T(&gpu_rangeData);
  gpuEmxFree_uint8_T(&gpu_b);
  checkCudaError(mwCudaFree(*gpu_anchors_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_yy), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_xx), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_tmp), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_tmp_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_anchors3dMod_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_anchorsDim_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_anchorMask_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_tmp2_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_pillarIndices), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_dlPillarFeatures_Data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_fv1), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_fv2), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_predOcc), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*c_gpu_this_workspace_predClassi), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaFree(*gpu_this_workspace_predHeading), __FILE__,
                 __LINE__);
  checkCudaError(mwCudaFree(*gpu_predAngle), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_sparseVoxelMap), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_iv1_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*b_gpu_anchorMask_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_newAnchors_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*c_gpu_anchorMask_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_x), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_ii_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_v1_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_vk_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_varargout_6_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_col_data), __FILE__, __LINE__);
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
  checkCudaError(mwCudaFree(*b_gpu_boxPreds_data), __FILE__, __LINE__);
  checkCudaError(mwCudaFree(*gpu_selectedIndex_data), __FILE__, __LINE__);
}

void pointpillarsDetect_delete()
{
  if (!gobj_0.matlabCodegenIsDeleted) {
    gobj_0.matlabCodegenIsDeleted = true;
    coder::internal::dlnetwork_delete(&gobj_0);
  }
}

void pointpillarsDetect_emx_init()
{
  c_emxInitStruct_pointPillarsObj(&pointPillarObj);
}

void pointpillarsDetect_init()
{
  pointPillarObj_not_empty = false;
}

void pointpillarsDetect_new()
{
  gobj_0.matlabCodegenIsDeleted = true;
}

// End of code generation (pointpillarsDetect.cu)
