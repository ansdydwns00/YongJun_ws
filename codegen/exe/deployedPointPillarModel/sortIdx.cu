//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: sortIdx.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "sortIdx.h"
#include "deployedPointPillarModel_rtwutil.h"
#include "rt_nonfinite.h"
#include "coder_array.h"

// Function Declarations
namespace coder {
namespace internal {
static void merge(array<int, 2U> &idx, array<float, 2U> &b_x, int b_offset,
                  int np, int nq, array<int, 1U> &iwork,
                  array<float, 1U> &xwork);

}
} // namespace coder

// Function Definitions
//
// Arguments    : array<int, 2U> &idx
//                array<float, 2U> &b_x
//                int b_offset
//                int np
//                int nq
//                array<int, 1U> &iwork
//                array<float, 1U> &xwork
// Return Type  : void
//
namespace coder {
namespace internal {
static void merge(array<int, 2U> &idx, array<float, 2U> &b_x, int b_offset,
                  int np, int nq, array<int, 1U> &iwork,
                  array<float, 1U> &xwork)
{
  if ((np != 0) && (nq != 0)) {
    int iout;
    int n;
    int p;
    int qend;
    n = np + nq;
    for (qend = 0; qend < n; qend++) {
      iwork[qend] = idx[b_offset + qend];
      xwork[qend] = b_x[b_offset + qend];
    }
    p = 1;
    n = np;
    qend = np + nq;
    iout = b_offset - 1;
    int exitg1;
    do {
      exitg1 = 0;
      iout++;
      if (xwork[p - 1] <= xwork[n]) {
        idx[iout] = iwork[p - 1];
        b_x[iout] = xwork[p - 1];
        if (p < np) {
          p++;
        } else {
          exitg1 = 1;
        }
      } else {
        idx[iout] = iwork[n];
        b_x[iout] = xwork[n];
        if (n + 1 < qend) {
          n++;
        } else {
          long long b;
          n = (iout - p) + 1;
          b = computeEndIdx(static_cast<long long>(p),
                            static_cast<long long>(np), 1LL);
          for (long long j{0LL}; j <= b; j++) {
            idx[n + static_cast<int>(p + j)] =
                iwork[static_cast<int>(p + j) - 1];
            b_x[n + static_cast<int>(p + j)] =
                xwork[static_cast<int>(p + j) - 1];
          }
          exitg1 = 1;
        }
      }
    } while (exitg1 == 0);
  }
}

//
// Arguments    : array<int, 2U> &idx
//                array<float, 2U> &b_x
//                int b_offset
//                int n
//                int preSortLevel
//                array<int, 1U> &iwork
//                array<float, 1U> &xwork
// Return Type  : void
//
void merge_block(array<int, 2U> &idx, array<float, 2U> &b_x, int b_offset,
                 int n, int preSortLevel, array<int, 1U> &iwork,
                 array<float, 1U> &xwork)
{
  int bLen;
  int nPairs;
  nPairs = n >> preSortLevel;
  bLen = 1 << preSortLevel;
  while (nPairs > 1) {
    int nTail;
    int tailOffset;
    if ((nPairs & 1) != 0) {
      nPairs--;
      tailOffset = bLen * nPairs;
      nTail = n - tailOffset;
      if (nTail > bLen) {
        merge(idx, b_x, b_offset + tailOffset, bLen, nTail - bLen, iwork,
              xwork);
      }
    }
    tailOffset = bLen << 1;
    nPairs >>= 1;
    for (nTail = 0; nTail < nPairs; nTail++) {
      merge(idx, b_x, b_offset + nTail * tailOffset, bLen, bLen, iwork, xwork);
    }
    bLen = tailOffset;
  }
  if (n > bLen) {
    merge(idx, b_x, b_offset, bLen, n - bLen, iwork, xwork);
  }
}

} // namespace internal
} // namespace coder

//
// File trailer for sortIdx.cu
//
// [EOF]
//
