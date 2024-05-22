/* Copyright 2020-2022 The MathWorks, Inc. */

#ifndef MW_MAX_POOLING_LAYER
#define MW_MAX_POOLING_LAYER

#include "MWCNNLayer.hpp"

#include "shared_layers_export_macros.hpp"

class MWTargetNetworkImplBase;
class MWTensorBase;

/**
 * Codegen class for MaxPool layer
 */

// MaxPooling2DLayer
class DLCODER_EXPORT_CLASS MWMaxPoolingLayer : public MWCNNLayer {
  public:
    MWMaxPoolingLayer()
        : isGlobalMaxPooling{false} {}
    ~MWMaxPoolingLayer() {}
    // Create MaxPooling2DLayer with PoolSize = [ PoolH PoolW ]
    //                                Stride = [ StrideH StrideW ]
    //                               Padding = [ PaddingH_T PaddingH_B PaddingW_L PaddingW_R ]

    template <typename T1, typename T2>
    void createMaxPoolingLayer(MWTargetNetworkImplBase*,
                               MWTensorBase*,
                               int,
                               int,
                               int,
                               int,
                               int,
                               int,
                               int,
                               int,
                               bool,
                               int,
                               const char*,
                               int,
                               ...);
    void propagateSize();

    int getNumInstrumentedOutputs() {
        return 1;
    }

  private:
    int strideH;
    int strideW;

    int poolH;
    int poolW;

    int paddingH_T;
    int paddingH_B;
    int paddingW_L;
    int paddingW_R;

    bool isGlobalMaxPooling;

    bool hasIndices;
};

#endif
