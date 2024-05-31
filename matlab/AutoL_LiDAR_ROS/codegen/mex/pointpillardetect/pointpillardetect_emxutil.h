//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// pointpillardetect_emxutil.h
//
// Code generation for function 'pointpillardetect_emxutil'
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
namespace coder {
namespace internal {
struct pointPillarsObjectDetector;

}
} // namespace coder
struct emxArray_real_T;

struct emxArray_real32_T;

struct emxArray_uint8_T;

struct emxArray_boolean_T;

struct emxArray_cell_wrap_40;

namespace coder {
struct b_pointCloud;

}
struct emxArray_pointCloudArray;

namespace coder {
struct pointCloud;

}

// Function Declarations
void c_emxFreeStruct_pointPillarsObj(
    coder::internal::pointPillarsObjectDetector *pStruct);

void c_emxInitStruct_pointPillarsObj(
    coder::internal::pointPillarsObjectDetector *pStruct,
    const emlrtRTEInfo *srcLocation, boolean_T doPush);

void emxEnsureCapacity_boolean_T(emxArray_boolean_T *emxArray, int32_T oldNumel,
                                 const emlrtRTEInfo *srcLocation);

void emxEnsureCapacity_cell_wrap_40(emxArray_cell_wrap_40 *emxArray,
                                    int32_T oldNumel,
                                    const emlrtRTEInfo *srcLocation);

void emxEnsureCapacity_real32_T(emxArray_real32_T *emxArray, int32_T oldNumel,
                                const emlrtRTEInfo *srcLocation);

void emxEnsureCapacity_real_T(emxArray_real_T *emxArray, int32_T oldNumel,
                              const emlrtRTEInfo *srcLocation);

void emxEnsureCapacity_uint8_T(emxArray_uint8_T *emxArray, int32_T oldNumel,
                               const emlrtRTEInfo *srcLocation);

void emxFreeStruct_pointCloud(coder::b_pointCloud *pStruct);

void emxFreeStruct_pointCloud1(coder::pointCloud *pStruct);

void emxFree_boolean_T(emxArray_boolean_T **pEmxArray);

void emxFree_cell_wrap_40(emxArray_cell_wrap_40 **pEmxArray);

void emxFree_pointCloudArray(emxArray_pointCloudArray **pEmxArray);

void emxFree_real32_T(emxArray_real32_T **pEmxArray);

void emxFree_real_T(emxArray_real_T **pEmxArray);

void emxFree_uint8_T(emxArray_uint8_T **pEmxArray);

void emxInitStruct_pointCloud(coder::b_pointCloud *pStruct,
                              const emlrtRTEInfo *srcLocation,
                              boolean_T doPush);

void emxInitStruct_pointCloud1(coder::pointCloud *pStruct,
                               const emlrtRTEInfo *srcLocation,
                               boolean_T doPush);

void emxInit_boolean_T(emxArray_boolean_T **pEmxArray, int32_T numDimensions,
                       const emlrtRTEInfo *srcLocation, boolean_T doPush);

void emxInit_cell_wrap_40(emxArray_cell_wrap_40 **pEmxArray,
                          int32_T numDimensions,
                          const emlrtRTEInfo *srcLocation, boolean_T doPush);

void emxInit_pointCloudArray(emxArray_pointCloudArray **pEmxArray,
                             int32_T numDimensions,
                             const emlrtRTEInfo *srcLocation, boolean_T doPush);

void emxInit_real32_T(emxArray_real32_T **pEmxArray, int32_T numDimensions,
                      const emlrtRTEInfo *srcLocation, boolean_T doPush);

void emxInit_real_T(emxArray_real_T **pEmxArray, int32_T numDimensions,
                    const emlrtRTEInfo *srcLocation, boolean_T doPush);

void emxInit_uint8_T(emxArray_uint8_T **pEmxArray, int32_T numDimensions,
                     const emlrtRTEInfo *srcLocation, boolean_T doPush);

// End of code generation (pointpillardetect_emxutil.h)
