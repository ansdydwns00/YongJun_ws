/* Copyright 2018-2022 The MathWorks, Inc. */

// Target Agnostic implementation for Keras's Sigmoid Layer
#include "MWSigmoidLayer.hpp"
#include "MWCNNLayerImplBase.hpp"
#include "MWTensorBase.hpp"
#include "MWCNNLayer.hpp"
#include "MWTargetNetworkImplBase.hpp"
#include "MWLayerImplFactory.hpp"

MWSigmoidLayer::MWSigmoidLayer() {
}

MWSigmoidLayer::~MWSigmoidLayer() {
}

void MWSigmoidLayer::createSigmoidLayer(MWTargetNetworkImplBase* ntwk_impl,
                                        MWTensorBase* m_in,
                                        const char* outFormat,
                                        int outbufIdx) {
    setInputTensor(m_in);
    allocateOutputTensor<float>(-1, -1, -1, -1, -1, NULL, outFormat);

    getOutputTensor(0)->setopBufIndex(outbufIdx);

    MWLayerImplFactory* factory = ntwk_impl->getLayerImplFactory();
    m_impl = factory->createSigmoidLayerImpl(this, ntwk_impl);
}

void MWSigmoidLayer::propagateSize() {
    resizeOutputTensor(getInputTensor()->getHeight(), getInputTensor()->getWidth(),
                       getInputTensor()->getChannels(), getInputTensor()->getBatchSize(),
                       getInputTensor()->getSequenceLength());

    m_impl->propagateSize();
}
