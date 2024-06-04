/* Copyright 2019 The MathWorks, Inc. */
#ifndef lidar_defines_h
#define lidar_defines_h

/* change LIBMWLTRT_API name appropriately */
/* All symbols in this module are intentionally exported. */
#ifdef _MSC_VER
#define LIBMWLTRT_API __declspec(dllexport)
#else
#define LIBMWLTRT_API
#endif

#ifndef EXTERN_C
#ifdef __cplusplus
#define EXTERN_C extern "C"
#else
#define EXTERN_C extern
#endif
#endif

#ifdef MATLAB_MEX_FILE
#include "tmwtypes.h"
#else
#include "rtwtypes.h"
#endif

#endif
