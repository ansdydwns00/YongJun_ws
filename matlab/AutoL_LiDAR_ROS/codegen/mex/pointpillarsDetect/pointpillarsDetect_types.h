//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// pointpillarsDetect_types.h
//
// Code generation for function 'pointpillarsDetect'
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
struct emxArray_real_T_107136x4 {
  real_T data[428544];
  int32_T size[2];
};

struct emxArray_real32_T {
  real32_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

struct emxArray_uint32_T_1x107136 {
  uint32_T data[107136];
  int32_T size[2];
};

struct emxArray_char_T_1x10 {
  char_T data[10];
  int32_T size[2];
};

struct cell_wrap_6 {
  emxArray_char_T_1x10 f1;
};

struct emxArray_cell_wrap_6_1 {
  cell_wrap_6 data[1];
  int32_T size[1];
};

namespace coder {
struct categorical {
  emxArray_uint32_T_1x107136 codes;
  emxArray_cell_wrap_6_1 categoryNames;
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

struct emxArray_real_T {
  real_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

struct emxArray_cell_wrap_6_107136 {
  cell_wrap_6 data[107136];
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
class detector0_0 {
public:
  detector0_0();
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
  ~detector0_0();

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
  detector0_0 *Network;
  emxArray_real_T_107136x4 AnchorsBEV;
};

} // namespace internal
} // namespace coder
struct returnCategoricalLabels {
  int32_T idx_data[107136];
};

struct selectStrongestBboxCodegen {
  real32_T X_data[428544];
  real32_T Y_data[428544];
  real32_T bbox_data[214272];
  real32_T x_data[214272];
  real32_T u_data[214272];
  real32_T v_data[214272];
  real32_T r_data[107136];
  real32_T b_x_data[107136];
  real32_T c_x_data[107136];
};

struct b_pointpillarsDetect {
  real32_T cpu_dlPillarFeatures_Data[10800000];
  real32_T cpu_boxPreds_data[964224];
  real32_T b_cpu_boxPreds_data[535680];
  real_T cpu_tmp_data[214272];
  real_T cpu_tmp2_data[214272];
  real_T cpu_sparseVoxelMap[214272];
  real_T cpu_anchorMask_data[107136];
  int32_T cpu_ii_data[107136];
  real32_T cpu_varargout_1_data[107136];
  boolean_T b_cpu_anchorMask_data[107136];
  boolean_T cpu_x[107136];
  boolean_T cpu_selectedIndex_data[107136];
};

struct pointpillarsDetect_api {
  coder::categorical labels;
};

struct b_returnCategoricalLabels {
  emxArray_cell_wrap_6_107136 labelCells;
  emxArray_cell_wrap_6_107136 inData;
  emxArray_cell_wrap_6_107136 uA;
  real_T y_data[107136];
  int32_T locbOfUA_data[107136];
  int32_T b_y_data[107136];
  int32_T ib_data[107136];
  int32_T ii_data[107136];
  int32_T a__2_data[107136];
  boolean_T d_data[107136];
  boolean_T b_d_data[107135];
};

struct pointpillarsDetectStackData {
  returnCategoricalLabels f0;
  selectStrongestBboxCodegen f1;
  b_returnCategoricalLabels f2;
  b_pointpillarsDetect f3;
  pointpillarsDetect_api f4;
};

// End of code generation (pointpillarsDetect_types.h)
