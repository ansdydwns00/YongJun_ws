/* Copyright 2019-2022 The MathWorks, Inc. */

#ifndef MW_CONCATENTION_LAYER
#define MW_CONCATENTION_LAYER

#include "MWCNNLayer.hpp"

#include "shared_layers_export_macros.hpp"

class MWTargetNetworkImplBase;
class MWTensorBase;

/**
 *  Codegen class for Concatenation Layer
 *  Concatenation layer
 **/
class DLCODER_EXPORT_CLASS MWConcatenationLayer : public MWCNNLayer {
  public:
    MWConcatenationLayer();
    ~MWConcatenationLayer();

    void createConcatenationLayer(MWTargetNetworkImplBase*, int numInputs, ...);
    void propagateSize();

  public:
    int dimension;
};

#endif
