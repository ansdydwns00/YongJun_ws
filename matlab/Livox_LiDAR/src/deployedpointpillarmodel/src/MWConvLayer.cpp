/* Copyright 2018-2022 The MathWorks, Inc. */

#include "MWConvLayer.hpp"
#include "MWCNNLayerImplBase.hpp"
#include "MWTargetNetworkImplBase.hpp"
#include "MWTensorBase.hpp"
#include "MWCNNLayer.hpp"
#include "MWLayerImplFactory.hpp"

#include <vector>

// Create Convolution2DLayer with  FilterSize = [r s]
//                               NumChannels = c
//                                NumFilters = k
//                                    Stride = [ StrideH StrideW ]
//                                   Padding = [ PaddingH PaddingW ]
//                            DilationFactor = [dilationFactorH dilationFactorW]
// g is for number of groups.
// g = 2 if NumChannels == [c c] and NumFilters == [k k].
// g = 1 otherwise.
// NNT does not support any other cases.
void MWConvLayer::createConvLayer(MWTargetNetworkImplBase* ntwk_impl,
                                  MWTensorBase* m_in,
                                  int m_FilterH,
                                  int m_FilterW,
                                  int m_NumChannels,
                                  int m_NumFilters,
                                  int m_StrideH,
                                  int m_StrideW,
                                  int m_PaddingH_T,
                                  int m_PaddingH_B,
                                  int m_PaddingW_L,
                                  int m_PaddingW_R,
                                  int m_DilationFactorH,
                                  int m_DilationFactorW,
                                  int m_NumGroups,
                                  const char* m_weights_file,
                                  const char* m_bias_file,
                                  const char* m_outFormat,
                                  int outbufIdx) {
    setInputTensor(m_in);

    numChannels = m_NumChannels;
    numFilters = m_NumFilters;
    numGroups = m_NumGroups;

    strideH = m_StrideH;
    strideW = m_StrideW;

    filterH = m_FilterH;
    filterW = m_FilterW;

    dilationFactorH = m_DilationFactorH;
    dilationFactorW = m_DilationFactorW;

    paddingH_T = m_PaddingH_T;
    paddingH_B = m_PaddingH_B;
    paddingW_L = m_PaddingW_L;
    paddingW_R = m_PaddingW_R;

    allocateOutputTensor<float>(-1, -1, -1, -1, -1, NULL, m_outFormat);

    getOutputTensor(0)->setopBufIndex(outbufIdx);

    MWLayerImplFactory* factory = ntwk_impl->getLayerImplFactory();
    m_impl = factory->createConvLayerImpl(
        this, ntwk_impl, m_FilterH, m_FilterW, m_NumGroups, m_NumChannels, m_NumFilters, m_StrideH,
        m_StrideW, m_PaddingH_T, m_PaddingH_B, m_PaddingW_L, m_PaddingW_R, m_DilationFactorH,
        m_DilationFactorW, m_weights_file, m_bias_file);
}

void MWConvLayer::propagateSize() {
    int filterH_temp = ((filterH - 1) * dilationFactorH) + 1;
    int filterW_temp = ((filterW - 1) * dilationFactorW) + 1;

    int outputH =
        ((getInputTensor()->getHeight() - filterH_temp + paddingH_B + paddingH_T) / strideH) + 1;
    int outputW =
        ((getInputTensor()->getWidth() - filterW_temp + paddingW_L + paddingW_R) / strideW) + 1;

    // allocate output tensor
    resizeOutputTensor(outputH, outputW, numFilters * numGroups, getInputTensor()->getBatchSize(),
                       getInputTensor()->getSequenceLength());

    assert(getOutputTensor()->getSequenceLength() == 1);

    m_impl->propagateSize();
}

void MWConvLayer::setLearnables(float* m_weights, float* m_bias) {
    std::vector<float*> learnables;
    learnables.reserve(2);
    learnables.push_back(m_weights);
    learnables.push_back(m_bias);
    m_impl->setLearnables(learnables);
}
