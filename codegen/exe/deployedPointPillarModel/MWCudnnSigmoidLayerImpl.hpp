/* Copyright 2018-2022 The MathWorks, Inc. */

// Target Specific (cudnn) header for Keras' Sigmoid Layer
#ifndef MW_CUDNN_SIGMOID_LAYER_IMPL
#define MW_CUDNN_SIGMOID_LAYER_IMPL

#include "MWCudnnCNNLayerImpl.hpp"

/**
 *  Codegen class for Keras Sigmoid Layer
 **/
class MWCNNLayer;

namespace MWCudnnTarget {
class MWTargetNetworkImpl;
class MWSigmoidLayerImpl : public MWCNNLayerImpl {
  public:
    MWSigmoidLayerImpl(MWCNNLayer*, MWTargetNetworkImpl*);
    ~MWSigmoidLayerImpl();

    void predict();
    void cleanup();
    void propagateSize();

  private:
    cudnnActivationDescriptor_t rISNTTiSXOTdHqHTtNiB;
};

} // namespace MWCudnnTarget
#endif
