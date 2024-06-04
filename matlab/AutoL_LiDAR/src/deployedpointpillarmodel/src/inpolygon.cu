//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: inpolygon.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "inpolygon.h"
#include "colon.h"
#include "find.h"
#include "minOrMax.h"
#include "rt_nonfinite.h"
#include "coder_array.h"
#include <cmath>

// Function Declarations
static void binary_expand_op_13(coder::array<bool, 1U> &in1,
                                const coder::array<bool, 1U> &in2, int in3);

static void binary_expand_op_14(coder::array<bool, 1U> &in1,
                                const coder::array<bool, 1U> &in2,
                                const coder::array<float, 1U> &in3);

static void binary_expand_op_15(coder::array<bool, 1U> &in1,
                                const coder::array<float, 1U> &in2, float in3,
                                float in4, const coder::array<float, 1U> &in5,
                                float in6, float in7);

// Function Definitions
//
// Arguments    : coder::array<bool, 1U> &in1
//                const coder::array<bool, 1U> &in2
//                int in3
// Return Type  : void
//
static void binary_expand_op_13(coder::array<bool, 1U> &in1,
                                const coder::array<bool, 1U> &in2, int in3)
{
  coder::array<bool, 1U> r;
  int b;
  int stride_0_0;
  int stride_1_0;
  r.set_size(in3 + 2);
  r[0] = true;
  for (int i{0}; i <= in3; i++) {
    r[i + 1] = in2[i];
  }
  if (r.size(0) == 1) {
    b = in2.size(0);
  } else {
    b = r.size(0);
  }
  in1.set_size(b);
  stride_0_0 = (in2.size(0) != 1);
  stride_1_0 = (r.size(0) != 1);
  if (r.size(0) == 1) {
    b = in2.size(0);
  } else {
    b = r.size(0);
  }
  for (int i{0}; i < b; i++) {
    in1[i] = (in2[i * stride_0_0] && r[i * stride_1_0]);
  }
}

//
// Arguments    : coder::array<bool, 1U> &in1
//                const coder::array<bool, 1U> &in2
//                const coder::array<float, 1U> &in3
// Return Type  : void
//
static void binary_expand_op_14(coder::array<bool, 1U> &in1,
                                const coder::array<bool, 1U> &in2,
                                const coder::array<float, 1U> &in3)
{
  int b;
  int stride_0_0;
  int stride_1_0;
  if (in3.size(0) == 1) {
    b = in2.size(0);
  } else {
    b = in3.size(0);
  }
  in1.set_size(b);
  stride_0_0 = (in2.size(0) != 1);
  stride_1_0 = (in3.size(0) != 1);
  if (in3.size(0) == 1) {
    b = in2.size(0);
  } else {
    b = in3.size(0);
  }
  for (int i{0}; i < b; i++) {
    in1[i] = (in2[i * stride_0_0] || std::isnan(in3[i * stride_1_0]));
  }
}

//
// Arguments    : coder::array<bool, 1U> &in1
//                const coder::array<float, 1U> &in2
//                float in3
//                float in4
//                const coder::array<float, 1U> &in5
//                float in6
//                float in7
// Return Type  : void
//
static void binary_expand_op_15(coder::array<bool, 1U> &in1,
                                const coder::array<float, 1U> &in2, float in3,
                                float in4, const coder::array<float, 1U> &in5,
                                float in6, float in7)
{
  int b;
  int stride_0_0;
  int stride_1_0;
  int stride_2_0;
  if (in5.size(0) == 1) {
    b = in2.size(0);
  } else {
    b = in5.size(0);
  }
  in1.set_size(b);
  stride_0_0 = (in2.size(0) != 1);
  stride_1_0 = (in5.size(0) != 1);
  stride_2_0 = (in5.size(0) != 1);
  if (in5.size(0) == 1) {
    b = in2.size(0);
  } else {
    b = in5.size(0);
  }
  for (int i{0}; i < b; i++) {
    in1[i] = ((in2[i * stride_0_0] >= in3) && (in2[i * stride_0_0] <= in4) &&
              (in5[i * stride_1_0] >= in6) && (in5[i * stride_2_0] <= in7));
  }
}

//
// Arguments    : const array<float, 1U> &points_x
//                const array<float, 1U> &points_y
//                const array<float, 1U> &polygon_x
//                const array<float, 1U> &polygon_y
//                array<bool, 2U> &in
// Return Type  : void
//
namespace coder {
namespace images {
namespace internal {
namespace coder {
void inpolygon(const array<float, 1U> &points_x,
               const array<float, 1U> &points_y,
               const array<float, 1U> &polygon_x,
               const array<float, 1U> &polygon_y, array<bool, 2U> &in)
{
  array<double, 2U> signCrossProd;
  array<float, 2U> dotProd;
  array<float, 2U> translatedPolygon_x;
  array<float, 2U> translatedPolygon_y;
  array<float, 1U> closedPolygon_x;
  array<float, 1U> closedPolygon_y;
  array<float, 1U> newPolygon_x;
  array<float, 1U> newPolygon_y;
  array<float, 1U> scaledEps;
  array<int, 2U> iv3;
  array<int, 2U> iv4;
  array<int, 1U> NaNLocations;
  array<int, 1U> inBoundsPointsIdx;
  array<bool, 1U> b_in;
  array<bool, 1U> b_x;
  array<bool, 1U> mask;
  array<bool, 1U> r;
  array<bool, 1U> r1;
  array<bool, 1U> redundantNaNPositions;
  array<bool, 1U> xNaNPositions;
  float avx;
  float avy;
  float maxval;
  float minval;
  unsigned int inputSize_idx_0;
  int ix;
  bool addTrailingNaN;
  bool exitg1;
  inputSize_idx_0 = static_cast<unsigned int>(points_x.size(0));
  avx = ::coder::internal::minimum(polygon_x);
  avy = ::coder::internal::maximum(polygon_x);
  minval = ::coder::internal::minimum(polygon_y);
  maxval = ::coder::internal::maximum(polygon_y);
  if (points_x.size(0) == 1) {
    ix = points_y.size(0);
  } else {
    ix = points_x.size(0);
  }
  if ((points_x.size(0) == points_y.size(0)) && (ix == points_y.size(0))) {
    mask.set_size(points_x.size(0));
    for (int i{0}; i < points_x.size(0); i++) {
      mask[i] = ((points_x[i] >= avx) && (points_x[i] <= avy) &&
                 (points_y[i] >= minval) && (points_y[i] <= maxval));
    }
  } else {
    binary_expand_op_15(mask, points_x, avx, avy, points_y, minval, maxval);
  }
  addTrailingNaN = false;
  ix = 1;
  exitg1 = false;
  while ((!exitg1) && (ix <= mask.size(0))) {
    if (mask[ix - 1]) {
      addTrailingNaN = true;
      exitg1 = true;
    } else {
      ix++;
    }
  }
  if (!addTrailingNaN) {
    in.set_size(points_x.size(0), 1);
    for (int i{0}; i < static_cast<int>(inputSize_idx_0); i++) {
      in[i] = false;
    }
  } else {
    double newNumberOfVertices;
    int b_i;
    int idxOffset;
    int k;
    int p;
    xNaNPositions.set_size(polygon_x.size(0));
    for (int i{0}; i < polygon_x.size(0); i++) {
      xNaNPositions[i] = std::isnan(polygon_x[i]);
    }
    if (xNaNPositions.size(0) == polygon_y.size(0)) {
      b_x.set_size(xNaNPositions.size(0));
      for (int i{0}; i < xNaNPositions.size(0); i++) {
        b_x[i] = (xNaNPositions[i] || std::isnan(polygon_y[i]));
      }
    } else {
      binary_expand_op_14(b_x, xNaNPositions, polygon_y);
    }
    addTrailingNaN = false;
    ix = 1;
    exitg1 = false;
    while ((!exitg1) && (ix <= b_x.size(0))) {
      if (b_x[ix - 1]) {
        addTrailingNaN = true;
        exitg1 = true;
      } else {
        ix++;
      }
    }
    if (!addTrailingNaN) {
      if (polygon_x.size(0) < 3) {
        closedPolygon_x.set_size(polygon_x.size(0));
        for (int i{0}; i < polygon_x.size(0); i++) {
          closedPolygon_x[i] = polygon_x[i];
        }
        closedPolygon_y.set_size(polygon_y.size(0));
        for (int i{0}; i < polygon_y.size(0); i++) {
          closedPolygon_y[i] = polygon_y[i];
        }
      } else if ((polygon_x[0] != polygon_x[polygon_x.size(0) - 1]) ||
                 (polygon_y[0] != polygon_y[polygon_y.size(0) - 1])) {
        closedPolygon_x.set_size(polygon_x.size(0) + 1);
        ix = polygon_x.size(0);
        for (int i{0}; i < ix; i++) {
          closedPolygon_x[i] = polygon_x[i];
        }
        closedPolygon_x[polygon_x.size(0)] = polygon_x[0];
        closedPolygon_y.set_size(polygon_y.size(0) + 1);
        ix = polygon_y.size(0);
        for (int i{0}; i < ix; i++) {
          closedPolygon_y[i] = polygon_y[i];
        }
        closedPolygon_y[polygon_y.size(0)] = polygon_y[0];
      } else {
        closedPolygon_x.set_size(polygon_x.size(0));
        for (int i{0}; i < polygon_x.size(0); i++) {
          closedPolygon_x[i] = polygon_x[i];
        }
        closedPolygon_y.set_size(polygon_y.size(0));
        for (int i{0}; i < polygon_y.size(0); i++) {
          closedPolygon_y[i] = polygon_y[i];
        }
      }
    } else {
      int startIdx;
      if (xNaNPositions.size(0) - 1 < 1) {
        b_i = 1;
      } else {
        b_i = xNaNPositions.size(0);
      }
      if (xNaNPositions.size(0) == b_i) {
        r.set_size(b_i);
        r[0] = true;
        for (int i{0}; i <= b_i - 2; i++) {
          r[i + 1] = xNaNPositions[i];
        }
        redundantNaNPositions.set_size(xNaNPositions.size(0));
        for (int i{0}; i < xNaNPositions.size(0); i++) {
          redundantNaNPositions[i] = (xNaNPositions[i] && r[i]);
        }
      } else {
        binary_expand_op_13(redundantNaNPositions, xNaNPositions, b_i - 2);
      }
      addTrailingNaN = !std::isnan(polygon_x[polygon_x.size(0) - 1]);
      ix = 0;
      b_i = redundantNaNPositions.size(0);
      for (k = 0; k < b_i; k++) {
        if (redundantNaNPositions[k]) {
          ix++;
        }
      }
      newNumberOfVertices = static_cast<double>(polygon_x.size(0) - ix) +
                            static_cast<double>(addTrailingNaN);
      newPolygon_x.set_size(static_cast<int>(newNumberOfVertices));
      newPolygon_y.set_size(static_cast<int>(newNumberOfVertices));
      p = 0;
      ix = polygon_x.size(0);
      for (k = 0; k < ix; k++) {
        if (!redundantNaNPositions[k]) {
          newPolygon_x[p] = polygon_x[k];
          newPolygon_y[p] = polygon_y[k];
          p++;
        }
      }
      if (addTrailingNaN) {
        newPolygon_x[p] = rtNaNF;
        newPolygon_y[p] = rtNaNF;
      }
      r1.set_size(newPolygon_x.size(0));
      for (int i{0}; i < newPolygon_x.size(0); i++) {
        r1[i] = std::isnan(newPolygon_x[i]);
      }
      eml_find(r1, NaNLocations);
      startIdx = 0;
      newNumberOfVertices = 0.0;
      ix = NaNLocations.size(0);
      for (k = 0; k < ix; k++) {
        if ((newPolygon_x[startIdx] == newPolygon_x[NaNLocations[k] - 2]) &&
            (newPolygon_y[startIdx] == newPolygon_y[NaNLocations[k] - 2])) {
          addTrailingNaN = true;
        } else {
          addTrailingNaN = false;
        }
        newNumberOfVertices += static_cast<double>(!addTrailingNaN);
        startIdx = NaNLocations[k];
      }
      if (newNumberOfVertices > 0.0) {
        newNumberOfVertices += static_cast<double>(newPolygon_x.size(0));
        closedPolygon_x.set_size(static_cast<int>(newNumberOfVertices));
        closedPolygon_y.set_size(static_cast<int>(newNumberOfVertices));
        startIdx = 0;
        idxOffset = -1;
        p = NaNLocations.size(0);
        for (k = 0; k < p; k++) {
          if (startIdx + 1 > NaNLocations[k] - 1) {
            ix = 0;
            b_i = 1;
          } else {
            ix = startIdx;
            b_i = NaNLocations[k];
          }
          eml_integer_colon_dispatcher(startIdx + 1, NaNLocations[k] - 1, iv3);
          for (int i{0}; i <= (b_i - ix) - 2; i++) {
            closedPolygon_x[iv3[i] + idxOffset] = newPolygon_x[ix + i];
          }
          if (startIdx + 1 > NaNLocations[k] - 1) {
            ix = 0;
            b_i = 1;
          } else {
            ix = startIdx;
            b_i = NaNLocations[k];
          }
          eml_integer_colon_dispatcher(startIdx + 1, NaNLocations[k] - 1, iv4);
          for (int i{0}; i <= (b_i - ix) - 2; i++) {
            closedPolygon_y[iv4[i] + idxOffset] = newPolygon_y[ix + i];
          }
          if ((!(newPolygon_x[startIdx] ==
                 newPolygon_x[NaNLocations[k] - 2])) ||
              (!(newPolygon_y[startIdx] ==
                 newPolygon_y[NaNLocations[k] - 2]))) {
            idxOffset++;
            closedPolygon_x[(idxOffset + NaNLocations[k]) - 1] =
                newPolygon_x[startIdx];
            closedPolygon_y[(idxOffset + NaNLocations[k]) - 1] =
                newPolygon_y[startIdx];
          }
          closedPolygon_x[idxOffset + NaNLocations[k]] = rtNaNF;
          closedPolygon_y[idxOffset + NaNLocations[k]] = rtNaNF;
          startIdx = NaNLocations[k];
        }
      } else {
        if (newPolygon_x.size(0) - 1 < 1) {
          ix = 0;
        } else {
          ix = newPolygon_x.size(0) - 1;
        }
        closedPolygon_x.set_size(ix);
        for (int i{0}; i < ix; i++) {
          closedPolygon_x[i] = newPolygon_x[i];
        }
        if (newPolygon_y.size(0) - 1 < 1) {
          ix = 0;
        } else {
          ix = newPolygon_y.size(0) - 1;
        }
        closedPolygon_y.set_size(ix);
        for (int i{0}; i < ix; i++) {
          closedPolygon_y[i] = newPolygon_y[i];
        }
      }
    }
    eml_find(mask, inBoundsPointsIdx);
    translatedPolygon_x.set_size(closedPolygon_x.size(0),
                                 inBoundsPointsIdx.size(0));
    translatedPolygon_y.set_size(closedPolygon_x.size(0),
                                 inBoundsPointsIdx.size(0));
    ix = inBoundsPointsIdx.size(0);
    for (p = 0; p < ix; p++) {
      b_i = closedPolygon_x.size(0);
      for (idxOffset = 0; idxOffset < b_i; idxOffset++) {
        translatedPolygon_x[idxOffset + translatedPolygon_x.size(0) * p] =
            closedPolygon_x[idxOffset] - points_x[inBoundsPointsIdx[p] - 1];
        translatedPolygon_y[idxOffset + translatedPolygon_y.size(0) * p] =
            closedPolygon_y[idxOffset] - points_y[inBoundsPointsIdx[p] - 1];
      }
    }
    scaledEps.set_size(closedPolygon_x.size(0) - 1);
    ix = closedPolygon_x.size(0);
    for (k = 0; k <= ix - 2; k++) {
      avx = std::abs(0.5F * (closedPolygon_x[k] + closedPolygon_x[k + 1]));
      avy = std::abs(0.5F * (closedPolygon_y[k] + closedPolygon_y[k + 1]));
      scaledEps[k] =
          std::fmax(std::fmax(avx, avy), avx * avy) * 2.22044605E-16F * 3.0F;
    }
    signCrossProd.set_size(translatedPolygon_x.size(0) - 1,
                           translatedPolygon_x.size(1));
    dotProd.set_size(translatedPolygon_x.size(0) - 1,
                     translatedPolygon_x.size(1));
    ix = translatedPolygon_x.size(1);
    b_in.set_size(translatedPolygon_x.size(1));
    for (p = 0; p < ix; p++) {
      double sumDiffQuad;
      b_i = translatedPolygon_x.size(0);
      sumDiffQuad = 0.0;
      for (idxOffset = 0; idxOffset <= b_i - 2; idxOffset++) {
        double d;
        double quadNum2;
        float b_y;
        float crossProd;
        bool isPositive_y;
        avx = translatedPolygon_x[idxOffset + translatedPolygon_x.size(0) * p];
        avy =
            translatedPolygon_x[(idxOffset + translatedPolygon_x.size(0) * p) +
                                1];
        minval =
            translatedPolygon_y[idxOffset + translatedPolygon_y.size(0) * p];
        maxval =
            translatedPolygon_y[(idxOffset + translatedPolygon_y.size(0) * p) +
                                1];
        dotProd[idxOffset + dotProd.size(0) * p] = avx * avy + minval * maxval;
        crossProd = maxval * avx - avy * minval;
        if (std::isnan(crossProd)) {
          b_y = rtNaNF;
        } else if (crossProd < 0.0F) {
          b_y = -1.0F;
        } else {
          b_y = (crossProd > 0.0F);
        }
        d = b_y;
        signCrossProd[idxOffset + signCrossProd.size(0) * p] = b_y;
        if (std::abs(crossProd) < scaledEps[idxOffset]) {
          d = 0.0;
          signCrossProd[idxOffset + signCrossProd.size(0) * p] = 0.0;
        }
        addTrailingNaN = (avx > 0.0F);
        isPositive_y = (minval > 0.0F);
        newNumberOfVertices =
            (static_cast<double>((!addTrailingNaN) && isPositive_y) +
             2.0 * static_cast<double>((!addTrailingNaN) && (!isPositive_y))) +
            3.0 * static_cast<double>(addTrailingNaN && (!isPositive_y));
        if (std::isnan(avx) || std::isnan(minval)) {
          newNumberOfVertices = rtNaN;
        }
        addTrailingNaN = (avy > 0.0F);
        isPositive_y = (maxval > 0.0F);
        quadNum2 =
            (static_cast<double>((!addTrailingNaN) && isPositive_y) +
             2.0 * static_cast<double>((!addTrailingNaN) && (!isPositive_y))) +
            3.0 * static_cast<double>(addTrailingNaN && (!isPositive_y));
        if (std::isnan(avy) || std::isnan(maxval)) {
          quadNum2 = rtNaN;
        }
        newNumberOfVertices = quadNum2 - newNumberOfVertices;
        if (std::abs(newNumberOfVertices) == 3.0) {
          newNumberOfVertices = -newNumberOfVertices / 3.0;
        } else if (std::abs(newNumberOfVertices) == 2.0) {
          newNumberOfVertices = 2.0 * d;
        } else if (std::isnan(newNumberOfVertices)) {
          newNumberOfVertices = 0.0;
        }
        sumDiffQuad += newNumberOfVertices;
      }
      b_in[p] = (sumDiffQuad != 0.0);
    }
    ix = signCrossProd.size(1);
    for (p = 0; p < ix; p++) {
      k = 0;
      exitg1 = false;
      while ((!exitg1) && (k <= signCrossProd.size(0) - 1)) {
        if ((signCrossProd[k + signCrossProd.size(0) * p] == 0.0) &&
            (dotProd[k + dotProd.size(0) * p] <= 0.0F)) {
          b_in[p] = true;
          exitg1 = true;
        } else {
          k++;
        }
      }
    }
    ix = b_in.size(0) - 1;
    for (b_i = 0; b_i <= ix; b_i++) {
      if (!b_in[b_i]) {
        mask[inBoundsPointsIdx[b_i] - 1] = false;
      }
    }
    in.set_size(points_x.size(0), 1);
    for (int i{0}; i < static_cast<int>(inputSize_idx_0); i++) {
      in[i] = mask[i];
    }
  }
}

} // namespace coder
} // namespace internal
} // namespace images
} // namespace coder

//
// File trailer for inpolygon.cu
//
// [EOF]
//
