//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// handle.h
//
// Code generation for function 'handle'
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
struct b_pointCloud;

struct pointCloud;

} // namespace coder

// Function Declarations
namespace coder {
void handle_matlabCodegenDestructor(pointCloud *obj);

void handle_matlabCodegenDestructor(b_pointCloud *obj);

} // namespace coder

// End of code generation (handle.h)
