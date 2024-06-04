/* Copyright 2018-2022 The MathWorks, Inc. */

#ifndef MW_CUDNN_SPLITTING_LAYER_IMPL
#define MW_CUDNN_SPLITTING_LAYER_IMPL

#include "MWCudnnCNNLayerImpl.hpp"
#include <vector>


/**
 *  Codegen class for channel level splitting
 **/
class MWCNNLayer;

namespace MWCudnnTarget {
class MWTargetNetworkImpl;
class MWSplittingLayerImpl : public MWCNNLayerImpl {
  public:
    MWSplittingLayerImpl(MWCNNLayer*, MWTargetNetworkImpl*, int, int*);
    ~MWSplittingLayerImpl();

    void predict();
    void cleanup();
    void propagateSize();

  public:
    int* MdSWZSOAjugbWppryHbR;

  private:
    int etjQLJVQCaeAXRWYtqOl;

  protected:
    virtual float* offsetOutputPointer(float*, int);
    virtual signed char* offsetOutputPointer(signed char*, int);
};

} // namespace MWCudnnTarget

#endif
