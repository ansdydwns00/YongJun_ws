/* Copyright 2018-2022 The MathWorks, Inc. */

#ifndef MW_CUDNN_FUSED_CONV_ACTIVATION_LAYER_IMPL
#define MW_CUDNN_FUSED_CONV_ACTIVATION_LAYER_IMPL

#ifdef PRECOMPILE_LAYERFILES
#include "layer/MWActivationFunctionType.hpp"
#else
#include "MWActivationFunctionType.hpp"
#endif

#include "MWCudnnCNNLayerImpl.hpp"

#include <vector>

class MWCNNLayer;

namespace MWCudnnTarget {
class MWTargetNetworkImpl;

class MWFusedConvActivationLayerImpl : public MWCNNLayerImpl {

  private:
    int AwZQzUhuWVLGrWgLHRuM; // Filter height for CONV and FC
    int AzTsxYcYjIEJsGQbeYHm;  // Filter width for CONV and FC

    int BdqURaHPmdnfzvtUvocl;
    int BRSPqxNffoBYKqpSVHne;
    int BUOdotSvmFyUWQKMUdra;

    int EvebzoroiuKkIxwjkGnD;
    int FOcStuqCptsGIZXskVpC;
    int CDJtexcMbXMWAmnNZsNf;
    int CCKWXUFWgrbBMjwfpOBN;
    int CTCbzQMDaLxINPbODdng;
    int CZNYmBcNFSZWvaCklqeM;
    int AVeZfqOFypgpiqfRYlKc;
    int AjhVZuQXURJimwbnYqDF;

    int fSKMHAqIghbYYgyIpNDw;

    float* vIWQzNvYZSuxmOTVDFhU;
    float* IpFhwalnAlrMvcuyQpQD;
    MWTensorBase* TfsmDFpPPOscKZifVzSQ; // for pre-padded input
    int bERCRkGjpaKXMNComoYl;
    int bOrQjJTNlssnrexxbHdi;

    float* WprSrhAStKGxyXeoxETy;

    float* HUdjvMUbhwNBNiIGaMZg; // Scaling factor for addition

    bool HtQBsWTCGEkpylRklilw;

    // Temporary buffer for Xinput, CuDNN 8 upgrade
    float* FrpxvsDMwwgbpqHXWxmN;

  public:
    MWFusedConvActivationLayerImpl(MWCNNLayer*,
                                   MWTargetNetworkImpl*,
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
                                   int,
                                   const char*,
                                   const char*,
                                   double,
                                   MWActivationFunctionType::ACTIVATION_FCN_ENUM);
    ~MWFusedConvActivationLayerImpl();

    void predict();
    void cleanup();
    void propagateSize();
    void allocate();
    void deallocate();
    void postSetup();
    void setLearnables(std::vector<float*>);

  private:
    void loadWeights(const char*);
    void loadBias(const char*);
    void getConvAlgoTuned();
    void getConvAlgoWorkSpaceLimit();
    void fixConvAlgo(); // g1916490

    void setalpha2Ptr(float* alpha2) {
        HUdjvMUbhwNBNiIGaMZg = alpha2;
    }
    float* getalpha2Ptr() {
        return HUdjvMUbhwNBNiIGaMZg;
    }


  private:
    cudnnConvolutionDescriptor_t NGqpeiLeVweDRsOKEtuw;
    cudnnConvolutionFwdAlgo_t NDHPlSVpLroiIBRnjwyO;

    cudnnFilterDescriptor_t PtkeOkuClHzhOfpmBevf;
    cudnnTensorDescriptor_t JgLfgHrHMEMmMYTettJF;

    cudnnTensorDescriptor_t XYbzSmRQGatVJtGmDZSo;

    cudnnActivationDescriptor_t muwRQxtWMMXAPxSuMYBw;
};
} // namespace MWCudnnTarget
#endif
