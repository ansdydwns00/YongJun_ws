/* Copyright 2018-2022 The MathWorks, Inc. */

#ifndef __MW_SCAN_UTIL_H__
#define __MW_SCAN_UTIL_H__

#ifdef __CUDACC__

#define CUB_IGNORE_DEPRECATED_CPP_DIALECT
#define THRUST_IGNORE_DEPRECATED_CPP_DIALECT

#include <thrust/sort.h>
#include <thrust/execution_policy.h>
#include "MWShuffleUtility.h"
#include "MWCudaMemoryFunctions.hpp"

#define BLOCK_SIZE 512

template<class T> MW_HOST_DEVICE
void callThrustScan1D(T* d_key, bool rev, int nelements);

template <class T> MW_HOST_DEVICE
void callThrustScanND(T* d_key, int* d_seq, bool rev, bool isEdgeDim, int nelements);

template <class T> MW_HOST_DEVICE
void callThrustScanNDEdge(T* d_key, int s, bool rev, int nelements);

template <class T> MW_HOST_DEVICE
void callThrustScanNDOther(T* d_key, int numDims, const int* dims, int scanAlongDim, bool rev, int nelements, bool isRowMajor);

template<class T> MW_HOST_DEVICE
void callThrustScan1DDevice(T* d_key, bool rev, int nelements);

template <class T> MW_HOST_DEVICE
void callThrustScanNDDevice(T* d_key, int* d_seq, bool rev, bool isEdgeDim, int nelements);

template <class T> __device__
void callThrustScanNDOtherDevice(T* d_key, int numDims, const int* dims, int scanAlongDim, bool rev, int nelements, bool isRowMajor);

template<class T> MW_HOST_DEVICE
void callThrustScan1D(T* d_key, bool rev, int nelements) {

    if (!rev) {
        // scanning in forward direction
        thrust::inclusive_scan(thrust::device, d_key, d_key + nelements, d_key);
    } else {
        // scanning in reverse direction
        thrust::reverse_iterator<T *> d_key_end(d_key + nelements);
        thrust::reverse_iterator<T *> d_key_begin(d_key);
        thrust::inclusive_scan(thrust::device, d_key_end, d_key_begin, d_key_end);
    }
}

template <class T> MW_HOST_DEVICE
void callThrustScanND(T* d_key, int* d_seq, bool rev, bool isEdgeDim, int nelements) {
    
    if(!isEdgeDim) {
        thrust::stable_sort_by_key(thrust::device, d_seq, d_seq + nelements, d_key);
    }
    
    if(!rev) {
        // scanning in forward direction
        thrust::inclusive_scan_by_key(thrust::device, d_seq, d_seq + nelements, d_key, d_key);
    } else {
        // scanning in reverse direction
        thrust::reverse_iterator<int *> d_seq_begin(d_seq);
        thrust::reverse_iterator<int *> d_seq_end(d_seq + nelements);
        thrust::reverse_iterator<T *> d_key_end(d_key + nelements);
        thrust::inclusive_scan_by_key(thrust::device, d_seq_end, d_seq_begin, d_key_end, d_key_end);
    }
}

template <class T> MW_HOST_DEVICE
void callThrustScanNDEdge(T* d_key, int s, bool rev, int nelements) {

    int* d_seq;
    mwCudaMalloc(&d_seq, sizeof(int) * nelements);
    
    dim3 dimBlock(BLOCK_SIZE, 1, 1);
    int numBlocksX = (nelements - 1) / BLOCK_SIZE + 1;
    dim3 dimGrid(numBlocksX, 1, 1);

    createSeqEdgeDim<<<dimGrid,dimBlock>>>(d_seq, s, nelements);
    
    callThrustScanND<T>(d_key, d_seq, rev, true, nelements);
    
    mwCudaFree(d_seq);
}

template <class T> MW_HOST_DEVICE
void callThrustScanNDOther(T* d_key, int numDims, const int* dims, int scanAlongDim, bool rev, int nelements, bool isRowMajor) {
  
    dim3 dimBlock(BLOCK_SIZE, 1, 1);
    int numBlocksX = (nelements - 1) / BLOCK_SIZE + 1;
    dim3 dimGrid(numBlocksX, 1, 1);

    int* oldDim = new int[numDims];
    int* stride = new int[numDims];
    int* shflStride = new int[numDims];
    int *d_seq;    
    T* d_key_out;
    int* d_shflStride;
    int* d_oldDim;
    int nelem2;
    int s;
    
    mwCudaMalloc(&d_seq    ,sizeof(int) * nelements);
    mwCudaMalloc(&d_key_out, sizeof(T) * nelements);
    mwCudaMalloc(&d_shflStride, sizeof(int) * numDims);
    mwCudaMalloc(&d_oldDim, sizeof(int) * numDims);
        
    if(isRowMajor) {
        nelem2 = calcRowMajorStrideAndDim(dims, numDims, scanAlongDim, stride, shflStride, oldDim);
    } else {
        nelem2 = calcColMajorStrideAndDim(dims, numDims, scanAlongDim, stride, shflStride, oldDim);
    }

    s = stride[scanAlongDim];
    createSeqOtherDim<<<dimGrid,dimBlock>>>(d_seq, s, nelements, nelem2);
    
    callThrustScanND<T>(d_key, d_seq, rev, false, nelements);
    
    #ifndef __CUDA_ARCH__
        cudaMemcpy(d_shflStride, shflStride, numDims * sizeof(int), cudaMemcpyHostToDevice);
        cudaMemcpy(d_oldDim, oldDim, numDims * sizeof(int), cudaMemcpyHostToDevice);
    #endif
    
    
    if(isRowMajor) {
        shuffleRowMajor<T><<<dimGrid,dimBlock>>>(d_key, d_key_out, d_shflStride, d_oldDim, numDims, nelements);
    } else {
        shuffleColMajor<T><<<dimGrid,dimBlock>>>(d_key, d_key_out, d_shflStride, d_oldDim, numDims, nelements);
    }

    #ifndef __CUDA_ARCH__
        cudaMemcpy(d_key, d_key_out, nelements * sizeof(T), cudaMemcpyDeviceToDevice);
    #endif
    
    
    mwCudaFree(d_key_out);
    mwCudaFree(d_seq);
    mwCudaFree(d_shflStride);
    mwCudaFree(d_oldDim);
    delete[] oldDim;
    delete[] stride;
    delete[] shflStride;
}

template<class T> __device__
void callThrustScan1DDevice(T* d_key, bool rev, int nelements) {

    if (!rev) {
        // scanning in forward direction
        thrust::inclusive_scan(thrust::seq, d_key, d_key + nelements, d_key);
    } else {
        // scanning in reverse direction
        thrust::reverse_iterator<T *> d_key_end(d_key + nelements);
        thrust::reverse_iterator<T *> d_key_begin(d_key);
        thrust::inclusive_scan(thrust::seq, d_key_end, d_key_begin, d_key_end);
    }
}

template <class T> MW_HOST_DEVICE
void callThrustScanNDDevice(T* d_key, int* d_seq, bool rev, bool isEdgeDim, int nelements) {
    
    if(!isEdgeDim) {
        thrust::stable_sort_by_key(thrust::seq, d_seq, d_seq + nelements, d_key);
    }
    
    if(!rev) {
        // scanning in forward direction
        thrust::inclusive_scan_by_key(thrust::seq, d_seq, d_seq + nelements, d_key, d_key);
    } else {
        // scanning in reverse direction
        thrust::reverse_iterator<int *> d_seq_begin(d_seq);
        thrust::reverse_iterator<int *> d_seq_end(d_seq + nelements);
        thrust::reverse_iterator<T *> d_key_end(d_key + nelements);
        thrust::inclusive_scan_by_key(thrust::seq, d_seq_end, d_seq_begin, d_key_end, d_key_end);
    }
}

template <class T> __device__
void callThrustScanNDEdgeDevice(T* d_key, int s, bool rev, int nelements) {

    int* d_seq;
    mwCudaMalloc(&d_seq, sizeof(int) * nelements);

    createSeqEdgeDimDevice(d_seq, s, nelements);
    
    callThrustScanNDDevice<T>(d_key, d_seq, rev, true, nelements);

    mwCudaFree(d_seq);
}

template <class T> __device__
void callThrustScanNDOtherDevice(T* d_key, int numDims, const int* dims, int scanAlongDim, bool rev, int nelements, bool isRowMajor) {

    int *d_seq;    
    T* d_key_out;
    int* d_stride;
    int* d_shflStride;
    int* d_oldDim;
    int nelem2;
    int s;
    
    mwCudaMalloc(&d_seq    ,sizeof(int) * nelements);
    mwCudaMalloc(&d_key_out, sizeof(T) * nelements);
    mwCudaMalloc(&d_stride, sizeof(int) * numDims);
    mwCudaMalloc(&d_shflStride, sizeof(int) * numDims);
    mwCudaMalloc(&d_oldDim, sizeof(int) * numDims);
        
    if(isRowMajor) {
        nelem2 = calcRowMajorStrideAndDim(dims, numDims, scanAlongDim, d_stride, d_shflStride, d_oldDim);
    } else {
        nelem2 = calcColMajorStrideAndDim(dims, numDims, scanAlongDim, d_stride, d_shflStride, d_oldDim);
    }

    s = d_stride[scanAlongDim];
    createSeqOtherDimDevice(d_seq, s, nelements, nelem2);
    
    callThrustScanNDDevice<T>(d_key, d_seq, rev, false, nelements);

    if(isRowMajor) {
        shuffleRowMajorDevice<T>(d_key, d_key_out, d_shflStride, d_oldDim, numDims, nelements);
    } else {
        shuffleColMajorDevice<T>(d_key, d_key_out, d_shflStride, d_oldDim, numDims, nelements);
    }

    memcpy(d_key, d_key_out, nelements * sizeof(T));
    
    mwCudaFree(d_key_out);
    mwCudaFree(d_seq);
    mwCudaFree(d_stride);
    mwCudaFree(d_shflStride);
    mwCudaFree(d_oldDim);
}


template <class T> __host__ __device__
void mwCallThrustScan1D(T* d_key, bool rev, int nelements) {
    bool isDevice;
#ifdef __CUDA_ARCH__
    isDevice = true;
#else
    isDevice = false;
#endif

    if (isDevice) {
        callThrustScan1DDevice<T>(d_key, rev, nelements);
    } else {
        callThrustScan1D<T>(d_key, rev, nelements);
    }
}


template <class T> __host__ __device__
void mwCallThrustScanNDEdge(T* d_key, int s, bool rev, int nelements) {
    bool isDevice;
#ifdef __CUDA_ARCH__
    isDevice = true;
#else
    isDevice = false;
#endif

    if (isDevice) {
        callThrustScanNDEdgeDevice<T>(d_key, s, rev, nelements);
    } else {
        callThrustScanNDEdge<T>(d_key, s, rev, nelements);
    }
}


template <class T> __host__ __device__
void mwCallThrustScanNDOther(T* d_key, int numDims, const int* dims, int scanAlongDim, bool rev, int nelements, bool isRowMajor) {
    bool isDevice;
#ifdef __CUDA_ARCH__
    isDevice = true;
#else
    isDevice = false;
#endif

    if (isDevice) {
        callThrustScanNDOtherDevice<T>(d_key, numDims, dims, scanAlongDim, rev, nelements, isRowMajor);
    } else {
        callThrustScanNDOther<T>(d_key, numDims, dims, scanAlongDim, rev, nelements, isRowMajor);
    }
}

#endif

#endif
