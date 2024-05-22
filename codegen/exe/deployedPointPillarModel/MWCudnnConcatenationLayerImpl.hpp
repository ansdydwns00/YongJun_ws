/* Copyright 2019-2022 The MathWorks, Inc. */

#ifndef MW_CUDNN_CONCAT_LAYER_IMPL
#define MW_CUDNN_CONCAT_LAYER_IMPL

#include "MWCudnnCNNLayerImpl.hpp"

/**
 *  Codegen class for Concat Layer
 *  Concatenates inputs along given dimension
 **/
class MWCNNLayer;

namespace MWCudnnTarget {

class MWTargetNetworkImpl;

class MWConcatenationLayerImpl : public MWCNNLayerImpl {
  public:
    MWConcatenationLayerImpl(MWCNNLayer*, MWTargetNetworkImpl*, int);
    ~MWConcatenationLayerImpl();

    void predict();
    void cleanup();
    void propagateSize();

    void prepareKernelInputs(int& KCudOrFMfgCzUPMcdePX,
                             int& shEncNmxJsMuJKwbrwok,
                             int dJcdBfQQLhIAYHPxwQeg);

  private:
    int OPnUFarBGxQhYRrGpeBQ;
};

} // namespace MWCudnnTarget

#endif
