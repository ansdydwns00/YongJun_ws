#include "MWCudnnCommonHeaders.hpp"
#include "MWCudnnSigmoidLayerImpl.hpp"
#include <cstdarg>
#include <cassert>
 namespace MWCudnnTarget { MWSigmoidLayerImpl::MWSigmoidLayerImpl(MWCNNLayer* 
layer, MWTargetNetworkImpl* ntwk_impl) : MWCNNLayerImpl(layer, ntwk_impl) { 
CUDNN_CALL(cudnnCreateActivationDescriptor(&rISNTTiSXOTdHqHTtNiB)); 
createAndAddDescriptor(getLayer()->getOutputTensor()->getSourcePortIndex()); } 
MWSigmoidLayerImpl::~MWSigmoidLayerImpl() { } void 
MWSigmoidLayerImpl::propagateSize() { MWTensorBase* opTensor = 
getLayer()->getOutputTensor(0); cudnnTensorDescriptor_t* desc = 
getDescriptor(opTensor->getSourcePortIndex()); assert(desc); 
setDescriptor<float>(*desc, static_cast<MWTensor<float>*>(opTensor)); 
CUDNN_CALL(cudnnSetActivationDescriptor( rISNTTiSXOTdHqHTtNiB, 
CUDNN_ACTIVATION_SIGMOID,  CUDNN_NOT_PROPAGATE_NAN, 0)); } void 
MWSigmoidLayerImpl::predict() { MWCNNLayer* SigmoidLayer = getLayer(); 
MWTensorBase* ipTensorBase = SigmoidLayer->getInputTensor(0); MWTensorBase* 
opTensorBase = SigmoidLayer->getOutputTensor(0); MWTensor<float>* ipTensor = 
static_cast<MWTensor<float>*>(ipTensorBase); MWTensor<float>* opTensor = 
static_cast<MWTensor<float>*>(opTensorBase); cudnnTensorDescriptor_t* desc = 
getDescriptor(opTensor->getSourcePortIndex()); assert(desc); 
cudnnTensorDescriptor_t ipDesc = 
MWCNNLayerImpl::getCuDNNDescriptor(ipTensorBase); 
CUDNN_CALL(cudnnActivationForward( *cQBKlCKXxecGPJrXBXdk->getCudnnHandle(), 
rISNTTiSXOTdHqHTtNiB, getOnePtr(), ipDesc, ipTensor->getData(), getZeroPtr(), 
*desc, opTensor->getData())); } void MWSigmoidLayerImpl::cleanup() { 
CUDNN_CALL(cudnnDestroyActivationDescriptor(rISNTTiSXOTdHqHTtNiB)); } } 