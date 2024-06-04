/* Copyright 2020-2022 The MathWorks, Inc. */

#ifndef MW_CUDNN_MAX_POOLING_LAYER_IMPL
#define MW_CUDNN_MAX_POOLING_LAYER_IMPL

#include "MWCudnnCNNLayerImpl.hpp"

class MWCNNLayer;

namespace MWCudnnTarget {
class MWTargetNetworkImpl;

// MaxPooling2DLayer
class MWMaxPoolingLayerImpl : public MWCNNLayerImpl {
  public:
    // Create MaxPooling2DLayer with PoolSize = [ PoolH PoolW ]
    //                                Stride = [ StrideH StrideW ]
    //                               Padding = [ PaddingH_T PaddingH_B PaddingW_L PaddingW_R ]
    MWMaxPoolingLayerImpl(MWCNNLayer*,
                          MWTargetNetworkImpl*,
                          int,
                          int,
                          int,
                          int,
                          int,
                          int,
                          int,
                          int,
                          bool,
                          int);
    ~MWMaxPoolingLayerImpl();

    void predict();
    void cleanup();
    void propagateSize();
    void allocate();
    void deallocate();
    float* getIndexData();

  public:
    int CufLFODQDXTAPyRqYodN;
    int DSsxcjIrUgZCKZovyNQf;
    int CqtPRJvHlGJFssiPzsOm;
    int DRzwhbNPpftRRIXXfHzd;

    int CDJtexcMbXMWAmnNZsNf;
    int CCKWXUFWgrbBMjwfpOBN;
    int CTCbzQMDaLxINPbODdng;
    int CZNYmBcNFSZWvaCklqeM;

    int EvebzoroiuKkIxwjkGnD;
    int FOcStuqCptsGIZXskVpC;

    bool BHuHNDGoRwGRouCxeMbw;

  private:
    float* URgvgDXnZskIYGdtimcU;
    float* OwortPcLToImGdYFtbSF;
    int etjQLJVQCaeAXRWYtqOl;
    cudnnPoolingDescriptor_t lHtftnmGBvlSSoGOXVui;
    float puSFZkRJmyuFPfQRswDK;
    bool vFNECEAeLZsYsUxvlgqL;
    cudnnTensorDescriptor_t DGzdAcREJHGXjyRzNjJV;
};

} // namespace MWCudnnTarget

#endif
