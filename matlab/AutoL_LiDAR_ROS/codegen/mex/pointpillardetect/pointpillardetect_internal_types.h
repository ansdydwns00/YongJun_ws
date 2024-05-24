//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// pointpillardetect_internal_types.h
//
// Code generation for function 'pointpillardetect'
//

#pragma once

// Include files
#include "pointpillardetect_types.h"
#include "rtwtypes.h"
#include "MWCudnnCustomLayerBase.hpp"
#include "MWCudnnTargetNetworkImpl.hpp"
#include "MWTensorBase.hpp"
#include "emlrt.h"

// Custom Header Code

#ifdef __CUDA_ARCH__
#undef printf
#endif

// Type Definitions
class MWScatterLayer_pretrained0_01 : public MWCudnnCustomLayerBase {
public:
  MWScatterLayer_pretrained0_01() = default;
  void createCustomLayer(MWCudnnTarget::MWTargetNetworkImpl *targetImpl,
                         MWTensorBase *b, MWTensorBase *c, const char_T *d,
                         int32_T e);
  void propagateSize();
  void cleanupLayer();
  void predict();
};

class MWResize2DLayer_pretrained0_01 : public MWCudnnCustomLayerBase {
public:
  MWResize2DLayer_pretrained0_01() = default;
  void createCustomLayer(MWCudnnTarget::MWTargetNetworkImpl *targetImpl,
                         MWTensorBase *b, const char_T *c, int32_T d);
  void propagateSize();
  void cleanupLayer();
  void predict();
};

class MWResize2DLayer_pretrained0_02 : public MWCudnnCustomLayerBase {
public:
  MWResize2DLayer_pretrained0_02() = default;
  void createCustomLayer(MWCudnnTarget::MWTargetNetworkImpl *targetImpl,
                         MWTensorBase *b, const char_T *c, int32_T d);
  void propagateSize();
  void cleanupLayer();
  void predict();
};

// End of code generation (pointpillardetect_internal_types.h)
