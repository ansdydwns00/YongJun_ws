//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: deployedPointPillarModel.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "deployedPointPillarModel.h"
#include "deployedPointPillarModel_data.h"
#include "deployedPointPillarModel_initialize.h"
#include "deployedPointPillarModel_internal_types.h"
#include "deployedPointPillarModel_types.h"
#include "dlnetwork.h"
#include "pointCloudBase.h"
#include "pointPillarsObjectDetector.h"
#include "ros2publisher.h"
#include "ros2rate.h"
#include "ros2subscriber.h"
#include "rosReadField.h"
#include "rosReadXYZ.h"
#include "rt_nonfinite.h"
#include "vision_msgs_Detection3DArrayStruct.h"
#include "MWCudnnCustomLayerBase.hpp"
#include "MWCudnnTargetNetworkImpl.hpp"
#include "MWTensorBase.hpp"
#include "coder_array.h"
#include "mlros2_node.h"
#include "mlros2_pub.h"
#include <cmath>
#include <cstdio>

// Function Definitions
//
// Arguments    : void
// Return Type  : void
//
void MWScatterLayer_detector0_01::cleanupLayer()
{
}

//
// Arguments    : void
// Return Type  : void
//
void MWResize2DLayer_detector0_01::cleanupLayer()
{
}

//
// Arguments    : void
// Return Type  : void
//
void MWResize2DLayer_detector0_02::cleanupLayer()
{
}

//
// Arguments    : MWCudnnTarget::MWTargetNetworkImpl *b_targetImpl
//                MWTensorBase *b
//                const char *c
//                int d
// Return Type  : void
//
void MWResize2DLayer_detector0_02::createCustomLayer(
    MWCudnnTarget::MWTargetNetworkImpl *b_targetImpl, MWTensorBase *b,
    const char *c, int d)
{
  setupTensors(1, 1, b, c, d);
  setupLayer(b_targetImpl);
}

//
// Arguments    : MWCudnnTarget::MWTargetNetworkImpl *b_targetImpl
//                MWTensorBase *b
//                const char *c
//                int d
// Return Type  : void
//
void MWResize2DLayer_detector0_01::createCustomLayer(
    MWCudnnTarget::MWTargetNetworkImpl *b_targetImpl, MWTensorBase *b,
    const char *c, int d)
{
  setupTensors(1, 1, b, c, d);
  setupLayer(b_targetImpl);
}

//
// Arguments    : MWCudnnTarget::MWTargetNetworkImpl *b_targetImpl
//                MWTensorBase *b
//                MWTensorBase *c
//                const char *d
//                int e
// Return Type  : void
//
void MWScatterLayer_detector0_01::createCustomLayer(
    MWCudnnTarget::MWTargetNetworkImpl *b_targetImpl, MWTensorBase *b,
    MWTensorBase *c, const char *d, int e)
{
  setupTensors(2, 1, b, c, d, e);
  setupLayer(b_targetImpl);
}

//
// Arguments    : void
// Return Type  : void
//
void MWScatterLayer_detector0_01::predict()
{
  reorderInputData(getInputTensor(0), 0);
  reorderInputData(getInputTensor(1), 1);
  coder::internal::dlnetwork_layerPredictWithColMajority(
      m_ntwkImpl->getPermuteBuffer(0), m_ntwkImpl->getPermuteBuffer(1),
      m_ntwkImpl->getPermuteBuffer(2));
  reorderOutputData(getOutputTensor(0), 2);
}

//
// Arguments    : void
// Return Type  : void
//
void MWResize2DLayer_detector0_01::predict()
{
  reorderInputData(getInputTensor(0), 0);
  coder::internal::dlnetwork_layerPredictWithColMajority(
      m_ntwkImpl->getPermuteBuffer(0), m_ntwkImpl->getPermuteBuffer(1));
  reorderOutputData(getOutputTensor(0), 1);
}

//
// Arguments    : void
// Return Type  : void
//
void MWResize2DLayer_detector0_02::predict()
{
  reorderInputData(getInputTensor(0), 0);
  coder::internal::b_dlnetwork_layerPredictWithColMajority(
      m_ntwkImpl->getPermuteBuffer(0), m_ntwkImpl->getPermuteBuffer(1));
  reorderOutputData(getOutputTensor(0), 1);
}

//
// Arguments    : void
// Return Type  : void
//
void MWScatterLayer_detector0_01::propagateSize()
{
  int batchSize;
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

//
// Arguments    : void
// Return Type  : void
//
void MWResize2DLayer_detector0_01::propagateSize()
{
  int batchSize;
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

//
// Arguments    : void
// Return Type  : void
//
void MWResize2DLayer_detector0_02::propagateSize()
{
  int batchSize;
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

//
// load the pre-trained deep learning network from the "pointPillarDetector.mat"
// file
//
// Arguments    : void
// Return Type  : void
//
void deployedPointPillarModel()
{
  static const char cv2[4]{'d', 'r', 'o', 'p'};
  static const char cv3[4]{'s', 'l', 'i', 'p'};
  detector0_0 lobj_6;
  coder::array<cell_wrap_6, 1U> labels_categoryNames;
  coder::array<sensor_msgs_PointFieldStruct_T, 1U> receivedpcdata_fields;
  coder::array<double, 2U> bboxes;
  coder::array<float, 2U> intensity;
  coder::array<float, 1U> a__1;
  coder::array<unsigned int, 2U> labels_codes;
  coder::array<unsigned char, 2U> uv;
  coder::array<unsigned char, 1U> receivedpcdata_data;
  coder::pointCloud ptCloud;
  coder::ros2node nd;
  coder::ros2publisher objDetectPub;
  coder::ros2rate r;
  coder::ros2subscriber pcsub;
  vision_msgs_Detection3DArrayStruct_T objMsg;
  unsigned int receivedpcdata_height;
  unsigned int receivedpcdata_point_step;
  unsigned int receivedpcdata_width;
  char receivedpcdata_MessageType[23];
  if (!isInitialized_deployedPointPillarModel) {
    deployedPointPillarModel_initialize();
  }
  ptCloud.matlabCodegenIsDeleted = true;
  lobj_6.matlabCodegenIsDeleted = true;
  coder::internal::dlnetwork_setup(&lobj_6);
  lobj_6.matlabCodegenIsDeleted = false;
  nd.NodeHandle = MATLAB::getGlobalNodeHandle();
  UNUSED_PARAM(nd.NodeHandle);
  //  create subscribers and publishers
  coder::ros2subscriber_ros2subscriber(&pcsub, &nd);
  coder::ros2publisher_ros2publisher(&objDetectPub, &nd);
  //  create ros message object
  vision_msgs_Detection3DArrayStruct(&objMsg);
  coder::ros2rate_ros2rate(&r);
  while (1) {
    double currentTime;
    int u0;
    std::printf("Waiting for input\n");
    std::fflush(stdout);
    coder::ros2subscriber_receive(
        &pcsub, receivedpcdata_MessageType, &receivedpcdata_height,
        &receivedpcdata_width, receivedpcdata_fields,
        &receivedpcdata_point_step, receivedpcdata_data);
    std::printf("Point Cloud received\n");
    std::fflush(stdout);
    //  Extract XYZ coordinates from ROS point cloud message structure
    coder::rosReadXYZ(receivedpcdata_height, receivedpcdata_width,
                      receivedpcdata_fields, receivedpcdata_point_step,
                      receivedpcdata_data, ptCloud.Location);
    //  Read point cloud data from ROS message structure based on field name
    coder::rosReadField(receivedpcdata_height, receivedpcdata_width,
                        receivedpcdata_fields, receivedpcdata_point_step,
                        receivedpcdata_data, intensity);
    //  Create a 3-D point cloud object
    uv.set(nullptr, 0, 0);
    coder::pointCloudBase_set_Color(&ptCloud, uv);
    ptCloud.Normal.set_size(0, 0);
    ptCloud.Intensity.set_size(intensity.size(0), intensity.size(1));
    for (u0 = 0; u0 < intensity.size(0) * intensity.size(1); u0++) {
      ptCloud.Intensity[u0] = intensity[u0];
    }
    ptCloud.RangeData.set_size(0, 0);
    ptCloud.PointCloudArrayData.set_size(1, 1);
    ptCloud.matlabCodegenIsDeleted = false;
    coder::internal::pointPillarsObjectDetector_detect(
        &lobj_6, &ptCloud, bboxes, a__1, labels_codes, labels_categoryNames);
    //  processing the output of the dectector, before publishing it on the
    //  rostopic publishing the coordinates and lables of detected objects
    std::printf("Publishing the coordinates and labels of detected objects \n");
    std::fflush(stdout);
    u0 = bboxes.size(0);
    if (u0 < 9) {
      u0 = 9;
    }
    if (bboxes.size(0) == 0) {
      u0 = 0;
    }
    for (int i{0}; i < u0; i++) {
      objMsg.detections[i].bbox.center.position.x = bboxes[i];
      objMsg.detections[i].bbox.center.position.y = bboxes[i + bboxes.size(0)];
      objMsg.detections[i].bbox.center.position.z =
          bboxes[i + bboxes.size(0) * 2];
      objMsg.detections[i].bbox.size.x = bboxes[i + bboxes.size(0) * 3];
      objMsg.detections[i].bbox.size.y = bboxes[i + bboxes.size(0) * 4];
      objMsg.detections[i].bbox.size.z = bboxes[i + bboxes.size(0) * 5];
      //  objMsg.detections(i).results.hypothesis.class_id = labels{i,1};
    }
    MATLABROS2Publisher_publish(objDetectPub.PublisherHelper, &objMsg);
    std::printf("Details published \n\n");
    std::fflush(stdout);
    currentTime = coder::ros2rate_getCurrentTime();
    if (currentTime < r.LastWakeTime) {
      r.LastWakeTime = 0.0;
      r.StartTime = coder::ros2rate_getCurrentTime();
      r.NextExecutionIndex = 0.0;
      r.ExecutionStartTime = 0.0;
      r.LastWakeTime = currentTime;
    } else {
      double sleepTime;
      r.NextExecutionIndex++;
      sleepTime =
          (r.NextExecutionIndex * r.DesiredPeriod + r.ExecutionStartTime) -
          currentTime;
      if (sleepTime < 0.0) {
        int exitg1;
        bool result;
        result = false;
        u0 = 0;
        do {
          exitg1 = 0;
          if (u0 + 1 < 5) {
            if (cv2[u0] != r.OverrunAction[u0]) {
              exitg1 = 1;
            } else {
              u0++;
            }
          } else {
            result = true;
            exitg1 = 1;
          }
        } while (exitg1 == 0);
        if (result) {
          u0 = 0;
        } else {
          u0 = 0;
          do {
            exitg1 = 0;
            if (u0 + 1 < 5) {
              if (cv3[u0] != r.OverrunAction[u0]) {
                exitg1 = 1;
              } else {
                u0++;
              }
            } else {
              result = true;
              exitg1 = 1;
            }
          } while (exitg1 == 0);
          if (result) {
            u0 = 1;
          } else {
            u0 = -1;
          }
        }
        switch (u0) {
        case 0:
          sleepTime = (currentTime - r.ExecutionStartTime) / r.DesiredPeriod;
          sleepTime = std::ceil(sleepTime);
          r.NextExecutionIndex = sleepTime;
          sleepTime =
              (r.NextExecutionIndex * r.DesiredPeriod + r.ExecutionStartTime) -
              currentTime;
          break;
        case 1:
          r.NextExecutionIndex = 0.0;
          r.ExecutionStartTime = currentTime;
          sleepTime = 0.0;
          break;
        }
      }
      coder::ros2rate_internalSleep(&r, sleepTime);
      currentTime = coder::ros2rate_getCurrentTime() - r.StartTime;
      if (currentTime > r.LastWakeTime) {
        r.LastWakeTime = currentTime;
      } else {
        r.LastWakeTime = 0.0;
        r.StartTime = coder::ros2rate_getCurrentTime();
        r.NextExecutionIndex = 0.0;
        r.ExecutionStartTime = 0.0;
        r.LastWakeTime = currentTime;
      }
      coder::ros2rate_getCurrentTime();
      r.PreviousPeriod = coder::ros2rate_getCurrentTime();
    }
    ptCloud.matlabCodegenIsDeleted = true;
  }
}

//
// File trailer for deployedPointPillarModel.cu
//
// [EOF]
//
