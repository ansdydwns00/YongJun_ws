/* Copyright 2017-2022 The MathWorks, Inc. */

#ifndef MW_BATCH_NORMALIZATION_LAYER
#define MW_BATCH_NORMALIZATION_LAYER

#include "MWCNNLayer.hpp"

#include "shared_layers_export_macros.hpp"

class MWTargetNetworkImplBase;
class MWTensorBase;

/**
 * Codegen class for Batch Normalization Layer
 *
 * This layer performs a simple scale and offset of the input data
 * using previously learned weights together with measured mean and
 * variance over the training data.
 */
class DLCODER_EXPORT_CLASS MWBatchNormalizationLayer : public MWCNNLayer {
  public:
    MWBatchNormalizationLayer();
    ~MWBatchNormalizationLayer();

    /** Create a new batch normalization layer. */
    void createBatchNormalizationLayer(MWTargetNetworkImplBase*,
                                       MWTensorBase* previousLayer,
                                       float epsilon,
                                       const char*,
                                       const char*,
                                       const char*,
                                       const char*,
                                       int numChannels,
                                       const char* outFormat,
                                       int outbufIdx);
    void propagateSize();
    void setLearnables(float*, float*);

  private:
    int numChannels;
};

#endif
