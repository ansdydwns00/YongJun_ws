//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// overlapPolygonRotatedRects.h
//
// Code generation for function 'overlapPolygonRotatedRects'
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

// Function Declarations
namespace coder {
namespace vision {
namespace internal {
namespace detector {
void c_overlapPolygonRotatedRects_fi(const real32_T xIndices1_data[],
                                     const real32_T yIndices1_data[],
                                     const real32_T xIndices2_data[],
                                     const real32_T yIndices2_data[],
                                     real_T overlapedPolyPts_data[],
                                     int32_T overlapedPolyPts_size[2]);

void d_overlapPolygonRotatedRects_fi(real_T overlapedPolyPts_data[],
                                     int32_T overlapedPolyPts_size[2],
                                     real_T overlapPoly_data[],
                                     int32_T overlapPoly_size[2]);

} // namespace detector
} // namespace internal
} // namespace vision
} // namespace coder

// End of code generation (overlapPolygonRotatedRects.h)
