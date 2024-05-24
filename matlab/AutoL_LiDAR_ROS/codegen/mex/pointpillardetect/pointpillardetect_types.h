//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// pointpillardetect_types.h
//
// Code generation for function 'pointpillardetect'
//

#pragma once

// Include files
#include "rtwtypes.h"
#include "MWCNNLayer.hpp"
#include "MWCudnnTargetNetworkImpl.hpp"
#include "MWTensorBase.hpp"
#include "emlrt.h"

// Custom Header Code

#ifdef __CUDA_ARCH__
#undef printf
#endif

// Type Definitions
struct cell_wrap_40 {
  real_T f1[5];
};

struct emxArray_real_T {
  real_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

struct emxArray_real32_T {
  real32_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

struct emxArray_uint32_T_1x214272 {
  uint32_T data[214272];
  int32_T size[2];
};

struct emxArray_char_T_1x5 {
  char_T data[5];
  int32_T size[2];
};

struct cell_wrap_6 {
  emxArray_char_T_1x5 f1;
};

struct emxArray_cell_wrap_6_2 {
  cell_wrap_6 data[2];
  int32_T size[1];
};

namespace coder {
struct categorical {
  emxArray_uint32_T_1x214272 codes;
  emxArray_cell_wrap_6_2 categoryNames;
};

} // namespace coder
struct emxArray_uint8_T {
  uint8_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

namespace coder {
struct pointCloud {
  boolean_T matlabCodegenIsDeleted;
  emxArray_real32_T *Location;
  emxArray_uint8_T *Color;
  emxArray_real32_T *Normal;
  emxArray_real32_T *Intensity;
  void *Kdtree;
  void *LocationHandle;
  boolean_T HasKdtreeConstructed;
  boolean_T HasLocationHandleAllocated;
};

} // namespace coder
struct emxArray_boolean_T {
  boolean_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

struct emxArray_cell_wrap_40 {
  cell_wrap_40 *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

struct emxArray_cell_wrap_6_214272 {
  cell_wrap_6 data[214272];
  int32_T size[1];
};

struct emxArray_pointCloudArray {
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

namespace coder {
struct b_pointCloud {
  boolean_T matlabCodegenIsDeleted;
  emxArray_real32_T *Location;
  emxArray_uint8_T *Color;
  emxArray_real32_T *Normal;
  emxArray_real32_T *Intensity;
  emxArray_real32_T *RangeData;
  void *Kdtree;
  void *LocationHandle;
  boolean_T HasKdtreeConstructed;
  boolean_T HasLocationHandleAllocated;
  emxArray_pointCloudArray *PointCloudArrayData;
};

} // namespace coder
class pretrained0_0 {
public:
  pretrained0_0();
  void setSize();
  void resetState();
  void setup();
  void activations(int32_T layerIdx);
  void cleanup();
  real32_T *getLayerOutput(int32_T layerIndex, int32_T portIndex);
  int32_T getLayerOutputSize(int32_T layerIndex, int32_T portIndex);
  real32_T *getInputDataPointer(int32_T b_index);
  real32_T *getInputDataPointer();
  real32_T *getOutputDataPointer(int32_T b_index);
  real32_T *getOutputDataPointer();
  int32_T getBatchSize();
  int32_T getOutputSequenceLength(int32_T layerIndex, int32_T portIndex);
  ~pretrained0_0();

private:
  void allocate();
  void postsetup();
  void deallocate();

public:
  boolean_T isInitialized;
  boolean_T matlabCodegenIsDeleted;

private:
  int32_T numLayers;
  MWTensorBase *inputTensors[2];
  MWTensorBase *outputTensors[6];
  MWCNNLayer *layers[57];
  MWCudnnTarget::MWTargetNetworkImpl *targetImpl;
};

namespace coder {
namespace internal {
struct pointPillarsObjectDetector {
  pretrained0_0 *Network;
  emxArray_real_T *AnchorsBEV;
};

} // namespace internal
} // namespace coder
struct returnCategoricalLabels {
  emxArray_cell_wrap_6_214272 c;
  int32_T idx_data[214272];
  int8_T y_data[214272];
  boolean_T d_data[214271];
};

struct selectStrongestBboxCodegen {
  real32_T X_data[857088];
  real32_T Y_data[857088];
  real32_T bbox_data[428544];
  real32_T x_data[428544];
  real32_T u_data[428544];
  real32_T v_data[428544];
  real32_T r_data[214272];
  real32_T b_x_data[214272];
  real32_T c_x_data[214272];
};

struct b_pointpillardetect {
  real32_T cpu_dlPillarFeatures_Data[10800000];
  real32_T cpu_boxPreds_data[1071360];
  real32_T cpu_fv1[642816];
  real32_T cpu_fv2[642816];
  real_T cpu_sparseVoxelMap[214272];
  real_T cpu_xCen_data[214272];
  real_T cpu_yCen_data[214272];
  real_T cpu_tmp[107136];
  real32_T cpu_predOcc[214272];
  real32_T cpu_predAngle[214272];
  int32_T cpu_ii_data[214272];
  real32_T cpu_xGt_data[214272];
  real32_T cpu_yGt_data[214272];
  real32_T cpu_zGt_data[214272];
  real32_T cpu_lGt_data[214272];
  real32_T cpu_wGt_data[214272];
  real32_T cpu_hGt_data[214272];
  real32_T cpu_hdGt_data[214272];
  real32_T cpu_angGt_data[214272];
  int32_T cpu_tmp_data[214272];
  int16_T cpu_col_data[214272];
  boolean_T cpu_x[214272];
  int8_T cpu_varargout_6_data[214272];
  boolean_T cpu_x_data[214272];
  boolean_T cpu_selectedIndex_data[214272];
};

struct pointpillardetect_api {
  coder::categorical labels;
};

struct b_returnCategoricalLabels {
  emxArray_cell_wrap_6_214272 labelCells;
  emxArray_cell_wrap_6_214272 inData;
  emxArray_cell_wrap_6_214272 uA;
  real_T y_data[214272];
  int32_T locbOfUA_data[214272];
  int32_T idx_data[214272];
  int32_T ib_data[214272];
  int32_T ii_data[214272];
  int32_T a__2_data[214272];
  int8_T b_ii_data[214272];
  boolean_T d_data[214272];
  boolean_T b_d_data[214271];
};

struct pointpillardetectStackData {
  returnCategoricalLabels f0;
  selectStrongestBboxCodegen f1;
  b_returnCategoricalLabels f2;
  b_pointpillardetect f3;
  pointpillardetect_api f4;
};

// End of code generation (pointpillardetect_types.h)
