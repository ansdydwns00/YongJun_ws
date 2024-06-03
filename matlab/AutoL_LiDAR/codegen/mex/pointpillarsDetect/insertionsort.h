//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// insertionsort.h
//
// Code generation for function 'insertionsort'
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
struct cell_wrap_6;

// Function Declarations
namespace coder {
namespace internal {
void insertionsort(int32_T x_data[], int32_T xstart, int32_T xend,
                   const cell_wrap_6 cmp_workspace_c_data[]);

}
} // namespace coder

// End of code generation (insertionsort.h)
