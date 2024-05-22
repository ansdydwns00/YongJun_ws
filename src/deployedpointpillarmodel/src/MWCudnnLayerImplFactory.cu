#ifdef PRECOMPILE_LAYERFILES
#include "layer/MWLayerImplFactory.hpp"
#include "layer/MWCNNLayerImplBase.hpp"
#else
#include "MWLayerImplFactory.hpp"
#include "MWCNNLayerImplBase.hpp"
#endif
#include "MWCudnnLayerImplFactory.hpp"
#include "MWCudnnCNNLayerImpl.hpp"
#include "MWCudnnTargetNetworkImpl.hpp"
 class MWCNNLayer;
#ifndef CREATE_INPUT_LAYER_IMPL_DEFINITION
#define CREATE_INPUT_LAYER_IMPL_DEFINITION

#include "MWCudnnInputLayerImpl.hpp"
MWCNNLayerImplBase* MWCudnnLayerImplFactory::createInputLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2) {
return new MWCudnnTarget::MWInputLayerImpl(arg1,
static_cast<MWCudnnTarget::MWTargetNetworkImpl*>(arg2));
}

#endif

#ifndef CREATE_FUSEDCONVACTIVATION_LAYER_IMPL_DEFINITION
#define CREATE_FUSEDCONVACTIVATION_LAYER_IMPL_DEFINITION

#include "MWCudnnFusedConvActivationLayerImpl.hpp"
MWCNNLayerImplBase* MWCudnnLayerImplFactory::createFusedConvActivationLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2,
int arg3,
int arg4,
int arg5,
int arg6,
int arg7,
int arg8,
int arg9,
int arg10,
int arg11,
int arg12,
int arg13,
int arg14,
int arg15,
int arg16,
const char* arg17,
const char* arg18,
double arg19,
MWActivationFunctionType::ACTIVATION_FCN_ENUM arg20) {
return new MWCudnnTarget::MWFusedConvActivationLayerImpl(arg1,
static_cast<MWCudnnTarget::MWTargetNetworkImpl*>(arg2),
arg3,
arg4,
arg5,
arg6,
arg7,
arg8,
arg9,
arg10,
arg11,
arg12,
arg13,
arg14,
arg15,
arg16,
arg17,
arg18,
arg19,
arg20);
}

#endif

#ifndef CREATE_MAXPOOLING_LAYER_IMPL_DEFINITION
#define CREATE_MAXPOOLING_LAYER_IMPL_DEFINITION

#include "MWCudnnMaxPoolingLayerImpl.hpp"
MWCNNLayerImplBase* MWCudnnLayerImplFactory::createMaxPoolingLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2,
int arg3,
int arg4,
int arg5,
int arg6,
int arg7,
int arg8,
int arg9,
int arg10,
bool arg11,
int arg12) {
return new MWCudnnTarget::MWMaxPoolingLayerImpl(arg1,
static_cast<MWCudnnTarget::MWTargetNetworkImpl*>(arg2),
arg3,
arg4,
arg5,
arg6,
arg7,
arg8,
arg9,
arg10,
arg11,
arg12);
}

#endif

#ifndef CREATE_BATCHNORMALIZATION_LAYER_IMPL_DEFINITION
#define CREATE_BATCHNORMALIZATION_LAYER_IMPL_DEFINITION

#include "MWCudnnBatchNormalizationLayerImpl.hpp"
MWCNNLayerImplBase* MWCudnnLayerImplFactory::createBatchNormalizationLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2,
float arg3,
const char* arg4,
const char* arg5,
const char* arg6,
const char* arg7,
int arg8) {
return new MWCudnnTarget::MWBatchNormalizationLayerImpl(arg1,
static_cast<MWCudnnTarget::MWTargetNetworkImpl*>(arg2),
arg3,
arg4,
arg5,
arg6,
arg7,
arg8);
}

#endif

#ifndef CREATE_CONCATENATION_LAYER_IMPL_DEFINITION
#define CREATE_CONCATENATION_LAYER_IMPL_DEFINITION

#include "MWCudnnConcatenationLayerImpl.hpp"
MWCNNLayerImplBase* MWCudnnLayerImplFactory::createConcatenationLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2,
int arg3) {
return new MWCudnnTarget::MWConcatenationLayerImpl(arg1,
static_cast<MWCudnnTarget::MWTargetNetworkImpl*>(arg2),
arg3);
}

#endif

#ifndef CREATE_CONV_LAYER_IMPL_DEFINITION
#define CREATE_CONV_LAYER_IMPL_DEFINITION

#include "MWCudnnConvLayerImpl.hpp"
MWCNNLayerImplBase* MWCudnnLayerImplFactory::createConvLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2,
int arg3,
int arg4,
int arg5,
int arg6,
int arg7,
int arg8,
int arg9,
int arg10,
int arg11,
int arg12,
int arg13,
int arg14,
int arg15,
const char* arg16,
const char* arg17) {
return new MWCudnnTarget::MWConvLayerImpl(arg1,
static_cast<MWCudnnTarget::MWTargetNetworkImpl*>(arg2),
arg3,
arg4,
arg5,
arg6,
arg7,
arg8,
arg9,
arg10,
arg11,
arg12,
arg13,
arg14,
arg15,
arg16,
arg17);
}

#endif

#ifndef CREATE_SPLITTING_LAYER_IMPL_DEFINITION
#define CREATE_SPLITTING_LAYER_IMPL_DEFINITION

#include "MWCudnnSplittingLayerImpl.hpp"
MWCNNLayerImplBase* MWCudnnLayerImplFactory::createSplittingLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2,
int arg3,
int* arg4) {
return new MWCudnnTarget::MWSplittingLayerImpl(arg1,
static_cast<MWCudnnTarget::MWTargetNetworkImpl*>(arg2),
arg3,
arg4);
}

#endif

#ifndef CREATE_SIGMOID_LAYER_IMPL_DEFINITION
#define CREATE_SIGMOID_LAYER_IMPL_DEFINITION

#include "MWCudnnSigmoidLayerImpl.hpp"
MWCNNLayerImplBase* MWCudnnLayerImplFactory::createSigmoidLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2) {
return new MWCudnnTarget::MWSigmoidLayerImpl(arg1,
static_cast<MWCudnnTarget::MWTargetNetworkImpl*>(arg2));
}

#endif

#ifndef CREATE_OUTPUT_LAYER_IMPL_DEFINITION
#define CREATE_OUTPUT_LAYER_IMPL_DEFINITION

#include "MWCudnnOutputLayerImpl.hpp"
MWCNNLayerImplBase* MWCudnnLayerImplFactory::createOutputLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2) {
return new MWCudnnTarget::MWOutputLayerImpl(arg1,
static_cast<MWCudnnTarget::MWTargetNetworkImpl*>(arg2));
}

#endif
