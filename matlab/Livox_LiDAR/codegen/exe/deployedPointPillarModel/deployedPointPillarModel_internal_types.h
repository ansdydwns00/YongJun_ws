//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: deployedPointPillarModel_internal_types.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

#ifndef DEPLOYEDPOINTPILLARMODEL_INTERNAL_TYPES_H
#define DEPLOYEDPOINTPILLARMODEL_INTERNAL_TYPES_H

// Include Files
#include "deployedPointPillarModel_types.h"
#include "rtwtypes.h"
#include "MWCNNLayer.hpp"
#include "MWCudnnCustomLayerBase.hpp"
#include "MWCudnnTargetNetworkImpl.hpp"
#include "MWTensorBase.hpp"
#include "coder_array.h"
#include "mlros2_node.h"
#include "mlros2_pub.h"
#include "mlros2_sub.h"

// Type Definitions
namespace coder {
struct ros2node {
  rclcpp::Node::SharedPtr NodeHandle;
};

struct ros2publisher {
  char TopicName[17];
  char History[8];
  double Depth;
  char Reliability[8];
  char Durability[8];
  std::unique_ptr<MATLABROS2Publisher<vision_msgs::msg::Detection3DArray,
                                      vision_msgs_Detection3DArrayStruct_T>>
      PublisherHelper;
};

struct ros2rate {
  double DesiredRate;
  double DesiredPeriod;
  double StartTime;
  double PreviousPeriod;
  char OverrunAction[4];
  double LastWakeTime;
  double NextExecutionIndex;
  double ExecutionStartTime;
  double CheckPeriod;
};

} // namespace coder
struct cell_wrap_5 {
  double f1[10];
};

struct cell_wrap_60 {
  double f1[5];
};

struct cell_wrap_9 {
  char f1[10];
};

namespace coder {
struct ros2subscriber {
  char TopicName[5];
  char History[8];
  double Depth;
  char Reliability[8];
  char Durability[8];
  double MessageCount;
  std::unique_ptr<MATLABROS2Subscriber<sensor_msgs::msg::PointCloud2,
                                       sensor_msgs_PointCloud2Struct_T>>
      SubscriberHelper;
  sensor_msgs_PointCloud2Struct_T MsgStruct;
};

} // namespace coder
struct cell_wrap_6 {
  coder::array<char, 2U> f1;
};

struct empty {};

namespace coder {
struct pointCloud {
  bool matlabCodegenIsDeleted;
  array<float, 2U> Location;
  array<unsigned char, 2U> Color;
  array<float, 2U> Normal;
  array<float, 2U> Intensity;
  array<float, 2U> RangeData;
  array<empty, 2U> PointCloudArrayData;
};

} // namespace coder
class MWScatterLayer_detector0_01 : public MWCudnnCustomLayerBase {
public:
  MWScatterLayer_detector0_01() = default;
  void createCustomLayer(MWCudnnTarget::MWTargetNetworkImpl *b_targetImpl,
                         MWTensorBase *b, MWTensorBase *c, const char *d,
                         int e);
  void propagateSize();
  void cleanupLayer();
  void predict();
};

class MWResize2DLayer_detector0_01 : public MWCudnnCustomLayerBase {
public:
  MWResize2DLayer_detector0_01() = default;
  void createCustomLayer(MWCudnnTarget::MWTargetNetworkImpl *b_targetImpl,
                         MWTensorBase *b, const char *c, int d);
  void propagateSize();
  void cleanupLayer();
  void predict();
};

class MWResize2DLayer_detector0_02 : public MWCudnnCustomLayerBase {
public:
  MWResize2DLayer_detector0_02() = default;
  void createCustomLayer(MWCudnnTarget::MWTargetNetworkImpl *b_targetImpl,
                         MWTensorBase *b, const char *c, int d);
  void propagateSize();
  void cleanupLayer();
  void predict();
};

class detector0_0 {
public:
  detector0_0();
  void setSize();
  void resetState();
  void setup();
  void activations(int layerIdx);
  void cleanup();
  float *getLayerOutput(int layerIndex, int portIndex);
  int getLayerOutputSize(int layerIndex, int portIndex);
  float *getInputDataPointer(int b_index);
  float *getInputDataPointer();
  float *getOutputDataPointer(int b_index);
  float *getOutputDataPointer();
  int getBatchSize();
  int getOutputSequenceLength(int layerIndex, int portIndex);
  ~detector0_0();

private:
  void allocate();
  void postsetup();
  void deallocate();

public:
  bool isInitialized;
  bool matlabCodegenIsDeleted;

private:
  int numLayers;
  MWTensorBase *inputTensors[2];
  MWTensorBase *outputTensors[6];
  MWCNNLayer *layers[57];
  MWCudnnTarget::MWTargetNetworkImpl *targetImpl;
};

#endif
//
// File trailer for deployedPointPillarModel_internal_types.h
//
// [EOF]
//
