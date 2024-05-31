//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// sort.cu
//
// Code generation for function 'sort'
//

// Include files
#include "sort.h"
#include "pointpillardetect_mexutil.h"
#include "rt_nonfinite.h"
#include <cmath>

// Function Definitions
namespace coder {
namespace internal {
void sort(real_T x_data[], const int32_T x_size[2], int32_T idx_data[],
          int32_T idx_size[2])
{
  int32_T i3;
  idx_size[0] = 1;
  idx_size[1] = x_size[1];
  for (i3 = 0; i3 < x_size[1]; i3++) {
    idx_data[i3] = 0;
  }
  if (x_size[1] != 0) {
    real_T xwork_data[24];
    real_T x4[4];
    int32_T bLen;
    int32_T i1;
    int32_T i2;
    int32_T i4;
    int32_T ib;
    int32_T n;
    int32_T nNonNaN;
    int32_T nPairs;
    int8_T iwork_data[24];
    int8_T idx4[4];
    for (i3 = 0; i3 < x_size[1]; i3++) {
      iwork_data[i3] = 0;
    }
    n = x_size[1] - 1;
    x4[0] = 0.0;
    idx4[0] = 0;
    x4[1] = 0.0;
    idx4[1] = 0;
    x4[2] = 0.0;
    idx4[2] = 0;
    x4[3] = 0.0;
    idx4[3] = 0;
    nPairs = 0;
    ib = 0;
    for (int32_T k{0}; k <= n; k++) {
      if (std::isnan(x_data[k])) {
        idx_data[n - nPairs] = k + 1;
        xwork_data[n - nPairs] = x_data[k];
        nPairs++;
      } else {
        ib++;
        idx4[ib - 1] = static_cast<int8_T>(k + 1);
        x4[ib - 1] = x_data[k];
        if (ib == 4) {
          ib = k - nPairs;
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
              nNonNaN = i1;
              bLen = i2;
              i1 = i3;
              i2 = i4;
            } else if (x4[i2 - 1] <= x4[i4 - 1]) {
              nNonNaN = i1;
              bLen = i3;
              i1 = i2;
              i2 = i4;
            } else {
              nNonNaN = i1;
              bLen = i3;
              i1 = i4;
            }
          } else if (x4[i1 - 1] <= x4[i4 - 1]) {
            if (x4[i2 - 1] <= x4[i4 - 1]) {
              nNonNaN = i3;
              bLen = i1;
              i1 = i2;
              i2 = i4;
            } else {
              nNonNaN = i3;
              bLen = i1;
              i1 = i4;
            }
          } else {
            nNonNaN = i3;
            bLen = i4;
          }
          idx_data[ib - 3] = idx4[nNonNaN - 1];
          idx_data[ib - 2] = idx4[bLen - 1];
          idx_data[ib - 1] = idx4[i1 - 1];
          idx_data[ib] = idx4[i2 - 1];
          x_data[ib - 3] = x4[nNonNaN - 1];
          x_data[ib - 2] = x4[bLen - 1];
          x_data[ib - 1] = x4[i1 - 1];
          x_data[ib] = x4[i2 - 1];
          ib = 0;
        }
      }
    }
    i2 = x_size[1] - nPairs;
    if (ib > 0) {
      int8_T perm[4];
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
      for (int32_T k{0}; k < ib; k++) {
        i3 = perm[k];
        idx_data[(i2 - ib) + k] = idx4[i3 - 1];
        x_data[(i2 - ib) + k] = x4[i3 - 1];
      }
    }
    i1 = nPairs >> 1;
    for (int32_T k{0}; k < i1; k++) {
      ib = idx_data[i2 + k];
      idx_data[i2 + k] = idx_data[n - k];
      idx_data[n - k] = ib;
      x_data[i2 + k] = xwork_data[n - k];
      x_data[n - k] = xwork_data[i2 + k];
    }
    if ((nPairs & 1) != 0) {
      x_data[i2 + i1] = xwork_data[i2 + i1];
    }
    nNonNaN = x_size[1] - nPairs;
    if (nNonNaN > 1) {
      int64_T b;
      int32_T exitg1;
      nPairs = nNonNaN >> 2;
      bLen = 4;
      while (nPairs > 1) {
        if ((nPairs & 1) != 0) {
          nPairs--;
          i2 = bLen * nPairs;
          ib = nNonNaN - i2;
          if (ib > bLen) {
            ib -= bLen;
            if (ib != 0) {
              n = bLen + ib;
              for (i1 = 0; i1 < n; i1++) {
                iwork_data[i1] = static_cast<int8_T>(idx_data[i2 + i1]);
                xwork_data[i1] = x_data[i2 + i1];
              }
              i4 = 1;
              i3 = bLen;
              i1 = bLen + ib;
              ib = i2 - 1;
              do {
                exitg1 = 0;
                ib++;
                if (xwork_data[i4 - 1] <= xwork_data[i3]) {
                  idx_data[ib] = iwork_data[i4 - 1];
                  x_data[ib] = xwork_data[i4 - 1];
                  if (i4 < bLen) {
                    i4++;
                  } else {
                    exitg1 = 1;
                  }
                } else {
                  idx_data[ib] = iwork_data[i3];
                  x_data[ib] = xwork_data[i3];
                  if (i3 + 1 < i1) {
                    i3++;
                  } else {
                    ib = (ib - i4) + 1;
                    b = computeEndIdx(static_cast<int64_T>(i4),
                                      static_cast<int64_T>(bLen), 1L);
                    for (int64_T j{0L}; j <= b; j++) {
                      idx_data[ib + static_cast<int32_T>(i4 + j)] =
                          iwork_data[static_cast<int32_T>(i4 + j) - 1];
                      x_data[ib + static_cast<int32_T>(i4 + j)] =
                          xwork_data[static_cast<int32_T>(i4 + j) - 1];
                    }
                    exitg1 = 1;
                  }
                }
              } while (exitg1 == 0);
            }
          }
        }
        i2 = bLen << 1;
        nPairs >>= 1;
        for (int32_T k{0}; k < nPairs; k++) {
          ib = k * i2;
          if (bLen != 0) {
            n = bLen + bLen;
            for (i1 = 0; i1 < n; i1++) {
              iwork_data[i1] = static_cast<int8_T>(idx_data[ib + i1]);
              xwork_data[i1] = x_data[ib + i1];
            }
            i4 = 1;
            i3 = bLen;
            i1 = bLen + bLen;
            ib--;
            do {
              exitg1 = 0;
              ib++;
              if (xwork_data[i4 - 1] <= xwork_data[i3]) {
                idx_data[ib] = iwork_data[i4 - 1];
                x_data[ib] = xwork_data[i4 - 1];
                if (i4 < bLen) {
                  i4++;
                } else {
                  exitg1 = 1;
                }
              } else {
                idx_data[ib] = iwork_data[i3];
                x_data[ib] = xwork_data[i3];
                if (i3 + 1 < i1) {
                  i3++;
                } else {
                  ib = (ib - i4) + 1;
                  b = computeEndIdx(static_cast<int64_T>(i4),
                                    static_cast<int64_T>(bLen), 1L);
                  for (int64_T j{0L}; j <= b; j++) {
                    idx_data[ib + static_cast<int32_T>(i4 + j)] =
                        iwork_data[static_cast<int32_T>(i4 + j) - 1];
                    x_data[ib + static_cast<int32_T>(i4 + j)] =
                        xwork_data[static_cast<int32_T>(i4 + j) - 1];
                  }
                  exitg1 = 1;
                }
              }
            } while (exitg1 == 0);
          }
        }
        bLen = i2;
      }
      if (nNonNaN > bLen) {
        ib = nNonNaN - bLen;
        if (ib != 0) {
          n = bLen + ib;
          for (i1 = 0; i1 < n; i1++) {
            iwork_data[i1] = static_cast<int8_T>(idx_data[i1]);
            xwork_data[i1] = x_data[i1];
          }
          i4 = 1;
          i3 = bLen;
          i1 = bLen + ib;
          ib = -1;
          do {
            exitg1 = 0;
            ib++;
            if (xwork_data[i4 - 1] <= xwork_data[i3]) {
              idx_data[ib] = iwork_data[i4 - 1];
              x_data[ib] = xwork_data[i4 - 1];
              if (i4 < bLen) {
                i4++;
              } else {
                exitg1 = 1;
              }
            } else {
              idx_data[ib] = iwork_data[i3];
              x_data[ib] = xwork_data[i3];
              if (i3 + 1 < i1) {
                i3++;
              } else {
                ib = (ib - i4) + 1;
                b = computeEndIdx(static_cast<int64_T>(i4),
                                  static_cast<int64_T>(bLen), 1L);
                for (int64_T j{0L}; j <= b; j++) {
                  idx_data[ib + static_cast<int32_T>(i4 + j)] =
                      iwork_data[static_cast<int32_T>(i4 + j) - 1];
                  x_data[ib + static_cast<int32_T>(i4 + j)] =
                      xwork_data[static_cast<int32_T>(i4 + j) - 1];
                }
                exitg1 = 1;
              }
            }
          } while (exitg1 == 0);
        }
      }
    }
  }
}

} // namespace internal
} // namespace coder

// End of code generation (sort.cu)
