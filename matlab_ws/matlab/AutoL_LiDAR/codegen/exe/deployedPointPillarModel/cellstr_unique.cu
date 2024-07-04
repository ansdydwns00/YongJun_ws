//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: cellstr_unique.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "cellstr_unique.h"
#include "cellstr_sort.h"
#include "deployedPointPillarModel_internal_types.h"
#include "find.h"
#include "rt_nonfinite.h"
#include "strcmp.h"
#include "MWScanFunctors.h"
#include "MWScanUtility.h"
#include "MWShuffleUtility.h"
#include "coder_array.h"
#include "coder_gpu_array.h"
#include <cmath>

// Function Definitions
//
// Arguments    : const array<cell_wrap_6, 1U> &a
//                array<cell_wrap_6, 1U> &u
// Return Type  : void
//
namespace coder {
namespace matlab {
namespace internal {
namespace coder {
namespace datatypes {
void cellstr_unique(const array<cell_wrap_6, 1U> &a, array<cell_wrap_6, 1U> &u)
{
  array<cell_wrap_6, 1U> c;
  array<double, 1U> cpu_ic;
  array<int, 2U> b_y;
  array<int, 2U> c_y;
  array<int, 1U> dIdx;
  array<int, 1U> ia;
  array<int, 1U> idx;
  array<bool, 1U> d;
  array<bool, 1U> r;
  gpu_array<double, 1U> gpu_ic;
  bool ic_outdatedOnGpu;
  ic_outdatedOnGpu = false;
  if (a.size(0) == 0) {
    u.set_size(0);
  } else {
    int b_i;
    int k;
    int loop_ub;
    int vlen;
    cellstr_sort(a, c, idx);
    d.set_size(c.size(0) - 1);
    for (int i{0}; i <= c.size(0) - 2; i++) {
      d[i] = !::coder::internal::b_strcmp(c[i].f1, c[i + 1].f1);
    }
    r.set_size(d.size(0) + 1);
    r[0] = true;
    loop_ub = d.size(0);
    for (b_i = 0; b_i < loop_ub; b_i++) {
      r[b_i + 1] = d[b_i];
    }
    d.set_size(r.size(0));
    for (b_i = 0; b_i < r.size(0); b_i++) {
      d[b_i] = r[b_i];
    }
    vlen = d.size(0);
    loop_ub = d[0];
    for (k = 0; k <= vlen - 2; k++) {
      loop_ub += d[k + 1];
    }
    u.set_size(static_cast<int>(std::fmin(static_cast<double>(loop_ub),
                                          static_cast<double>(a.size(0)))));
    eml_find(d, dIdx);
    ia.set_size(dIdx.size(0));
    k = dIdx.size(0);
    for (int i{0}; i < k; i++) {
      if (i + 1 != dIdx.size(0)) {
        if (static_cast<double>(dIdx[i + 1]) - 1.0 < dIdx[i]) {
          c_y.set_size(1, 0);
        } else {
          double b_d;
          b_i = dIdx[i];
          b_d = static_cast<double>(dIdx[i + 1]) - 1.0;
          c_y.set_size(
              1, static_cast<int>((static_cast<double>(dIdx[i + 1]) - 1.0) -
                                  static_cast<double>(dIdx[i])) +
                     1);
          for (loop_ub = 0;
               loop_ub <= static_cast<int>(b_d - static_cast<double>(b_i));
               loop_ub++) {
            c_y[loop_ub] = b_i + loop_ub;
          }
        }
        vlen = c_y.size(1);
        loop_ub = idx[c_y[0] - 1];
        for (int c_i{0}; c_i <= vlen - 2; c_i++) {
          b_i = c_y[c_i + 1];
          if (loop_ub > idx[b_i - 1]) {
            loop_ub = idx[b_i - 1];
          }
        }
        ia[i] = loop_ub;
      } else {
        if (idx.size(0) < dIdx[i]) {
          b_y.set_size(1, 0);
        } else {
          b_i = dIdx[i];
          b_y.set_size(1, (idx.size(0) - dIdx[i]) + 1);
          for (loop_ub = 0; loop_ub <= idx.size(0) - b_i; loop_ub++) {
            b_y[loop_ub] = b_i + loop_ub;
          }
        }
        vlen = b_y.size(1);
        loop_ub = idx[b_y[0] - 1];
        for (int c_i{0}; c_i <= vlen - 2; c_i++) {
          b_i = b_y[c_i + 1];
          if (loop_ub > idx[b_i - 1]) {
            loop_ub = idx[b_i - 1];
          }
        }
        ia[i] = loop_ub;
      }
    }
    cpu_ic.set_size(d.size(0));
    gpu_ic.set_size(&cpu_ic);
    for (b_i = 0; b_i < d.size(0); b_i++) {
      cpu_ic[b_i] = d[b_i];
      ic_outdatedOnGpu = true;
    }
    if (cpu_ic.size(0) != 1) {
      if (ic_outdatedOnGpu) {
        arrayCopyCpuToGpu(gpu_ic, cpu_ic);
      }
      mwCallThrustScan1D(&(gpu_ic.data())[0], false, cpu_ic.size(0));
    }
    k = dIdx.size(0);
    for (int i{0}; i < k; i++) {
      u[i].f1.set_size(1, a[ia[i] - 1].f1.size(1));
      loop_ub = a[ia[i] - 1].f1.size(1);
      for (b_i = 0; b_i < loop_ub; b_i++) {
        u[i].f1[b_i] = a[ia[i] - 1].f1[b_i];
      }
    }
  }
}

//
// Arguments    : const array<cell_wrap_6, 1U> &a
//                array<cell_wrap_6, 1U> &u
//                array<double, 1U> &ia
// Return Type  : void
//
void cellstr_unique(const array<cell_wrap_6, 1U> &a, array<cell_wrap_6, 1U> &u,
                    array<double, 1U> &ia)
{
  array<cell_wrap_6, 1U> c;
  array<double, 1U> cpu_ic;
  array<int, 2U> b_y;
  array<int, 2U> c_y;
  array<int, 1U> dIdx;
  array<int, 1U> idx;
  array<bool, 1U> d;
  array<bool, 1U> r;
  gpu_array<double, 1U> gpu_ic;
  bool ic_outdatedOnGpu;
  ic_outdatedOnGpu = false;
  if (a.size(0) == 0) {
    u.set_size(0);
    ia.set_size(0);
  } else {
    int b_i;
    int k;
    int loop_ub;
    int vlen;
    cellstr_sort(a, c, idx);
    d.set_size(c.size(0) - 1);
    for (int i{0}; i <= c.size(0) - 2; i++) {
      d[i] = !::coder::internal::b_strcmp(c[i].f1, c[i + 1].f1);
    }
    r.set_size(d.size(0) + 1);
    r[0] = true;
    loop_ub = d.size(0);
    for (b_i = 0; b_i < loop_ub; b_i++) {
      r[b_i + 1] = d[b_i];
    }
    d.set_size(r.size(0));
    for (b_i = 0; b_i < r.size(0); b_i++) {
      d[b_i] = r[b_i];
    }
    vlen = d.size(0);
    loop_ub = d[0];
    for (k = 0; k <= vlen - 2; k++) {
      loop_ub += d[k + 1];
    }
    u.set_size(static_cast<int>(std::fmin(static_cast<double>(loop_ub),
                                          static_cast<double>(a.size(0)))));
    eml_find(d, dIdx);
    ia.set_size(dIdx.size(0));
    k = dIdx.size(0);
    for (int i{0}; i < k; i++) {
      if (i + 1 != dIdx.size(0)) {
        if (static_cast<double>(dIdx[i + 1]) - 1.0 < dIdx[i]) {
          c_y.set_size(1, 0);
        } else {
          double b_d;
          b_i = dIdx[i];
          b_d = static_cast<double>(dIdx[i + 1]) - 1.0;
          c_y.set_size(
              1, static_cast<int>((static_cast<double>(dIdx[i + 1]) - 1.0) -
                                  static_cast<double>(dIdx[i])) +
                     1);
          for (loop_ub = 0;
               loop_ub <= static_cast<int>(b_d - static_cast<double>(b_i));
               loop_ub++) {
            c_y[loop_ub] = b_i + loop_ub;
          }
        }
        vlen = c_y.size(1);
        loop_ub = idx[c_y[0] - 1];
        for (int c_i{0}; c_i <= vlen - 2; c_i++) {
          b_i = c_y[c_i + 1];
          if (loop_ub > idx[b_i - 1]) {
            loop_ub = idx[b_i - 1];
          }
        }
        ia[i] = loop_ub;
      } else {
        if (idx.size(0) < dIdx[i]) {
          b_y.set_size(1, 0);
        } else {
          b_i = dIdx[i];
          b_y.set_size(1, (idx.size(0) - dIdx[i]) + 1);
          for (loop_ub = 0; loop_ub <= idx.size(0) - b_i; loop_ub++) {
            b_y[loop_ub] = b_i + loop_ub;
          }
        }
        vlen = b_y.size(1);
        loop_ub = idx[b_y[0] - 1];
        for (int c_i{0}; c_i <= vlen - 2; c_i++) {
          b_i = b_y[c_i + 1];
          if (loop_ub > idx[b_i - 1]) {
            loop_ub = idx[b_i - 1];
          }
        }
        ia[i] = loop_ub;
      }
    }
    cpu_ic.set_size(d.size(0));
    gpu_ic.set_size(&cpu_ic);
    for (b_i = 0; b_i < d.size(0); b_i++) {
      cpu_ic[b_i] = d[b_i];
      ic_outdatedOnGpu = true;
    }
    if (cpu_ic.size(0) != 1) {
      if (ic_outdatedOnGpu) {
        arrayCopyCpuToGpu(gpu_ic, cpu_ic);
      }
      mwCallThrustScan1D(&(gpu_ic.data())[0], false, cpu_ic.size(0));
    }
    k = dIdx.size(0);
    for (int i{0}; i < k; i++) {
      u[i].f1.set_size(1, a[static_cast<int>(ia[i]) - 1].f1.size(1));
      loop_ub = a[static_cast<int>(ia[i]) - 1].f1.size(1);
      for (b_i = 0; b_i < loop_ub; b_i++) {
        u[i].f1[b_i] = a[static_cast<int>(ia[i]) - 1].f1[b_i];
      }
    }
  }
}

} // namespace datatypes
} // namespace coder
} // namespace internal
} // namespace matlab
} // namespace coder

//
// File trailer for cellstr_unique.cu
//
// [EOF]
//
