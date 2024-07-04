#include "MWCudnnCommonHeaders.hpp"
#include "MWCudnnMaxPoolingLayerImpl.hpp"
#include <cmath>
 namespace MWCudnnTarget { void __global__ MWSetDyForBackPropImpl(float* 
OwortPcLToImGdYFtbSF, const int eqOmMKQRpqBqRQCnJmxt); void __global__ 
doMWMaxPoolingLayerImpl(float* URgvgDXnZskIYGdtimcU, float* 
UKtMXCCqdjeyaVHabkxg, const int BNrGqqHwfmYKIqbDbnjx); 
MWMaxPoolingLayerImpl::MWMaxPoolingLayerImpl(MWCNNLayer* layer, 
MWTargetNetworkImpl* ntwk_impl, int DCdZnqpcBnvXVgEsLBnz, int 
DqxLTLaJwwgQqmrtCDuu, int FLuSVNoPhAFKtLUchSvv, int FeVcBgtQmTLtmnNcJGMY, 
int CLOUhPjbgggWoXHTtmjC, int CGbFsczkgkhjcHoCKzBx, int 
ClEhcJFlvGCgiavziIag, int CpMjJjtGOeWOzwxpAAQP, bool 
FwLnexHgxHRquTKmNpoa, int eqUIJyhXTwRqtPfXapcx) : MWCNNLayerImpl(layer, 
ntwk_impl) , BHuHNDGoRwGRouCxeMbw(FwLnexHgxHRquTKmNpoa) , 
URgvgDXnZskIYGdtimcU(0) , OwortPcLToImGdYFtbSF(0) , 
CufLFODQDXTAPyRqYodN(DCdZnqpcBnvXVgEsLBnz) , 
DSsxcjIrUgZCKZovyNQf(DqxLTLaJwwgQqmrtCDuu) , 
CqtPRJvHlGJFssiPzsOm(DCdZnqpcBnvXVgEsLBnz) , 
DRzwhbNPpftRRIXXfHzd(DqxLTLaJwwgQqmrtCDuu) , 
CDJtexcMbXMWAmnNZsNf(CLOUhPjbgggWoXHTtmjC) , 
CCKWXUFWgrbBMjwfpOBN(CGbFsczkgkhjcHoCKzBx) , 
CTCbzQMDaLxINPbODdng(ClEhcJFlvGCgiavziIag) , 
CZNYmBcNFSZWvaCklqeM(CpMjJjtGOeWOzwxpAAQP) , 
EvebzoroiuKkIxwjkGnD(FLuSVNoPhAFKtLUchSvv) , 
FOcStuqCptsGIZXskVpC(FeVcBgtQmTLtmnNcJGMY) , 
puSFZkRJmyuFPfQRswDK(std::pow(2.0f, 
static_cast<float>(layer->getScalingExponent()))) , 
vFNECEAeLZsYsUxvlgqL(std::string{"INT8x4"}.compare(layer->getAccelMode()) 
== 0) , etjQLJVQCaeAXRWYtqOl(eqUIJyhXTwRqtPfXapcx) { 
CUDNN_CALL(cudnnCreatePoolingDescriptor(&lHtftnmGBvlSSoGOXVui)); 
createAndAddDescriptor(getLayer()->getOutputTensor(0)->getSourcePortIndex()); 
CUDNN_CALL(cudnnCreateTensorDescriptor(&DGzdAcREJHGXjyRzNjJV)); } 
MWMaxPoolingLayerImpl::~MWMaxPoolingLayerImpl() { } void 
MWMaxPoolingLayerImpl::propagateSize() { MWTensorBase* ipTensorBase = 
getLayer()->getInputTensor(0); MWTensorBase* opTensorBase = 
getLayer()->getOutputTensor(0); if ((CufLFODQDXTAPyRqYodN == -1) && 
(DSsxcjIrUgZCKZovyNQf == -1)) { CqtPRJvHlGJFssiPzsOm = 
ipTensorBase->getHeight(); DRzwhbNPpftRRIXXfHzd = ipTensorBase->getWidth(); } int 
lWJYwWaFPmWNQDPrlqER = CDJtexcMbXMWAmnNZsNf; int 
lXJKIOEATumoVKStGbVy = CTCbzQMDaLxINPbODdng; 
CUDNN_CALL(cudnnSetPooling2dDescriptor( lHtftnmGBvlSSoGOXVui, CUDNN_POOLING_MAX, 
CUDNN_NOT_PROPAGATE_NAN, CqtPRJvHlGJFssiPzsOm, DRzwhbNPpftRRIXXfHzd, 
lWJYwWaFPmWNQDPrlqER, lXJKIOEATumoVKStGbVy, EvebzoroiuKkIxwjkGnD, 
FOcStuqCptsGIZXskVpC)); cudnnTensorDescriptor_t* desc = 
getDescriptor(opTensorBase->getSourcePortIndex()); assert(desc); if 
(ipTensorBase->isInt8()) { if (vFNECEAeLZsYsUxvlgqL) { 
CUDNN_CALL(cudnnSetTensor4dDescriptor(DGzdAcREJHGXjyRzNjJV, 
CUDNN_TENSOR_NCHW_VECT_C,  CUDNN_DATA_INT8x4,  ipTensorBase->getBatchSize(),  
ipTensorBase->getChannels(),  ipTensorBase->getHeight(),  
ipTensorBase->getWidth())  ); MWCNNLayerImpl::setDescriptorForINT8(*desc, 
static_cast<MWTensor<signed char>*>(opTensorBase), CUDNN_DATA_INT8x4, 
CUDNN_TENSOR_NCHW_VECT_C); } else { CUDNN_CALL(cudnnSetTensor4dDescriptor( 
DGzdAcREJHGXjyRzNjJV, CUDNN_TENSOR_NCHW, CUDNN_DATA_INT8, 
ipTensorBase->getBatchSize(), ipTensorBase->getChannels(), 
ipTensorBase->getHeight(), ipTensorBase->getWidth())); 
MWCNNLayerImpl::setDescriptorForINT8(*desc, static_cast<MWTensor<signed 
char>*>(opTensorBase), CUDNN_DATA_INT8, CUDNN_TENSOR_NCHW); } } else { 
setDescriptor<float>(*desc, static_cast<MWTensor<float>*>(opTensorBase)); } } 
void MWMaxPoolingLayerImpl::allocate() { MWCNNLayer* maxpoolLayer = getLayer(); 
MWTensorBase* ipTensor = maxpoolLayer->getInputTensor(0); MWTensorBase* 
opTensor = maxpoolLayer->getOutputTensor(0); if (BHuHNDGoRwGRouCxeMbw) { const 
int dJcdBfQQLhIAYHPxwQeg = ipTensor->getNumElements(); CUDA_CALL( 
cudaMalloc((void**)&URgvgDXnZskIYGdtimcU, sizeof(float) * 
dJcdBfQQLhIAYHPxwQeg)); const int eqOmMKQRpqBqRQCnJmxt = 
opTensor->getNumElements(); CUDA_CALL(cudaMalloc((void**)&OwortPcLToImGdYFtbSF, 
sizeof(float) * eqOmMKQRpqBqRQCnJmxt)); int shEncNmxJsMuJKwbrwok = 
(eqOmMKQRpqBqRQCnJmxt < 1024) ? eqOmMKQRpqBqRQCnJmxt : 1024; int 
KCudOrFMfgCzUPMcdePX = (eqOmMKQRpqBqRQCnJmxt + shEncNmxJsMuJKwbrwok - 
1) / shEncNmxJsMuJKwbrwok; 
MWSetDyForBackPropImpl<<<KCudOrFMfgCzUPMcdePX, 
shEncNmxJsMuJKwbrwok>>>( OwortPcLToImGdYFtbSF, eqOmMKQRpqBqRQCnJmxt); } } void 
MWMaxPoolingLayerImpl::deallocate() { if (URgvgDXnZskIYGdtimcU) { 
CUDA_FREE_CALL(URgvgDXnZskIYGdtimcU); URgvgDXnZskIYGdtimcU = 
NULL; } if (OwortPcLToImGdYFtbSF) { CUDA_FREE_CALL(OwortPcLToImGdYFtbSF); OwortPcLToImGdYFtbSF = 
NULL; } } void MWMaxPoolingLayerImpl::predict() { MWCNNLayer* maxpoolLayer = 
getLayer(); MWTensorBase* ipTensorBase = maxpoolLayer->getInputTensor(0); 
MWTensorBase* opTensorBase = maxpoolLayer->getOutputTensor(0); 
cudnnTensorDescriptor_t* desc = 
getDescriptor(opTensorBase->getSourcePortIndex()); assert(desc); 
cudnnTensorDescriptor_t XYbzSmRQGatVJtGmDZSo; if (opTensorBase->isInt8()) { 
XYbzSmRQGatVJtGmDZSo = DGzdAcREJHGXjyRzNjJV; MWTensor<signed char>* ipTensor = 
static_cast<MWTensor<signed char>*>(ipTensorBase); MWTensor<signed char>* 
opTensor = static_cast<MWTensor<signed char>*>(opTensorBase); 
CUDNN_CALL(cudnnPoolingForward(*cQBKlCKXxecGPJrXBXdk->getCudnnHandle(), 
lHtftnmGBvlSSoGOXVui, &puSFZkRJmyuFPfQRswDK, XYbzSmRQGatVJtGmDZSo, 
ipTensor->getData(), getZeroPtr(), *desc, opTensor->getData())); } else { 
XYbzSmRQGatVJtGmDZSo = MWCNNLayerImpl::getCuDNNDescriptor(ipTensorBase); 
MWTensor<float>* ipTensor = static_cast<MWTensor<float>*>(ipTensorBase); 
MWTensor<float>* opTensor = static_cast<MWTensor<float>*>(opTensorBase); 
CUDNN_CALL(cudnnPoolingForward(*cQBKlCKXxecGPJrXBXdk->getCudnnHandle(), 
lHtftnmGBvlSSoGOXVui, getOnePtr(), XYbzSmRQGatVJtGmDZSo, ipTensor->getData(), 
getZeroPtr(), *desc, opTensor->getData())); if (BHuHNDGoRwGRouCxeMbw) { 
CUDNN_CALL(cudnnPoolingBackward( *cQBKlCKXxecGPJrXBXdk->getCudnnHandle(), 
lHtftnmGBvlSSoGOXVui, getOnePtr(), *desc, opTensor->getData(), *desc, 
OwortPcLToImGdYFtbSF, XYbzSmRQGatVJtGmDZSo, ipTensor->getData(), getZeroPtr(), 
XYbzSmRQGatVJtGmDZSo, URgvgDXnZskIYGdtimcU)); int dJcdBfQQLhIAYHPxwQeg = 
ipTensor->getNumElements(); int shEncNmxJsMuJKwbrwok = 
(dJcdBfQQLhIAYHPxwQeg < 1024) ? dJcdBfQQLhIAYHPxwQeg : 1024; int 
KCudOrFMfgCzUPMcdePX = (dJcdBfQQLhIAYHPxwQeg + shEncNmxJsMuJKwbrwok - 
1) / shEncNmxJsMuJKwbrwok; 
doMWMaxPoolingLayerImpl<<<KCudOrFMfgCzUPMcdePX, 
shEncNmxJsMuJKwbrwok>>>( URgvgDXnZskIYGdtimcU, 
static_cast<MWTensor<float>*>(maxpoolLayer->getOutputTensor(1))->getData(), 
dJcdBfQQLhIAYHPxwQeg); } } return; } void MWMaxPoolingLayerImpl::cleanup() { 
CUDNN_CALL(cudnnDestroyPoolingDescriptor(lHtftnmGBvlSSoGOXVui)); MWTensorBase* 
opTensorBase = getLayer()->getOutputTensor(0); if (opTensorBase->isInt8()) { 
CUDNN_CALL(cudnnDestroyTensorDescriptor(DGzdAcREJHGXjyRzNjJV)); } } float* 
MWMaxPoolingLayerImpl::getIndexData() { return 
static_cast<MWTensor<float>*>(getLayer()->getOutputTensor(1))->getData(); } 
void __global__ __launch_bounds__(1024) MWSetDyForBackPropImpl(float* 
OwortPcLToImGdYFtbSF, const int eqOmMKQRpqBqRQCnJmxt) { for (int i = blockDim.x * 
blockIdx.x + threadIdx.x; i < eqOmMKQRpqBqRQCnJmxt; i += blockDim.x * 
gridDim.x) { OwortPcLToImGdYFtbSF[i] = i + 1; } } void __global__ 
__launch_bounds__(1024) doMWMaxPoolingLayerImpl(float* 
URgvgDXnZskIYGdtimcU, float* UKtMXCCqdjeyaVHabkxg, const int 
BNrGqqHwfmYKIqbDbnjx) { for (int i = blockDim.x * blockIdx.x + threadIdx.x; i < 
BNrGqqHwfmYKIqbDbnjx; i += blockDim.x * gridDim.x) { if 
(static_cast<int>(URgvgDXnZskIYGdtimcU[i]) != 0) { 
UKtMXCCqdjeyaVHabkxg[static_cast<int>(URgvgDXnZskIYGdtimcU[i]) - 1] = 
i; } } } } 