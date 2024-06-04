//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: dlnetwork.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "dlnetwork.h"
#include "Resize2DLayer.h"
#include "deployedPointPillarModel.h"
#include "deployedPointPillarModel_data.h"
#include "deployedPointPillarModel_internal_types.h"
#include "ipermute.h"
#include "permute.h"
#include "rt_nonfinite.h"
#include "MWBatchNormalizationLayer.hpp"
#include "MWCNNLayer.hpp"
#include "MWConcatenationLayer.hpp"
#include "MWConvLayer.hpp"
#include "MWCudaDimUtility.hpp"
#include "MWCudnnCustomLayerBase.hpp"
#include "MWCudnnTargetNetworkImpl.hpp"
#include "MWFusedConvActivationLayer.hpp"
#include "MWInputLayer.hpp"
#include "MWMaxPoolingLayer.hpp"
#include "MWOutputLayer.hpp"
#include "MWSigmoidLayer.hpp"
#include "MWSplittingLayer.hpp"
#include "MWTensor.hpp"
#include "MWTensorBase.hpp"
#include "coder_array.h"
#include "stdio.h"
#include <cstdlib>
#include <cstring>

// Named Constants
const char *errorString{
    "Abnormal termination due to: %s.\nError in %s (line %d)."};

const char *errStringBase{
    "Error during execution of the generated code. %s at line: %d, file: "
    "%s\nExiting program execution ...\n"};

// Variable Definitions
static bool gpuConstsCopied_dlnetwork_layerPredictWithColMajority;

static bool b_gpuConstsCopied_dlnetwork_layerPredictWithColMajority;

// Function Declarations
static void checkCleanupCudaError(cudaError_t errCode, const char *file,
                                  unsigned int b_line);

static void checkRunTimeError(const char *errMsg, const char *file,
                              unsigned int b_line);

static __global__ void
dlnetwork_layerPredictWithColMajority_kernel21(double dv[124]);

static __global__ void
dlnetwork_layerPredictWithColMajority_kernel26(double dv[62]);

// Function Definitions
//
// Arguments    : void
// Return Type  : void
//
void detector0_0::allocate()
{
  targetImpl->allocatePermuteBuffers(13713408, 3);
  targetImpl->allocate(76800000, 4);
  for (int idx{0}; idx < 57; idx++) {
    layers[idx]->allocate();
  }
  (static_cast<MWTensor<float> *>(inputTensors[0]))
      ->setData(layers[3]->getLayerOutput(0));
  (static_cast<MWTensor<float> *>(inputTensors[1]))
      ->setData(layers[0]->getLayerOutput(0));
}

//
// Arguments    : void
// Return Type  : void
//
void detector0_0::cleanup()
{
  deallocate();
  for (int idx{0}; idx < 57; idx++) {
    layers[idx]->cleanup();
  }
  if (targetImpl) {
    targetImpl->cleanup();
  }
  isInitialized = false;
  checkCleanupCudaError(cudaGetLastError(), __FILE__, __LINE__);
}

//
// Arguments    : void
// Return Type  : void
//
void detector0_0::deallocate()
{
  targetImpl->deallocate();
  for (int idx{0}; idx < 57; idx++) {
    layers[idx]->deallocate();
  }
}

//
// Arguments    : void
// Return Type  : void
//
void detector0_0::postsetup()
{
  targetImpl->postSetup(layers, numLayers);
}

//
// Arguments    : void
// Return Type  : void
//
void detector0_0::resetState()
{
}

//
// Arguments    : void
// Return Type  : void
//
void detector0_0::setSize()
{
  for (int idx{0}; idx < 57; idx++) {
    layers[idx]->propagateSize();
  }
  allocate();
  postsetup();
}

//
// Arguments    : void
// Return Type  : void
//
void detector0_0::setup()
{
  if (isInitialized) {
    resetState();
  } else {
    targetImpl->preSetup();
    targetImpl->setAutoTune(true);
    (static_cast<MWInputLayer *>(layers[0]))
        ->createInputLayer(targetImpl, inputTensors[1], "SSCB", 0);
    (static_cast<MWFusedConvActivationLayer *>(layers[1]))
        ->createFusedConvActivationLayer(
            targetImpl, 1, layers[0]->getOutputTensor(0), 1, 1, 9, 64, 1, 1, 0,
            0, 0, 0, 1, 1, 1,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_pillars_conv2d_w.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_pillars_conv2d_b.bin",
            0.0F, MWActivationFunctionType::ACTIVATION_FCN_ENUM::RELU, "SSCB",
            1);
    (static_cast<MWMaxPoolingLayer *>(layers[2]))
        ->createMaxPoolingLayer<float, float>(
            targetImpl, layers[1]->getOutputTensor(0), 1, 100, 1, 100, 0, 0, 0,
            0, 0, 0, "FLOAT", 1, "SSCB", 0);
    (static_cast<MWInputLayer *>(layers[3]))
        ->createInputLayer(targetImpl, inputTensors[0], "SSCB", 2);
    (static_cast<MWScatterLayer_detector0_01 *>(layers[4]))
        ->createCustomLayer(targetImpl, layers[2]->getOutputTensor(0),
                            layers[3]->getOutputTensor(0), "SSCB", 1);
    (static_cast<MWFusedConvActivationLayer *>(layers[5]))
        ->createFusedConvActivationLayer(
            targetImpl, 1, layers[4]->getOutputTensor(0), 3, 3, 64, 64, 2, 2, 0,
            1, 0, 1, 1, 1, 1,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block1_conv2d0_w.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block1_conv2d0_b.bin",
            0.0F, MWActivationFunctionType::ACTIVATION_FCN_ENUM::RELU, "SSCB",
            0);
    (static_cast<MWBatchNormalizationLayer *>(layers[6]))
        ->createBatchNormalizationLayer(
            targetImpl, layers[5]->getOutputTensor(0), 0.001F,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block1_bn0_offset.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block1_bn0_scale.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block1_bn0_trainedMean.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block1_bn0_trainedVariance.bin",
            64, "SSCB", 0);
    (static_cast<MWFusedConvActivationLayer *>(layers[7]))
        ->createFusedConvActivationLayer(
            targetImpl, 1, layers[6]->getOutputTensor(0), 3, 3, 64, 64, 1, 1, 1,
            1, 1, 1, 1, 1, 1,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block1_conv2d1_w.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block1_conv2d1_b.bin",
            0.0F, MWActivationFunctionType::ACTIVATION_FCN_ENUM::RELU, "SSCB",
            1);
    (static_cast<MWBatchNormalizationLayer *>(layers[8]))
        ->createBatchNormalizationLayer(
            targetImpl, layers[7]->getOutputTensor(0), 0.001F,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block1_bn1_offset.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block1_bn1_scale.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block1_bn1_trainedMean.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block1_bn1_trainedVariance.bin",
            64, "SSCB", 1);
    (static_cast<MWFusedConvActivationLayer *>(layers[9]))
        ->createFusedConvActivationLayer(
            targetImpl, 1, layers[8]->getOutputTensor(0), 3, 3, 64, 64, 1, 1, 1,
            1, 1, 1, 1, 1, 1,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block1_conv2d2_w.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block1_conv2d2_b.bin",
            0.0F, MWActivationFunctionType::ACTIVATION_FCN_ENUM::RELU, "SSCB",
            0);
    (static_cast<MWBatchNormalizationLayer *>(layers[10]))
        ->createBatchNormalizationLayer(
            targetImpl, layers[9]->getOutputTensor(0), 0.001F,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block1_bn2_offset.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block1_bn2_scale.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block1_bn2_trainedMean.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block1_bn2_trainedVariance.bin",
            64, "SSCB", 0);
    (static_cast<MWFusedConvActivationLayer *>(layers[11]))
        ->createFusedConvActivationLayer(
            targetImpl, 1, layers[10]->getOutputTensor(0), 3, 3, 64, 64, 1, 1,
            1, 1, 1, 1, 1, 1, 1,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block1_conv2d3_w.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block1_conv2d3_b.bin",
            0.0F, MWActivationFunctionType::ACTIVATION_FCN_ENUM::RELU, "SSCB",
            1);
    (static_cast<MWBatchNormalizationLayer *>(layers[12]))
        ->createBatchNormalizationLayer(
            targetImpl, layers[11]->getOutputTensor(0), 0.001F,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block1_bn3_offset.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block1_bn3_scale.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block1_bn3_trainedMean.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block1_bn3_trainedVariance.bin",
            64, "SSCB", 1);
    (static_cast<MWFusedConvActivationLayer *>(layers[13]))
        ->createFusedConvActivationLayer(
            targetImpl, 1, layers[12]->getOutputTensor(0), 3, 3, 64, 128, 2, 2,
            0, 1, 0, 1, 1, 1, 1,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_conv2d0_w.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_conv2d0_b.bin",
            0.0F, MWActivationFunctionType::ACTIVATION_FCN_ENUM::RELU, "SSCB",
            0);
    (static_cast<MWBatchNormalizationLayer *>(layers[14]))
        ->createBatchNormalizationLayer(
            targetImpl, layers[13]->getOutputTensor(0), 0.001F,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_bn0_offset.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_bn0_scale.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_bn0_trainedMean.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_bn0_trainedVariance.bin",
            128, "SSCB", 0);
    (static_cast<MWFusedConvActivationLayer *>(layers[15]))
        ->createFusedConvActivationLayer(
            targetImpl, 1, layers[14]->getOutputTensor(0), 3, 3, 128, 128, 1, 1,
            1, 1, 1, 1, 1, 1, 1,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_conv2d1_w.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_conv2d1_b.bin",
            0.0F, MWActivationFunctionType::ACTIVATION_FCN_ENUM::RELU, "SSCB",
            2);
    (static_cast<MWBatchNormalizationLayer *>(layers[16]))
        ->createBatchNormalizationLayer(
            targetImpl, layers[15]->getOutputTensor(0), 0.001F,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_bn1_offset.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_bn1_scale.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_bn1_trainedMean.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_bn1_trainedVariance.bin",
            128, "SSCB", 2);
    (static_cast<MWFusedConvActivationLayer *>(layers[17]))
        ->createFusedConvActivationLayer(
            targetImpl, 1, layers[16]->getOutputTensor(0), 3, 3, 128, 128, 1, 1,
            1, 1, 1, 1, 1, 1, 1,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_conv2d2_w.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_conv2d2_b.bin",
            0.0F, MWActivationFunctionType::ACTIVATION_FCN_ENUM::RELU, "SSCB",
            0);
    (static_cast<MWBatchNormalizationLayer *>(layers[18]))
        ->createBatchNormalizationLayer(
            targetImpl, layers[17]->getOutputTensor(0), 0.001F,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_bn2_offset.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_bn2_scale.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_bn2_trainedMean.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_bn2_trainedVariance.bin",
            128, "SSCB", 0);
    (static_cast<MWFusedConvActivationLayer *>(layers[19]))
        ->createFusedConvActivationLayer(
            targetImpl, 1, layers[18]->getOutputTensor(0), 3, 3, 128, 128, 1, 1,
            1, 1, 1, 1, 1, 1, 1,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_conv2d3_w.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_conv2d3_b.bin",
            0.0F, MWActivationFunctionType::ACTIVATION_FCN_ENUM::RELU, "SSCB",
            2);
    (static_cast<MWBatchNormalizationLayer *>(layers[20]))
        ->createBatchNormalizationLayer(
            targetImpl, layers[19]->getOutputTensor(0), 0.001F,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_bn3_offset.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_bn3_scale.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_bn3_trainedMean.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_bn3_trainedVariance.bin",
            128, "SSCB", 2);
    (static_cast<MWFusedConvActivationLayer *>(layers[21]))
        ->createFusedConvActivationLayer(
            targetImpl, 1, layers[20]->getOutputTensor(0), 3, 3, 128, 128, 1, 1,
            1, 1, 1, 1, 1, 1, 1,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_conv2d4_w.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_conv2d4_b.bin",
            0.0F, MWActivationFunctionType::ACTIVATION_FCN_ENUM::RELU, "SSCB",
            0);
    (static_cast<MWBatchNormalizationLayer *>(layers[22]))
        ->createBatchNormalizationLayer(
            targetImpl, layers[21]->getOutputTensor(0), 0.001F,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_bn4_offset.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_bn4_scale.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_bn4_trainedMean.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_bn4_trainedVariance.bin",
            128, "SSCB", 0);
    (static_cast<MWFusedConvActivationLayer *>(layers[23]))
        ->createFusedConvActivationLayer(
            targetImpl, 1, layers[22]->getOutputTensor(0), 3, 3, 128, 128, 1, 1,
            1, 1, 1, 1, 1, 1, 1,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_conv2d5_w.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_conv2d5_b.bin",
            0.0F, MWActivationFunctionType::ACTIVATION_FCN_ENUM::RELU, "SSCB",
            2);
    (static_cast<MWBatchNormalizationLayer *>(layers[24]))
        ->createBatchNormalizationLayer(
            targetImpl, layers[23]->getOutputTensor(0), 0.001F,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_bn5_offset.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_bn5_scale.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_bn5_trainedMean.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block2_bn5_trainedVariance.bin",
            128, "SSCB", 2);
    (static_cast<MWFusedConvActivationLayer *>(layers[25]))
        ->createFusedConvActivationLayer(
            targetImpl, 1, layers[12]->getOutputTensor(0), 3, 3, 64, 128, 1, 1,
            1, 1, 1, 1, 1, 1, 1,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_up1_conv2dt_w.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_up1_conv2dt_b.bin",
            0.0F, MWActivationFunctionType::ACTIVATION_FCN_ENUM::RELU, "SSCB",
            0);
    (static_cast<MWBatchNormalizationLayer *>(layers[26]))
        ->createBatchNormalizationLayer(
            targetImpl, layers[25]->getOutputTensor(0), 0.001F,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_up1_bn_offset.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_up1_bn_scale.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_up1_bn_trainedMean.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_up1_bn_trainedVariance.bin",
            128, "SSCB", 0);
    (static_cast<MWResize2DLayer_detector0_01 *>(layers[27]))
        ->createCustomLayer(targetImpl, layers[24]->getOutputTensor(0), "SSCB",
                            1);
    (static_cast<MWFusedConvActivationLayer *>(layers[28]))
        ->createFusedConvActivationLayer(
            targetImpl, 1, layers[27]->getOutputTensor(0), 3, 3, 128, 128, 1, 1,
            1, 1, 1, 1, 1, 1, 1,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_up2_conv2dt_w.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_up2_conv2dt_b.bin",
            0.0F, MWActivationFunctionType::ACTIVATION_FCN_ENUM::RELU, "SSCB",
            3);
    (static_cast<MWBatchNormalizationLayer *>(layers[29]))
        ->createBatchNormalizationLayer(
            targetImpl, layers[28]->getOutputTensor(0), 0.001F,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_up2_bn_offset.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_up2_bn_scale.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_up2_bn_trainedMean.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_up2_bn_trainedVariance.bin",
            128, "SSCB", 3);
    (static_cast<MWFusedConvActivationLayer *>(layers[30]))
        ->createFusedConvActivationLayer(
            targetImpl, 1, layers[24]->getOutputTensor(0), 3, 3, 128, 128, 2, 2,
            0, 1, 0, 1, 1, 1, 1,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_conv2d0_w.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_conv2d0_b.bin",
            0.0F, MWActivationFunctionType::ACTIVATION_FCN_ENUM::RELU, "SSCB",
            1);
    (static_cast<MWBatchNormalizationLayer *>(layers[31]))
        ->createBatchNormalizationLayer(
            targetImpl, layers[30]->getOutputTensor(0), 0.001F,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_bn0_offset.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_bn0_scale.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_bn0_trainedMean.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_bn0_trainedVariance.bin",
            128, "SSCB", 1);
    (static_cast<MWFusedConvActivationLayer *>(layers[32]))
        ->createFusedConvActivationLayer(
            targetImpl, 1, layers[31]->getOutputTensor(0), 3, 3, 128, 128, 1, 1,
            1, 1, 1, 1, 1, 1, 1,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_conv2d1_w.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_conv2d1_b.bin",
            0.0F, MWActivationFunctionType::ACTIVATION_FCN_ENUM::RELU, "SSCB",
            2);
    (static_cast<MWBatchNormalizationLayer *>(layers[33]))
        ->createBatchNormalizationLayer(
            targetImpl, layers[32]->getOutputTensor(0), 0.001F,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_bn1_offset.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_bn1_scale.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_bn1_trainedMean.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_bn1_trainedVariance.bin",
            128, "SSCB", 2);
    (static_cast<MWFusedConvActivationLayer *>(layers[34]))
        ->createFusedConvActivationLayer(
            targetImpl, 1, layers[33]->getOutputTensor(0), 3, 3, 128, 128, 1, 1,
            1, 1, 1, 1, 1, 1, 1,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_conv2d2_w.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_conv2d2_b.bin",
            0.0F, MWActivationFunctionType::ACTIVATION_FCN_ENUM::RELU, "SSCB",
            1);
    (static_cast<MWBatchNormalizationLayer *>(layers[35]))
        ->createBatchNormalizationLayer(
            targetImpl, layers[34]->getOutputTensor(0), 0.001F,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_bn2_offset.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_bn2_scale.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_bn2_trainedMean.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_bn2_trainedVariance.bin",
            128, "SSCB", 1);
    (static_cast<MWFusedConvActivationLayer *>(layers[36]))
        ->createFusedConvActivationLayer(
            targetImpl, 1, layers[35]->getOutputTensor(0), 3, 3, 128, 128, 1, 1,
            1, 1, 1, 1, 1, 1, 1,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_conv2d3_w.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_conv2d3_b.bin",
            0.0F, MWActivationFunctionType::ACTIVATION_FCN_ENUM::RELU, "SSCB",
            2);
    (static_cast<MWBatchNormalizationLayer *>(layers[37]))
        ->createBatchNormalizationLayer(
            targetImpl, layers[36]->getOutputTensor(0), 0.001F,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_bn3_offset.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_bn3_scale.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_bn3_trainedMean.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_bn3_trainedVariance.bin",
            128, "SSCB", 2);
    (static_cast<MWFusedConvActivationLayer *>(layers[38]))
        ->createFusedConvActivationLayer(
            targetImpl, 1, layers[37]->getOutputTensor(0), 3, 3, 128, 128, 1, 1,
            1, 1, 1, 1, 1, 1, 1,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_conv2d4_w.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_conv2d4_b.bin",
            0.0F, MWActivationFunctionType::ACTIVATION_FCN_ENUM::RELU, "SSCB",
            1);
    (static_cast<MWBatchNormalizationLayer *>(layers[39]))
        ->createBatchNormalizationLayer(
            targetImpl, layers[38]->getOutputTensor(0), 0.001F,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_bn4_offset.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_bn4_scale.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_bn4_trainedMean.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_bn4_trainedVariance.bin",
            128, "SSCB", 1);
    (static_cast<MWFusedConvActivationLayer *>(layers[40]))
        ->createFusedConvActivationLayer(
            targetImpl, 1, layers[39]->getOutputTensor(0), 3, 3, 128, 128, 1, 1,
            1, 1, 1, 1, 1, 1, 1,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_conv2d5_w.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_conv2d5_b.bin",
            0.0F, MWActivationFunctionType::ACTIVATION_FCN_ENUM::RELU, "SSCB",
            2);
    (static_cast<MWBatchNormalizationLayer *>(layers[41]))
        ->createBatchNormalizationLayer(
            targetImpl, layers[40]->getOutputTensor(0), 0.001F,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_bn5_offset.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_bn5_scale.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_bn5_trainedMean.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_block3_bn5_trainedVariance.bin",
            128, "SSCB", 2);
    (static_cast<MWResize2DLayer_detector0_02 *>(layers[42]))
        ->createCustomLayer(targetImpl, layers[41]->getOutputTensor(0), "SSCB",
                            1);
    (static_cast<MWFusedConvActivationLayer *>(layers[43]))
        ->createFusedConvActivationLayer(
            targetImpl, 1, layers[42]->getOutputTensor(0), 3, 3, 128, 128, 1, 1,
            1, 1, 1, 1, 1, 1, 1,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_up3_conv2dt_w.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_up3_conv2dt_b.bin",
            0.0F, MWActivationFunctionType::ACTIVATION_FCN_ENUM::RELU, "SSCB",
            2);
    (static_cast<MWBatchNormalizationLayer *>(layers[44]))
        ->createBatchNormalizationLayer(
            targetImpl, layers[43]->getOutputTensor(0), 0.001F,
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_up3_bn_offset.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_up3_bn_scale.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_up3_bn_trainedMean.bin",
            "./codegen/exe/deployedPointPillarModel/"
            "cnn_detector0_0_cnn_up3_bn_trainedVariance.bin",
            128, "SSCB", 2);
    (static_cast<MWConcatenationLayer *>(layers[45]))
        ->createConcatenationLayer(
            targetImpl, 3, layers[26]->getOutputTensor(0),
            layers[29]->getOutputTensor(0), layers[44]->getOutputTensor(0), 3,
            "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[46]))
        ->createConvLayer(targetImpl, layers[45]->getOutputTensor(0), 1, 1, 384,
                          20, 1, 1, 0, 0, 0, 0, 1, 1, 1,
                          "./codegen/exe/deployedPointPillarModel/"
                          "cnn_detector0_0_angle_conv2d_w_fused.bin",
                          "./codegen/exe/deployedPointPillarModel/"
                          "cnn_detector0_0_angle_conv2d_b_fused.bin",
                          "SSCB", 0);
    (static_cast<MWSplittingLayer *>(layers[47]))
        ->createSplittingLayer(targetImpl, layers[46]->getOutputTensor(0), 6, 2,
                               2, 2, 2, 6, 6, 6, "SSCB", "SSCB", "SSCB", "SSCB",
                               "SSCB", "SSCB", 0, 0, 0, 0, 0, 0);
    (static_cast<MWSigmoidLayer *>(layers[48]))
        ->createSigmoidLayer(targetImpl, layers[47]->getOutputTensor(2), "SSCB",
                             0);
    (static_cast<MWOutputLayer *>(layers[49]))
        ->createOutputLayer(targetImpl, layers[48]->getOutputTensor(0), "SSCB",
                            0);
    (static_cast<MWOutputLayer *>(layers[50]))
        ->createOutputLayer(targetImpl, layers[47]->getOutputTensor(0), "SSCB",
                            0);
    (static_cast<MWSigmoidLayer *>(layers[51]))
        ->createSigmoidLayer(targetImpl, layers[47]->getOutputTensor(1), "SSCB",
                             0);
    (static_cast<MWOutputLayer *>(layers[52]))
        ->createOutputLayer(targetImpl, layers[51]->getOutputTensor(0), "SSCB",
                            0);
    (static_cast<MWOutputLayer *>(layers[53]))
        ->createOutputLayer(targetImpl, layers[47]->getOutputTensor(4), "SSCB",
                            0);
    (static_cast<MWSigmoidLayer *>(layers[54]))
        ->createSigmoidLayer(targetImpl, layers[47]->getOutputTensor(3), "SSCB",
                             0);
    (static_cast<MWOutputLayer *>(layers[55]))
        ->createOutputLayer(targetImpl, layers[54]->getOutputTensor(0), "SSCB",
                            0);
    (static_cast<MWOutputLayer *>(layers[56]))
        ->createOutputLayer(targetImpl, layers[47]->getOutputTensor(5), "SSCB",
                            0);
    outputTensors[0] = layers[49]->getOutputTensor(0);
    outputTensors[1] = layers[50]->getOutputTensor(0);
    outputTensors[2] = layers[52]->getOutputTensor(0);
    outputTensors[3] = layers[53]->getOutputTensor(0);
    outputTensors[4] = layers[55]->getOutputTensor(0);
    outputTensors[5] = layers[56]->getOutputTensor(0);
    setSize();
  }
  isInitialized = true;
}

//
// Arguments    : cudaError_t errCode
//                const char *file
//                unsigned int b_line
// Return Type  : void
//
static void checkCleanupCudaError(cudaError_t errCode, const char *file,
                                  unsigned int b_line)
{
  if ((errCode != cudaSuccess) && (errCode != cudaErrorCudartUnloading)) {
    printf(errorString, cudaGetErrorString(errCode), file, b_line);
  }
}

//
// Arguments    : const char *errMsg
//                const char *file
//                unsigned int b_line
// Return Type  : void
//
static void checkRunTimeError(const char *errMsg, const char *file,
                              unsigned int b_line)
{
  printf(errStringBase, errMsg, b_line, file);
  exit(EXIT_FAILURE);
}

//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                double dv[124]
// Return Type  : void
//
static __global__ __launch_bounds__(
    128, 1) void dlnetwork_layerPredictWithColMajority_kernel21(double dv[124])
{
  unsigned long long threadId;
  int i;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  i = static_cast<int>(threadId);
  if (i < 124) {
    dv[i] = static_cast<double>(i) + 1.0;
  }
}

//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                double dv[62]
// Return Type  : void
//
static __global__ __launch_bounds__(
    64, 1) void dlnetwork_layerPredictWithColMajority_kernel26(double dv[62])
{
  unsigned long long threadId;
  int i;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  i = static_cast<int>(threadId);
  if (i < 62) {
    dv[i] = static_cast<double>(i) + 1.0;
  }
}

//
// Arguments    : int layerIdx
// Return Type  : void
//
void detector0_0::activations(int layerIdx)
{
  for (int idx{0}; idx <= layerIdx; idx++) {
    layers[idx]->predict();
  }
}

//
// Arguments    : void
// Return Type  : ::detector0_0
//
detector0_0::detector0_0()
{
  numLayers = 57;
  isInitialized = false;
  targetImpl = 0;
  layers[0] = new MWInputLayer;
  layers[0]->setName("pillars|input");
  layers[1] = new MWFusedConvActivationLayer;
  layers[1]->setName("pillars|conv2d_pillars|relu");
  layers[2] = new MWMaxPoolingLayer;
  layers[2]->setName("pillars|reshape");
  layers[3] = new MWInputLayer;
  layers[3]->setName("pillars|indices|reshape");
  layers[4] = new MWScatterLayer_detector0_01;
  layers[4]->setName("pillars|scatter_nd");
  layers[5] = new MWFusedConvActivationLayer;
  layers[5]->setName("cnn|block1|conv2d0_cnn|block1|conv2d0_relu");
  layers[6] = new MWBatchNormalizationLayer;
  layers[6]->setName("cnn|block1|bn0");
  layers[6]->setInPlaceIndex(0, 0);
  layers[7] = new MWFusedConvActivationLayer;
  layers[7]->setName("cnn|block1|conv2d1_cnn|block1|conv2d1_relu");
  layers[8] = new MWBatchNormalizationLayer;
  layers[8]->setName("cnn|block1|bn1");
  layers[8]->setInPlaceIndex(0, 0);
  layers[9] = new MWFusedConvActivationLayer;
  layers[9]->setName("cnn|block1|conv2d2_cnn|block1|conv2d2_relu");
  layers[10] = new MWBatchNormalizationLayer;
  layers[10]->setName("cnn|block1|bn2");
  layers[10]->setInPlaceIndex(0, 0);
  layers[11] = new MWFusedConvActivationLayer;
  layers[11]->setName("cnn|block1|conv2d3_cnn|block1|conv2d3_relu");
  layers[12] = new MWBatchNormalizationLayer;
  layers[12]->setName("cnn|block1|bn3");
  layers[12]->setInPlaceIndex(0, 0);
  layers[13] = new MWFusedConvActivationLayer;
  layers[13]->setName("cnn|block2|conv2d0_cnn|block2|conv2d0_relu");
  layers[14] = new MWBatchNormalizationLayer;
  layers[14]->setName("cnn|block2|bn0");
  layers[14]->setInPlaceIndex(0, 0);
  layers[15] = new MWFusedConvActivationLayer;
  layers[15]->setName("cnn|block2|conv2d1_cnn|block2|conv2d1_relu");
  layers[16] = new MWBatchNormalizationLayer;
  layers[16]->setName("cnn|block2|bn1");
  layers[16]->setInPlaceIndex(0, 0);
  layers[17] = new MWFusedConvActivationLayer;
  layers[17]->setName("cnn|block2|conv2d2_cnn|block2|conv2d2_relu");
  layers[18] = new MWBatchNormalizationLayer;
  layers[18]->setName("cnn|block2|bn2");
  layers[18]->setInPlaceIndex(0, 0);
  layers[19] = new MWFusedConvActivationLayer;
  layers[19]->setName("cnn|block2|conv2d3_cnn|block2|conv2d3_relu");
  layers[20] = new MWBatchNormalizationLayer;
  layers[20]->setName("cnn|block2|bn3");
  layers[20]->setInPlaceIndex(0, 0);
  layers[21] = new MWFusedConvActivationLayer;
  layers[21]->setName("cnn|block2|conv2d4_cnn|block2|conv2d4_relu");
  layers[22] = new MWBatchNormalizationLayer;
  layers[22]->setName("cnn|block2|bn4");
  layers[22]->setInPlaceIndex(0, 0);
  layers[23] = new MWFusedConvActivationLayer;
  layers[23]->setName("cnn|block2|conv2d5_cnn|block2|conv2d5_relu");
  layers[24] = new MWBatchNormalizationLayer;
  layers[24]->setName("cnn|block2|bn5");
  layers[24]->setInPlaceIndex(0, 0);
  layers[25] = new MWFusedConvActivationLayer;
  layers[25]->setName("cnn|up1|conv2dt_cnn|up1|conv2dt_relu");
  layers[26] = new MWBatchNormalizationLayer;
  layers[26]->setName("cnn|up1|bn");
  layers[26]->setInPlaceIndex(0, 0);
  layers[27] = new MWResize2DLayer_detector0_01;
  layers[27]->setName("cnn|add|resize|2");
  layers[28] = new MWFusedConvActivationLayer;
  layers[28]->setName("cnn|up2|conv2dt_cnn|up2|conv2dt_relu");
  layers[29] = new MWBatchNormalizationLayer;
  layers[29]->setName("cnn|up2|bn");
  layers[29]->setInPlaceIndex(0, 0);
  layers[30] = new MWFusedConvActivationLayer;
  layers[30]->setName("cnn|block3|conv2d0_cnn|block3|conv2d0_relu");
  layers[31] = new MWBatchNormalizationLayer;
  layers[31]->setName("cnn|block3|bn0");
  layers[31]->setInPlaceIndex(0, 0);
  layers[32] = new MWFusedConvActivationLayer;
  layers[32]->setName("cnn|block3|conv2d1_cnn|block3|conv2d1_relu");
  layers[33] = new MWBatchNormalizationLayer;
  layers[33]->setName("cnn|block3|bn1");
  layers[33]->setInPlaceIndex(0, 0);
  layers[34] = new MWFusedConvActivationLayer;
  layers[34]->setName("cnn|block3|conv2d2_cnn|block3|conv2d2_relu");
  layers[35] = new MWBatchNormalizationLayer;
  layers[35]->setName("cnn|block3|bn2");
  layers[35]->setInPlaceIndex(0, 0);
  layers[36] = new MWFusedConvActivationLayer;
  layers[36]->setName("cnn|block3|conv2d3_cnn|block3|conv2d3_relu");
  layers[37] = new MWBatchNormalizationLayer;
  layers[37]->setName("cnn|block3|bn3");
  layers[37]->setInPlaceIndex(0, 0);
  layers[38] = new MWFusedConvActivationLayer;
  layers[38]->setName("cnn|block3|conv2d4_cnn|block3|conv2d4_relu");
  layers[39] = new MWBatchNormalizationLayer;
  layers[39]->setName("cnn|block3|bn4");
  layers[39]->setInPlaceIndex(0, 0);
  layers[40] = new MWFusedConvActivationLayer;
  layers[40]->setName("cnn|block3|conv2d5_cnn|block3|conv2d5_relu");
  layers[41] = new MWBatchNormalizationLayer;
  layers[41]->setName("cnn|block3|bn5");
  layers[41]->setInPlaceIndex(0, 0);
  layers[42] = new MWResize2DLayer_detector0_02;
  layers[42]->setName("cnn|add|resize|3");
  layers[43] = new MWFusedConvActivationLayer;
  layers[43]->setName("cnn|up3|conv2dt_cnn|up3|conv2dt_relu");
  layers[44] = new MWBatchNormalizationLayer;
  layers[44]->setName("cnn|up3|bn");
  layers[44]->setInPlaceIndex(0, 0);
  layers[45] = new MWConcatenationLayer;
  layers[45]->setName("cnn|concatenate");
  layers[46] = new MWConvLayer;
  layers[46]->setName("angle|conv2d_fused");
  layers[47] = new MWSplittingLayer;
  layers[47]->setName("angle|conv2d_fused_channelSplit");
  layers[47]->setInPlaceIndex(0, 0);
  layers[47]->setInPlaceIndex(1, 0);
  layers[47]->setInPlaceIndex(2, 0);
  layers[47]->setInPlaceIndex(3, 0);
  layers[47]->setInPlaceIndex(4, 0);
  layers[47]->setInPlaceIndex(5, 0);
  layers[48] = new MWSigmoidLayer;
  layers[48]->setName("activation");
  layers[48]->setInPlaceIndex(0, 0);
  layers[49] = new MWOutputLayer;
  layers[49]->setName("output_activation");
  layers[49]->setInPlaceIndex(0, 0);
  layers[50] = new MWOutputLayer;
  layers[50]->setName("output_angle|conv2d");
  layers[50]->setInPlaceIndex(0, 0);
  layers[51] = new MWSigmoidLayer;
  layers[51]->setName("heading|conv2dSigmoid");
  layers[51]->setInPlaceIndex(0, 0);
  layers[52] = new MWOutputLayer;
  layers[52]->setName("output_heading|conv2dSigmoid");
  layers[52]->setInPlaceIndex(0, 0);
  layers[53] = new MWOutputLayer;
  layers[53]->setName("output_loc|conv2d");
  layers[53]->setInPlaceIndex(0, 0);
  layers[54] = new MWSigmoidLayer;
  layers[54]->setName("occupancy|conv2dSigmoid");
  layers[54]->setInPlaceIndex(0, 0);
  layers[55] = new MWOutputLayer;
  layers[55]->setName("output_occupancy|conv2dSigmoid");
  layers[55]->setInPlaceIndex(0, 0);
  layers[56] = new MWOutputLayer;
  layers[56]->setName("output_size|conv2d");
  layers[56]->setInPlaceIndex(0, 0);
  targetImpl = new MWCudnnTarget::MWTargetNetworkImpl;
  inputTensors[0] = new MWTensor<float>;
  inputTensors[0]->setHeight(12000);
  inputTensors[0]->setWidth(2);
  inputTensors[0]->setChannels(1);
  inputTensors[0]->setBatchSize(1);
  inputTensors[0]->setSequenceLength(1);
  inputTensors[1] = new MWTensor<float>;
  inputTensors[1]->setHeight(12000);
  inputTensors[1]->setWidth(100);
  inputTensors[1]->setChannels(9);
  inputTensors[1]->setBatchSize(1);
  inputTensors[1]->setSequenceLength(1);
}

//
// Arguments    : void
// Return Type  : void
//
detector0_0::~detector0_0()
{
  try {
    if (isInitialized) {
      cleanup();
    }
    for (int idx{0}; idx < 57; idx++) {
      delete layers[idx];
    }
    if (targetImpl) {
      delete targetImpl;
    }
    delete inputTensors[0];
    delete inputTensors[1];
  } catch (...) {
  }
}

//
// Arguments    : void
// Return Type  : int
//
int detector0_0::getBatchSize()
{
  return inputTensors[0]->getBatchSize();
}

//
// Arguments    : int b_index
// Return Type  : float *
//
float *detector0_0::getInputDataPointer(int b_index)
{
  return (static_cast<MWTensor<float> *>(inputTensors[b_index]))->getData();
}

//
// Arguments    : void
// Return Type  : float *
//
float *detector0_0::getInputDataPointer()
{
  return (static_cast<MWTensor<float> *>(inputTensors[0]))->getData();
}

//
// Arguments    : int layerIndex
//                int portIndex
// Return Type  : float *
//
float *detector0_0::getLayerOutput(int layerIndex, int portIndex)
{
  return layers[layerIndex]->getLayerOutput(portIndex);
}

//
// Arguments    : int layerIndex
//                int portIndex
// Return Type  : int
//
int detector0_0::getLayerOutputSize(int layerIndex, int portIndex)
{
  return static_cast<unsigned int>(
             layers[layerIndex]->getOutputTensor(portIndex)->getNumElements()) *
         sizeof(float);
}

//
// Arguments    : int b_index
// Return Type  : float *
//
float *detector0_0::getOutputDataPointer(int b_index)
{
  return (static_cast<MWTensor<float> *>(outputTensors[b_index]))->getData();
}

//
// Arguments    : void
// Return Type  : float *
//
float *detector0_0::getOutputDataPointer()
{
  return (static_cast<MWTensor<float> *>(outputTensors[0]))->getData();
}

//
// Arguments    : int layerIndex
//                int portIndex
// Return Type  : int
//
int detector0_0::getOutputSequenceLength(int layerIndex, int portIndex)
{
  return layers[layerIndex]->getOutputTensor(portIndex)->getSequenceLength();
}

//
// Arguments    : const float varargin_1[428544]
//                float varargout_1[6856704]
// Return Type  : void
//
namespace coder {
namespace internal {
void b_dlnetwork_layerPredictWithColMajority(const float varargin_1[428544],
                                             float varargout_1[6856704])
{
  static const double cpu_dv[248]{
      1.0,    1.0,    1.125,  1.375,  1.625,  1.875,  2.125,  2.375,  2.625,
      2.875,  3.125,  3.375,  3.625,  3.875,  4.125,  4.375,  4.625,  4.875,
      5.125,  5.375,  5.625,  5.875,  6.125,  6.375,  6.625,  6.875,  7.125,
      7.375,  7.625,  7.875,  8.125,  8.375,  8.625,  8.875,  9.125,  9.375,
      9.625,  9.875,  10.125, 10.375, 10.625, 10.875, 11.125, 11.375, 11.625,
      11.875, 12.125, 12.375, 12.625, 12.875, 13.125, 13.375, 13.625, 13.875,
      14.125, 14.375, 14.625, 14.875, 15.125, 15.375, 15.625, 15.875, 16.125,
      16.375, 16.625, 16.875, 17.125, 17.375, 17.625, 17.875, 18.125, 18.375,
      18.625, 18.875, 19.125, 19.375, 19.625, 19.875, 20.125, 20.375, 20.625,
      20.875, 21.125, 21.375, 21.625, 21.875, 22.125, 22.375, 22.625, 22.875,
      23.125, 23.375, 23.625, 23.875, 24.125, 24.375, 24.625, 24.875, 25.125,
      25.375, 25.625, 25.875, 26.125, 26.375, 26.625, 26.875, 27.125, 27.375,
      27.625, 27.875, 28.125, 28.375, 28.625, 28.875, 29.125, 29.375, 29.625,
      29.875, 30.125, 30.375, 30.625, 30.875, 31.125, 31.375, 31.625, 31.875,
      32.125, 32.375, 32.625, 32.875, 33.125, 33.375, 33.625, 33.875, 34.125,
      34.375, 34.625, 34.875, 35.125, 35.375, 35.625, 35.875, 36.125, 36.375,
      36.625, 36.875, 37.125, 37.375, 37.625, 37.875, 38.125, 38.375, 38.625,
      38.875, 39.125, 39.375, 39.625, 39.875, 40.125, 40.375, 40.625, 40.875,
      41.125, 41.375, 41.625, 41.875, 42.125, 42.375, 42.625, 42.875, 43.125,
      43.375, 43.625, 43.875, 44.125, 44.375, 44.625, 44.875, 45.125, 45.375,
      45.625, 45.875, 46.125, 46.375, 46.625, 46.875, 47.125, 47.375, 47.625,
      47.875, 48.125, 48.375, 48.625, 48.875, 49.125, 49.375, 49.625, 49.875,
      50.125, 50.375, 50.625, 50.875, 51.125, 51.375, 51.625, 51.875, 52.125,
      52.375, 52.625, 52.875, 53.125, 53.375, 53.625, 53.875, 54.125, 54.375,
      54.625, 54.875, 55.125, 55.375, 55.625, 55.875, 56.125, 56.375, 56.625,
      56.875, 57.125, 57.375, 57.625, 57.875, 58.125, 58.375, 58.625, 58.875,
      59.125, 59.375, 59.625, 59.875, 60.125, 60.375, 60.625, 60.875, 61.125,
      61.375, 61.625, 61.875, 62.0,   62.0};
  double(*gpu_dv)[62];
  float(*c_gpu_tmp)[6856704];
  float(*b_gpu_tmp)[1714176];
  float(*gpu_tmp)[1714176];
  if (!b_gpuConstsCopied_dlnetwork_layerPredictWithColMajority) {
    b_gpuConstsCopied_dlnetwork_layerPredictWithColMajority = true;
    cudaMemcpy(*b_global_gpu_dv, cpu_dv, sizeof(double[248]),
               cudaMemcpyHostToDevice);
  }
  cudaMalloc(&gpu_tmp, 6856704ULL);
  cudaMalloc(&b_gpu_tmp, 6856704ULL);
  cudaMalloc(&c_gpu_tmp, 27426816ULL);
  cudaMalloc(&gpu_dv, 496ULL);
  dlnetwork_layerPredictWithColMajority_kernel26<<<dim3(1U, 1U, 1U),
                                                   dim3(64U, 1U, 1U)>>>(
      *gpu_dv);
  nnet::internal::cnn::coder::b_interpAlongSpatialDim(varargin_1, *gpu_tmp);
  b_permute(*gpu_tmp, *b_gpu_tmp);
  nnet::internal::cnn::coder::b_interp1CustomImpl(*gpu_dv, *b_gpu_tmp,
                                                  *b_global_gpu_dv, *c_gpu_tmp);
  ipermute(*c_gpu_tmp, varargout_1);
  cudaFree(*gpu_dv);
  cudaFree(*c_gpu_tmp);
  cudaFree(*b_gpu_tmp);
  cudaFree(*gpu_tmp);
}

//
// Arguments    : const float gpu_varargin_1[768000]
//                const float gpu_varargin_2[24000]
//                float gpu_varargout_1[13713408]
// Return Type  : void
//
void dlnetwork_layerPredictWithColMajority(const float gpu_varargin_1[768000],
                                           const float gpu_varargin_2[24000],
                                           float gpu_varargout_1[13713408])
{
  array<float, 2U> maps;
  array<int, 1U> iv1;
  array<int, 1U> r;
  array<int, 1U> r1;
  float(*cpu_varargout_1)[13713408];
  float(*cpu_varargin_1)[768000];
  float(*cpu_varargin_2)[24000];
  int iv1_idx_0;
  int trueCount;
  bool indices[12000];
  bool varargin_1_outdatedOnCpu;
  bool varargin_2_outdatedOnCpu;
  cpu_varargout_1 = (float(*)[13713408])malloc(54853632U);
  cpu_varargin_2 = (float(*)[24000])malloc(96000U);
  cpu_varargin_1 = (float(*)[768000])malloc(3072000U);
  varargin_2_outdatedOnCpu = true;
  varargin_1_outdatedOnCpu = true;
  cudaMemcpy(*cpu_varargout_1, gpu_varargout_1, 54853632ULL,
             cudaMemcpyDeviceToHost);
  std::memset(&(*cpu_varargout_1)[0], 0, 13713408U * sizeof(float));
  trueCount = 0;
  for (int i{0}; i < 12000; i++) {
    bool b;
    if (varargin_2_outdatedOnCpu) {
      cudaMemcpy(*cpu_varargin_2, gpu_varargin_2, 96000ULL,
                 cudaMemcpyDeviceToHost);
    }
    varargin_2_outdatedOnCpu = false;
    b = ((*cpu_varargin_2)[i] >= 1.0F);
    indices[i] = b;
    if (b) {
      trueCount++;
    }
  }
  r.set_size(trueCount);
  trueCount = 0;
  for (int i{0}; i < 12000; i++) {
    if (indices[i]) {
      r[trueCount] = i;
      trueCount++;
    }
  }
  maps.set_size(r.size(0), 2);
  for (trueCount = 0; trueCount < 2; trueCount++) {
    for (int i{0}; i < r.size(0); i++) {
      if (varargin_2_outdatedOnCpu) {
        cudaMemcpy(*cpu_varargin_2, gpu_varargin_2, 96000ULL,
                   cudaMemcpyDeviceToHost);
      }
      varargin_2_outdatedOnCpu = false;
      maps[i + maps.size(0) * trueCount] =
          (*cpu_varargin_2)[r[i] + 12000 * trueCount] - 1.0F;
    }
  }
  iv1.set_size(maps.size(0));
  for (trueCount = 0; trueCount < maps.size(0); trueCount++) {
    iv1[trueCount] = static_cast<int>((maps[trueCount + maps.size(0)] * 432.0F +
                                       maps[trueCount]) +
                                      1.0F) -
                     1;
  }
  trueCount = 0;
  for (int i{0}; i < 12000; i++) {
    if (indices[i]) {
      trueCount++;
    }
  }
  r1.set_size(trueCount);
  trueCount = 0;
  for (int i{0}; i < 12000; i++) {
    if (indices[i]) {
      r1[trueCount] = i;
      trueCount++;
    }
  }
  iv1_idx_0 = iv1.size(0);
  for (trueCount = 0; trueCount < 64; trueCount++) {
    for (int i{0}; i < iv1_idx_0; i++) {
      if (varargin_1_outdatedOnCpu) {
        cudaMemcpy(*cpu_varargin_1, gpu_varargin_1, 3072000ULL,
                   cudaMemcpyDeviceToHost);
      }
      varargin_1_outdatedOnCpu = false;
      (*cpu_varargout_1)[iv1[i] + 214272 * trueCount] =
          (*cpu_varargin_1)[r1[i] + 12000 * trueCount];
    }
  }
  cudaMemcpy(gpu_varargout_1, *cpu_varargout_1, 54853632ULL,
             cudaMemcpyHostToDevice);
  free(*cpu_varargin_1);
  free(*cpu_varargin_2);
  free(*cpu_varargout_1);
}

//
// Arguments    : const float varargin_1[1714176]
//                float varargout_1[6856704]
// Return Type  : void
//
void dlnetwork_layerPredictWithColMajority(const float varargin_1[1714176],
                                           float varargout_1[6856704])
{
  static const double cpu_dv[248]{
      1.0,    1.25,   1.75,   2.25,   2.75,   3.25,   3.75,   4.25,   4.75,
      5.25,   5.75,   6.25,   6.75,   7.25,   7.75,   8.25,   8.75,   9.25,
      9.75,   10.25,  10.75,  11.25,  11.75,  12.25,  12.75,  13.25,  13.75,
      14.25,  14.75,  15.25,  15.75,  16.25,  16.75,  17.25,  17.75,  18.25,
      18.75,  19.25,  19.75,  20.25,  20.75,  21.25,  21.75,  22.25,  22.75,
      23.25,  23.75,  24.25,  24.75,  25.25,  25.75,  26.25,  26.75,  27.25,
      27.75,  28.25,  28.75,  29.25,  29.75,  30.25,  30.75,  31.25,  31.75,
      32.25,  32.75,  33.25,  33.75,  34.25,  34.75,  35.25,  35.75,  36.25,
      36.75,  37.25,  37.75,  38.25,  38.75,  39.25,  39.75,  40.25,  40.75,
      41.25,  41.75,  42.25,  42.75,  43.25,  43.75,  44.25,  44.75,  45.25,
      45.75,  46.25,  46.75,  47.25,  47.75,  48.25,  48.75,  49.25,  49.75,
      50.25,  50.75,  51.25,  51.75,  52.25,  52.75,  53.25,  53.75,  54.25,
      54.75,  55.25,  55.75,  56.25,  56.75,  57.25,  57.75,  58.25,  58.75,
      59.25,  59.75,  60.25,  60.75,  61.25,  61.75,  62.25,  62.75,  63.25,
      63.75,  64.25,  64.75,  65.25,  65.75,  66.25,  66.75,  67.25,  67.75,
      68.25,  68.75,  69.25,  69.75,  70.25,  70.75,  71.25,  71.75,  72.25,
      72.75,  73.25,  73.75,  74.25,  74.75,  75.25,  75.75,  76.25,  76.75,
      77.25,  77.75,  78.25,  78.75,  79.25,  79.75,  80.25,  80.75,  81.25,
      81.75,  82.25,  82.75,  83.25,  83.75,  84.25,  84.75,  85.25,  85.75,
      86.25,  86.75,  87.25,  87.75,  88.25,  88.75,  89.25,  89.75,  90.25,
      90.75,  91.25,  91.75,  92.25,  92.75,  93.25,  93.75,  94.25,  94.75,
      95.25,  95.75,  96.25,  96.75,  97.25,  97.75,  98.25,  98.75,  99.25,
      99.75,  100.25, 100.75, 101.25, 101.75, 102.25, 102.75, 103.25, 103.75,
      104.25, 104.75, 105.25, 105.75, 106.25, 106.75, 107.25, 107.75, 108.25,
      108.75, 109.25, 109.75, 110.25, 110.75, 111.25, 111.75, 112.25, 112.75,
      113.25, 113.75, 114.25, 114.75, 115.25, 115.75, 116.25, 116.75, 117.25,
      117.75, 118.25, 118.75, 119.25, 119.75, 120.25, 120.75, 121.25, 121.75,
      122.25, 122.75, 123.25, 123.75, 124.0};
  double(*gpu_dv)[124];
  float(*c_gpu_tmp)[6856704];
  float(*b_gpu_tmp)[3428352];
  float(*gpu_tmp)[3428352];
  if (!gpuConstsCopied_dlnetwork_layerPredictWithColMajority) {
    gpuConstsCopied_dlnetwork_layerPredictWithColMajority = true;
    cudaMemcpy(*global_gpu_dv, cpu_dv, sizeof(double[248]),
               cudaMemcpyHostToDevice);
  }
  cudaMalloc(&gpu_tmp, 13713408ULL);
  cudaMalloc(&b_gpu_tmp, 13713408ULL);
  cudaMalloc(&c_gpu_tmp, 27426816ULL);
  cudaMalloc(&gpu_dv, 992ULL);
  dlnetwork_layerPredictWithColMajority_kernel21<<<dim3(1U, 1U, 1U),
                                                   dim3(128U, 1U, 1U)>>>(
      *gpu_dv);
  nnet::internal::cnn::coder::interpAlongSpatialDim(varargin_1, *gpu_tmp);
  permute(*gpu_tmp, *b_gpu_tmp);
  nnet::internal::cnn::coder::interp1CustomImpl(*gpu_dv, *b_gpu_tmp,
                                                *global_gpu_dv, *c_gpu_tmp);
  ipermute(*c_gpu_tmp, varargout_1);
  cudaFree(*gpu_dv);
  cudaFree(*c_gpu_tmp);
  cudaFree(*b_gpu_tmp);
  cudaFree(*gpu_tmp);
}

//
// Arguments    : detector0_0 *obj
// Return Type  : void
//
void dlnetwork_setup(detector0_0 *obj)
{
  try {
    obj->setup();
  } catch (std::runtime_error const &err) {
    obj->cleanup();
    checkRunTimeError(err.what(), __FILE__, __LINE__);
  } catch (...) {
    obj->cleanup();
    checkRunTimeError("", __FILE__, __LINE__);
  }
}

} // namespace internal
} // namespace coder

//
// File trailer for dlnetwork.cu
//
// [EOF]
//
