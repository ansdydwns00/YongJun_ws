/* Copyright 2017-2022 The MathWorks, Inc. */

#include "MWBatchNormalizationLayer.hpp"
#include "MWCNNLayerImplBase.hpp"
#include "MWTensorBase.hpp"
#include "MWCNNLayer.hpp"
#include "MWTargetNetworkImplBase.hpp"
#include "MWLayerImplFactory.hpp"

#include <cstdio>
#include <cassert>
#include <vector>

MWBatchNormalizationLayer::MWBatchNormalizationLayer() {
}

MWBatchNormalizationLayer::~MWBatchNormalizationLayer() {
}

void MWBatchNormalizationLayer::createBatchNormalizationLayer(
    MWTargetNetworkImplBase* ntwk_impl,
    MWTensorBase* MW_mangled_in,
    float MW_mangled_epsilon_in,
    const char* MW_mangled_offset_file,
    const char* MW_mangled_scale_file,
    const char* MW_mangled_trainedMean_file,
    const char* MW_mangled_trainedVariance_file,
    int MW_mangled_numChannels,
    const char* MW_mangled_outFormat,
    int outbufIdx) {
    setInputTensor(MW_mangled_in);
    allocateOutputTensor<float>(-1, -1, -1, -1, -1, NULL, MW_mangled_outFormat);

    getOutputTensor(0)->setopBufIndex(outbufIdx);

    numChannels = MW_mangled_numChannels;

    MWLayerImplFactory* factory = ntwk_impl->getLayerImplFactory();
    m_impl = factory->createBatchNormalizationLayerImpl(
        this, ntwk_impl, MW_mangled_epsilon_in, MW_mangled_offset_file, MW_mangled_scale_file,
        MW_mangled_trainedMean_file, MW_mangled_trainedVariance_file, numChannels);
}

void MWBatchNormalizationLayer::propagateSize() {
    assert(getInputTensor()->getChannels() == numChannels);
    assert(getInputTensor()->getSequenceLength() == 1);

    resizeOutputTensor(getInputTensor()->getHeight(), getInputTensor()->getWidth(),
                       getInputTensor()->getChannels(), getInputTensor()->getBatchSize(),
                       getInputTensor()->getSequenceLength());

    m_impl->propagateSize();
}

void MWBatchNormalizationLayer::setLearnables(float* m_offset, float* m_scale) {
    std::vector<float*> learnables;
    learnables.reserve(2);
    learnables.push_back(m_offset);
    learnables.push_back(m_scale);
    m_impl->setLearnables(learnables);
}
