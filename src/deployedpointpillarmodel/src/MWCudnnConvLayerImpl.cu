#include "MWCudnnCommonHeaders.hpp"
#include "MWCudnnConvLayerImpl.hpp"
#include <cassert>
#include <cstdio>
#include <vector>
 namespace MWCudnnTarget { MWConvLayerImpl::MWConvLayerImpl(MWCNNLayer* layer, 
MWTargetNetworkImpl* ntwk_impl, int filt_H, int filt_W, int numGrps, int 
numChnls, int numFilts, int FLuSVNoPhAFKtLUchSvv, int 
FeVcBgtQmTLtmnNcJGMY, int CLOUhPjbgggWoXHTtmjC, int 
CGbFsczkgkhjcHoCKzBx, int ClEhcJFlvGCgiavziIag, int 
CpMjJjtGOeWOzwxpAAQP, int AdmgfUbRAfzFeYHxSnQr, int 
AuqaQHxmPQSyYRemQvyX, const char* xHViLEwTujGGrPZZgmbF, const 
char* JwxFdqOKggeawILBfGgg) : MWCNNLayerImpl(layer, ntwk_impl) , 
vIWQzNvYZSuxmOTVDFhU(NULL) , IpFhwalnAlrMvcuyQpQD(NULL) , SugesRlPIbOVzRgNWRnl(NULL) , 
AwZQzUhuWVLGrWgLHRuM(filt_H) , AzTsxYcYjIEJsGQbeYHm(filt_W) , 
BdqURaHPmdnfzvtUvocl(numGrps) , BRSPqxNffoBYKqpSVHne(numChnls) , 
BUOdotSvmFyUWQKMUdra(numFilts) , 
AVeZfqOFypgpiqfRYlKc(AdmgfUbRAfzFeYHxSnQr) , 
AjhVZuQXURJimwbnYqDF(AuqaQHxmPQSyYRemQvyX) , 
CDJtexcMbXMWAmnNZsNf(CLOUhPjbgggWoXHTtmjC) , 
CCKWXUFWgrbBMjwfpOBN(CGbFsczkgkhjcHoCKzBx) , 
CTCbzQMDaLxINPbODdng(ClEhcJFlvGCgiavziIag) , 
CZNYmBcNFSZWvaCklqeM(CpMjJjtGOeWOzwxpAAQP) , 
EvebzoroiuKkIxwjkGnD(FLuSVNoPhAFKtLUchSvv) , 
FOcStuqCptsGIZXskVpC(FeVcBgtQmTLtmnNcJGMY) , 
HtQBsWTCGEkpylRklilw((CDJtexcMbXMWAmnNZsNf != CCKWXUFWgrbBMjwfpOBN) 
|| (CTCbzQMDaLxINPbODdng != CZNYmBcNFSZWvaCklqeM)) { cQBKlCKXxecGPJrXBXdk = 
ntwk_impl; CUDNN_CALL(cudnnCreateConvolutionDescriptor(&NGqpeiLeVweDRsOKEtuw)); 
CUDNN_CALL(cudnnCreateFilterDescriptor(&PtkeOkuClHzhOfpmBevf)); 
CUDNN_CALL(cudnnCreateTensorDescriptor(&JgLfgHrHMEMmMYTettJF)); MWCNNLayer* 
convLayer = getLayer(); MWTensorBase* ipTensor = convLayer->getInputTensor(0); 
if (HtQBsWTCGEkpylRklilw) { SugesRlPIbOVzRgNWRnl = new MWTensor<float>(-1, 
-1, -1, -1, -1, NULL, getLayer(), ipTensor->getDataFormat(), 0); if 
(!SugesRlPIbOVzRgNWRnl) { MWCNNLayerImpl::throwAllocationError(__LINE__, __FILE__); } 
CUDNN_CALL(cudnnCreateTensorDescriptor(&XYbzSmRQGatVJtGmDZSo)); } else { 
SugesRlPIbOVzRgNWRnl = ipTensor; } assert(SugesRlPIbOVzRgNWRnl != NULL); int 
NMMfJylfQjiIUAKhXCJb; int NNhshzQGJHLSGjDiVerE; if 
(HtQBsWTCGEkpylRklilw) { NMMfJylfQjiIUAKhXCJb = 0; 
NNhshzQGJHLSGjDiVerE = 0; } else { NMMfJylfQjiIUAKhXCJb = 
CDJtexcMbXMWAmnNZsNf; NNhshzQGJHLSGjDiVerE = CTCbzQMDaLxINPbODdng; } 
bERCRkGjpaKXMNComoYl = CDJtexcMbXMWAmnNZsNf; bOrQjJTNlssnrexxbHdi = CTCbzQMDaLxINPbODdng;
#if (CUDNN_MAJOR <= 5)
 { if ((AVeZfqOFypgpiqfRYlKc != 1) && (AjhVZuQXURJimwbnYqDF != 1)) 
{ printf("Dilated Convolution only supported for cuDNN 6 or greater "); throw 
std::runtime_error("Unsupported Dilation Factor"); } 
CUDNN_CALL(cudnnSetConvolution2dDescriptor( NGqpeiLeVweDRsOKEtuw, 
NMMfJylfQjiIUAKhXCJb, NNhshzQGJHLSGjDiVerE, EvebzoroiuKkIxwjkGnD, 
FOcStuqCptsGIZXskVpC, 1, 1, CUDNN_CROSS_CORRELATION));  }
#else
 { CUDNN_CALL(cudnnSetConvolution2dDescriptor( NGqpeiLeVweDRsOKEtuw, 
NMMfJylfQjiIUAKhXCJb, NNhshzQGJHLSGjDiVerE, EvebzoroiuKkIxwjkGnD, 
FOcStuqCptsGIZXskVpC, AVeZfqOFypgpiqfRYlKc, AjhVZuQXURJimwbnYqDF, 
CUDNN_CROSS_CORRELATION, CUDNN_DATA_FLOAT)); }
#endif
#if (FP16_ENABLED == 1 && (CUDNN_MAJOR > 7 || (CUDNN_MAJOR == 7 && CUDNN_MINOR >= 2)))
 CUDNN_CALL( cudnnSetConvolutionMathType(NGqpeiLeVweDRsOKEtuw, CUDNN_TENSOR_OP_MATH_ALLOW_CONVERSION));
#endif
 if (BdqURaHPmdnfzvtUvocl > 1) { 
CUDNN_CALL(cudnnSetConvolutionGroupCount(NGqpeiLeVweDRsOKEtuw, 
BdqURaHPmdnfzvtUvocl)); } int eWYFXrUazhqiEIscccda = 
BRSPqxNffoBYKqpSVHne * BdqURaHPmdnfzvtUvocl; int eqmVWbEcwBRGnVNDUtrG 
= BUOdotSvmFyUWQKMUdra * BdqURaHPmdnfzvtUvocl; 
CUDNN_CALL(cudnnSetFilter4dDescriptor(PtkeOkuClHzhOfpmBevf, CUDNN_DATA_FLOAT, 
CUDNN_TENSOR_NCHW, eqmVWbEcwBRGnVNDUtrG, eWYFXrUazhqiEIscccda / 
BdqURaHPmdnfzvtUvocl, AwZQzUhuWVLGrWgLHRuM, AzTsxYcYjIEJsGQbeYHm)); 
CUDNN_CALL(cudnnSetTensor4dDescriptor(JgLfgHrHMEMmMYTettJF, CUDNN_TENSOR_NCHW, 
CUDNN_DATA_FLOAT, 1, eqmVWbEcwBRGnVNDUtrG, 1, 1)); int weightSize = 
BRSPqxNffoBYKqpSVHne * eqmVWbEcwBRGnVNDUtrG * AwZQzUhuWVLGrWgLHRuM 
* AzTsxYcYjIEJsGQbeYHm; CUDA_CALL(cudaMalloc((void**)&vIWQzNvYZSuxmOTVDFhU, 
sizeof(float) * weightSize)); CUDA_CALL(cudaMalloc((void**)&IpFhwalnAlrMvcuyQpQD, 
sizeof(float) * eqmVWbEcwBRGnVNDUtrG)); 
loadWeights(xHViLEwTujGGrPZZgmbF); loadBias(JwxFdqOKggeawILBfGgg); 
createAndAddDescriptor(getLayer()->getOutputTensor()->getSourcePortIndex()); } 
void MWConvLayerImpl::propagateSize() { MWTensorBase* ipTensor = 
getLayer()->getInputTensor(0); int inputH; int inputW; if 
(HtQBsWTCGEkpylRklilw) { inputH = ipTensor->getHeight() + 
CDJtexcMbXMWAmnNZsNf + CCKWXUFWgrbBMjwfpOBN; inputW = ipTensor->getWidth() + 
CTCbzQMDaLxINPbODdng + CZNYmBcNFSZWvaCklqeM; } else { inputH = 
ipTensor->getHeight(); inputW = ipTensor->getWidth(); } 
SugesRlPIbOVzRgNWRnl->setHeight(inputH); SugesRlPIbOVzRgNWRnl->setWidth(inputW); 
SugesRlPIbOVzRgNWRnl->setChannels(ipTensor->getChannels()); 
SugesRlPIbOVzRgNWRnl->setBatchSize(ipTensor->getBatchSize()); 
SugesRlPIbOVzRgNWRnl->setSequenceLength(ipTensor->getSequenceLength()); 
assert(SugesRlPIbOVzRgNWRnl->getSequenceLength() == 1); if 
(HtQBsWTCGEkpylRklilw) { CUDNN_CALL(cudnnSetTensor4dDescriptor( 
XYbzSmRQGatVJtGmDZSo, CUDNN_TENSOR_NCHW, CUDNN_DATA_FLOAT, 
SugesRlPIbOVzRgNWRnl->getBatchSize(), SugesRlPIbOVzRgNWRnl->getChannels(), 
SugesRlPIbOVzRgNWRnl->getHeight(), SugesRlPIbOVzRgNWRnl->getWidth())); } else { 
XYbzSmRQGatVJtGmDZSo = MWCNNLayerImpl::getCuDNNDescriptor(SugesRlPIbOVzRgNWRnl); } 
MWTensorBase* opTensor = getLayer()->getOutputTensor(0); 
cudnnTensorDescriptor_t* desc = getDescriptor(opTensor->getSourcePortIndex()); 
assert(desc); setDescriptor<float>(*desc, static_cast<MWTensor<float>*>(opTensor));
#if (CUDNN_MAJOR < 7)
 { CUDNN_CALL(cudnnGetConvolutionForwardAlgorithm( 
*cQBKlCKXxecGPJrXBXdk->getCudnnHandle(), XYbzSmRQGatVJtGmDZSo, 
PtkeOkuClHzhOfpmBevf, NGqpeiLeVweDRsOKEtuw, *desc, 
CUDNN_CONVOLUTION_FWD_PREFER_FASTEST, 0, &NDHPlSVpLroiIBRnjwyO)); }
#else
 { const int maxAlgoCount(3); int returnedAlgoCount(-1); 
cudnnConvolutionFwdAlgoPerf_t perf_results[maxAlgoCount]; 
CUDNN_CALL(cudnnGetConvolutionForwardAlgorithm_v7( 
*cQBKlCKXxecGPJrXBXdk->getCudnnHandle(), XYbzSmRQGatVJtGmDZSo, 
PtkeOkuClHzhOfpmBevf, NGqpeiLeVweDRsOKEtuw, *desc, maxAlgoCount, 
&returnedAlgoCount, perf_results)); NDHPlSVpLroiIBRnjwyO = perf_results[0].algo; }
#endif
 size_t sxuOMwKXOKfuExclRaSe = 0; 
CUDNN_CALL(cudnnGetConvolutionForwardWorkspaceSize( 
*cQBKlCKXxecGPJrXBXdk->getCudnnHandle(), XYbzSmRQGatVJtGmDZSo, 
PtkeOkuClHzhOfpmBevf, NGqpeiLeVweDRsOKEtuw, *desc, NDHPlSVpLroiIBRnjwyO, 
&sxuOMwKXOKfuExclRaSe)); if (sxuOMwKXOKfuExclRaSe > 
*cQBKlCKXxecGPJrXBXdk->getProposedWorkSpaceSize()) { 
cQBKlCKXxecGPJrXBXdk->setProposedWorkSpaceSize(sxuOMwKXOKfuExclRaSe); } } void 
MWConvLayerImpl::allocate() { MWTensorBase* ipTensor = 
getLayer()->getInputTensor(0); if (HtQBsWTCGEkpylRklilw) { float* 
newInput; int inputH = ipTensor->getHeight() + CDJtexcMbXMWAmnNZsNf + 
CCKWXUFWgrbBMjwfpOBN; int inputW = ipTensor->getWidth() + 
CTCbzQMDaLxINPbODdng + CZNYmBcNFSZWvaCklqeM; int paddedSize = 
ipTensor->getBatchSize() * ipTensor->getChannels() * inputH * inputW; 
CUDA_CALL(cudaMalloc((void**)&newInput, sizeof(float) * paddedSize)); 
CUDA_CALL(cudaMemset(newInput, 0, sizeof(float) * paddedSize)); 
static_cast<MWTensor<float>*>(SugesRlPIbOVzRgNWRnl)->setData(newInput); } } void 
MWConvLayerImpl::deallocate() { if (SugesRlPIbOVzRgNWRnl != 
getLayer()->getInputTensor(0)) { assert(HtQBsWTCGEkpylRklilw); 
CUDA_FREE_CALL(static_cast<MWTensor<float>*>(SugesRlPIbOVzRgNWRnl)->getData()); 
static_cast<MWTensor<float>*>(SugesRlPIbOVzRgNWRnl)->setData((float*)NULL); } } void 
MWConvLayerImpl::predict() { MWCNNLayer* convLayer = getLayer(); MWTensorBase* 
ipTensorBase = convLayer->getInputTensor(); MWTensorBase* opTensorBase = 
convLayer->getOutputTensor(); MWTensor<float>* ipTensor = 
static_cast<MWTensor<float>*>(ipTensorBase); MWTensor<float>* opTensor = 
static_cast<MWTensor<float>*>(opTensorBase); if (SugesRlPIbOVzRgNWRnl != 
convLayer->getInputTensor()) { 
CUDA_CALL(cudaMemset(static_cast<MWTensor<float>*>(SugesRlPIbOVzRgNWRnl)->getData(), 
0, sizeof(float) * SugesRlPIbOVzRgNWRnl->getNumElements())); MWCNNLayerImpl::padInput( 
ipTensor->getData(), ipTensor->getHeight(), ipTensor->getWidth(), 
ipTensor->getChannels(), SugesRlPIbOVzRgNWRnl->getHeight(), SugesRlPIbOVzRgNWRnl->getWidth(), 
bERCRkGjpaKXMNComoYl, bOrQjJTNlssnrexxbHdi, 
static_cast<MWTensor<float>*>(SugesRlPIbOVzRgNWRnl)->getData(), 
ipTensor->getNumElements()); } assert(opTensor->getData() != 
static_cast<MWTensor<float>*>(SugesRlPIbOVzRgNWRnl)->getData()); 
cudnnTensorDescriptor_t* desc = getDescriptor(opTensor->getSourcePortIndex()); 
assert(desc); CUDNN_CALL(cudnnConvolutionForward( 
*cQBKlCKXxecGPJrXBXdk->getCudnnHandle(), getOnePtr(), XYbzSmRQGatVJtGmDZSo, 
static_cast<MWTensor<float>*>(SugesRlPIbOVzRgNWRnl)->getData(), PtkeOkuClHzhOfpmBevf, 
vIWQzNvYZSuxmOTVDFhU, NGqpeiLeVweDRsOKEtuw, NDHPlSVpLroiIBRnjwyO, 
cQBKlCKXxecGPJrXBXdk->getWorkSpace(), 
*cQBKlCKXxecGPJrXBXdk->getAllocatedWorkSpaceSize(), getZeroPtr(), *desc, 
opTensor->getData())); 
CUDNN_CALL(cudnnAddTensor(*cQBKlCKXxecGPJrXBXdk->getCudnnHandle(), getOnePtr(), 
JgLfgHrHMEMmMYTettJF, IpFhwalnAlrMvcuyQpQD, getOnePtr(), *desc, opTensor->getData())); } 
void MWConvLayerImpl::cleanup() { 
CUDNN_CALL(cudnnDestroyConvolutionDescriptor(NGqpeiLeVweDRsOKEtuw)); 
CUDNN_CALL(cudnnDestroyFilterDescriptor(PtkeOkuClHzhOfpmBevf)); if 
(vIWQzNvYZSuxmOTVDFhU) { CUDA_FREE_CALL(vIWQzNvYZSuxmOTVDFhU); vIWQzNvYZSuxmOTVDFhU = NULL; } 
CUDNN_CALL(cudnnDestroyTensorDescriptor(JgLfgHrHMEMmMYTettJF)); if 
(IpFhwalnAlrMvcuyQpQD) { CUDA_FREE_CALL(IpFhwalnAlrMvcuyQpQD); IpFhwalnAlrMvcuyQpQD = NULL; } if 
(SugesRlPIbOVzRgNWRnl != getLayer()->getInputTensor(0)) { 
assert(HtQBsWTCGEkpylRklilw); 
CUDNN_CALL(cudnnDestroyTensorDescriptor(XYbzSmRQGatVJtGmDZSo)); } } void 
MWConvLayerImpl::loadWeights(const char* PmFfARVzoHVAYkfpuvqK) { FILE* 
QMgBqCuvjnbWHWiVPEwn = MWCNNLayer::openBinaryFile(PmFfARVzoHVAYkfpuvqK); 
assert(QMgBqCuvjnbWHWiVPEwn); int cRtIUoZRPICuQEOZOSzT = BRSPqxNffoBYKqpSVHne * 
BUOdotSvmFyUWQKMUdra * BdqURaHPmdnfzvtUvocl * AwZQzUhuWVLGrWgLHRuM * 
AzTsxYcYjIEJsGQbeYHm;  float* KHjdvykTFbUxdfZTFbqy = MALLOC_CALL(sizeof(float) * 
cRtIUoZRPICuQEOZOSzT); MWCNNLayer::call_fread(KHjdvykTFbUxdfZTFbqy, sizeof(float), 
cRtIUoZRPICuQEOZOSzT, QMgBqCuvjnbWHWiVPEwn, PmFfARVzoHVAYkfpuvqK); 
CUDA_CALL(cudaMemcpy(vIWQzNvYZSuxmOTVDFhU, KHjdvykTFbUxdfZTFbqy, sizeof(float) * 
cRtIUoZRPICuQEOZOSzT, cudaMemcpyHostToDevice)); fclose(QMgBqCuvjnbWHWiVPEwn); 
free(KHjdvykTFbUxdfZTFbqy); } void MWConvLayerImpl::loadBias(const char* 
PmFfARVzoHVAYkfpuvqK) { FILE* QMgBqCuvjnbWHWiVPEwn = 
MWCNNLayer::openBinaryFile(PmFfARVzoHVAYkfpuvqK); assert(QMgBqCuvjnbWHWiVPEwn); int 
cRtIUoZRPICuQEOZOSzT = BUOdotSvmFyUWQKMUdra * BdqURaHPmdnfzvtUvocl;  float* 
KHjdvykTFbUxdfZTFbqy = MALLOC_CALL(sizeof(float) * cRtIUoZRPICuQEOZOSzT); 
MWCNNLayer::call_fread(KHjdvykTFbUxdfZTFbqy, sizeof(float), cRtIUoZRPICuQEOZOSzT, 
QMgBqCuvjnbWHWiVPEwn, PmFfARVzoHVAYkfpuvqK); CUDA_CALL(cudaMemcpy(IpFhwalnAlrMvcuyQpQD, 
KHjdvykTFbUxdfZTFbqy, sizeof(float) * cRtIUoZRPICuQEOZOSzT, cudaMemcpyHostToDevice)); 
free(KHjdvykTFbUxdfZTFbqy); fclose(QMgBqCuvjnbWHWiVPEwn); } void 
MWConvLayerImpl::setLearnables(std::vector<float*> learnables) { 
assert(learnables.size() == 2); int cRtIUoZRPICuQEOZOSzT = BRSPqxNffoBYKqpSVHne * 
BUOdotSvmFyUWQKMUdra * BdqURaHPmdnfzvtUvocl * AwZQzUhuWVLGrWgLHRuM * 
AzTsxYcYjIEJsGQbeYHm;  float* wqggPBXZvtlxnxwngvAq = learnables[0]; 
CUDA_CALL(cudaMemcpy(vIWQzNvYZSuxmOTVDFhU, wqggPBXZvtlxnxwngvAq, sizeof(float) * 
cRtIUoZRPICuQEOZOSzT, cudaMemcpyHostToDevice)); cRtIUoZRPICuQEOZOSzT = 
BUOdotSvmFyUWQKMUdra * BdqURaHPmdnfzvtUvocl;  float* JLxVZWxVuFDRoIFIqrjf = 
learnables[1]; CUDA_CALL(cudaMemcpy(IpFhwalnAlrMvcuyQpQD, JLxVZWxVuFDRoIFIqrjf, 
sizeof(float) * cRtIUoZRPICuQEOZOSzT, cudaMemcpyHostToDevice)); } void 
MWConvLayerImpl::postSetup() { if (cQBKlCKXxecGPJrXBXdk->getAutoTune()) { 
getConvAlgoTuned(); } else { getConvAlgoWorkSpaceLimit(); } } void 
MWConvLayerImpl::getConvAlgoTuned() { MWTensorBase* opTensorBase = 
getLayer()->getOutputTensor(0); MWTensor<float>* opTensor = 
static_cast<MWTensor<float>*>(opTensorBase); cudnnConvolutionFwdAlgoPerf_t 
perf_results[3]; cudnnTensorDescriptor_t* desc = 
getDescriptor(getLayer()->getOutputTensor()->getSourcePortIndex()); 
assert(desc); int returnedAlgoCount; 
CUDNN_CALL(cudnnFindConvolutionForwardAlgorithmEx( 
*cQBKlCKXxecGPJrXBXdk->getCudnnHandle(), XYbzSmRQGatVJtGmDZSo, 
static_cast<MWTensor<float>*>(SugesRlPIbOVzRgNWRnl)->getData(), PtkeOkuClHzhOfpmBevf, 
vIWQzNvYZSuxmOTVDFhU, NGqpeiLeVweDRsOKEtuw, *desc, opTensor->getData(), 3, 
&returnedAlgoCount, &perf_results[0], cQBKlCKXxecGPJrXBXdk->getWorkSpace(), 
*cQBKlCKXxecGPJrXBXdk->getAllocatedWorkSpaceSize())); NDHPlSVpLroiIBRnjwyO = 
perf_results[0].algo; } void MWConvLayerImpl::getConvAlgoWorkSpaceLimit() { 
cudnnTensorDescriptor_t* desc = 
getDescriptor(getLayer()->getOutputTensor()->getSourcePortIndex()); assert(desc);
#if (CUDNN_MAJOR < 8)
 CUDNN_CALL(cudnnGetConvolutionForwardAlgorithm( 
*cQBKlCKXxecGPJrXBXdk->getCudnnHandle(), XYbzSmRQGatVJtGmDZSo, 
PtkeOkuClHzhOfpmBevf, NGqpeiLeVweDRsOKEtuw, *desc, 
CUDNN_CONVOLUTION_FWD_SPECIFY_WORKSPACE_LIMIT, 
*cQBKlCKXxecGPJrXBXdk->getAllocatedWorkSpaceSize(), &NDHPlSVpLroiIBRnjwyO));
#else
 int maxAlgoCount(-1); 
CUDNN_CALL(cudnnGetConvolutionForwardAlgorithmMaxCount(*cQBKlCKXxecGPJrXBXdk->getCudnnHandle(), 
&maxAlgoCount)); int returnedAlgoCount(-1); 
std::vector<cudnnConvolutionFwdAlgoPerf_t> perf_results(maxAlgoCount); 
CUDNN_CALL(cudnnGetConvolutionForwardAlgorithm_v7( 
*cQBKlCKXxecGPJrXBXdk->getCudnnHandle(), XYbzSmRQGatVJtGmDZSo, 
PtkeOkuClHzhOfpmBevf, NGqpeiLeVweDRsOKEtuw, *desc, maxAlgoCount, 
&returnedAlgoCount, &perf_results[0])); cudnnConvolutionFwdAlgoPerf_t 
nextFastest; bool algoFound(false); for (int i = 0; i < returnedAlgoCount; ++i) 
{ nextFastest = perf_results[i]; if (nextFastest.memory <= 
*cQBKlCKXxecGPJrXBXdk->getAllocatedWorkSpaceSize()) { NDHPlSVpLroiIBRnjwyO = 
nextFastest.algo; algoFound = true; break; } } if (!algoFound) { assert(false); }
#endif
 } } 