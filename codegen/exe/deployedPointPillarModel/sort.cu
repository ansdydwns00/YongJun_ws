//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: sort.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "sort.h"
#include "deployedPointPillarModel_rtwutil.h"
#include "rt_nonfinite.h"
#include "sortIdx.h"
#include "coder_array.h"
#include <cmath>

// Function Definitions
//
// Arguments    : array<float, 2U> &b_x
//                array<int, 2U> &idx
// Return Type  : void
//
namespace coder {
namespace internal {
void sort(array<float, 2U> &b_x, array<int, 2U> &idx)
{
  array<float, 1U> xwork;
  array<int, 1U> iwork;
  float b_xwork[256];
  float x4[4];
  int b_iwork[256];
  int idx4[4];
  int nPairs;
  signed char perm[4];
  idx.set_size(1, b_x.size(1));
  for (nPairs = 0; nPairs < b_x.size(1); nPairs++) {
    idx[nPairs] = 0;
  }
  if (b_x.size(1) != 0) {
    int bLen2;
    int i1;
    int i2;
    int i3;
    int i4;
    int ib;
    int n;
    int nNaNs;
    int nNonNaN;
    n = b_x.size(1) - 1;
    x4[0] = 0.0F;
    idx4[0] = 0;
    x4[1] = 0.0F;
    idx4[1] = 0;
    x4[2] = 0.0F;
    idx4[2] = 0;
    x4[3] = 0.0F;
    idx4[3] = 0;
    iwork.set_size(b_x.size(1));
    xwork.set_size(b_x.size(1));
    for (nPairs = 0; nPairs < b_x.size(1); nPairs++) {
      iwork[nPairs] = 0;
      xwork[nPairs] = 0.0F;
    }
    nNaNs = 0;
    ib = 0;
    for (int k{0}; k <= n; k++) {
      if (std::isnan(b_x[k])) {
        idx[n - nNaNs] = k + 1;
        xwork[n - nNaNs] = b_x[k];
        nNaNs++;
      } else {
        ib++;
        idx4[ib - 1] = k + 1;
        x4[ib - 1] = b_x[k];
        if (ib == 4) {
          ib = k - nNaNs;
          if (x4[0] <= x4[1]) {
            i1 = 1;
            i2 = 2;
          } else {
            i1 = 2;
            i2 = 1;
          }
          if (x4[2] <= x4[3]) {
            i3 = 3;
            i4 = 4;
          } else {
            i3 = 4;
            i4 = 3;
          }
          if (x4[i1 - 1] <= x4[i3 - 1]) {
            if (x4[i2 - 1] <= x4[i3 - 1]) {
              nPairs = i1;
              bLen2 = i2;
              i1 = i3;
              i2 = i4;
            } else if (x4[i2 - 1] <= x4[i4 - 1]) {
              nPairs = i1;
              bLen2 = i3;
              i1 = i2;
              i2 = i4;
            } else {
              nPairs = i1;
              bLen2 = i3;
              i1 = i4;
            }
          } else if (x4[i1 - 1] <= x4[i4 - 1]) {
            if (x4[i2 - 1] <= x4[i4 - 1]) {
              nPairs = i3;
              bLen2 = i1;
              i1 = i2;
              i2 = i4;
            } else {
              nPairs = i3;
              bLen2 = i1;
              i1 = i4;
            }
          } else {
            nPairs = i3;
            bLen2 = i4;
          }
          idx[ib - 3] = idx4[nPairs - 1];
          idx[ib - 2] = idx4[bLen2 - 1];
          idx[ib - 1] = idx4[i1 - 1];
          idx[ib] = idx4[i2 - 1];
          b_x[ib - 3] = x4[nPairs - 1];
          b_x[ib - 2] = x4[bLen2 - 1];
          b_x[ib - 1] = x4[i1 - 1];
          b_x[ib] = x4[i2 - 1];
          ib = 0;
        }
      }
    }
    i2 = b_x.size(1) - nNaNs;
    if (ib > 0) {
      perm[1] = 0;
      perm[2] = 0;
      perm[3] = 0;
      if (ib == 1) {
        perm[0] = 1;
      } else if (ib == 2) {
        if (x4[0] <= x4[1]) {
          perm[0] = 1;
          perm[1] = 2;
        } else {
          perm[0] = 2;
          perm[1] = 1;
        }
      } else if (x4[0] <= x4[1]) {
        if (x4[1] <= x4[2]) {
          perm[0] = 1;
          perm[1] = 2;
          perm[2] = 3;
        } else if (x4[0] <= x4[2]) {
          perm[0] = 1;
          perm[1] = 3;
          perm[2] = 2;
        } else {
          perm[0] = 3;
          perm[1] = 1;
          perm[2] = 2;
        }
      } else if (x4[0] <= x4[2]) {
        perm[0] = 2;
        perm[1] = 1;
        perm[2] = 3;
      } else if (x4[1] <= x4[2]) {
        perm[0] = 2;
        perm[1] = 3;
        perm[2] = 1;
      } else {
        perm[0] = 3;
        perm[1] = 2;
        perm[2] = 1;
      }
      for (int k{0}; k < ib; k++) {
        nPairs = perm[k];
        idx[(i2 - ib) + k] = idx4[nPairs - 1];
        b_x[(i2 - ib) + k] = x4[nPairs - 1];
      }
    }
    i1 = nNaNs >> 1;
    for (int k{0}; k < i1; k++) {
      ib = idx[i2 + k];
      idx[i2 + k] = idx[n - k];
      idx[n - k] = ib;
      b_x[i2 + k] = xwork[n - k];
      b_x[n - k] = xwork[i2 + k];
    }
    if ((nNaNs & 1) != 0) {
      b_x[i2 + i1] = xwork[i2 + i1];
    }
    nNonNaN = b_x.size(1) - nNaNs;
    ib = 2;
    if (nNonNaN > 1) {
      if (b_x.size(1) >= 256) {
        n = nNonNaN >> 8;
        if (n > 0) {
          for (nNaNs = 0; nNaNs < n; nNaNs++) {
            i3 = nNaNs << 8;
            for (int b{0}; b < 6; b++) {
              i4 = 1 << (b + 2);
              bLen2 = i4 << 1;
              nPairs = 256 >> (b + 3);
              for (int k{0}; k < nPairs; k++) {
                ib = i3 + k * bLen2;
                for (i1 = 0; i1 < bLen2; i1++) {
                  b_iwork[i1] = idx[ib + i1];
                  b_xwork[i1] = b_x[ib + i1];
                }
                i2 = 1;
                i1 = i4;
                ib--;
                int exitg1;
                do {
                  exitg1 = 0;
                  ib++;
                  if (b_xwork[i2 - 1] <= b_xwork[i1]) {
                    idx[ib] = b_iwork[i2 - 1];
                    b_x[ib] = b_xwork[i2 - 1];
                    if (i2 < i4) {
                      i2++;
                    } else {
                      exitg1 = 1;
                    }
                  } else {
                    idx[ib] = b_iwork[i1];
                    b_x[ib] = b_xwork[i1];
                    if (i1 + 1 < bLen2) {
                      i1++;
                    } else {
                      long long c;
                      ib = (ib - i2) + 1;
                      c = computeEndIdx(static_cast<long long>(i2),
                                        static_cast<long long>(i4), 1LL);
                      for (long long j{0LL}; j <= c; j++) {
                        idx[ib + static_cast<int>(i2 + j)] =
                            b_iwork[static_cast<int>(i2 + j) - 1];
                        b_x[ib + static_cast<int>(i2 + j)] =
                            b_xwork[static_cast<int>(i2 + j) - 1];
                      }
                      exitg1 = 1;
                    }
                  }
                } while (exitg1 == 0);
              }
            }
          }
          ib = n << 8;
          i1 = nNonNaN - ib;
          if (i1 > 0) {
            merge_block(idx, b_x, ib, i1, 2, iwork, xwork);
          }
          ib = 8;
        }
      }
      merge_block(idx, b_x, 0, nNonNaN, ib, iwork, xwork);
    }
  }
}

} // namespace internal
} // namespace coder

//
// File trailer for sort.cu
//
// [EOF]
//
