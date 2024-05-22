//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: introsort.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "introsort.h"
#include "cellstr_sort.h"
#include "deployedPointPillarModel_internal_types.h"
#include "heapsort.h"
#include "insertionsort.h"
#include "rt_nonfinite.h"
#include "coder_array.h"

// Type Definitions
struct struct_T {
  int xstart;
  int xend;
  int depth;
};

// Function Definitions
//
// Arguments    : array<int, 1U> &b_x
//                int b_xend
//                const array<cell_wrap_6, 1U> &cmp_workspace_c
// Return Type  : void
//
namespace coder {
namespace internal {
void introsort(array<int, 1U> &b_x, int b_xend,
               const array<cell_wrap_6, 1U> &cmp_workspace_c)
{
  array<struct_T, 1U> st_d;
  struct_T frame;
  if (b_xend > 1) {
    if (b_xend <= 32) {
      insertionsort(b_x, 1, b_xend, cmp_workspace_c);
    } else {
      int MAXDEPTH;
      int pivot;
      int pmax;
      int pmin;
      int pow2p;
      bool exitg1;
      pmax = 31;
      pmin = 0;
      exitg1 = false;
      while ((!exitg1) && (pmax - pmin > 1)) {
        pivot = (pmin + pmax) >> 1;
        pow2p = 1 << pivot;
        if (pow2p == b_xend) {
          pmax = pivot;
          exitg1 = true;
        } else if (pow2p > b_xend) {
          pmax = pivot;
        } else {
          pmin = pivot;
        }
      }
      MAXDEPTH = (pmax - 1) << 1;
      frame.xstart = 1;
      frame.xend = b_xend;
      frame.depth = 0;
      pmax = MAXDEPTH << 1;
      st_d.set_size(pmax);
      for (pmin = 0; pmin < pmax; pmin++) {
        st_d[pmin] = frame;
      }
      st_d[0] = frame;
      pow2p = 1;
      while (pow2p > 0) {
        frame = st_d[pow2p - 1];
        pmax = st_d[pow2p - 1].xstart - 1;
        b_xend = st_d[pow2p - 1].xend;
        pow2p--;
        if ((frame.xend - frame.xstart) + 1 <= 32) {
          insertionsort(b_x, frame.xstart, frame.xend, cmp_workspace_c);
        } else if (frame.depth == MAXDEPTH) {
          b_heapsort(b_x, frame.xstart, frame.xend, cmp_workspace_c);
        } else {
          int t;
          pmin = (frame.xstart + (frame.xend - frame.xstart) / 2) - 1;
          if (matlab::internal::coder::datatypes::cellstr_sort_anonFcn1(
                  cmp_workspace_c, b_x[pmin], b_x[pmax])) {
            t = b_x[frame.xstart - 1];
            b_x[frame.xstart - 1] = b_x[pmin];
            b_x[pmin] = t;
          }
          if (matlab::internal::coder::datatypes::cellstr_sort_anonFcn1(
                  cmp_workspace_c, b_x[b_xend - 1], b_x[pmax])) {
            t = b_x[frame.xstart - 1];
            b_x[frame.xstart - 1] = b_x[frame.xend - 1];
            b_x[frame.xend - 1] = t;
          }
          if (matlab::internal::coder::datatypes::cellstr_sort_anonFcn1(
                  cmp_workspace_c, b_x[b_xend - 1], b_x[pmin])) {
            t = b_x[pmin];
            b_x[pmin] = b_x[frame.xend - 1];
            b_x[frame.xend - 1] = t;
          }
          pivot = b_x[pmin];
          b_x[pmin] = b_x[frame.xend - 2];
          b_x[frame.xend - 2] = pivot;
          pmax = frame.xstart - 1;
          pmin = frame.xend - 2;
          int exitg2;
          do {
            exitg2 = 0;
            pmax++;
            while (matlab::internal::coder::datatypes::cellstr_sort_anonFcn1(
                cmp_workspace_c, b_x[pmax], pivot)) {
              pmax++;
            }
            pmin--;
            while (matlab::internal::coder::datatypes::cellstr_sort_anonFcn1(
                cmp_workspace_c, pivot, b_x[pmin])) {
              pmin--;
            }
            if (pmax + 1 >= pmin + 1) {
              exitg2 = 1;
            } else {
              t = b_x[pmax];
              b_x[pmax] = b_x[pmin];
              b_x[pmin] = t;
            }
          } while (exitg2 == 0);
          b_x[frame.xend - 2] = b_x[pmax];
          b_x[pmax] = pivot;
          if (pmax + 2 < frame.xend) {
            st_d[pow2p].xstart = pmax + 2;
            st_d[pow2p].xend = frame.xend;
            st_d[pow2p].depth = frame.depth + 1;
            pow2p++;
          }
          if (frame.xstart < pmax + 1) {
            st_d[pow2p].xstart = frame.xstart;
            st_d[pow2p].xend = pmax + 1;
            st_d[pow2p].depth = frame.depth + 1;
            pow2p++;
          }
        }
      }
    }
  }
}

} // namespace internal
} // namespace coder

//
// File trailer for introsort.cu
//
// [EOF]
//
