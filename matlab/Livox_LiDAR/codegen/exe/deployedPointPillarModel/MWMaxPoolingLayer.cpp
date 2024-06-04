/* Copyright 2020-2022 The MathWorks, Inc. */

#include "MWMaxPoolingLayer.hpp"
#include "MWCNNLayerImplBase.hpp"
#include "MWTensorBase.hpp"
#include "MWCNNLayer.hpp"
#include "MWTargetNetworkImplBase.hpp"
#include "MWLayerImplFactory.hpp"

#include "shared_layers_export_macros.hpp"

#include <cmath>
#include <cstdarg>


// Template type T1 is the input data type and will always be signed char or float
// Template type T2 is the output data type and this can be either signed char or float

template DLCODER_EXPORT_CLASS void MWMaxPoolingLayer::createMaxPoolingLayer<signed char, signed char>(
    MWTargetNetworkImplBase*,
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

template DLCODER_EXPORT_CLASS void MWMaxPoolingLayer::createMaxPoolingLayer<float, float>(MWTargetNetworkImplBase*,
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


// Create MaxPooling2DLayer with PoolSize = [ PoolH PoolW ]
//                                Stride = [ StrideH StrideW ]
//                               Padding = [ PaddingH_T PaddingH_B PaddingW_L PaddingW_R ]
template <typename T1, typename T2>
void MWMaxPoolingLayer::createMaxPoolingLayer(MWTargetNetworkImplBase* ntwk_impl,
                                              MWTensorBase* m_in,
                                              int m_PoolH,
                                              int m_PoolW,
                                              int m_StrideH,
                                              int m_StrideW,
                                              int m_PaddingH_T,
                                              int m_PaddingH_B,
                                              int m_PaddingW_L,
                                              int m_PaddingW_R,
                                              bool m_hasIndices,
                                              int m_scalingFactorAlpha1,
                                              const char* m_accelerationMode,
                                              int numOutputs,
                                              ...) {
    setInputTensor(m_in);

    strideH = m_StrideH;
    strideW = m_StrideW;

    poolH = m_PoolH;
    poolW = m_PoolW;

    isGlobalMaxPooling = (poolH == -1) && (poolW == -1);

    paddingH_T = m_PaddingH_T;
    paddingH_B = m_PaddingH_B;
    paddingW_L = m_PaddingW_L;
    paddingW_R = m_PaddingW_R;

    hasIndices = m_hasIndices;
    setAccelMode(m_accelerationMode);
    setScalingExponent(m_scalingFactorAlpha1);

    {
        va_list args;
        va_start(args, numOutputs);

        std::vector<const char*> outFormats(numOutputs, NULL);
        for (int i = 0; i < numOutputs; i++) {
            outFormats[i] = va_arg(args, const char*);
        }

        for (int i = 0; i < numOutputs; ++i) {
            allocateOutputTensor<T2>(-1, -1, -1, -1, -1, NULL, outFormats[i], i);
            int bufIndex = va_arg(args, int);
            getOutputTensor(i)->setopBufIndex(bufIndex);
        }

        MWLayerImplFactory* factory = ntwk_impl->getLayerImplFactory();
        m_impl = factory->createMaxPoolingLayerImpl(
            this, ntwk_impl, m_PoolH, m_PoolW, m_StrideH, m_StrideW, m_PaddingH_T, m_PaddingH_B,
            m_PaddingW_L, m_PaddingW_R, m_hasIndices, numOutputs);
    }
}


void MWMaxPoolingLayer::propagateSize() {
    // Global Max Pooling case
    if (isGlobalMaxPooling) {
        poolH = getInputTensor()->getHeight();
        poolW = getInputTensor()->getWidth();
    }

    int outputH = ((getInputTensor()->getHeight() - poolH + paddingH_T + paddingH_B) / strideH) + 1;
    int outputW = ((getInputTensor()->getWidth() - poolW + paddingW_L + paddingW_R) / strideW) + 1;

    assert(getInputTensor()->getSequenceLength() == 1);

    bool isINT8x4 =
        getOutputTensor()->isInt8() && std::string{"INT8x4"}.compare(getAccelMode()) == 0;

    int mult4_featureMap =
        isINT8x4 ? static_cast<int>(std::ceil((float)getInputTensor()->getChannels() / 4) * 4)
                 : getInputTensor()->getChannels();

    resizeOutputTensor(outputH, outputW, mult4_featureMap, getInputTensor()->getBatchSize(),
                       getInputTensor()->getSequenceLength());

    if (hasIndices) {
        // allocate index tensor
        resizeOutputTensor(outputH, outputW, getInputTensor()->getChannels(),
                           getInputTensor()->getBatchSize(), getInputTensor()->getSequenceLength(),
                           1);
    }

    m_impl->propagateSize();
}
