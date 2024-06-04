#include "MWCudnnCommonHeaders.hpp"
#include "MWCudnnBatchNormalizationLayerImpl.hpp"
#include <cstdio>
#include <cassert>
#include <vector>
 namespace MWCudnnTarget { 
MWBatchNormalizationLayerImpl::MWBatchNormalizationLayerImpl( MWCNNLayer* 
layer, MWTargetNetworkImpl* ntwk_impl, float GbdgxISzcqHOpzQEBrvP, const 
char* HhKGcPZwrclEFnIdWerH, const char* HoqiuUUuJnXGkfDodicJ, const char* 
IAlDgIFcchbwRGBSfVfA, const char* IIiwAtyrOtLzLWAUlTey, int 
eybNKlJCSDUvsznWynwK) : MWCNNLayerImpl(layer, ntwk_impl) , 
olKGEIcsxmLSoMhRhEtP(NULL) , fYaOQTeunPwVjnhhTECh(NULL) , tGsvtyAVkrDznETdweDC(NULL) 
, tiuPuNpHUkyfgdeGvHSN(NULL) , PQjbchiGbyJfmpiqPpOC(GbdgxISzcqHOpzQEBrvP) 
, cwCXkgHfZmFQRzNVUlCO(eybNKlJCSDUvsznWynwK) { 
CUDNN_CALL(cudnnCreateTensorDescriptor(&KHClOltUSuqFVVErSxVb)); 
createAndAddDescriptor(getLayer()->getOutputTensor(0)->getSourcePortIndex()); 
const size_t numBytes = sizeof(float) * cwCXkgHfZmFQRzNVUlCO; 
CUDA_CALL(cudaMalloc((void**)&olKGEIcsxmLSoMhRhEtP, numBytes)); 
CUDA_CALL(cudaMalloc((void**)&fYaOQTeunPwVjnhhTECh, numBytes)); 
CUDA_CALL(cudaMalloc((void**)&tGsvtyAVkrDznETdweDC, numBytes)); 
CUDA_CALL(cudaMalloc((void**)&tiuPuNpHUkyfgdeGvHSN, numBytes)); 
loadScale(HoqiuUUuJnXGkfDodicJ); loadOffset(HhKGcPZwrclEFnIdWerH); 
loadTrainedMean(IAlDgIFcchbwRGBSfVfA); 
loadTrainedVariance(IIiwAtyrOtLzLWAUlTey); } 
MWBatchNormalizationLayerImpl::~MWBatchNormalizationLayerImpl() { } void 
MWBatchNormalizationLayerImpl::propagateSize() { MWCNNLayer* BNLayer = 
getLayer(); MWTensorBase* ipTensor = BNLayer->getInputTensor(); MWTensorBase* 
opTensor = BNLayer->getOutputTensor(); cudnnTensorDescriptor_t* desc = 
getDescriptor(opTensor->getSourcePortIndex()); assert(desc); 
setDescriptor<float>(*desc, static_cast<MWTensor<float>*>(opTensor)); 
bQjijJlpNAVdwDDQgpaX = CUDNN_BATCHNORM_SPATIAL; 
CUDNN_CALL(cudnnDeriveBNTensorDescriptor(KHClOltUSuqFVVErSxVb, *desc, 
bQjijJlpNAVdwDDQgpaX)); } void MWBatchNormalizationLayerImpl::iLoadParamOntoGPU(char 
const* const PtRNGuserCxHAQfyEjFc, int const dMxIKDGTITyhdLqIHBLA, float* 
QwUuNuQNtlPXrIwRNiSZ) { FILE* QMgBqCuvjnbWHWiVPEwn = 
MWCNNLayer::openBinaryFile(PtRNGuserCxHAQfyEjFc); assert(QMgBqCuvjnbWHWiVPEwn); int 
const LHIWBuIwgwCuuNBzenxH = sizeof(float) * dMxIKDGTITyhdLqIHBLA; float* 
KHjdvykTFbUxdfZTFbqy = (float*)malloc(LHIWBuIwgwCuuNBzenxH); 
fread(KHjdvykTFbUxdfZTFbqy, sizeof(float), dMxIKDGTITyhdLqIHBLA, QMgBqCuvjnbWHWiVPEwn); 
fclose(QMgBqCuvjnbWHWiVPEwn); CUDA_CALL(cudaMemcpy(QwUuNuQNtlPXrIwRNiSZ, 
KHjdvykTFbUxdfZTFbqy, LHIWBuIwgwCuuNBzenxH, cudaMemcpyHostToDevice)); 
free(KHjdvykTFbUxdfZTFbqy); } void MWBatchNormalizationLayerImpl::loadScale(const 
char* PtRNGuserCxHAQfyEjFc) { iLoadParamOntoGPU(PtRNGuserCxHAQfyEjFc, 
cwCXkgHfZmFQRzNVUlCO, olKGEIcsxmLSoMhRhEtP); } void 
MWBatchNormalizationLayerImpl::loadOffset(const char* PtRNGuserCxHAQfyEjFc) { 
iLoadParamOntoGPU(PtRNGuserCxHAQfyEjFc, cwCXkgHfZmFQRzNVUlCO, 
fYaOQTeunPwVjnhhTECh); } void MWBatchNormalizationLayerImpl::loadTrainedMean(const 
char* PtRNGuserCxHAQfyEjFc) { iLoadParamOntoGPU(PtRNGuserCxHAQfyEjFc, 
cwCXkgHfZmFQRzNVUlCO, tGsvtyAVkrDznETdweDC); } void 
MWBatchNormalizationLayerImpl::loadTrainedVariance(const char* 
PtRNGuserCxHAQfyEjFc) { iLoadParamOntoGPU(PtRNGuserCxHAQfyEjFc, 
cwCXkgHfZmFQRzNVUlCO, tiuPuNpHUkyfgdeGvHSN); } void 
MWBatchNormalizationLayerImpl::setLearnables(std::vector<float*> learnables) { 
assert(learnables.size() == 2); float* gCYwEfkibolsgZAumsuW = learnables[0]; 
CUDA_CALL(cudaMemcpy(fYaOQTeunPwVjnhhTECh, gCYwEfkibolsgZAumsuW, sizeof(float) * 
cwCXkgHfZmFQRzNVUlCO, cudaMemcpyHostToDevice)); float* omxlPZbBePZdWaJOBUUG = 
learnables[1]; CUDA_CALL(cudaMemcpy(olKGEIcsxmLSoMhRhEtP, omxlPZbBePZdWaJOBUUG, 
sizeof(float) * cwCXkgHfZmFQRzNVUlCO, cudaMemcpyHostToDevice)); } void 
MWBatchNormalizationLayerImpl::predict() { MWCNNLayer* BNLayer = getLayer(); 
MWTensorBase* ipTensorBase = BNLayer->getInputTensor(); MWTensorBase* 
opTensorBase = BNLayer->getOutputTensor(); MWTensor<float>* ipTensor = 
static_cast<MWTensor<float>*>(ipTensorBase); MWTensor<float>* opTensor = 
static_cast<MWTensor<float>*>(opTensorBase); const cudnnTensorDescriptor_t 
TaAJDyqFVJXfAfCJhOuU = MWCNNLayerImpl::getCuDNNDescriptor(ipTensorBase); float* 
TbrNrGxaFFHrzKUcfHNZ = ipTensor->getData(); cudnnTensorDescriptor_t* desc = 
getDescriptor(opTensor->getSourcePortIndex()); assert(desc); 
cudnnTensorDescriptor_t jLmklYtHcmTxayQTpmRw = *desc; float* jLyhrFjMmVnNjoeDJCwH = 
opTensor->getData(); CUDNN_CALL(cudnnBatchNormalizationForwardInference( 
*cQBKlCKXxecGPJrXBXdk->getCudnnHandle(), bQjijJlpNAVdwDDQgpaX, getOnePtr(), 
getZeroPtr(),  TaAJDyqFVJXfAfCJhOuU, TbrNrGxaFFHrzKUcfHNZ, jLmklYtHcmTxayQTpmRw, 
jLyhrFjMmVnNjoeDJCwH, KHClOltUSuqFVVErSxVb, olKGEIcsxmLSoMhRhEtP, 
fYaOQTeunPwVjnhhTECh, tGsvtyAVkrDznETdweDC, tiuPuNpHUkyfgdeGvHSN, 
PQjbchiGbyJfmpiqPpOC)); } void MWBatchNormalizationLayerImpl::cleanup() { 
CUDNN_CALL(cudnnDestroyTensorDescriptor(KHClOltUSuqFVVErSxVb)); if 
(olKGEIcsxmLSoMhRhEtP) { CUDA_FREE_CALL(olKGEIcsxmLSoMhRhEtP); olKGEIcsxmLSoMhRhEtP = NULL; 
} if (fYaOQTeunPwVjnhhTECh) { CUDA_FREE_CALL(fYaOQTeunPwVjnhhTECh); fYaOQTeunPwVjnhhTECh 
= NULL; } if (tGsvtyAVkrDznETdweDC) { CUDA_FREE_CALL(tGsvtyAVkrDznETdweDC); 
tGsvtyAVkrDznETdweDC = NULL; } if (tiuPuNpHUkyfgdeGvHSN) { 
CUDA_FREE_CALL(tiuPuNpHUkyfgdeGvHSN); tiuPuNpHUkyfgdeGvHSN = NULL; 
} } } 