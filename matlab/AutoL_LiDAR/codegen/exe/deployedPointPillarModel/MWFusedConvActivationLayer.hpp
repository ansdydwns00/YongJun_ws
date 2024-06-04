/* Copyright 2018-2022 The MathWorks, Inc. */

#ifndef MW_FUSED_CONV_ACTIVATION_LAYER
#define MW_FUSED_CONV_ACTIVATION_LAYER

#include "MWCNNLayer.hpp"
#include "MWActivationFunctionType.hpp"

#include "shared_layers_export_macros.hpp"

class MWTargetNetworkImplBase;
class MWTensorBase;

/**
 *  Codegen class for Fused Convolution2D-Activation
 **/
class DLCODER_EXPORT_CLASS MWFusedConvActivationLayer : public MWCNNLayer {
  public:
    MWFusedConvActivationLayer();
    ~MWFusedConvActivationLayer();
    void createFusedConvActivationLayer(MWTargetNetworkImplBase*, int, ...);
    void propagateSize();
    void setLearnables(float*, float*);

  private:
    int numFilters;
    int numGroups;
    int numChannels;

    int strideH;
    int strideW;

    int filterH;
    int filterW;

    int dilationFactorH;
    int dilationFactorW;

    int paddingH_T;
    int paddingH_B;
    int paddingW_L;
    int paddingW_R;
};

#endif
