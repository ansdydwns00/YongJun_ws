/* Copyright 2018-2022 The MathWorks, Inc. */

#ifndef MW_CONV_LAYER
#define MW_CONV_LAYER

#include "MWCNNLayer.hpp"

#include "shared_layers_export_macros.hpp"

class MWTargetNetworkImplBase;
class MWTensorBase;

/**
 * Codegen class for Convolution layer
 */

class DLCODER_EXPORT_CLASS MWConvLayer : public MWCNNLayer {
  public:
    MWConvLayer() {}
    ~MWConvLayer() {}
    void createConvLayer(MWTargetNetworkImplBase* ntwk_impl,
                         MWTensorBase*,
                         int,
                         int,
                         int,
                         int,
                         int,
                         int,
                         int,
                         int,
                         int,
                         int,
                         int,
                         int,
                         int,
                         const char*,
                         const char*,
                         const char*,
                         int);
    void propagateSize();
    void setLearnables(float*, float*);

  private:
    int numChannels;
    int numFilters;
    int numGroups;

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
