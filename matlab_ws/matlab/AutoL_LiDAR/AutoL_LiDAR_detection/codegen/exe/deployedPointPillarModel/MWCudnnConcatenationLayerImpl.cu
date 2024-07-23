#ifdef PRECOMPILE_LAYERFILES
#include "layer/MWCNNLayer.hpp"
#include "layer/MWTensorBase.hpp"
#include "layer/MWTensor.hpp"
#else
#include "MWCNNLayer.hpp"
#include "MWTensorBase.hpp"
#include "MWTensor.hpp"
#endif
#include "MWCudnnCNNLayerImpl.hpp"
#include "MWCudnnConcatenationLayerImpl.hpp"
#include <cstdarg>
#include <cassert>
 namespace MWCudnnTarget { class MWTargetNetworkImpl; 
MWConcatenationLayerImpl::MWConcatenationLayerImpl(MWCNNLayer* layer, 
MWTargetNetworkImpl* ntwk_impl, int dimension) : MWCNNLayerImpl(layer, 
ntwk_impl) , OPnUFarBGxQhYRrGpeBQ(dimension) { } 
MWConcatenationLayerImpl::~MWConcatenationLayerImpl() { } void 
MWConcatenationLayerImpl::propagateSize() { } void __global__ 
__launch_bounds__(1024) concatHeightImpl(float* in, float* out, double W,  
double WH,  double WHC,  double WHCN,  double WHCNS,  double W_totalH,  double 
W_totalH_C,  double W_totalH_CN,  double accumulatedH) { long int i = 
blockDim.x * blockIdx.x + threadIdx.x; if (i < WHCNS) { double sequenceIdx = 
floor(i / WHCN); double i_sequence = i - (sequenceIdx * WHCN); double batchIdx 
= floor(i_sequence / WHC); double i_batch = i_sequence - (batchIdx * WHC); 
double channelIdx = floor(i_batch / WH); double i_channel = i_batch - 
(channelIdx * WH); double heightIdx = floor(i_channel / W); double widthIdx = 
i_channel - (heightIdx * W); long int outIdx = sequenceIdx * W_totalH_CN + 
batchIdx * W_totalH_C + channelIdx * W_totalH + (heightIdx + accumulatedH) * W 
+ widthIdx; out[outIdx] = in[i]; } } void __global__ __launch_bounds__(1024) 
concatWidthImpl(float* in, float* out, double W,  double WH,  double WHC,  
double WHCN,  double WHCNS,  double totalW,  double totalW_H,  double 
totalW_HC,  double totalW_HCN,  double accumulatedW) { long int i = blockDim.x 
* blockIdx.x + threadIdx.x; if (i < WHCNS) { double sequenceIdx = floor(i / 
WHCN); double i_sequence = i - (sequenceIdx * WHCN); double batchIdx = 
floor(i_sequence / WHC); double i_batch = i_sequence - (batchIdx * WHC); double 
channelIdx = floor(i_batch / WH); double i_channel = i_batch - (channelIdx * 
WH); double heightIdx = floor(i_channel / W); double widthIdx = i_channel - 
(heightIdx * W); long int outIdx = sequenceIdx * totalW_HCN + batchIdx * 
totalW_HC + channelIdx * totalW_H + heightIdx * totalW + (widthIdx + 
accumulatedW); out[outIdx] = in[i]; } } void __global__ __launch_bounds__(1024) 
concatChannelImpl(float* in, float* out, double WH,  double WHC,  double WHCN,  
double WHCNS,  double WH_totalC,  double WH_totalC_N,  double accumulatedC) { 
long int i = blockDim.x * blockIdx.x + threadIdx.x; if (i < WHCNS) { double 
sequenceIdx = floor(i / WHCN); double i_sequence = i - (sequenceIdx * WHCN); 
double batchIdx = floor(i_sequence / WHC); double i_batch = i_sequence - 
(batchIdx * WHC); double channelIdx = floor(i_batch / WH); double i_channel = 
i_batch - (channelIdx * WH); long int outIdx = sequenceIdx * WH_totalC_N + 
batchIdx * WH_totalC + (channelIdx + accumulatedC) * WH + i_channel; 
out[outIdx] = in[i]; } } void MWConcatenationLayerImpl::predict() { MWCNNLayer* 
concatLayer = getLayer(); MWTensorBase* opTensorBase = 
concatLayer->getOutputTensor(0); MWTensor<float>* opTensor = 
static_cast<MWTensor<float>*>(opTensorBase); int accumulatedH = 0; int 
accumulatedW = 0; int accumulatedC = 0; long int accumulatedElements = 0; int 
KCudOrFMfgCzUPMcdePX = 0; int shEncNmxJsMuJKwbrwok = 0; for (int k = 
0; k < static_cast<int>(concatLayer->getNumInputs()); k++) { MWTensorBase* 
ipTensorBase = concatLayer->getInputTensor(k); MWTensor<float>* ipTensor = 
static_cast<MWTensor<float>*>(ipTensorBase); switch (OPnUFarBGxQhYRrGpeBQ) { 
case 1:  { if ((ipTensor->getBatchSize() == 1 && ipTensor->getSequenceLength() 
== 1) && ipTensor->getChannels() == 1) { cudaMemcpy(opTensor->getData() + 
accumulatedElements, ipTensor->getData(), ipTensor->getNumElements() * 
sizeof(float), cudaMemcpyDeviceToDevice); accumulatedElements += (long 
int)ipTensor->getNumElements(); } else { double W = ipTensor->getWidth(); 
double WH = W * ipTensor->getHeight(); double WHC = WH * 
ipTensor->getChannels(); double WHCN = WHC * ipTensor->getBatchSize(); double 
WHCNS = WHCN * ipTensor->getSequenceLength(); double W_totalH = W * 
opTensor->getHeight(); double W_totalH_C = W_totalH * ipTensor->getChannels(); 
double W_totalH_CN = W_totalH_C * ipTensor->getBatchSize(); 
prepareKernelInputs(KCudOrFMfgCzUPMcdePX, shEncNmxJsMuJKwbrwok, 
ipTensor->getNumElements()); concatHeightImpl<<<KCudOrFMfgCzUPMcdePX, 
shEncNmxJsMuJKwbrwok>>>( ipTensor->getData(), opTensor->getData(), W, WH, 
WHC, WHCN, WHCNS, W_totalH, W_totalH_C, W_totalH_CN, accumulatedH); 
accumulatedH += ipTensor->getHeight(); } } break; case 2:  { if 
(((ipTensor->getBatchSize() == 1 && ipTensor->getSequenceLength() == 1) && 
ipTensor->getChannels() == 1) && ipTensor->getHeight() == 1) { 
cudaMemcpy(opTensor->getData() + accumulatedElements, ipTensor->getData(), 
ipTensor->getNumElements() * sizeof(float), cudaMemcpyDeviceToDevice); 
accumulatedElements += (long int)ipTensor->getNumElements(); } else { double W 
= ipTensor->getWidth(); double WH = W * ipTensor->getHeight(); double WHC = WH 
* ipTensor->getChannels(); double WHCN = WHC * ipTensor->getBatchSize(); double 
WHCNS = WHCN * ipTensor->getSequenceLength(); double totalW = 
opTensor->getWidth(); double totalW_H = totalW * ipTensor->getHeight(); double 
totalW_HC = totalW_H * ipTensor->getChannels(); double totalW_HCN = totalW_HC * 
ipTensor->getBatchSize(); prepareKernelInputs(KCudOrFMfgCzUPMcdePX, 
shEncNmxJsMuJKwbrwok, ipTensor->getNumElements()); 
concatWidthImpl<<<KCudOrFMfgCzUPMcdePX, shEncNmxJsMuJKwbrwok>>>( 
ipTensor->getData(), opTensor->getData(), W, WH, WHC, WHCN, WHCNS, totalW, 
totalW_H, totalW_HC, totalW_HCN, accumulatedW); accumulatedW += 
ipTensor->getWidth(); } } break; case 3:  { if (ipTensor->getBatchSize() == 1 
&& ipTensor->getSequenceLength() == 1) { cudaMemcpy(opTensor->getData() + 
accumulatedElements, ipTensor->getData(), ipTensor->getNumElements() * 
sizeof(float), cudaMemcpyDeviceToDevice); accumulatedElements += (long 
int)ipTensor->getNumElements(); } else { double WH = ipTensor->getWidth() * 
ipTensor->getHeight(); double WHC = WH * ipTensor->getChannels(); double WHCN = 
WHC * ipTensor->getBatchSize(); double WHCNS = WHCN * 
ipTensor->getSequenceLength(); double WH_totalC = WH * opTensor->getChannels(); 
double WH_totalC_N = WH_totalC * ipTensor->getBatchSize(); 
prepareKernelInputs(KCudOrFMfgCzUPMcdePX, shEncNmxJsMuJKwbrwok, 
ipTensor->getNumElements()); concatChannelImpl<<<KCudOrFMfgCzUPMcdePX, 
shEncNmxJsMuJKwbrwok>>>( ipTensor->getData(), opTensor->getData(), WH, 
WHC, WHCN, WHCNS, WH_totalC, WH_totalC_N, accumulatedC); accumulatedC += 
ipTensor->getChannels(); } } break; default: assert((OPnUFarBGxQhYRrGpeBQ == 1 
|| OPnUFarBGxQhYRrGpeBQ == 2) || OPnUFarBGxQhYRrGpeBQ == 3); } } } void 
MWConcatenationLayerImpl::prepareKernelInputs(int& KCudOrFMfgCzUPMcdePX, 
int& shEncNmxJsMuJKwbrwok, int dJcdBfQQLhIAYHPxwQeg) { const int 
threadsPerWarp = 32; shEncNmxJsMuJKwbrwok = ((dJcdBfQQLhIAYHPxwQeg + 
threadsPerWarp - 1)/threadsPerWarp) * threadsPerWarp; 
shEncNmxJsMuJKwbrwok = (shEncNmxJsMuJKwbrwok < 1024) ? 
shEncNmxJsMuJKwbrwok : 1024; KCudOrFMfgCzUPMcdePX = 
(dJcdBfQQLhIAYHPxwQeg + shEncNmxJsMuJKwbrwok - 1) / 
shEncNmxJsMuJKwbrwok; } void MWConcatenationLayerImpl::cleanup() { } } 