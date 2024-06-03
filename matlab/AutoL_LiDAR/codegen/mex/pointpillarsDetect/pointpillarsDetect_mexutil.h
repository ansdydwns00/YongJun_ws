//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// pointpillarsDetect_mexutil.h
//
// Code generation for function 'pointpillarsDetect_mexutil'
//

#pragma once

// Include files
#include "rtwtypes.h"
#include "emlrt.h"
#include "mex.h"
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>

// Custom Header Code

#ifdef __CUDA_ARCH__
#undef printf
#endif

// Type Declarations
struct emxArray_uint8_T;

struct emxArray_real32_T;

struct emxArray_real_T;

// Function Declarations
void checkCudaError(cudaError_t errCode, const char_T *file, uint32_T b_line);

void checkRunTimeError(const char_T *errMsg, const char_T *file,
                       uint32_T b_line);

int64_T computeEndIdx(int64_T start, int64_T end, int64_T stride);

uint64_T computeNumIters(int32_T ub, int32_T b_ub);

uint64_T computeNumIters(int32_T ub);

emlrtRTEInfo createEmlrtInfoStruct(const char_T *file, uint32_T b_line);

void gpuEmxEnsureCapacity_real_T(const emxArray_real_T *cpu,
                                 emxArray_real_T *gpu, boolean_T needsCopy);

void gpuEmxEnsureCapacity_uint8_T(const emxArray_uint8_T *cpu,
                                  emxArray_uint8_T *gpu, boolean_T needsCopy);

void gpuEmxFree_real32_T(emxArray_real32_T *gpu);

void gpuEmxFree_real_T(emxArray_real_T *gpu);

void gpuEmxFree_uint8_T(emxArray_uint8_T *gpu);

void gpuEmxMemcpyCpuToGpu_uint8_T(emxArray_uint8_T *gpu,
                                  const emxArray_uint8_T *cpu);

void gpuEmxReset_real32_T(emxArray_real32_T *gpu);

void gpuEmxReset_real_T(emxArray_real_T *gpu);

void gpuEmxReset_uint8_T(emxArray_uint8_T *gpu);

void raiseCudaError(int32_T errCode, const char_T *file, uint32_T b_line,
                    const char_T *errorName, const char_T *errorString);

// End of code generation (pointpillarsDetect_mexutil.h)
