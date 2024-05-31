//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// overlapPolygonRotatedRects.cu
//
// Code generation for function 'overlapPolygonRotatedRects'
//

// Include files
#include "overlapPolygonRotatedRects.h"
#include "rt_nonfinite.h"
#include "sort.h"
#include "rt_defines.h"
#include <cmath>
#include <cstring>

// Function Declarations
static real_T rt_atan2d_snf(real_T u0, real_T u1);

// Function Definitions
static real_T rt_atan2d_snf(real_T u0, real_T u1)
{
  real_T y;
  if (std::isnan(u0) || std::isnan(u1)) {
    y = rtNaN;
  } else if (std::isinf(u0) && std::isinf(u1)) {
    int32_T b;
    int32_T c;
    if (u1 > 0.0) {
      b = 1;
    } else {
      b = -1;
    }
    if (u0 > 0.0) {
      c = 1;
    } else {
      c = -1;
    }
    y = std::atan2(static_cast<real_T>(c), static_cast<real_T>(b));
  } else if (u1 == 0.0) {
    if (u0 > 0.0) {
      y = RT_PI / 2.0;
    } else if (u0 < 0.0) {
      y = -(RT_PI / 2.0);
    } else {
      y = 0.0;
    }
  } else {
    y = std::atan2(u0, u1);
  }
  return y;
}

namespace coder {
namespace vision {
namespace internal {
namespace detector {
void c_overlapPolygonRotatedRects_fi(const real32_T xIndices1_data[],
                                     const real32_T yIndices1_data[],
                                     const real32_T xIndices2_data[],
                                     const real32_T yIndices2_data[],
                                     real_T overlapedPolyPts_data[],
                                     int32_T overlapedPolyPts_size[2])
{
  real_T b_pointsInsidePoly[16];
  real_T overlapedPolyPts[16];
  real_T pointsInsidePoly[16];
  int32_T b_count;
  int32_T count;
  int32_T i;
  int32_T neg;
  int32_T pos;
  real32_T a1;
  real32_T a2;
  real32_T b1;
  real32_T b2;
  real32_T c1;
  real32_T c2;
  real32_T det;
  real32_T intersectPt_idx_0;
  std::memset(&overlapedPolyPts[0], 0, 16U * sizeof(real_T));
  count = -1;
  a1 = yIndices1_data[1] - yIndices1_data[0];
  b1 = xIndices1_data[0] - xIndices1_data[1];
  c1 = a1 * xIndices1_data[0] + b1 * yIndices1_data[0];
  a2 = yIndices2_data[1] - yIndices2_data[0];
  b2 = xIndices2_data[0] - xIndices2_data[1];
  c2 = a2 * xIndices2_data[0] + b2 * yIndices2_data[0];
  det = a1 * b2 - a2 * b1;
  if (!(det == 0.0F)) {
    intersectPt_idx_0 = (b2 * c1 - b1 * c2) / det;
    b2 = (a1 * c2 - a2 * c1) / det;
    if ((intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices1_data[0], xIndices1_data[1])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices1_data[0], xIndices1_data[1])) &&
        (b2 - 0.001F <= std::fmax(yIndices1_data[0], yIndices1_data[1])) &&
        (b2 + 0.001F >= std::fmin(yIndices1_data[0], yIndices1_data[1])) &&
        (intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices2_data[0], xIndices2_data[1])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices2_data[0], xIndices2_data[1])) &&
        (b2 - 0.001F <= std::fmax(yIndices2_data[0], yIndices2_data[1])) &&
        (b2 + 0.001F >= std::fmin(yIndices2_data[0], yIndices2_data[1]))) {
      count = 0;
      overlapedPolyPts[0] = intersectPt_idx_0;
      overlapedPolyPts[1] = b2;
    }
  }
  a2 = yIndices2_data[2] - yIndices2_data[1];
  b2 = xIndices2_data[1] - xIndices2_data[2];
  c2 = a2 * xIndices2_data[1] + b2 * yIndices2_data[1];
  det = a1 * b2 - a2 * b1;
  if (!(det == 0.0F)) {
    intersectPt_idx_0 = (b2 * c1 - b1 * c2) / det;
    b2 = (a1 * c2 - a2 * c1) / det;
    if ((intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices1_data[0], xIndices1_data[1])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices1_data[0], xIndices1_data[1])) &&
        (b2 - 0.001F <= std::fmax(yIndices1_data[0], yIndices1_data[1])) &&
        (b2 + 0.001F >= std::fmin(yIndices1_data[0], yIndices1_data[1])) &&
        (intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices2_data[1], xIndices2_data[2])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices2_data[1], xIndices2_data[2])) &&
        (b2 - 0.001F <= std::fmax(yIndices2_data[1], yIndices2_data[2])) &&
        (b2 + 0.001F >= std::fmin(yIndices2_data[1], yIndices2_data[2]))) {
      count++;
      overlapedPolyPts[count << 1] = intersectPt_idx_0;
      overlapedPolyPts[(count << 1) + 1] = b2;
    }
  }
  a2 = yIndices2_data[3] - yIndices2_data[2];
  b2 = xIndices2_data[2] - xIndices2_data[3];
  c2 = a2 * xIndices2_data[2] + b2 * yIndices2_data[2];
  det = a1 * b2 - a2 * b1;
  if (!(det == 0.0F)) {
    intersectPt_idx_0 = (b2 * c1 - b1 * c2) / det;
    b2 = (a1 * c2 - a2 * c1) / det;
    if ((intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices1_data[0], xIndices1_data[1])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices1_data[0], xIndices1_data[1])) &&
        (b2 - 0.001F <= std::fmax(yIndices1_data[0], yIndices1_data[1])) &&
        (b2 + 0.001F >= std::fmin(yIndices1_data[0], yIndices1_data[1])) &&
        (intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices2_data[2], xIndices2_data[3])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices2_data[2], xIndices2_data[3])) &&
        (b2 - 0.001F <= std::fmax(yIndices2_data[2], yIndices2_data[3])) &&
        (b2 + 0.001F >= std::fmin(yIndices2_data[2], yIndices2_data[3]))) {
      count++;
      overlapedPolyPts[count << 1] = intersectPt_idx_0;
      overlapedPolyPts[(count << 1) + 1] = b2;
    }
  }
  a2 = yIndices2_data[0] - yIndices2_data[3];
  b2 = xIndices2_data[3] - xIndices2_data[0];
  c2 = a2 * xIndices2_data[3] + b2 * yIndices2_data[3];
  det = a1 * b2 - a2 * b1;
  if (!(det == 0.0F)) {
    intersectPt_idx_0 = (b2 * c1 - b1 * c2) / det;
    b2 = (a1 * c2 - a2 * c1) / det;
    if ((intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices1_data[0], xIndices1_data[1])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices1_data[0], xIndices1_data[1])) &&
        (b2 - 0.001F <= std::fmax(yIndices1_data[0], yIndices1_data[1])) &&
        (b2 + 0.001F >= std::fmin(yIndices1_data[0], yIndices1_data[1])) &&
        (intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices2_data[3], xIndices2_data[0])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices2_data[3], xIndices2_data[0])) &&
        (b2 - 0.001F <= std::fmax(yIndices2_data[3], yIndices2_data[0])) &&
        (b2 + 0.001F >= std::fmin(yIndices2_data[3], yIndices2_data[0]))) {
      count++;
      overlapedPolyPts[count << 1] = intersectPt_idx_0;
      overlapedPolyPts[(count << 1) + 1] = b2;
    }
  }
  a1 = yIndices1_data[2] - yIndices1_data[1];
  b1 = xIndices1_data[1] - xIndices1_data[2];
  c1 = a1 * xIndices1_data[1] + b1 * yIndices1_data[1];
  a2 = yIndices2_data[1] - yIndices2_data[0];
  b2 = xIndices2_data[0] - xIndices2_data[1];
  c2 = a2 * xIndices2_data[0] + b2 * yIndices2_data[0];
  det = a1 * b2 - a2 * b1;
  if (!(det == 0.0F)) {
    intersectPt_idx_0 = (b2 * c1 - b1 * c2) / det;
    b2 = (a1 * c2 - a2 * c1) / det;
    if ((intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices1_data[1], xIndices1_data[2])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices1_data[1], xIndices1_data[2])) &&
        (b2 - 0.001F <= std::fmax(yIndices1_data[1], yIndices1_data[2])) &&
        (b2 + 0.001F >= std::fmin(yIndices1_data[1], yIndices1_data[2])) &&
        (intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices2_data[0], xIndices2_data[1])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices2_data[0], xIndices2_data[1])) &&
        (b2 - 0.001F <= std::fmax(yIndices2_data[0], yIndices2_data[1])) &&
        (b2 + 0.001F >= std::fmin(yIndices2_data[0], yIndices2_data[1]))) {
      count++;
      overlapedPolyPts[count << 1] = intersectPt_idx_0;
      overlapedPolyPts[(count << 1) + 1] = b2;
    }
  }
  a2 = yIndices2_data[2] - yIndices2_data[1];
  b2 = xIndices2_data[1] - xIndices2_data[2];
  c2 = a2 * xIndices2_data[1] + b2 * yIndices2_data[1];
  det = a1 * b2 - a2 * b1;
  if (!(det == 0.0F)) {
    intersectPt_idx_0 = (b2 * c1 - b1 * c2) / det;
    b2 = (a1 * c2 - a2 * c1) / det;
    if ((intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices1_data[1], xIndices1_data[2])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices1_data[1], xIndices1_data[2])) &&
        (b2 - 0.001F <= std::fmax(yIndices1_data[1], yIndices1_data[2])) &&
        (b2 + 0.001F >= std::fmin(yIndices1_data[1], yIndices1_data[2])) &&
        (intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices2_data[1], xIndices2_data[2])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices2_data[1], xIndices2_data[2])) &&
        (b2 - 0.001F <= std::fmax(yIndices2_data[1], yIndices2_data[2])) &&
        (b2 + 0.001F >= std::fmin(yIndices2_data[1], yIndices2_data[2]))) {
      count++;
      overlapedPolyPts[count << 1] = intersectPt_idx_0;
      overlapedPolyPts[(count << 1) + 1] = b2;
    }
  }
  a2 = yIndices2_data[3] - yIndices2_data[2];
  b2 = xIndices2_data[2] - xIndices2_data[3];
  c2 = a2 * xIndices2_data[2] + b2 * yIndices2_data[2];
  det = a1 * b2 - a2 * b1;
  if (!(det == 0.0F)) {
    intersectPt_idx_0 = (b2 * c1 - b1 * c2) / det;
    b2 = (a1 * c2 - a2 * c1) / det;
    if ((intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices1_data[1], xIndices1_data[2])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices1_data[1], xIndices1_data[2])) &&
        (b2 - 0.001F <= std::fmax(yIndices1_data[1], yIndices1_data[2])) &&
        (b2 + 0.001F >= std::fmin(yIndices1_data[1], yIndices1_data[2])) &&
        (intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices2_data[2], xIndices2_data[3])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices2_data[2], xIndices2_data[3])) &&
        (b2 - 0.001F <= std::fmax(yIndices2_data[2], yIndices2_data[3])) &&
        (b2 + 0.001F >= std::fmin(yIndices2_data[2], yIndices2_data[3]))) {
      count++;
      overlapedPolyPts[count << 1] = intersectPt_idx_0;
      overlapedPolyPts[(count << 1) + 1] = b2;
    }
  }
  a2 = yIndices2_data[0] - yIndices2_data[3];
  b2 = xIndices2_data[3] - xIndices2_data[0];
  c2 = a2 * xIndices2_data[3] + b2 * yIndices2_data[3];
  det = a1 * b2 - a2 * b1;
  if (!(det == 0.0F)) {
    intersectPt_idx_0 = (b2 * c1 - b1 * c2) / det;
    b2 = (a1 * c2 - a2 * c1) / det;
    if ((intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices1_data[1], xIndices1_data[2])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices1_data[1], xIndices1_data[2])) &&
        (b2 - 0.001F <= std::fmax(yIndices1_data[1], yIndices1_data[2])) &&
        (b2 + 0.001F >= std::fmin(yIndices1_data[1], yIndices1_data[2])) &&
        (intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices2_data[3], xIndices2_data[0])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices2_data[3], xIndices2_data[0])) &&
        (b2 - 0.001F <= std::fmax(yIndices2_data[3], yIndices2_data[0])) &&
        (b2 + 0.001F >= std::fmin(yIndices2_data[3], yIndices2_data[0]))) {
      count++;
      overlapedPolyPts[count << 1] = intersectPt_idx_0;
      overlapedPolyPts[(count << 1) + 1] = b2;
    }
  }
  a1 = yIndices1_data[3] - yIndices1_data[2];
  b1 = xIndices1_data[2] - xIndices1_data[3];
  c1 = a1 * xIndices1_data[2] + b1 * yIndices1_data[2];
  a2 = yIndices2_data[1] - yIndices2_data[0];
  b2 = xIndices2_data[0] - xIndices2_data[1];
  c2 = a2 * xIndices2_data[0] + b2 * yIndices2_data[0];
  det = a1 * b2 - a2 * b1;
  if (!(det == 0.0F)) {
    intersectPt_idx_0 = (b2 * c1 - b1 * c2) / det;
    b2 = (a1 * c2 - a2 * c1) / det;
    if ((intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices1_data[2], xIndices1_data[3])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices1_data[2], xIndices1_data[3])) &&
        (b2 - 0.001F <= std::fmax(yIndices1_data[2], yIndices1_data[3])) &&
        (b2 + 0.001F >= std::fmin(yIndices1_data[2], yIndices1_data[3])) &&
        (intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices2_data[0], xIndices2_data[1])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices2_data[0], xIndices2_data[1])) &&
        (b2 - 0.001F <= std::fmax(yIndices2_data[0], yIndices2_data[1])) &&
        (b2 + 0.001F >= std::fmin(yIndices2_data[0], yIndices2_data[1]))) {
      count++;
      overlapedPolyPts[count << 1] = intersectPt_idx_0;
      overlapedPolyPts[(count << 1) + 1] = b2;
    }
  }
  a2 = yIndices2_data[2] - yIndices2_data[1];
  b2 = xIndices2_data[1] - xIndices2_data[2];
  c2 = a2 * xIndices2_data[1] + b2 * yIndices2_data[1];
  det = a1 * b2 - a2 * b1;
  if (!(det == 0.0F)) {
    intersectPt_idx_0 = (b2 * c1 - b1 * c2) / det;
    b2 = (a1 * c2 - a2 * c1) / det;
    if ((intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices1_data[2], xIndices1_data[3])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices1_data[2], xIndices1_data[3])) &&
        (b2 - 0.001F <= std::fmax(yIndices1_data[2], yIndices1_data[3])) &&
        (b2 + 0.001F >= std::fmin(yIndices1_data[2], yIndices1_data[3])) &&
        (intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices2_data[1], xIndices2_data[2])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices2_data[1], xIndices2_data[2])) &&
        (b2 - 0.001F <= std::fmax(yIndices2_data[1], yIndices2_data[2])) &&
        (b2 + 0.001F >= std::fmin(yIndices2_data[1], yIndices2_data[2]))) {
      count++;
      overlapedPolyPts[count << 1] = intersectPt_idx_0;
      overlapedPolyPts[(count << 1) + 1] = b2;
    }
  }
  a2 = yIndices2_data[3] - yIndices2_data[2];
  b2 = xIndices2_data[2] - xIndices2_data[3];
  c2 = a2 * xIndices2_data[2] + b2 * yIndices2_data[2];
  det = a1 * b2 - a2 * b1;
  if (!(det == 0.0F)) {
    intersectPt_idx_0 = (b2 * c1 - b1 * c2) / det;
    b2 = (a1 * c2 - a2 * c1) / det;
    if ((intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices1_data[2], xIndices1_data[3])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices1_data[2], xIndices1_data[3])) &&
        (b2 - 0.001F <= std::fmax(yIndices1_data[2], yIndices1_data[3])) &&
        (b2 + 0.001F >= std::fmin(yIndices1_data[2], yIndices1_data[3])) &&
        (intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices2_data[2], xIndices2_data[3])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices2_data[2], xIndices2_data[3])) &&
        (b2 - 0.001F <= std::fmax(yIndices2_data[2], yIndices2_data[3])) &&
        (b2 + 0.001F >= std::fmin(yIndices2_data[2], yIndices2_data[3]))) {
      count++;
      overlapedPolyPts[count << 1] = intersectPt_idx_0;
      overlapedPolyPts[(count << 1) + 1] = b2;
    }
  }
  a2 = yIndices2_data[0] - yIndices2_data[3];
  b2 = xIndices2_data[3] - xIndices2_data[0];
  c2 = a2 * xIndices2_data[3] + b2 * yIndices2_data[3];
  det = a1 * b2 - a2 * b1;
  if (!(det == 0.0F)) {
    intersectPt_idx_0 = (b2 * c1 - b1 * c2) / det;
    b2 = (a1 * c2 - a2 * c1) / det;
    if ((intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices1_data[2], xIndices1_data[3])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices1_data[2], xIndices1_data[3])) &&
        (b2 - 0.001F <= std::fmax(yIndices1_data[2], yIndices1_data[3])) &&
        (b2 + 0.001F >= std::fmin(yIndices1_data[2], yIndices1_data[3])) &&
        (intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices2_data[3], xIndices2_data[0])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices2_data[3], xIndices2_data[0])) &&
        (b2 - 0.001F <= std::fmax(yIndices2_data[3], yIndices2_data[0])) &&
        (b2 + 0.001F >= std::fmin(yIndices2_data[3], yIndices2_data[0]))) {
      count++;
      overlapedPolyPts[count << 1] = intersectPt_idx_0;
      overlapedPolyPts[(count << 1) + 1] = b2;
    }
  }
  a1 = yIndices1_data[0] - yIndices1_data[3];
  b1 = xIndices1_data[3] - xIndices1_data[0];
  c1 = a1 * xIndices1_data[3] + b1 * yIndices1_data[3];
  a2 = yIndices2_data[1] - yIndices2_data[0];
  b2 = xIndices2_data[0] - xIndices2_data[1];
  c2 = a2 * xIndices2_data[0] + b2 * yIndices2_data[0];
  det = a1 * b2 - a2 * b1;
  if (!(det == 0.0F)) {
    intersectPt_idx_0 = (b2 * c1 - b1 * c2) / det;
    b2 = (a1 * c2 - a2 * c1) / det;
    if ((intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices1_data[3], xIndices1_data[0])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices1_data[3], xIndices1_data[0])) &&
        (b2 - 0.001F <= std::fmax(yIndices1_data[3], yIndices1_data[0])) &&
        (b2 + 0.001F >= std::fmin(yIndices1_data[3], yIndices1_data[0])) &&
        (intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices2_data[0], xIndices2_data[1])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices2_data[0], xIndices2_data[1])) &&
        (b2 - 0.001F <= std::fmax(yIndices2_data[0], yIndices2_data[1])) &&
        (b2 + 0.001F >= std::fmin(yIndices2_data[0], yIndices2_data[1]))) {
      count++;
      overlapedPolyPts[count << 1] = intersectPt_idx_0;
      overlapedPolyPts[(count << 1) + 1] = b2;
    }
  }
  a2 = yIndices2_data[2] - yIndices2_data[1];
  b2 = xIndices2_data[1] - xIndices2_data[2];
  c2 = a2 * xIndices2_data[1] + b2 * yIndices2_data[1];
  det = a1 * b2 - a2 * b1;
  if (!(det == 0.0F)) {
    intersectPt_idx_0 = (b2 * c1 - b1 * c2) / det;
    b2 = (a1 * c2 - a2 * c1) / det;
    if ((intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices1_data[3], xIndices1_data[0])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices1_data[3], xIndices1_data[0])) &&
        (b2 - 0.001F <= std::fmax(yIndices1_data[3], yIndices1_data[0])) &&
        (b2 + 0.001F >= std::fmin(yIndices1_data[3], yIndices1_data[0])) &&
        (intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices2_data[1], xIndices2_data[2])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices2_data[1], xIndices2_data[2])) &&
        (b2 - 0.001F <= std::fmax(yIndices2_data[1], yIndices2_data[2])) &&
        (b2 + 0.001F >= std::fmin(yIndices2_data[1], yIndices2_data[2]))) {
      count++;
      overlapedPolyPts[count << 1] = intersectPt_idx_0;
      overlapedPolyPts[(count << 1) + 1] = b2;
    }
  }
  a2 = yIndices2_data[3] - yIndices2_data[2];
  b2 = xIndices2_data[2] - xIndices2_data[3];
  c2 = a2 * xIndices2_data[2] + b2 * yIndices2_data[2];
  det = a1 * b2 - a2 * b1;
  if (!(det == 0.0F)) {
    intersectPt_idx_0 = (b2 * c1 - b1 * c2) / det;
    b2 = (a1 * c2 - a2 * c1) / det;
    if ((intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices1_data[3], xIndices1_data[0])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices1_data[3], xIndices1_data[0])) &&
        (b2 - 0.001F <= std::fmax(yIndices1_data[3], yIndices1_data[0])) &&
        (b2 + 0.001F >= std::fmin(yIndices1_data[3], yIndices1_data[0])) &&
        (intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices2_data[2], xIndices2_data[3])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices2_data[2], xIndices2_data[3])) &&
        (b2 - 0.001F <= std::fmax(yIndices2_data[2], yIndices2_data[3])) &&
        (b2 + 0.001F >= std::fmin(yIndices2_data[2], yIndices2_data[3]))) {
      count++;
      overlapedPolyPts[count << 1] = intersectPt_idx_0;
      overlapedPolyPts[(count << 1) + 1] = b2;
    }
  }
  a2 = yIndices2_data[0] - yIndices2_data[3];
  b2 = xIndices2_data[3] - xIndices2_data[0];
  c2 = a2 * xIndices2_data[3] + b2 * yIndices2_data[3];
  det = a1 * b2 - a2 * b1;
  if (!(det == 0.0F)) {
    intersectPt_idx_0 = (b2 * c1 - b1 * c2) / det;
    b2 = (a1 * c2 - a2 * c1) / det;
    if ((intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices1_data[3], xIndices1_data[0])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices1_data[3], xIndices1_data[0])) &&
        (b2 - 0.001F <= std::fmax(yIndices1_data[3], yIndices1_data[0])) &&
        (b2 + 0.001F >= std::fmin(yIndices1_data[3], yIndices1_data[0])) &&
        (intersectPt_idx_0 - 0.001F <=
         std::fmax(xIndices2_data[3], xIndices2_data[0])) &&
        (intersectPt_idx_0 + 0.001F >=
         std::fmin(xIndices2_data[3], xIndices2_data[0])) &&
        (b2 - 0.001F <= std::fmax(yIndices2_data[3], yIndices2_data[0])) &&
        (b2 + 0.001F >= std::fmin(yIndices2_data[3], yIndices2_data[0]))) {
      count++;
      overlapedPolyPts[count << 1] = intersectPt_idx_0;
      overlapedPolyPts[(count << 1) + 1] = b2;
    }
  }
  std::memset(&pointsInsidePoly[0], 0, 16U * sizeof(real_T));
  b_count = -1;
  neg = 0;
  pos = 0;
  b2 = (yIndices1_data[0] - yIndices2_data[0]) *
           (xIndices2_data[1] - xIndices2_data[0]) -
       (xIndices1_data[0] - xIndices2_data[0]) *
           (yIndices2_data[1] - yIndices2_data[0]);
  if (b2 == 0.0F) {
    if ((xIndices1_data[0] - 0.001F <=
         std::fmax(xIndices2_data[0], xIndices2_data[1])) &&
        (xIndices1_data[0] + 0.001F >=
         std::fmin(xIndices2_data[0], xIndices2_data[1])) &&
        (yIndices1_data[0] - 0.001F <=
         std::fmax(yIndices2_data[0], yIndices2_data[1])) &&
        (yIndices1_data[0] + 0.001F >=
         std::fmin(yIndices2_data[0], yIndices2_data[1]))) {
      b_count = 0;
      pointsInsidePoly[0] = xIndices1_data[0];
      pointsInsidePoly[1] = yIndices1_data[0];
    }
  } else if (b2 < 0.0F) {
    neg = 1;
  } else if (b2 > 0.0F) {
    pos = 1;
  }
  b2 = (yIndices1_data[0] - yIndices2_data[1]) *
           (xIndices2_data[2] - xIndices2_data[1]) -
       (xIndices1_data[0] - xIndices2_data[1]) *
           (yIndices2_data[2] - yIndices2_data[1]);
  if (b2 == 0.0F) {
    if ((xIndices1_data[0] - 0.001F <=
         std::fmax(xIndices2_data[1], xIndices2_data[2])) &&
        (xIndices1_data[0] + 0.001F >=
         std::fmin(xIndices2_data[1], xIndices2_data[2])) &&
        (yIndices1_data[0] - 0.001F <=
         std::fmax(yIndices2_data[1], yIndices2_data[2])) &&
        (yIndices1_data[0] + 0.001F >=
         std::fmin(yIndices2_data[1], yIndices2_data[2]))) {
      b_count++;
      pointsInsidePoly[b_count << 1] = xIndices1_data[0];
      pointsInsidePoly[(b_count << 1) + 1] = yIndices1_data[0];
    }
  } else if (b2 < 0.0F) {
    neg++;
  } else if (b2 > 0.0F) {
    pos++;
  }
  b2 = (yIndices1_data[0] - yIndices2_data[2]) *
           (xIndices2_data[3] - xIndices2_data[2]) -
       (xIndices1_data[0] - xIndices2_data[2]) *
           (yIndices2_data[3] - yIndices2_data[2]);
  if (b2 == 0.0F) {
    if ((xIndices1_data[0] - 0.001F <=
         std::fmax(xIndices2_data[2], xIndices2_data[3])) &&
        (xIndices1_data[0] + 0.001F >=
         std::fmin(xIndices2_data[2], xIndices2_data[3])) &&
        (yIndices1_data[0] - 0.001F <=
         std::fmax(yIndices2_data[2], yIndices2_data[3])) &&
        (yIndices1_data[0] + 0.001F >=
         std::fmin(yIndices2_data[2], yIndices2_data[3]))) {
      b_count++;
      pointsInsidePoly[b_count << 1] = xIndices1_data[0];
      pointsInsidePoly[(b_count << 1) + 1] = yIndices1_data[0];
    }
  } else if (b2 < 0.0F) {
    neg++;
  } else if (b2 > 0.0F) {
    pos++;
  }
  b2 = (yIndices1_data[0] - yIndices2_data[3]) *
           (xIndices2_data[0] - xIndices2_data[3]) -
       (xIndices1_data[0] - xIndices2_data[3]) *
           (yIndices2_data[0] - yIndices2_data[3]);
  if (b2 == 0.0F) {
    if ((xIndices1_data[0] - 0.001F <=
         std::fmax(xIndices2_data[3], xIndices2_data[0])) &&
        (xIndices1_data[0] + 0.001F >=
         std::fmin(xIndices2_data[3], xIndices2_data[0])) &&
        (yIndices1_data[0] - 0.001F <=
         std::fmax(yIndices2_data[3], yIndices2_data[0])) &&
        (yIndices1_data[0] + 0.001F >=
         std::fmin(yIndices2_data[3], yIndices2_data[0]))) {
      b_count++;
      pointsInsidePoly[b_count << 1] = xIndices1_data[0];
      pointsInsidePoly[(b_count << 1) + 1] = yIndices1_data[0];
    }
  } else if (b2 < 0.0F) {
    neg++;
  } else if (b2 > 0.0F) {
    pos++;
  }
  if ((static_cast<real_T>(neg) / 4.0 == 1.0) ||
      (static_cast<real_T>(pos) / 4.0 == 1.0)) {
    b_count++;
    pointsInsidePoly[b_count << 1] = xIndices1_data[0];
    pointsInsidePoly[(b_count << 1) + 1] = yIndices1_data[0];
  }
  neg = 0;
  pos = 0;
  b2 = (yIndices1_data[1] - yIndices2_data[0]) *
           (xIndices2_data[1] - xIndices2_data[0]) -
       (xIndices1_data[1] - xIndices2_data[0]) *
           (yIndices2_data[1] - yIndices2_data[0]);
  if (b2 == 0.0F) {
    if ((xIndices1_data[1] - 0.001F <=
         std::fmax(xIndices2_data[0], xIndices2_data[1])) &&
        (xIndices1_data[1] + 0.001F >=
         std::fmin(xIndices2_data[0], xIndices2_data[1])) &&
        (yIndices1_data[1] - 0.001F <=
         std::fmax(yIndices2_data[0], yIndices2_data[1])) &&
        (yIndices1_data[1] + 0.001F >=
         std::fmin(yIndices2_data[0], yIndices2_data[1]))) {
      b_count++;
      pointsInsidePoly[b_count << 1] = xIndices1_data[1];
      pointsInsidePoly[(b_count << 1) + 1] = yIndices1_data[1];
    }
  } else if (b2 < 0.0F) {
    neg = 1;
  } else if (b2 > 0.0F) {
    pos = 1;
  }
  b2 = (yIndices1_data[1] - yIndices2_data[1]) *
           (xIndices2_data[2] - xIndices2_data[1]) -
       (xIndices1_data[1] - xIndices2_data[1]) *
           (yIndices2_data[2] - yIndices2_data[1]);
  if (b2 == 0.0F) {
    if ((xIndices1_data[1] - 0.001F <=
         std::fmax(xIndices2_data[1], xIndices2_data[2])) &&
        (xIndices1_data[1] + 0.001F >=
         std::fmin(xIndices2_data[1], xIndices2_data[2])) &&
        (yIndices1_data[1] - 0.001F <=
         std::fmax(yIndices2_data[1], yIndices2_data[2])) &&
        (yIndices1_data[1] + 0.001F >=
         std::fmin(yIndices2_data[1], yIndices2_data[2]))) {
      b_count++;
      pointsInsidePoly[b_count << 1] = xIndices1_data[1];
      pointsInsidePoly[(b_count << 1) + 1] = yIndices1_data[1];
    }
  } else if (b2 < 0.0F) {
    neg++;
  } else if (b2 > 0.0F) {
    pos++;
  }
  b2 = (yIndices1_data[1] - yIndices2_data[2]) *
           (xIndices2_data[3] - xIndices2_data[2]) -
       (xIndices1_data[1] - xIndices2_data[2]) *
           (yIndices2_data[3] - yIndices2_data[2]);
  if (b2 == 0.0F) {
    if ((xIndices1_data[1] - 0.001F <=
         std::fmax(xIndices2_data[2], xIndices2_data[3])) &&
        (xIndices1_data[1] + 0.001F >=
         std::fmin(xIndices2_data[2], xIndices2_data[3])) &&
        (yIndices1_data[1] - 0.001F <=
         std::fmax(yIndices2_data[2], yIndices2_data[3])) &&
        (yIndices1_data[1] + 0.001F >=
         std::fmin(yIndices2_data[2], yIndices2_data[3]))) {
      b_count++;
      pointsInsidePoly[b_count << 1] = xIndices1_data[1];
      pointsInsidePoly[(b_count << 1) + 1] = yIndices1_data[1];
    }
  } else if (b2 < 0.0F) {
    neg++;
  } else if (b2 > 0.0F) {
    pos++;
  }
  b2 = (yIndices1_data[1] - yIndices2_data[3]) *
           (xIndices2_data[0] - xIndices2_data[3]) -
       (xIndices1_data[1] - xIndices2_data[3]) *
           (yIndices2_data[0] - yIndices2_data[3]);
  if (b2 == 0.0F) {
    if ((xIndices1_data[1] - 0.001F <=
         std::fmax(xIndices2_data[3], xIndices2_data[0])) &&
        (xIndices1_data[1] + 0.001F >=
         std::fmin(xIndices2_data[3], xIndices2_data[0])) &&
        (yIndices1_data[1] - 0.001F <=
         std::fmax(yIndices2_data[3], yIndices2_data[0])) &&
        (yIndices1_data[1] + 0.001F >=
         std::fmin(yIndices2_data[3], yIndices2_data[0]))) {
      b_count++;
      pointsInsidePoly[b_count << 1] = xIndices1_data[1];
      pointsInsidePoly[(b_count << 1) + 1] = yIndices1_data[1];
    }
  } else if (b2 < 0.0F) {
    neg++;
  } else if (b2 > 0.0F) {
    pos++;
  }
  if ((static_cast<real_T>(neg) / 4.0 == 1.0) ||
      (static_cast<real_T>(pos) / 4.0 == 1.0)) {
    b_count++;
    pointsInsidePoly[b_count << 1] = xIndices1_data[1];
    pointsInsidePoly[(b_count << 1) + 1] = yIndices1_data[1];
  }
  neg = 0;
  pos = 0;
  b2 = (yIndices1_data[2] - yIndices2_data[0]) *
           (xIndices2_data[1] - xIndices2_data[0]) -
       (xIndices1_data[2] - xIndices2_data[0]) *
           (yIndices2_data[1] - yIndices2_data[0]);
  if (b2 == 0.0F) {
    if ((xIndices1_data[2] - 0.001F <=
         std::fmax(xIndices2_data[0], xIndices2_data[1])) &&
        (xIndices1_data[2] + 0.001F >=
         std::fmin(xIndices2_data[0], xIndices2_data[1])) &&
        (yIndices1_data[2] - 0.001F <=
         std::fmax(yIndices2_data[0], yIndices2_data[1])) &&
        (yIndices1_data[2] + 0.001F >=
         std::fmin(yIndices2_data[0], yIndices2_data[1]))) {
      b_count++;
      pointsInsidePoly[b_count << 1] = xIndices1_data[2];
      pointsInsidePoly[(b_count << 1) + 1] = yIndices1_data[2];
    }
  } else if (b2 < 0.0F) {
    neg = 1;
  } else if (b2 > 0.0F) {
    pos = 1;
  }
  b2 = (yIndices1_data[2] - yIndices2_data[1]) *
           (xIndices2_data[2] - xIndices2_data[1]) -
       (xIndices1_data[2] - xIndices2_data[1]) *
           (yIndices2_data[2] - yIndices2_data[1]);
  if (b2 == 0.0F) {
    if ((xIndices1_data[2] - 0.001F <=
         std::fmax(xIndices2_data[1], xIndices2_data[2])) &&
        (xIndices1_data[2] + 0.001F >=
         std::fmin(xIndices2_data[1], xIndices2_data[2])) &&
        (yIndices1_data[2] - 0.001F <=
         std::fmax(yIndices2_data[1], yIndices2_data[2])) &&
        (yIndices1_data[2] + 0.001F >=
         std::fmin(yIndices2_data[1], yIndices2_data[2]))) {
      b_count++;
      pointsInsidePoly[b_count << 1] = xIndices1_data[2];
      pointsInsidePoly[(b_count << 1) + 1] = yIndices1_data[2];
    }
  } else if (b2 < 0.0F) {
    neg++;
  } else if (b2 > 0.0F) {
    pos++;
  }
  b2 = (yIndices1_data[2] - yIndices2_data[2]) *
           (xIndices2_data[3] - xIndices2_data[2]) -
       (xIndices1_data[2] - xIndices2_data[2]) *
           (yIndices2_data[3] - yIndices2_data[2]);
  if (b2 == 0.0F) {
    if ((xIndices1_data[2] - 0.001F <=
         std::fmax(xIndices2_data[2], xIndices2_data[3])) &&
        (xIndices1_data[2] + 0.001F >=
         std::fmin(xIndices2_data[2], xIndices2_data[3])) &&
        (yIndices1_data[2] - 0.001F <=
         std::fmax(yIndices2_data[2], yIndices2_data[3])) &&
        (yIndices1_data[2] + 0.001F >=
         std::fmin(yIndices2_data[2], yIndices2_data[3]))) {
      b_count++;
      pointsInsidePoly[b_count << 1] = xIndices1_data[2];
      pointsInsidePoly[(b_count << 1) + 1] = yIndices1_data[2];
    }
  } else if (b2 < 0.0F) {
    neg++;
  } else if (b2 > 0.0F) {
    pos++;
  }
  b2 = (yIndices1_data[2] - yIndices2_data[3]) *
           (xIndices2_data[0] - xIndices2_data[3]) -
       (xIndices1_data[2] - xIndices2_data[3]) *
           (yIndices2_data[0] - yIndices2_data[3]);
  if (b2 == 0.0F) {
    if ((xIndices1_data[2] - 0.001F <=
         std::fmax(xIndices2_data[3], xIndices2_data[0])) &&
        (xIndices1_data[2] + 0.001F >=
         std::fmin(xIndices2_data[3], xIndices2_data[0])) &&
        (yIndices1_data[2] - 0.001F <=
         std::fmax(yIndices2_data[3], yIndices2_data[0])) &&
        (yIndices1_data[2] + 0.001F >=
         std::fmin(yIndices2_data[3], yIndices2_data[0]))) {
      b_count++;
      pointsInsidePoly[b_count << 1] = xIndices1_data[2];
      pointsInsidePoly[(b_count << 1) + 1] = yIndices1_data[2];
    }
  } else if (b2 < 0.0F) {
    neg++;
  } else if (b2 > 0.0F) {
    pos++;
  }
  if ((static_cast<real_T>(neg) / 4.0 == 1.0) ||
      (static_cast<real_T>(pos) / 4.0 == 1.0)) {
    b_count++;
    pointsInsidePoly[b_count << 1] = xIndices1_data[2];
    pointsInsidePoly[(b_count << 1) + 1] = yIndices1_data[2];
  }
  neg = 0;
  pos = 0;
  b2 = (yIndices1_data[3] - yIndices2_data[0]) *
           (xIndices2_data[1] - xIndices2_data[0]) -
       (xIndices1_data[3] - xIndices2_data[0]) *
           (yIndices2_data[1] - yIndices2_data[0]);
  if (b2 == 0.0F) {
    if ((xIndices1_data[3] - 0.001F <=
         std::fmax(xIndices2_data[0], xIndices2_data[1])) &&
        (xIndices1_data[3] + 0.001F >=
         std::fmin(xIndices2_data[0], xIndices2_data[1])) &&
        (yIndices1_data[3] - 0.001F <=
         std::fmax(yIndices2_data[0], yIndices2_data[1])) &&
        (yIndices1_data[3] + 0.001F >=
         std::fmin(yIndices2_data[0], yIndices2_data[1]))) {
      b_count++;
      pointsInsidePoly[b_count << 1] = xIndices1_data[3];
      pointsInsidePoly[(b_count << 1) + 1] = yIndices1_data[3];
    }
  } else if (b2 < 0.0F) {
    neg = 1;
  } else if (b2 > 0.0F) {
    pos = 1;
  }
  b2 = (yIndices1_data[3] - yIndices2_data[1]) *
           (xIndices2_data[2] - xIndices2_data[1]) -
       (xIndices1_data[3] - xIndices2_data[1]) *
           (yIndices2_data[2] - yIndices2_data[1]);
  if (b2 == 0.0F) {
    if ((xIndices1_data[3] - 0.001F <=
         std::fmax(xIndices2_data[1], xIndices2_data[2])) &&
        (xIndices1_data[3] + 0.001F >=
         std::fmin(xIndices2_data[1], xIndices2_data[2])) &&
        (yIndices1_data[3] - 0.001F <=
         std::fmax(yIndices2_data[1], yIndices2_data[2])) &&
        (yIndices1_data[3] + 0.001F >=
         std::fmin(yIndices2_data[1], yIndices2_data[2]))) {
      b_count++;
      pointsInsidePoly[b_count << 1] = xIndices1_data[3];
      pointsInsidePoly[(b_count << 1) + 1] = yIndices1_data[3];
    }
  } else if (b2 < 0.0F) {
    neg++;
  } else if (b2 > 0.0F) {
    pos++;
  }
  b2 = (yIndices1_data[3] - yIndices2_data[2]) *
           (xIndices2_data[3] - xIndices2_data[2]) -
       (xIndices1_data[3] - xIndices2_data[2]) *
           (yIndices2_data[3] - yIndices2_data[2]);
  if (b2 == 0.0F) {
    if ((xIndices1_data[3] - 0.001F <=
         std::fmax(xIndices2_data[2], xIndices2_data[3])) &&
        (xIndices1_data[3] + 0.001F >=
         std::fmin(xIndices2_data[2], xIndices2_data[3])) &&
        (yIndices1_data[3] - 0.001F <=
         std::fmax(yIndices2_data[2], yIndices2_data[3])) &&
        (yIndices1_data[3] + 0.001F >=
         std::fmin(yIndices2_data[2], yIndices2_data[3]))) {
      b_count++;
      pointsInsidePoly[b_count << 1] = xIndices1_data[3];
      pointsInsidePoly[(b_count << 1) + 1] = yIndices1_data[3];
    }
  } else if (b2 < 0.0F) {
    neg++;
  } else if (b2 > 0.0F) {
    pos++;
  }
  b2 = (yIndices1_data[3] - yIndices2_data[3]) *
           (xIndices2_data[0] - xIndices2_data[3]) -
       (xIndices1_data[3] - xIndices2_data[3]) *
           (yIndices2_data[0] - yIndices2_data[3]);
  if (b2 == 0.0F) {
    if ((xIndices1_data[3] - 0.001F <=
         std::fmax(xIndices2_data[3], xIndices2_data[0])) &&
        (xIndices1_data[3] + 0.001F >=
         std::fmin(xIndices2_data[3], xIndices2_data[0])) &&
        (yIndices1_data[3] - 0.001F <=
         std::fmax(yIndices2_data[3], yIndices2_data[0])) &&
        (yIndices1_data[3] + 0.001F >=
         std::fmin(yIndices2_data[3], yIndices2_data[0]))) {
      b_count++;
      pointsInsidePoly[b_count << 1] = xIndices1_data[3];
      pointsInsidePoly[(b_count << 1) + 1] = yIndices1_data[3];
    }
  } else if (b2 < 0.0F) {
    neg++;
  } else if (b2 > 0.0F) {
    pos++;
  }
  if ((static_cast<real_T>(neg) / 4.0 == 1.0) ||
      (static_cast<real_T>(pos) / 4.0 == 1.0)) {
    b_count++;
    pointsInsidePoly[b_count << 1] = xIndices1_data[3];
    pointsInsidePoly[(b_count << 1) + 1] = yIndices1_data[3];
  }
  if (b_count + 1 < 1) {
    i = -1;
  } else {
    i = b_count;
  }
  std::memset(&b_pointsInsidePoly[0], 0, 16U * sizeof(real_T));
  b_count = -1;
  neg = 0;
  pos = 0;
  b2 = (yIndices2_data[0] - yIndices1_data[0]) *
           (xIndices1_data[1] - xIndices1_data[0]) -
       (xIndices2_data[0] - xIndices1_data[0]) *
           (yIndices1_data[1] - yIndices1_data[0]);
  if (b2 == 0.0F) {
    if ((xIndices2_data[0] - 0.001F <=
         std::fmax(xIndices1_data[0], xIndices1_data[1])) &&
        (xIndices2_data[0] + 0.001F >=
         std::fmin(xIndices1_data[0], xIndices1_data[1])) &&
        (yIndices2_data[0] - 0.001F <=
         std::fmax(yIndices1_data[0], yIndices1_data[1])) &&
        (yIndices2_data[0] + 0.001F >=
         std::fmin(yIndices1_data[0], yIndices1_data[1]))) {
      b_count = 0;
      b_pointsInsidePoly[0] = xIndices2_data[0];
      b_pointsInsidePoly[1] = yIndices2_data[0];
    }
  } else if (b2 < 0.0F) {
    neg = 1;
  } else if (b2 > 0.0F) {
    pos = 1;
  }
  b2 = (yIndices2_data[0] - yIndices1_data[1]) *
           (xIndices1_data[2] - xIndices1_data[1]) -
       (xIndices2_data[0] - xIndices1_data[1]) *
           (yIndices1_data[2] - yIndices1_data[1]);
  if (b2 == 0.0F) {
    if ((xIndices2_data[0] - 0.001F <=
         std::fmax(xIndices1_data[1], xIndices1_data[2])) &&
        (xIndices2_data[0] + 0.001F >=
         std::fmin(xIndices1_data[1], xIndices1_data[2])) &&
        (yIndices2_data[0] - 0.001F <=
         std::fmax(yIndices1_data[1], yIndices1_data[2])) &&
        (yIndices2_data[0] + 0.001F >=
         std::fmin(yIndices1_data[1], yIndices1_data[2]))) {
      b_count++;
      b_pointsInsidePoly[b_count << 1] = xIndices2_data[0];
      b_pointsInsidePoly[(b_count << 1) + 1] = yIndices2_data[0];
    }
  } else if (b2 < 0.0F) {
    neg++;
  } else if (b2 > 0.0F) {
    pos++;
  }
  b2 = (yIndices2_data[0] - yIndices1_data[2]) *
           (xIndices1_data[3] - xIndices1_data[2]) -
       (xIndices2_data[0] - xIndices1_data[2]) *
           (yIndices1_data[3] - yIndices1_data[2]);
  if (b2 == 0.0F) {
    if ((xIndices2_data[0] - 0.001F <=
         std::fmax(xIndices1_data[2], xIndices1_data[3])) &&
        (xIndices2_data[0] + 0.001F >=
         std::fmin(xIndices1_data[2], xIndices1_data[3])) &&
        (yIndices2_data[0] - 0.001F <=
         std::fmax(yIndices1_data[2], yIndices1_data[3])) &&
        (yIndices2_data[0] + 0.001F >=
         std::fmin(yIndices1_data[2], yIndices1_data[3]))) {
      b_count++;
      b_pointsInsidePoly[b_count << 1] = xIndices2_data[0];
      b_pointsInsidePoly[(b_count << 1) + 1] = yIndices2_data[0];
    }
  } else if (b2 < 0.0F) {
    neg++;
  } else if (b2 > 0.0F) {
    pos++;
  }
  b2 = (yIndices2_data[0] - yIndices1_data[3]) *
           (xIndices1_data[0] - xIndices1_data[3]) -
       (xIndices2_data[0] - xIndices1_data[3]) *
           (yIndices1_data[0] - yIndices1_data[3]);
  if (b2 == 0.0F) {
    if ((xIndices2_data[0] - 0.001F <=
         std::fmax(xIndices1_data[3], xIndices1_data[0])) &&
        (xIndices2_data[0] + 0.001F >=
         std::fmin(xIndices1_data[3], xIndices1_data[0])) &&
        (yIndices2_data[0] - 0.001F <=
         std::fmax(yIndices1_data[3], yIndices1_data[0])) &&
        (yIndices2_data[0] + 0.001F >=
         std::fmin(yIndices1_data[3], yIndices1_data[0]))) {
      b_count++;
      b_pointsInsidePoly[b_count << 1] = xIndices2_data[0];
      b_pointsInsidePoly[(b_count << 1) + 1] = yIndices2_data[0];
    }
  } else if (b2 < 0.0F) {
    neg++;
  } else if (b2 > 0.0F) {
    pos++;
  }
  if ((static_cast<real_T>(neg) / 4.0 == 1.0) ||
      (static_cast<real_T>(pos) / 4.0 == 1.0)) {
    b_count++;
    b_pointsInsidePoly[b_count << 1] = xIndices2_data[0];
    b_pointsInsidePoly[(b_count << 1) + 1] = yIndices2_data[0];
  }
  neg = 0;
  pos = 0;
  b2 = (yIndices2_data[1] - yIndices1_data[0]) *
           (xIndices1_data[1] - xIndices1_data[0]) -
       (xIndices2_data[1] - xIndices1_data[0]) *
           (yIndices1_data[1] - yIndices1_data[0]);
  if (b2 == 0.0F) {
    if ((xIndices2_data[1] - 0.001F <=
         std::fmax(xIndices1_data[0], xIndices1_data[1])) &&
        (xIndices2_data[1] + 0.001F >=
         std::fmin(xIndices1_data[0], xIndices1_data[1])) &&
        (yIndices2_data[1] - 0.001F <=
         std::fmax(yIndices1_data[0], yIndices1_data[1])) &&
        (yIndices2_data[1] + 0.001F >=
         std::fmin(yIndices1_data[0], yIndices1_data[1]))) {
      b_count++;
      b_pointsInsidePoly[b_count << 1] = xIndices2_data[1];
      b_pointsInsidePoly[(b_count << 1) + 1] = yIndices2_data[1];
    }
  } else if (b2 < 0.0F) {
    neg = 1;
  } else if (b2 > 0.0F) {
    pos = 1;
  }
  b2 = (yIndices2_data[1] - yIndices1_data[1]) *
           (xIndices1_data[2] - xIndices1_data[1]) -
       (xIndices2_data[1] - xIndices1_data[1]) *
           (yIndices1_data[2] - yIndices1_data[1]);
  if (b2 == 0.0F) {
    if ((xIndices2_data[1] - 0.001F <=
         std::fmax(xIndices1_data[1], xIndices1_data[2])) &&
        (xIndices2_data[1] + 0.001F >=
         std::fmin(xIndices1_data[1], xIndices1_data[2])) &&
        (yIndices2_data[1] - 0.001F <=
         std::fmax(yIndices1_data[1], yIndices1_data[2])) &&
        (yIndices2_data[1] + 0.001F >=
         std::fmin(yIndices1_data[1], yIndices1_data[2]))) {
      b_count++;
      b_pointsInsidePoly[b_count << 1] = xIndices2_data[1];
      b_pointsInsidePoly[(b_count << 1) + 1] = yIndices2_data[1];
    }
  } else if (b2 < 0.0F) {
    neg++;
  } else if (b2 > 0.0F) {
    pos++;
  }
  b2 = (yIndices2_data[1] - yIndices1_data[2]) *
           (xIndices1_data[3] - xIndices1_data[2]) -
       (xIndices2_data[1] - xIndices1_data[2]) *
           (yIndices1_data[3] - yIndices1_data[2]);
  if (b2 == 0.0F) {
    if ((xIndices2_data[1] - 0.001F <=
         std::fmax(xIndices1_data[2], xIndices1_data[3])) &&
        (xIndices2_data[1] + 0.001F >=
         std::fmin(xIndices1_data[2], xIndices1_data[3])) &&
        (yIndices2_data[1] - 0.001F <=
         std::fmax(yIndices1_data[2], yIndices1_data[3])) &&
        (yIndices2_data[1] + 0.001F >=
         std::fmin(yIndices1_data[2], yIndices1_data[3]))) {
      b_count++;
      b_pointsInsidePoly[b_count << 1] = xIndices2_data[1];
      b_pointsInsidePoly[(b_count << 1) + 1] = yIndices2_data[1];
    }
  } else if (b2 < 0.0F) {
    neg++;
  } else if (b2 > 0.0F) {
    pos++;
  }
  b2 = (yIndices2_data[1] - yIndices1_data[3]) *
           (xIndices1_data[0] - xIndices1_data[3]) -
       (xIndices2_data[1] - xIndices1_data[3]) *
           (yIndices1_data[0] - yIndices1_data[3]);
  if (b2 == 0.0F) {
    if ((xIndices2_data[1] - 0.001F <=
         std::fmax(xIndices1_data[3], xIndices1_data[0])) &&
        (xIndices2_data[1] + 0.001F >=
         std::fmin(xIndices1_data[3], xIndices1_data[0])) &&
        (yIndices2_data[1] - 0.001F <=
         std::fmax(yIndices1_data[3], yIndices1_data[0])) &&
        (yIndices2_data[1] + 0.001F >=
         std::fmin(yIndices1_data[3], yIndices1_data[0]))) {
      b_count++;
      b_pointsInsidePoly[b_count << 1] = xIndices2_data[1];
      b_pointsInsidePoly[(b_count << 1) + 1] = yIndices2_data[1];
    }
  } else if (b2 < 0.0F) {
    neg++;
  } else if (b2 > 0.0F) {
    pos++;
  }
  if ((static_cast<real_T>(neg) / 4.0 == 1.0) ||
      (static_cast<real_T>(pos) / 4.0 == 1.0)) {
    b_count++;
    b_pointsInsidePoly[b_count << 1] = xIndices2_data[1];
    b_pointsInsidePoly[(b_count << 1) + 1] = yIndices2_data[1];
  }
  neg = 0;
  pos = 0;
  b2 = (yIndices2_data[2] - yIndices1_data[0]) *
           (xIndices1_data[1] - xIndices1_data[0]) -
       (xIndices2_data[2] - xIndices1_data[0]) *
           (yIndices1_data[1] - yIndices1_data[0]);
  if (b2 == 0.0F) {
    if ((xIndices2_data[2] - 0.001F <=
         std::fmax(xIndices1_data[0], xIndices1_data[1])) &&
        (xIndices2_data[2] + 0.001F >=
         std::fmin(xIndices1_data[0], xIndices1_data[1])) &&
        (yIndices2_data[2] - 0.001F <=
         std::fmax(yIndices1_data[0], yIndices1_data[1])) &&
        (yIndices2_data[2] + 0.001F >=
         std::fmin(yIndices1_data[0], yIndices1_data[1]))) {
      b_count++;
      b_pointsInsidePoly[b_count << 1] = xIndices2_data[2];
      b_pointsInsidePoly[(b_count << 1) + 1] = yIndices2_data[2];
    }
  } else if (b2 < 0.0F) {
    neg = 1;
  } else if (b2 > 0.0F) {
    pos = 1;
  }
  b2 = (yIndices2_data[2] - yIndices1_data[1]) *
           (xIndices1_data[2] - xIndices1_data[1]) -
       (xIndices2_data[2] - xIndices1_data[1]) *
           (yIndices1_data[2] - yIndices1_data[1]);
  if (b2 == 0.0F) {
    if ((xIndices2_data[2] - 0.001F <=
         std::fmax(xIndices1_data[1], xIndices1_data[2])) &&
        (xIndices2_data[2] + 0.001F >=
         std::fmin(xIndices1_data[1], xIndices1_data[2])) &&
        (yIndices2_data[2] - 0.001F <=
         std::fmax(yIndices1_data[1], yIndices1_data[2])) &&
        (yIndices2_data[2] + 0.001F >=
         std::fmin(yIndices1_data[1], yIndices1_data[2]))) {
      b_count++;
      b_pointsInsidePoly[b_count << 1] = xIndices2_data[2];
      b_pointsInsidePoly[(b_count << 1) + 1] = yIndices2_data[2];
    }
  } else if (b2 < 0.0F) {
    neg++;
  } else if (b2 > 0.0F) {
    pos++;
  }
  b2 = (yIndices2_data[2] - yIndices1_data[2]) *
           (xIndices1_data[3] - xIndices1_data[2]) -
       (xIndices2_data[2] - xIndices1_data[2]) *
           (yIndices1_data[3] - yIndices1_data[2]);
  if (b2 == 0.0F) {
    if ((xIndices2_data[2] - 0.001F <=
         std::fmax(xIndices1_data[2], xIndices1_data[3])) &&
        (xIndices2_data[2] + 0.001F >=
         std::fmin(xIndices1_data[2], xIndices1_data[3])) &&
        (yIndices2_data[2] - 0.001F <=
         std::fmax(yIndices1_data[2], yIndices1_data[3])) &&
        (yIndices2_data[2] + 0.001F >=
         std::fmin(yIndices1_data[2], yIndices1_data[3]))) {
      b_count++;
      b_pointsInsidePoly[b_count << 1] = xIndices2_data[2];
      b_pointsInsidePoly[(b_count << 1) + 1] = yIndices2_data[2];
    }
  } else if (b2 < 0.0F) {
    neg++;
  } else if (b2 > 0.0F) {
    pos++;
  }
  b2 = (yIndices2_data[2] - yIndices1_data[3]) *
           (xIndices1_data[0] - xIndices1_data[3]) -
       (xIndices2_data[2] - xIndices1_data[3]) *
           (yIndices1_data[0] - yIndices1_data[3]);
  if (b2 == 0.0F) {
    if ((xIndices2_data[2] - 0.001F <=
         std::fmax(xIndices1_data[3], xIndices1_data[0])) &&
        (xIndices2_data[2] + 0.001F >=
         std::fmin(xIndices1_data[3], xIndices1_data[0])) &&
        (yIndices2_data[2] - 0.001F <=
         std::fmax(yIndices1_data[3], yIndices1_data[0])) &&
        (yIndices2_data[2] + 0.001F >=
         std::fmin(yIndices1_data[3], yIndices1_data[0]))) {
      b_count++;
      b_pointsInsidePoly[b_count << 1] = xIndices2_data[2];
      b_pointsInsidePoly[(b_count << 1) + 1] = yIndices2_data[2];
    }
  } else if (b2 < 0.0F) {
    neg++;
  } else if (b2 > 0.0F) {
    pos++;
  }
  if ((static_cast<real_T>(neg) / 4.0 == 1.0) ||
      (static_cast<real_T>(pos) / 4.0 == 1.0)) {
    b_count++;
    b_pointsInsidePoly[b_count << 1] = xIndices2_data[2];
    b_pointsInsidePoly[(b_count << 1) + 1] = yIndices2_data[2];
  }
  neg = 0;
  pos = 0;
  b2 = (yIndices2_data[3] - yIndices1_data[0]) *
           (xIndices1_data[1] - xIndices1_data[0]) -
       (xIndices2_data[3] - xIndices1_data[0]) *
           (yIndices1_data[1] - yIndices1_data[0]);
  if (b2 == 0.0F) {
    if ((xIndices2_data[3] - 0.001F <=
         std::fmax(xIndices1_data[0], xIndices1_data[1])) &&
        (xIndices2_data[3] + 0.001F >=
         std::fmin(xIndices1_data[0], xIndices1_data[1])) &&
        (yIndices2_data[3] - 0.001F <=
         std::fmax(yIndices1_data[0], yIndices1_data[1])) &&
        (yIndices2_data[3] + 0.001F >=
         std::fmin(yIndices1_data[0], yIndices1_data[1]))) {
      b_count++;
      b_pointsInsidePoly[b_count << 1] = xIndices2_data[3];
      b_pointsInsidePoly[(b_count << 1) + 1] = yIndices2_data[3];
    }
  } else if (b2 < 0.0F) {
    neg = 1;
  } else if (b2 > 0.0F) {
    pos = 1;
  }
  b2 = (yIndices2_data[3] - yIndices1_data[1]) *
           (xIndices1_data[2] - xIndices1_data[1]) -
       (xIndices2_data[3] - xIndices1_data[1]) *
           (yIndices1_data[2] - yIndices1_data[1]);
  if (b2 == 0.0F) {
    if ((xIndices2_data[3] - 0.001F <=
         std::fmax(xIndices1_data[1], xIndices1_data[2])) &&
        (xIndices2_data[3] + 0.001F >=
         std::fmin(xIndices1_data[1], xIndices1_data[2])) &&
        (yIndices2_data[3] - 0.001F <=
         std::fmax(yIndices1_data[1], yIndices1_data[2])) &&
        (yIndices2_data[3] + 0.001F >=
         std::fmin(yIndices1_data[1], yIndices1_data[2]))) {
      b_count++;
      b_pointsInsidePoly[b_count << 1] = xIndices2_data[3];
      b_pointsInsidePoly[(b_count << 1) + 1] = yIndices2_data[3];
    }
  } else if (b2 < 0.0F) {
    neg++;
  } else if (b2 > 0.0F) {
    pos++;
  }
  b2 = (yIndices2_data[3] - yIndices1_data[2]) *
           (xIndices1_data[3] - xIndices1_data[2]) -
       (xIndices2_data[3] - xIndices1_data[2]) *
           (yIndices1_data[3] - yIndices1_data[2]);
  if (b2 == 0.0F) {
    if ((xIndices2_data[3] - 0.001F <=
         std::fmax(xIndices1_data[2], xIndices1_data[3])) &&
        (xIndices2_data[3] + 0.001F >=
         std::fmin(xIndices1_data[2], xIndices1_data[3])) &&
        (yIndices2_data[3] - 0.001F <=
         std::fmax(yIndices1_data[2], yIndices1_data[3])) &&
        (yIndices2_data[3] + 0.001F >=
         std::fmin(yIndices1_data[2], yIndices1_data[3]))) {
      b_count++;
      b_pointsInsidePoly[b_count << 1] = xIndices2_data[3];
      b_pointsInsidePoly[(b_count << 1) + 1] = yIndices2_data[3];
    }
  } else if (b2 < 0.0F) {
    neg++;
  } else if (b2 > 0.0F) {
    pos++;
  }
  b2 = (yIndices2_data[3] - yIndices1_data[3]) *
           (xIndices1_data[0] - xIndices1_data[3]) -
       (xIndices2_data[3] - xIndices1_data[3]) *
           (yIndices1_data[0] - yIndices1_data[3]);
  if (b2 == 0.0F) {
    if ((xIndices2_data[3] - 0.001F <=
         std::fmax(xIndices1_data[3], xIndices1_data[0])) &&
        (xIndices2_data[3] + 0.001F >=
         std::fmin(xIndices1_data[3], xIndices1_data[0])) &&
        (yIndices2_data[3] - 0.001F <=
         std::fmax(yIndices1_data[3], yIndices1_data[0])) &&
        (yIndices2_data[3] + 0.001F >=
         std::fmin(yIndices1_data[3], yIndices1_data[0]))) {
      b_count++;
      b_pointsInsidePoly[b_count << 1] = xIndices2_data[3];
      b_pointsInsidePoly[(b_count << 1) + 1] = yIndices2_data[3];
    }
  } else if (b2 < 0.0F) {
    neg++;
  } else if (b2 > 0.0F) {
    pos++;
  }
  if ((static_cast<real_T>(neg) / 4.0 == 1.0) ||
      (static_cast<real_T>(pos) / 4.0 == 1.0)) {
    b_count++;
    b_pointsInsidePoly[b_count << 1] = xIndices2_data[3];
    b_pointsInsidePoly[(b_count << 1) + 1] = yIndices2_data[3];
  }
  if (b_count + 1 < 1) {
    neg = -1;
  } else {
    neg = b_count;
  }
  if (count + 1 < 1) {
    b_count = -1;
  } else {
    b_count = count;
  }
  overlapedPolyPts_size[0] = 2;
  overlapedPolyPts_size[1] = ((b_count + i) + neg) + 3;
  for (pos = 0; pos <= b_count; pos++) {
    overlapedPolyPts_data[2 * pos] = overlapedPolyPts[pos << 1];
    overlapedPolyPts_data[2 * pos + 1] = overlapedPolyPts[(pos << 1) + 1];
  }
  for (pos = 0; pos <= i; pos++) {
    overlapedPolyPts_data[2 * ((pos + b_count) + 1)] =
        pointsInsidePoly[pos << 1];
    overlapedPolyPts_data[2 * ((pos + b_count) + 1) + 1] =
        pointsInsidePoly[(pos << 1) + 1];
  }
  for (pos = 0; pos <= neg; pos++) {
    overlapedPolyPts_data[2 * (((pos + b_count) + i) + 2)] =
        b_pointsInsidePoly[pos << 1];
    overlapedPolyPts_data[2 * (((pos + b_count) + i) + 2) + 1] =
        b_pointsInsidePoly[(pos << 1) + 1];
  }
}

void d_overlapPolygonRotatedRects_fi(real_T overlapedPolyPts_data[],
                                     int32_T overlapedPolyPts_size[2],
                                     real_T overlapPoly_data[],
                                     int32_T overlapPoly_size[2])
{
  real_T distVec_data[48];
  real_T theta_data[24];
  real_T center_idx_0;
  real_T center_idx_1;
  int32_T iidx_data[24];
  int32_T iidx_size[2];
  int32_T theta_size[2];
  int32_T vlen;
  int32_T xoffset;
  vlen = overlapedPolyPts_size[1];
  if (overlapedPolyPts_size[1] == 0) {
    center_idx_0 = 0.0;
    center_idx_1 = 0.0;
  } else {
    center_idx_0 = overlapedPolyPts_data[0];
    center_idx_1 = overlapedPolyPts_data[1];
    for (int32_T k{0}; k <= vlen - 2; k++) {
      xoffset = (k + 1) << 1;
      center_idx_0 += overlapedPolyPts_data[xoffset];
      center_idx_1 += overlapedPolyPts_data[xoffset + 1];
    }
  }
  center_idx_0 /= static_cast<real_T>(overlapedPolyPts_size[1]);
  center_idx_1 /= static_cast<real_T>(overlapedPolyPts_size[1]);
  vlen = overlapedPolyPts_size[1];
  for (xoffset = 0; xoffset < overlapedPolyPts_size[1]; xoffset++) {
    distVec_data[2 * xoffset] =
        overlapedPolyPts_data[2 * xoffset] - center_idx_0;
    distVec_data[2 * xoffset + 1] =
        overlapedPolyPts_data[2 * xoffset + 1] - center_idx_1;
  }
  theta_size[0] = 1;
  theta_size[1] = overlapedPolyPts_size[1];
  for (int32_T k{0}; k < vlen; k++) {
    theta_data[k] = rt_atan2d_snf(distVec_data[2 * k + 1], distVec_data[2 * k]);
  }
  ::coder::internal::sort(theta_data, theta_size, iidx_data, iidx_size);
  vlen = iidx_size[1];
  for (xoffset = 0; xoffset < iidx_size[1]; xoffset++) {
    distVec_data[2 * xoffset] =
        overlapedPolyPts_data[2 * (iidx_data[xoffset] - 1)];
    distVec_data[2 * xoffset + 1] =
        overlapedPolyPts_data[2 * (iidx_data[xoffset] - 1) + 1];
  }
  for (xoffset = 0; xoffset < (vlen << 1); xoffset++) {
    overlapedPolyPts_data[xoffset] = distVec_data[xoffset];
  }
  overlapPoly_size[0] = 2;
  overlapPoly_size[1] = iidx_size[1] + 1;
  vlen = iidx_size[1];
  for (xoffset = 0; xoffset < vlen; xoffset++) {
    overlapPoly_data[2 * xoffset] = overlapedPolyPts_data[2 * xoffset];
    overlapPoly_data[2 * xoffset + 1] = overlapedPolyPts_data[2 * xoffset + 1];
  }
  overlapPoly_data[2 * iidx_size[1]] = overlapedPolyPts_data[0];
  overlapPoly_data[2 * iidx_size[1] + 1] = overlapedPolyPts_data[1];
}

} // namespace detector
} // namespace internal
} // namespace vision
} // namespace coder

// End of code generation (overlapPolygonRotatedRects.cu)
