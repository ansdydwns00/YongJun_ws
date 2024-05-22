//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: overlapPolygonRotatedRects.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "overlapPolygonRotatedRects.h"
#include "div.h"
#include "inpolygon.h"
#include "mtimes.h"
#include "rt_nonfinite.h"
#include "coder_array.h"
#include "coder_gpu_array.h"
#include <cmath>

// Function Declarations
static void binary_expand_op_12(coder::array<bool, 2U> &in1,
                                const coder::array<float, 2U> &in2, int in3,
                                int in4, int in5);

// Function Definitions
//
// Arguments    : coder::array<bool, 2U> &in1
//                const coder::array<float, 2U> &in2
//                int in3
//                int in4
//                int in5
// Return Type  : void
//
static void binary_expand_op_12(coder::array<bool, 2U> &in1,
                                const coder::array<float, 2U> &in2, int in3,
                                int in4, int in5)
{
  int b;
  int stride_0_1;
  int stride_1_1;
  if ((in5 - in4) + 1 == 1) {
    b = in3 + 1;
  } else {
    b = (in5 - in4) + 1;
  }
  in1.set_size(1, b);
  stride_0_1 = (in3 + 1 != 1);
  stride_1_1 = ((in5 - in4) + 1 != 1);
  if ((in5 - in4) + 1 == 1) {
    b = in3 + 1;
  } else {
    b = (in5 - in4) + 1;
  }
  for (int i{0}; i < b; i++) {
    in1[i] = (in2[i * stride_0_1] * in2[in4 + i * stride_1_1] <= 0.0F);
  }
}

//
// Arguments    : const array<float, 1U> &xIndices1
//                const array<float, 1U> &yIndices1
//                const array<float, 1U> &xIndices2
//                const array<float, 1U> &yIndices2
//                array<float, 2U> &overlapedPolyPts
// Return Type  : void
//
namespace coder {
namespace vision {
namespace internal {
namespace detector {
void overlapPolygonRotatedRects_findOverlapPolyPoints(
    const array<float, 1U> &xIndices1, const array<float, 1U> &yIndices1,
    const array<float, 1U> &xIndices2, const array<float, 1U> &yIndices2,
    array<float, 2U> &overlapedPolyPts)
{
  array<float, 2U> b_cpu_b;
  array<float, 2U> b_polyEdges1;
  array<float, 2U> b_polyEdges2;
  array<float, 2U> cn;
  array<float, 2U> cpu_b;
  array<float, 2U> cpu_crossProd;
  array<float, 2U> cpu_transPolyEdge2;
  array<float, 2U> cpu_y1;
  array<float, 2U> cpu_y2;
  array<float, 2U> crossProdSign;
  array<float, 2U> d_y;
  array<float, 2U> e_y;
  array<float, 2U> intersectPoints;
  array<float, 2U> padEdges2;
  array<float, 2U> polyEdges1;
  array<float, 2U> polyEdges2;
  array<float, 2U> x1;
  array<float, 2U> x2;
  array<int, 2U> b_y;
  array<int, 2U> c_y;
  array<int, 2U> ii;
  array<int, 2U> r2;
  array<int, 1U> r;
  array<int, 1U> r1;
  array<bool, 2U> b_x;
  array<bool, 2U> c_x;
  array<bool, 2U> indices;
  array<bool, 2U> insideInd1;
  array<bool, 2U> insideInd2;
  gpu_array<float, 2U> b_gpu_b;
  gpu_array<float, 2U> gpu_b;
  gpu_array<float, 2U> gpu_crossProd;
  gpu_array<float, 2U> gpu_transPolyEdge2;
  gpu_array<float, 2U> gpu_y1;
  gpu_array<float, 2U> gpu_y2;
  float cpu_dist[2];
  float(*gpu_dist)[2];
  int acoef;
  int csz_idx_1;
  int i;
  int idx;
  int k;
  int nx;
  unsigned int sz_idx_1;
  bool b_b_outdatedOnCpu;
  bool b_b_outdatedOnGpu;
  bool b_outdatedOnCpu;
  bool b_outdatedOnGpu;
  bool crossProd_outdatedOnCpu;
  bool crossProd_outdatedOnGpu;
  bool exitg1;
  bool p;
  bool transPolyEdge2_outdatedOnCpu;
  bool transPolyEdge2_outdatedOnGpu;
  bool y1_outdatedOnCpu;
  bool y1_outdatedOnGpu;
  bool y2_outdatedOnCpu;
  bool y2_outdatedOnGpu;
  cudaMalloc(&gpu_dist, 8ULL);
  y2_outdatedOnCpu = false;
  y2_outdatedOnGpu = false;
  b_b_outdatedOnCpu = false;
  b_b_outdatedOnGpu = false;
  y1_outdatedOnCpu = false;
  y1_outdatedOnGpu = false;
  b_outdatedOnCpu = false;
  b_outdatedOnGpu = false;
  crossProd_outdatedOnCpu = false;
  crossProd_outdatedOnGpu = false;
  transPolyEdge2_outdatedOnCpu = false;
  transPolyEdge2_outdatedOnGpu = false;
  polyEdges1.set_size(2, xIndices1.size(0));
  nx = xIndices1.size(0);
  for (k = 0; k < nx; k++) {
    polyEdges1[2 * k] = xIndices1[k];
  }
  nx = yIndices1.size(0);
  for (k = 0; k < nx; k++) {
    polyEdges1[2 * k + 1] = yIndices1[k];
  }
  polyEdges2.set_size(2, xIndices2.size(0));
  nx = xIndices2.size(0);
  for (k = 0; k < nx; k++) {
    polyEdges2[2 * k] = xIndices2[k];
  }
  nx = yIndices2.size(0);
  for (k = 0; k < nx; k++) {
    polyEdges2[2 * k + 1] = yIndices2[k];
  }
  p = true;
  k = 0;
  exitg1 = false;
  while ((!exitg1) && (k < 2)) {
    if (!(polyEdges1[k] == polyEdges1[k + 2 * (polyEdges1.size(1) - 1)])) {
      p = false;
      exitg1 = true;
    } else {
      k++;
    }
  }
  if (!p) {
    b_polyEdges1.set_size(2, polyEdges1.size(1) + 1);
    nx = polyEdges1.size(1);
    for (k = 0; k < nx; k++) {
      b_polyEdges1[2 * k] = polyEdges1[2 * k];
      b_polyEdges1[2 * k + 1] = polyEdges1[2 * k + 1];
    }
    b_polyEdges1[2 * polyEdges1.size(1)] = polyEdges1[0];
    b_polyEdges1[2 * polyEdges1.size(1) + 1] = polyEdges1[1];
    polyEdges1.set_size(2, b_polyEdges1.size(1));
    for (k = 0; k < (b_polyEdges1.size(1) << 1); k++) {
      polyEdges1[k] = b_polyEdges1[k];
    }
  }
  p = true;
  k = 0;
  exitg1 = false;
  while ((!exitg1) && (k < 2)) {
    if (!(polyEdges2[k] == polyEdges2[k + 2 * (polyEdges2.size(1) - 1)])) {
      p = false;
      exitg1 = true;
    } else {
      k++;
    }
  }
  if (!p) {
    b_polyEdges2.set_size(2, polyEdges2.size(1) + 1);
    nx = polyEdges2.size(1);
    for (k = 0; k < nx; k++) {
      b_polyEdges2[2 * k] = polyEdges2[2 * k];
      b_polyEdges2[2 * k + 1] = polyEdges2[2 * k + 1];
    }
    b_polyEdges2[2 * polyEdges2.size(1)] = polyEdges2[0];
    b_polyEdges2[2 * polyEdges2.size(1) + 1] = polyEdges2[1];
    polyEdges2.set_size(2, b_polyEdges2.size(1));
    for (k = 0; k < (b_polyEdges2.size(1) << 1); k++) {
      polyEdges2[k] = b_polyEdges2[k];
    }
  }
  if (polyEdges1.size(1) > polyEdges2.size(1)) {
    padEdges2.set_size(2, polyEdges1.size(1));
    for (k = 0; k < (polyEdges1.size(1) << 1); k++) {
      padEdges2[k] = polyEdges1[k];
    }
    polyEdges1.set_size(2, polyEdges2.size(1));
    for (k = 0; k < (polyEdges2.size(1) << 1); k++) {
      polyEdges1[k] = polyEdges2[k];
    }
    polyEdges2.set_size(2, padEdges2.size(1));
    for (k = 0; k < (padEdges2.size(1) << 1); k++) {
      polyEdges2[k] = padEdges2[k];
    }
  }
  intersectPoints.set_size(2, 0);
  i = polyEdges1.size(1);
  if (polyEdges1.size(1) - 2 >= 0) {
    csz_idx_1 = polyEdges2.size(1);
  }
  for (int n{0}; n <= i - 2; n++) {
    float point2_idx_0;
    float point2_idx_1;
    float u;
    cpu_transPolyEdge2.set_size(2, csz_idx_1);
    if (!transPolyEdge2_outdatedOnGpu) {
      gpu_transPolyEdge2.set_size(&cpu_transPolyEdge2);
    }
    if (csz_idx_1 != 0) {
      acoef = (polyEdges2.size(1) != 1);
      nx = csz_idx_1 - 1;
      for (k = 0; k <= nx; k++) {
        idx = acoef * k;
        if (transPolyEdge2_outdatedOnCpu) {
          arrayCopyGpuToCpu(cpu_transPolyEdge2, gpu_transPolyEdge2);
        }
        cpu_transPolyEdge2[2 * k] = polyEdges2[2 * idx] - polyEdges1[2 * n];
        cpu_transPolyEdge2[2 * k + 1] =
            polyEdges2[2 * idx + 1] - polyEdges1[2 * n + 1];
        transPolyEdge2_outdatedOnCpu = false;
        transPolyEdge2_outdatedOnGpu = true;
      }
    }
    point2_idx_0 = polyEdges1[2 * (n + 1)] - polyEdges1[2 * n];
    point2_idx_1 = polyEdges1[2 * (n + 1) + 1] - polyEdges1[2 * n + 1];
    cpu_dist[0] = point2_idx_1;
    cpu_dist[1] = -point2_idx_0;
    cudaMemcpy(*gpu_dist, cpu_dist, 8ULL, cudaMemcpyHostToDevice);
    ::coder::internal::blas::mtimes(
        *gpu_dist, cpu_transPolyEdge2, &transPolyEdge2_outdatedOnCpu,
        gpu_transPolyEdge2, &transPolyEdge2_outdatedOnGpu, cpu_crossProd,
        &crossProd_outdatedOnCpu, gpu_crossProd, &crossProd_outdatedOnGpu);
    crossProdSign.set_size(1, cpu_crossProd.size(1));
    for (k = 0; k < cpu_crossProd.size(1); k++) {
      if (crossProd_outdatedOnCpu) {
        arrayCopyGpuToCpu(cpu_crossProd, gpu_crossProd);
      }
      crossProd_outdatedOnCpu = false;
      u = cpu_crossProd[k];
      if (std::isnan(u)) {
        u = rtNaNF;
      } else if (u < 0.0F) {
        u = -1.0F;
      } else {
        u = (u > 0.0F);
      }
      crossProdSign[k] = u;
    }
    if (crossProdSign.size(1) - 1 < 1) {
      idx = 0;
    } else {
      idx = crossProdSign.size(1) - 1;
    }
    if (crossProdSign.size(1) < 2) {
      acoef = 0;
      nx = 0;
    } else {
      acoef = 1;
      nx = crossProdSign.size(1);
    }
    if (idx == nx - acoef) {
      indices.set_size(1, idx);
      for (k = 0; k < idx; k++) {
        indices[k] = (crossProdSign[k] * crossProdSign[acoef + k] <= 0.0F);
      }
    } else {
      binary_expand_op_12(indices, crossProdSign, idx - 1, acoef, nx - 1);
    }
    p = false;
    nx = 1;
    exitg1 = false;
    while ((!exitg1) && (nx <= indices.size(1))) {
      if (indices[nx - 1]) {
        p = true;
        exitg1 = true;
      } else {
        nx++;
      }
    }
    if (p) {
      nx = indices.size(1);
      idx = 0;
      ii.set_size(1, indices.size(1));
      acoef = 1;
      exitg1 = false;
      while ((!exitg1) && (acoef <= nx)) {
        if (indices[acoef - 1]) {
          idx++;
          ii[idx - 1] = acoef;
          if (idx >= nx) {
            exitg1 = true;
          } else {
            acoef++;
          }
        } else {
          acoef++;
        }
      }
      if (indices.size(1) == 1) {
        if (idx == 0) {
          ii.set_size(1, 0);
        }
      } else {
        if (idx < 1) {
          idx = 0;
        }
        ii.set_size(ii.size(0), idx);
      }
      x1.set_size(1, ii.size(1));
      x2.set_size(1, ii.size(1));
      for (k = 0; k < ii.size(1); k++) {
        if (crossProd_outdatedOnCpu) {
          arrayCopyGpuToCpu(cpu_crossProd, gpu_crossProd);
        }
        x1[k] = cpu_crossProd[ii[k] - 1];
        crossProd_outdatedOnCpu = false;
        x2[k] = cpu_crossProd[ii[k]];
      }
      u = point2_idx_0 * point2_idx_0 + point2_idx_1 * point2_idx_1;
      cpu_dist[0] = point2_idx_0 / u;
      cpu_dist[1] = point2_idx_1 / u;
      cpu_b.set_size(2, ii.size(1));
      if (!b_outdatedOnGpu) {
        gpu_b.set_size(&cpu_b);
      }
      for (k = 0; k < ii.size(1); k++) {
        if (b_outdatedOnCpu) {
          arrayCopyGpuToCpu(cpu_b, gpu_b);
        }
        if (transPolyEdge2_outdatedOnCpu) {
          arrayCopyGpuToCpu(cpu_transPolyEdge2, gpu_transPolyEdge2);
        }
        cpu_b[2 * k] = cpu_transPolyEdge2[2 * (ii[k] - 1)];
        transPolyEdge2_outdatedOnCpu = false;
        cpu_b[2 * k + 1] = cpu_transPolyEdge2[2 * (ii[k] - 1) + 1];
        b_outdatedOnCpu = false;
        b_outdatedOnGpu = true;
      }
      cudaMemcpy(*gpu_dist, cpu_dist, 8ULL, cudaMemcpyHostToDevice);
      ::coder::internal::blas::mtimes(
          *gpu_dist, cpu_b, &b_outdatedOnCpu, gpu_b, &b_outdatedOnGpu, cpu_y1,
          &y1_outdatedOnCpu, gpu_y1, &y1_outdatedOnGpu);
      b_cpu_b.set_size(2, ii.size(1));
      if (!b_b_outdatedOnGpu) {
        b_gpu_b.set_size(&b_cpu_b);
      }
      for (k = 0; k < ii.size(1); k++) {
        if (b_b_outdatedOnCpu) {
          arrayCopyGpuToCpu(b_cpu_b, b_gpu_b);
        }
        if (transPolyEdge2_outdatedOnCpu) {
          arrayCopyGpuToCpu(cpu_transPolyEdge2, gpu_transPolyEdge2);
        }
        b_cpu_b[2 * k] = cpu_transPolyEdge2[2 * ii[k]];
        transPolyEdge2_outdatedOnCpu = false;
        b_cpu_b[2 * k + 1] = cpu_transPolyEdge2[2 * ii[k] + 1];
        b_b_outdatedOnCpu = false;
        b_b_outdatedOnGpu = true;
      }
      ::coder::internal::blas::mtimes(
          *gpu_dist, b_cpu_b, &b_b_outdatedOnCpu, b_gpu_b, &b_b_outdatedOnGpu,
          cpu_y2, &y2_outdatedOnCpu, gpu_y2, &y2_outdatedOnGpu);
      if (cpu_y1.size(1) == 1) {
        nx = x2.size(1);
      } else {
        nx = cpu_y1.size(1);
      }
      if (cpu_y2.size(1) == 1) {
        acoef = x1.size(1);
      } else {
        acoef = cpu_y2.size(1);
      }
      if (cpu_y1.size(1) == 1) {
        k = x2.size(1);
      } else {
        k = cpu_y1.size(1);
      }
      if (k == 1) {
        if (cpu_y2.size(1) == 1) {
          k = x1.size(1);
        } else {
          k = cpu_y2.size(1);
        }
      } else if (cpu_y1.size(1) == 1) {
        k = x2.size(1);
      } else {
        k = cpu_y1.size(1);
      }
      if (x2.size(1) == 1) {
        idx = x1.size(1);
      } else {
        idx = x2.size(1);
      }
      if ((cpu_y1.size(1) == x2.size(1)) && (cpu_y2.size(1) == x1.size(1)) &&
          (nx == acoef) && (x2.size(1) == x1.size(1)) && (k == idx)) {
        d_y.set_size(1, cpu_y1.size(1));
        for (k = 0; k < cpu_y1.size(1); k++) {
          float f;
          u = x2[k];
          f = x1[k];
          if (y1_outdatedOnCpu) {
            arrayCopyGpuToCpu(cpu_y1, gpu_y1);
          }
          y1_outdatedOnCpu = false;
          if (y2_outdatedOnCpu) {
            arrayCopyGpuToCpu(cpu_y2, gpu_y2);
          }
          y2_outdatedOnCpu = false;
          d_y[k] = (cpu_y1[k] * u - cpu_y2[k] * f) / (u - f);
        }
      } else {
        if (y1_outdatedOnCpu) {
          arrayCopyGpuToCpu(cpu_y1, gpu_y1);
        }
        y1_outdatedOnCpu = false;
        if (y2_outdatedOnCpu) {
          arrayCopyGpuToCpu(cpu_y2, gpu_y2);
        }
        y2_outdatedOnCpu = false;
        binary_expand_op_11(d_y, cpu_y1, x2, cpu_y2, x1);
      }
      indices.set_size(1, d_y.size(1));
      for (k = 0; k < d_y.size(1); k++) {
        indices[k] = ((d_y[k] >= 0.0F) && (d_y[k] < 1.0F));
      }
      p = false;
      nx = 1;
      exitg1 = false;
      while ((!exitg1) && (nx <= indices.size(1))) {
        if (indices[nx - 1]) {
          p = true;
          exitg1 = true;
        } else {
          nx++;
        }
      }
      if (p) {
        nx = indices.size(1) - 1;
        acoef = 0;
        for (idx = 0; idx <= nx; idx++) {
          if (indices[idx]) {
            acoef++;
          }
        }
        r2.set_size(1, acoef);
        acoef = 0;
        for (idx = 0; idx <= nx; idx++) {
          if (indices[idx]) {
            r2[acoef] = idx;
            acoef++;
          }
        }
        nx = r2.size(1);
        e_y.set_size(2, r2.size(1));
        for (k = 0; k < nx; k++) {
          e_y[2 * k] = point2_idx_0 * d_y[r2[k]];
          e_y[2 * k + 1] = point2_idx_1 * d_y[r2[k]];
        }
        cn.set_size(2, e_y.size(1));
        if (e_y.size(1) != 0) {
          nx = (e_y.size(1) != 1);
          idx = e_y.size(1) - 1;
          for (k = 0; k <= idx; k++) {
            acoef = nx * k;
            cn[2 * k] = polyEdges1[2 * n] + e_y[2 * acoef];
            cn[2 * k + 1] = polyEdges1[2 * n + 1] + e_y[2 * acoef + 1];
          }
        }
      } else {
        cn.set_size(2, 0);
      }
    } else {
      cn.set_size(2, 0);
    }
    if (cn.size(1) != 0) {
      k = intersectPoints.size(1);
      intersectPoints.set_size(2, intersectPoints.size(1) + cn.size(1));
      nx = cn.size(1);
      for (idx = 0; idx < nx; idx++) {
        intersectPoints[2 * (idx + k)] = cn[2 * idx];
        intersectPoints[2 * (idx + k) + 1] = cn[2 * idx + 1];
      }
    }
  }
  images::internal::coder::inpolygon(xIndices1, yIndices1, xIndices2, yIndices2,
                                     insideInd1);
  images::internal::coder::inpolygon(xIndices2, yIndices2, xIndices1, yIndices1,
                                     insideInd2);
  overlapedPolyPts.set_size(2, 0);
  if (intersectPoints.size(1) != 0) {
    overlapedPolyPts.set_size(2, intersectPoints.size(1));
    nx = intersectPoints.size(1);
    for (k = 0; k < nx; k++) {
      overlapedPolyPts[2 * k] = intersectPoints[2 * k];
      overlapedPolyPts[2 * k + 1] = intersectPoints[2 * k + 1];
    }
  }
  nx = insideInd1.size(0);
  if ((insideInd1.size(0) == 0) || (insideInd1.size(1) == 0)) {
    sz_idx_1 = static_cast<unsigned int>(insideInd1.size(1));
    b_y.set_size(1, insideInd1.size(1));
    for (k = 0; k < static_cast<int>(sz_idx_1); k++) {
      b_y[k] = 0;
    }
  } else {
    idx = insideInd1.size(1);
    b_y.set_size(1, insideInd1.size(1));
    for (i = 0; i < idx; i++) {
      acoef = i * insideInd1.size(0);
      b_y[i] = insideInd1[acoef];
      for (k = 0; k <= nx - 2; k++) {
        b_y[i] = b_y[i] + insideInd1[(acoef + k) + 1];
      }
    }
  }
  b_x.set_size(1, b_y.size(1));
  for (k = 0; k < b_y.size(1); k++) {
    b_x[k] = (b_y[k] > 0);
  }
  p = (b_x.size(1) != 0);
  if (p) {
    k = 1;
    exitg1 = false;
    while ((!exitg1) && (k <= b_x.size(1))) {
      if (!b_x[k - 1]) {
        p = false;
        exitg1 = true;
      } else {
        k++;
      }
    }
  }
  if (p) {
    nx = insideInd1.size(0) * insideInd1.size(1) - 1;
    acoef = 0;
    for (i = 0; i <= nx; i++) {
      if (insideInd1[i]) {
        acoef++;
      }
    }
    r.set_size(acoef);
    acoef = 0;
    for (i = 0; i <= nx; i++) {
      if (insideInd1[i]) {
        r[acoef] = i;
        acoef++;
      }
    }
    k = overlapedPolyPts.size(1);
    overlapedPolyPts.set_size(2, r.size(0) + overlapedPolyPts.size(1));
    nx = r.size(0);
    for (idx = 0; idx < nx; idx++) {
      overlapedPolyPts[2 * (idx + k)] = xIndices1[r[idx]];
      overlapedPolyPts[2 * (idx + k) + 1] = yIndices1[r[idx]];
    }
  }
  nx = insideInd2.size(0);
  if ((insideInd2.size(0) == 0) || (insideInd2.size(1) == 0)) {
    sz_idx_1 = static_cast<unsigned int>(insideInd2.size(1));
    c_y.set_size(1, insideInd2.size(1));
    for (k = 0; k < static_cast<int>(sz_idx_1); k++) {
      c_y[k] = 0;
    }
  } else {
    idx = insideInd2.size(1);
    c_y.set_size(1, insideInd2.size(1));
    for (i = 0; i < idx; i++) {
      acoef = i * insideInd2.size(0);
      c_y[i] = insideInd2[acoef];
      for (k = 0; k <= nx - 2; k++) {
        c_y[i] = c_y[i] + insideInd2[(acoef + k) + 1];
      }
    }
  }
  c_x.set_size(1, c_y.size(1));
  for (k = 0; k < c_y.size(1); k++) {
    c_x[k] = (c_y[k] > 0);
  }
  p = (c_x.size(1) != 0);
  if (p) {
    k = 1;
    exitg1 = false;
    while ((!exitg1) && (k <= c_x.size(1))) {
      if (!c_x[k - 1]) {
        p = false;
        exitg1 = true;
      } else {
        k++;
      }
    }
  }
  if (p) {
    nx = insideInd2.size(0) * insideInd2.size(1) - 1;
    acoef = 0;
    for (i = 0; i <= nx; i++) {
      if (insideInd2[i]) {
        acoef++;
      }
    }
    r1.set_size(acoef);
    acoef = 0;
    for (i = 0; i <= nx; i++) {
      if (insideInd2[i]) {
        r1[acoef] = i;
        acoef++;
      }
    }
    k = overlapedPolyPts.size(1);
    overlapedPolyPts.set_size(2, r1.size(0) + overlapedPolyPts.size(1));
    nx = r1.size(0);
    for (idx = 0; idx < nx; idx++) {
      overlapedPolyPts[2 * (idx + k)] = xIndices2[r1[idx]];
      overlapedPolyPts[2 * (idx + k) + 1] = yIndices2[r1[idx]];
    }
  }
  cudaFree(*gpu_dist);
}

//
// Arguments    : coder::array<float, 2U> &in1
//                const coder::array<float, 2U> &in2
//                const coder::array<float, 2U> &in3
// Return Type  : void
//
} // namespace detector
} // namespace internal
} // namespace vision
} // namespace coder
void minus(coder::array<float, 2U> &in1, const coder::array<float, 2U> &in2,
           const coder::array<float, 2U> &in3)
{
  int aux_0_1;
  int aux_1_1;
  int b;
  int stride_0_1;
  int stride_1_1;
  if (in3.size(1) == 1) {
    b = in2.size(1);
  } else {
    b = in3.size(1);
  }
  in1.set_size(2, b);
  stride_0_1 = (in2.size(1) != 1);
  stride_1_1 = (in3.size(1) != 1);
  aux_0_1 = 0;
  aux_1_1 = 0;
  if (in3.size(1) == 1) {
    b = in2.size(1);
  } else {
    b = in3.size(1);
  }
  for (int i{0}; i < b; i++) {
    in1[2 * i] = in2[2 * aux_0_1] - in3[2 * aux_1_1];
    in1[2 * i + 1] = in2[2 * aux_0_1 + 1] - in3[2 * aux_1_1 + 1];
    aux_1_1 += stride_1_1;
    aux_0_1 += stride_0_1;
  }
}

//
// File trailer for overlapPolygonRotatedRects.cu
//
// [EOF]
//
