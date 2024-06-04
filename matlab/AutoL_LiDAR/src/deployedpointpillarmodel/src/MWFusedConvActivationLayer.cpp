/* Copyright 2018-2022 The MathWorks, Inc. */

#include "MWFusedConvActivationLayer.hpp"
#include "MWCNNLayerImplBase.hpp"
#include "MWTensorBase.hpp"
#include "MWCNNLayer.hpp"
#include "MWTargetNetworkImplBase.hpp"
#include "MWActivationFunctionType.hpp"
#include "MWLayerImplFactory.hpp"

#include <cstdio>
#include <cassert>
#include <cstdarg>
#include <stdexcept>
#include <vector>

MWFusedConvActivationLayer::MWFusedConvActivationLayer() {
}

MWFusedConvActivationLayer::~MWFusedConvActivationLayer() {
}


void MWFusedConvActivationLayer::createFusedConvActivationLayer(MWTargetNetworkImplBase* ntwk_impl,
                                                                int numInputs,
                                                                ...) {
    va_list args;
    va_start(args, numInputs);

    for (int i = 0; i < numInputs; i++) {
        MWTensorBase* inputTensor = va_arg(args, MWTensorBase*);
        setInputTensor(inputTensor, i);
    }

    filterH = va_arg(args, int);
    filterW = va_arg(args, int);
    numChannels = va_arg(args, int);
    numFilters = va_arg(args, int);
    strideH = va_arg(args, int);
    strideW = va_arg(args, int);
    paddingH_T = va_arg(args, int);
    paddingH_B = va_arg(args, int);
    paddingW_L = va_arg(args, int);
    paddingW_R = va_arg(args, int);
    dilationFactorH = va_arg(args, int);
    dilationFactorW = va_arg(args, int);
    numGroups = va_arg(args, int);
    const char* m_weights_file = va_arg(args, const char*);
    const char* m_bias_file = va_arg(args, const char*);
    double m_alpha = va_arg(args, double);

    // Extract ACTIVATION_FCN_ENUM as a int because extraction using promoting types(short, float)
    // causes undefined behaviour with va_arg.
    MWActivationFunctionType::ACTIVATION_FCN_ENUM m_activationFcn =
        static_cast<MWActivationFunctionType::ACTIVATION_FCN_ENUM>(va_arg(args, int));

    const char* outFormat = va_arg(args, const char*);
    allocateOutputTensor<float>(-1, -1, -1, -1, -1, NULL, outFormat);

    int outbufIdx = va_arg(args, int);

    if (m_activationFcn >= MWActivationFunctionType::ACTIVATION_FCN_ENUM::INVALID_ACTIVATION) {
        std::string errorStr = "Convolution and current activation layer fusion is illegal.";
        throw std::runtime_error(errorStr);
    }

    getOutputTensor(0)->setopBufIndex(outbufIdx);

    MWLayerImplFactory* factory = ntwk_impl->getLayerImplFactory();
    m_impl = factory->createFusedConvActivationLayerImpl(
        this, ntwk_impl, filterH, filterW, numGroups, numChannels, numFilters, strideH, strideW,
        paddingH_T, paddingH_B, paddingW_L, paddingW_R, dilationFactorH, dilationFactorW, numInputs,
        m_weights_file, m_bias_file, m_alpha, m_activationFcn);
}

void MWFusedConvActivationLayer::propagateSize() {
    int m_filterH_temp = ((filterH - 1) * dilationFactorH) + 1;
    int m_filterW_temp = ((filterW - 1) * dilationFactorW) + 1;
    int outputH =
        ((getInputTensor()->getHeight() - m_filterH_temp + paddingH_B + paddingH_T) / strideH) + 1;
    int outputW =
        ((getInputTensor()->getWidth() - m_filterW_temp + paddingW_L + paddingW_R) / strideW) + 1;

    assert(getInputTensor()->getSequenceLength() == 1);

    assert(getNumInputs() == 2 || getNumInputs() == 1);
    if (getNumInputs() == 2) {

        assert(getInputTensor(1)->getHeight() == outputH);
        assert(getInputTensor(1)->getWidth() == outputW);
        assert(getInputTensor(1)->getChannels() == numFilters * numGroups);
        assert(getInputTensor(1)->getBatchSize() == getInputTensor(0)->getBatchSize());
        assert(getInputTensor(1)->getSequenceLength() == getInputTensor(0)->getSequenceLength());
    }

    resizeOutputTensor(outputH, outputW, numFilters * numGroups, getInputTensor()->getBatchSize(),
                       getInputTensor()->getSequenceLength());

    m_impl->propagateSize();
}

void MWFusedConvActivationLayer::setLearnables(float* m_weights, float* m_bias) {
    std::vector<float*> learnables;
    learnables.reserve(2);
    learnables.push_back(m_weights);
    learnables.push_back(m_bias);
    m_impl->setLearnables(learnables);
}
