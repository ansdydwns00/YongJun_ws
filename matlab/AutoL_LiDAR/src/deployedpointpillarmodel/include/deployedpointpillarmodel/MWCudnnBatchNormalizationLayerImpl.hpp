/* Copyright 2017-2022 The MathWorks, Inc. */


#ifndef MW_CUDNN_BATCH_NORMALIZATION_IMPL
#define MW_CUDNN_BATCH_NORMALIZATION_IMPL

#include "MWCudnnCNNLayerImpl.hpp"

#include <vector>

class MWCNNLayer;

namespace MWCudnnTarget {

class MWTargetNetworkImpl;

/**
 * Codegen class for Batch Normalization Layer
 *
 * This layer performs a simple scale and offset of the input data
 * using previously learned weights together with measured mean and
 * variance over the training data.
 */

class MWBatchNormalizationLayerImpl : public MWCNNLayerImpl {
  public:
    MWBatchNormalizationLayerImpl(MWCNNLayer*,
                                  MWTargetNetworkImpl*,
                                  float,
                                  const char*,
                                  const char*,
                                  const char*,
                                  const char*,
                                  int);
    ~MWBatchNormalizationLayerImpl();

    void predict();
    void cleanup();
    void propagateSize();
    void setLearnables(std::vector<float*>);

  protected:
    // Methods to setup the scale, offset, mean and variance parameters
    void loadScale(const char*);
    void loadOffset(const char*);
    void loadTrainedMean(const char*);
    void loadTrainedVariance(const char*);

  public:
    int cwCXkgHfZmFQRzNVUlCO;

  private:
    const float PQjbchiGbyJfmpiqPpOC;
    cudnnBatchNormMode_t bQjijJlpNAVdwDDQgpaX;
    cudnnTensorDescriptor_t KHClOltUSuqFVVErSxVb;

    // Parameters from training
    float* olKGEIcsxmLSoMhRhEtP;
    float* fYaOQTeunPwVjnhhTECh;
    float* tGsvtyAVkrDznETdweDC;
    float* tiuPuNpHUkyfgdeGvHSN;

  private:
    /** Helper to load a parameter from file into GPU memory. */
    void iLoadParamOntoGPU(char const* const PtRNGuserCxHAQfyEjFc,
                           int const dMxIKDGTITyhdLqIHBLA,
                           float* QwUuNuQNtlPXrIwRNiSZ);
};

} // namespace MWCudnnTarget

#endif
