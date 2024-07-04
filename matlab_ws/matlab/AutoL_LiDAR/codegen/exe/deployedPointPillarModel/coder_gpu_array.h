/* Copyright 2021 The MathWorks, Inc. */

#ifndef _mw_coder_gpu_array_h
#define _mw_coder_gpu_array_h

#include "coder_array.h"
#include "MWCudaMemoryFunctions.hpp"

namespace coder {

template <typename T, int N>
class gpu_array {
  public:
    gpu_array()
        : data_(nullptr)
        , capacity_(0)
        , owner_(true) {
        memset(size_, 0, sizeof(int) * N);
    }

    gpu_array(gpu_array const& _other)
        : data_(_other.data_)
        , capacity_(_other.capacity_)
        , owner_(false) {
        std::copy(_other.size_, _other.size_ + N, size_);
    }

    ~gpu_array() {
        if (owner_ && data_ != nullptr) {
            mwCudaFree(data_);
            data_ = nullptr;
        }
    }

    __device__ __host__ T& operator[](int _index) {
        return data_[_index];
    }

    __device__ __host__ T const& operator[](int _index) const {
        return data_[_index];
    }

    __device__ __host__ T* data() {
        return data_;
    }

    __device__ __host__ T const* data() const {
        return data_;
    }

    __device__ __host__ int* size() {
        return &size_[0];
    }

    __device__ __host__ int const* size() const {
        return &size_[0];
    }

    __device__ __host__ int size(int _index) const {
        return size_[_index];
    }

    void set_size(coder::array<T, N> const* cpuArray) {
        ensureCapacityWithCopy(cpuArray->capacity());
        std::copy(cpuArray->size(), cpuArray->size() + N, size());
    }

    int numel() const {
        return ::coder::detail::numel<N>::compute(size_);
    }

    void ensureCapacityWithoutCopy(int _newCapcity) {
        if (_newCapcity > capacity_) {
            if (owner_) {
                mwCudaFree(data_);
            }
            mwCudaMalloc(&data_, _newCapcity * sizeof(T));
            capacity_ = _newCapcity;
            owner_ = true;
        }
    }

    void ensureCapacityWithCopy(int _newCapacity) {
        if (_newCapacity > capacity_) {
            T* newData = nullptr;
            mwCudaMalloc(&newData, _newCapacity * sizeof(T));
            if (data_ != nullptr) {
                cudaMemcpy(newData, data_, numel() * sizeof(T), cudaMemcpyDeviceToDevice);
            }
            if (owner_) {
                mwCudaFree(data_);
            }
            data_ = newData;
            capacity_ = _newCapacity;
            owner_ = true;
        }
    }

  private:
    gpu_array& operator=(gpu_array const&) = delete;

  private:
    T* data_;
    int capacity_;
    bool owner_;
    int size_[N];
};

} // namespace coder

template <typename T, int N, typename T2>
void arrayCopyGpuToCpu(coder::array<T, N>& cpuLhs, coder::gpu_array<T2, N> const& gpuRhs) {
    cudaMemcpy(cpuLhs.data(), gpuRhs.data(), cpuLhs.numel() * sizeof(T), cudaMemcpyDeviceToHost);
}

template <typename T, int N, typename T2>
void arrayCopyCpuToGpu(coder::gpu_array<T2, N>& gpuLhs, coder::array<T, N> const& cpuRhs) {
    gpuLhs.ensureCapacityWithoutCopy(cpuRhs.capacity());
    std::copy(cpuRhs.size(), cpuRhs.size() + N, gpuLhs.size());
    cudaMemcpy(gpuLhs.data(), cpuRhs.data(), cpuRhs.numel() * sizeof(T), cudaMemcpyHostToDevice);
}


#endif
