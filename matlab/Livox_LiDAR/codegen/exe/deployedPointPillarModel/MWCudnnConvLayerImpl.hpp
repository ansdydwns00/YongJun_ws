/* Copyright 2018-2022 The MathWorks, Inc. */

#ifndef MW_CUDNN_CONV_LAYER_IMPL
#define MW_CUDNN_CONV_LAYER_IMPL

#include "MWCudnnCNNLayerImpl.hpp"

#include <vector>

class MWCNNLayer;

namespace MWCudnnTarget {

class MWTargetNetworkImpl;

/**
 * Codegen class for Convolution layer implementation
 */
class MWConvLayerImpl : public MWCNNLayerImpl {
  private:
    int AwZQzUhuWVLGrWgLHRuM;
    int AzTsxYcYjIEJsGQbeYHm;

    int BdqURaHPmdnfzvtUvocl;
    int BRSPqxNffoBYKqpSVHne;
    int BUOdotSvmFyUWQKMUdra;

    int AVeZfqOFypgpiqfRYlKc;
    int AjhVZuQXURJimwbnYqDF;

    int CDJtexcMbXMWAmnNZsNf;
    int CCKWXUFWgrbBMjwfpOBN;
    int CTCbzQMDaLxINPbODdng;
    int CZNYmBcNFSZWvaCklqeM;

    int EvebzoroiuKkIxwjkGnD;
    int FOcStuqCptsGIZXskVpC;

    float* vIWQzNvYZSuxmOTVDFhU;
    float* IpFhwalnAlrMvcuyQpQD;

    // for temporary pre-padded input for asymmetric padding
    MWTensorBase* SugesRlPIbOVzRgNWRnl;
    int bERCRkGjpaKXMNComoYl;
    int bOrQjJTNlssnrexxbHdi;

    bool HtQBsWTCGEkpylRklilw;

  public:
    MWConvLayerImpl(MWCNNLayer* layer,
                    MWTargetNetworkImpl* ntwk_impl,
                    int filt_H,
                    int filt_W,
                    int numGrps,
                    int numChannels,
                    int numFilts,
                    int EvebzoroiuKkIxwjkGnD,
                    int FOcStuqCptsGIZXskVpC,
                    int CDJtexcMbXMWAmnNZsNf,
                    int CCKWXUFWgrbBMjwfpOBN,
                    int CTCbzQMDaLxINPbODdng,
                    int CZNYmBcNFSZWvaCklqeM,
                    int AVeZfqOFypgpiqfRYlKc,
                    int AjhVZuQXURJimwbnYqDF,
                    const char* xHViLEwTujGGrPZZgmbF,
                    const char* JwxFdqOKggeawILBfGgg);

    ~MWConvLayerImpl() {
    }

    void predict();
    void cleanup();
    void postSetup();
    void propagateSize();
    void allocate();
    void deallocate();
    void setLearnables(std::vector<float*>);

  private:
    void loadWeights(const char*);
    void loadBias(const char*);
    void getConvAlgoTuned();
    void getConvAlgoWorkSpaceLimit();

  private:
    cudnnConvolutionDescriptor_t NGqpeiLeVweDRsOKEtuw;
    cudnnConvolutionFwdAlgo_t NDHPlSVpLroiIBRnjwyO;

    cudnnFilterDescriptor_t PtkeOkuClHzhOfpmBevf;
    cudnnTensorDescriptor_t JgLfgHrHMEMmMYTettJF;

    cudnnTensorDescriptor_t XYbzSmRQGatVJtGmDZSo;
};

} // namespace MWCudnnTarget

#endif
