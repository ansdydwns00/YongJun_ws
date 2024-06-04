/* Copyright 2017-2022 The MathWorks, Inc. */

#ifndef MW_SPLITTING_LAYER
#define MW_SPLITTING_LAYER

#include "MWCNNLayer.hpp"

#include "shared_layers_export_macros.hpp"

class MWTargetNetworkImplBase;
class MWTensorBase;

/**
 *  Codegen class for Splitting layer
 *  Splitting a tensor across channels
 **/
class DLCODER_EXPORT_CLASS MWSplittingLayer : public MWCNNLayer {
  public:
    MWSplittingLayer();
    ~MWSplittingLayer();

    void createSplittingLayer(MWTargetNetworkImplBase*, MWTensorBase* tensorInput, ...);
    void propagateSize();

  private:
    int* channelSizes;
};

#endif
