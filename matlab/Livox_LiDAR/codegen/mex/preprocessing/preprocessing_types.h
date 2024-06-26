/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * preprocessing_types.h
 *
 * Code generation for function 'preprocessing'
 *
 */

#pragma once

/* Include files */
#include "rtwtypes.h"
#include "emlrt.h"

/* Type Definitions */
#ifndef struct_emxArray_real32_T
#define struct_emxArray_real32_T
struct emxArray_real32_T {
  real32_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};
#endif /* struct_emxArray_real32_T */
#ifndef typedef_emxArray_real32_T
#define typedef_emxArray_real32_T
typedef struct emxArray_real32_T emxArray_real32_T;
#endif /* typedef_emxArray_real32_T */

#ifndef struct_emxArray_uint8_T
#define struct_emxArray_uint8_T
struct emxArray_uint8_T {
  uint8_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};
#endif /* struct_emxArray_uint8_T */
#ifndef typedef_emxArray_uint8_T
#define typedef_emxArray_uint8_T
typedef struct emxArray_uint8_T emxArray_uint8_T;
#endif /* typedef_emxArray_uint8_T */

#ifndef struct_emxArray_uint32_T
#define struct_emxArray_uint32_T
struct emxArray_uint32_T {
  uint32_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};
#endif /* struct_emxArray_uint32_T */
#ifndef typedef_emxArray_uint32_T
#define typedef_emxArray_uint32_T
typedef struct emxArray_uint32_T emxArray_uint32_T;
#endif /* typedef_emxArray_uint32_T */

#ifndef struct_emxArray_real_T
#define struct_emxArray_real_T
struct emxArray_real_T {
  real_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};
#endif /* struct_emxArray_real_T */
#ifndef typedef_emxArray_real_T
#define typedef_emxArray_real_T
typedef struct emxArray_real_T emxArray_real_T;
#endif /* typedef_emxArray_real_T */

#ifndef struct_emxArray_uint16_T
#define struct_emxArray_uint16_T
struct emxArray_uint16_T {
  uint16_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};
#endif /* struct_emxArray_uint16_T */
#ifndef typedef_emxArray_uint16_T
#define typedef_emxArray_uint16_T
typedef struct emxArray_uint16_T emxArray_uint16_T;
#endif /* typedef_emxArray_uint16_T */

#ifndef struct_emxArray_boolean_T
#define struct_emxArray_boolean_T
struct emxArray_boolean_T {
  boolean_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};
#endif /* struct_emxArray_boolean_T */
#ifndef typedef_emxArray_boolean_T
#define typedef_emxArray_boolean_T
typedef struct emxArray_boolean_T emxArray_boolean_T;
#endif /* typedef_emxArray_boolean_T */

#ifndef struct_emxArray_int32_T
#define struct_emxArray_int32_T
struct emxArray_int32_T {
  int32_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};
#endif /* struct_emxArray_int32_T */
#ifndef typedef_emxArray_int32_T
#define typedef_emxArray_int32_T
typedef struct emxArray_int32_T emxArray_int32_T;
#endif /* typedef_emxArray_int32_T */

#ifndef c_typedef_c_emxArray_pointcloud
#define c_typedef_c_emxArray_pointcloud
typedef struct {
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
} c_emxArray_pointclouds_internal;
#endif /* c_typedef_c_emxArray_pointcloud */

#ifndef typedef_pointCloud
#define typedef_pointCloud
typedef struct {
  boolean_T matlabCodegenIsDeleted;
  emxArray_real32_T *Location;
  emxArray_uint8_T *Color;
  emxArray_real32_T *Normal;
  emxArray_real32_T *Intensity;
  emxArray_real32_T *RangeData;
  void *Kdtree;
  void *LocationHandle;
  boolean_T HasKdtreeConstructed;
  boolean_T HasLocationHandleAllocated;
  c_emxArray_pointclouds_internal *PointCloudArrayData;
} pointCloud;
#endif /* typedef_pointCloud */

#ifndef typedef_b_pointCloud
#define typedef_b_pointCloud
typedef struct {
  boolean_T matlabCodegenIsDeleted;
  real32_T Location[172800];
  emxArray_uint8_T *Color;
  emxArray_real32_T *Normal;
  emxArray_real32_T *Intensity;
  emxArray_real32_T *RangeData;
  void *Kdtree;
  void *LocationHandle;
  boolean_T HasKdtreeConstructed;
  boolean_T HasLocationHandleAllocated;
  c_emxArray_pointclouds_internal *PointCloudArrayData;
} b_pointCloud;
#endif /* typedef_b_pointCloud */

#ifndef typedef_b_preprocessing
#define typedef_b_preprocessing
typedef struct {
  b_pointCloud ptCloud_tmp;
} b_preprocessing;
#endif /* typedef_b_preprocessing */

#ifndef typedef_b_preprocessing_api
#define typedef_b_preprocessing_api
typedef struct {
  real32_T points[172800];
  real32_T intensity[57600];
} b_preprocessing_api;
#endif /* typedef_b_preprocessing_api */

#ifndef typedef_preprocessingStackData
#define typedef_preprocessingStackData
typedef struct {
  b_preprocessing f0;
  b_preprocessing_api f1;
} preprocessingStackData;
#endif /* typedef_preprocessingStackData */

/* End of code generation (preprocessing_types.h) */
