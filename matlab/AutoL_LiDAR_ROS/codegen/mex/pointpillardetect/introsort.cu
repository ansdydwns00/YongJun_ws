//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// introsort.cu
//
// Code generation for function 'introsort'
//

// Include files
#include "introsort.h"
#include "heapsort.h"
#include "insertionsort.h"
#include "pointpillardetect_types.h"
#include "rt_nonfinite.h"
#include <cmath>

// Type Definitions
struct struct_T {
  int32_T xstart;
  int32_T xend;
  int32_T depth;
};

// Function Definitions
namespace coder {
namespace internal {
void introsort(int32_T x_data[], int32_T xend,
               const cell_wrap_6 cmp_workspace_c_data[])
{
  if (xend > 1) {
    if (xend <= 32) {
      insertionsort(x_data, 1, xend, cmp_workspace_c_data);
    } else {
      struct_T st_d_data[120];
      int32_T MAXDEPTH;
      int32_T pmax;
      int32_T pmin;
      int32_T pow2p;
      int32_T st_n;
      int32_T xmid;
      boolean_T exitg1;
      pmax = 31;
      pmin = 0;
      exitg1 = false;
      while ((!exitg1) && (pmax - pmin > 1)) {
        xmid = (pmin + pmax) >> 1;
        pow2p = 1 << xmid;
        if (pow2p == xend) {
          pmax = xmid;
          exitg1 = true;
        } else if (pow2p > xend) {
          pmax = xmid;
        } else {
          pmin = xmid;
        }
      }
      MAXDEPTH = (pmax - 1) << 1;
      st_d_data[0].xstart = 1;
      st_d_data[0].xend = xend;
      st_d_data[0].depth = 0;
      st_n = 1;
      while (st_n > 0) {
        struct_T expl_temp;
        expl_temp = st_d_data[st_n - 1];
        pmin = st_d_data[st_n - 1].xstart - 1;
        xend = st_d_data[st_n - 1].xend;
        st_n--;
        if ((expl_temp.xend - expl_temp.xstart) + 1 <= 32) {
          insertionsort(x_data, expl_temp.xstart, expl_temp.xend,
                        cmp_workspace_c_data);
        } else if (expl_temp.depth == MAXDEPTH) {
          b_heapsort(x_data, expl_temp.xstart, expl_temp.xend,
                     cmp_workspace_c_data);
        } else {
          int32_T exitg2;
          int32_T i;
          int32_T j;
          int32_T k;
          boolean_T varargout_1;
          xmid =
              (expl_temp.xstart + (expl_temp.xend - expl_temp.xstart) / 2) - 1;
          i = x_data[xmid];
          j = x_data[expl_temp.xstart - 1];
          pow2p = static_cast<int32_T>(std::fmin(
              static_cast<real_T>(
                  cmp_workspace_c_data[x_data[xmid] - 1].f1.size[1]),
              static_cast<real_T>(
                  cmp_workspace_c_data[x_data[pmin] - 1].f1.size[1])));
          varargout_1 = (cmp_workspace_c_data[x_data[xmid] - 1].f1.size[1] <
                         cmp_workspace_c_data[x_data[expl_temp.xstart - 1] - 1]
                             .f1.size[1]);
          k = 0;
          do {
            exitg2 = 0;
            if (k <= pow2p - 1) {
              if (cmp_workspace_c_data[x_data[xmid] - 1].f1.data[k] !=
                  cmp_workspace_c_data[x_data[pmin] - 1].f1.data[k]) {
                varargout_1 =
                    (cmp_workspace_c_data[x_data[xmid] - 1].f1.data[k] <
                     cmp_workspace_c_data[x_data[pmin] - 1].f1.data[k]);
                exitg2 = 1;
              } else {
                k++;
              }
            } else {
              if (cmp_workspace_c_data[i - 1].f1.size[1] ==
                  cmp_workspace_c_data[j - 1].f1.size[1]) {
                varargout_1 = (i < j);
              }
              exitg2 = 1;
            }
          } while (exitg2 == 0);
          if (varargout_1) {
            pmax = x_data[expl_temp.xstart - 1];
            x_data[expl_temp.xstart - 1] = x_data[xmid];
            x_data[xmid] = pmax;
          }
          i = x_data[expl_temp.xend - 1];
          j = x_data[expl_temp.xstart - 1];
          pow2p = static_cast<int32_T>(std::fmin(
              static_cast<real_T>(
                  cmp_workspace_c_data[x_data[xend - 1] - 1].f1.size[1]),
              static_cast<real_T>(
                  cmp_workspace_c_data[x_data[pmin] - 1].f1.size[1])));
          varargout_1 =
              (cmp_workspace_c_data[x_data[expl_temp.xend - 1] - 1].f1.size[1] <
               cmp_workspace_c_data[x_data[expl_temp.xstart - 1] - 1]
                   .f1.size[1]);
          k = 0;
          do {
            exitg2 = 0;
            if (k <= pow2p - 1) {
              if (cmp_workspace_c_data[x_data[xend - 1] - 1].f1.data[k] !=
                  cmp_workspace_c_data[x_data[pmin] - 1].f1.data[k]) {
                varargout_1 =
                    (cmp_workspace_c_data[x_data[xend - 1] - 1].f1.data[k] <
                     cmp_workspace_c_data[x_data[pmin] - 1].f1.data[k]);
                exitg2 = 1;
              } else {
                k++;
              }
            } else {
              if (cmp_workspace_c_data[i - 1].f1.size[1] ==
                  cmp_workspace_c_data[j - 1].f1.size[1]) {
                varargout_1 = (i < j);
              }
              exitg2 = 1;
            }
          } while (exitg2 == 0);
          if (varargout_1) {
            pmax = x_data[expl_temp.xstart - 1];
            x_data[expl_temp.xstart - 1] = x_data[expl_temp.xend - 1];
            x_data[expl_temp.xend - 1] = pmax;
          }
          i = x_data[expl_temp.xend - 1];
          j = x_data[xmid];
          pow2p = static_cast<int32_T>(std::fmin(
              static_cast<real_T>(
                  cmp_workspace_c_data[x_data[xend - 1] - 1].f1.size[1]),
              static_cast<real_T>(
                  cmp_workspace_c_data[x_data[xmid] - 1].f1.size[1])));
          varargout_1 =
              (cmp_workspace_c_data[x_data[expl_temp.xend - 1] - 1].f1.size[1] <
               cmp_workspace_c_data[x_data[xmid] - 1].f1.size[1]);
          k = 0;
          do {
            exitg2 = 0;
            if (k <= pow2p - 1) {
              if (cmp_workspace_c_data[x_data[xend - 1] - 1].f1.data[k] !=
                  cmp_workspace_c_data[x_data[xmid] - 1].f1.data[k]) {
                varargout_1 =
                    (cmp_workspace_c_data[x_data[xend - 1] - 1].f1.data[k] <
                     cmp_workspace_c_data[x_data[xmid] - 1].f1.data[k]);
                exitg2 = 1;
              } else {
                k++;
              }
            } else {
              if (cmp_workspace_c_data[i - 1].f1.size[1] ==
                  cmp_workspace_c_data[j - 1].f1.size[1]) {
                varargout_1 = (i < j);
              }
              exitg2 = 1;
            }
          } while (exitg2 == 0);
          if (varargout_1) {
            pmax = x_data[xmid];
            x_data[xmid] = x_data[expl_temp.xend - 1];
            x_data[expl_temp.xend - 1] = pmax;
          }
          pmin = x_data[xmid] - 1;
          x_data[xmid] = x_data[expl_temp.xend - 2];
          x_data[expl_temp.xend - 2] = pmin + 1;
          i = expl_temp.xstart - 1;
          j = expl_temp.xend - 2;
          do {
            int32_T exitg3;
            int32_T exitg4;
            exitg2 = 0;
            i++;
            do {
              exitg3 = 0;
              pmax = x_data[i];
              pow2p = static_cast<int32_T>(std::fmin(
                  static_cast<real_T>(
                      cmp_workspace_c_data[x_data[i] - 1].f1.size[1]),
                  static_cast<real_T>(cmp_workspace_c_data[pmin].f1.size[1])));
              varargout_1 = (cmp_workspace_c_data[x_data[i] - 1].f1.size[1] <
                             cmp_workspace_c_data[pmin].f1.size[1]);
              k = 0;
              do {
                exitg4 = 0;
                if (k <= pow2p - 1) {
                  if (cmp_workspace_c_data[x_data[i] - 1].f1.data[k] !=
                      cmp_workspace_c_data[pmin].f1.data[k]) {
                    varargout_1 =
                        (cmp_workspace_c_data[x_data[i] - 1].f1.data[k] <
                         cmp_workspace_c_data[pmin].f1.data[k]);
                    exitg4 = 1;
                  } else {
                    k++;
                  }
                } else {
                  if (cmp_workspace_c_data[pmax - 1].f1.size[1] ==
                      cmp_workspace_c_data[pmin].f1.size[1]) {
                    varargout_1 = (pmax < pmin + 1);
                  }
                  exitg4 = 1;
                }
              } while (exitg4 == 0);
              if (varargout_1) {
                i++;
              } else {
                exitg3 = 1;
              }
            } while (exitg3 == 0);
            j--;
            do {
              exitg3 = 0;
              pmax = x_data[j];
              pow2p = static_cast<int32_T>(std::fmin(
                  static_cast<real_T>(cmp_workspace_c_data[pmin].f1.size[1]),
                  static_cast<real_T>(
                      cmp_workspace_c_data[x_data[j] - 1].f1.size[1])));
              varargout_1 = (cmp_workspace_c_data[pmin].f1.size[1] <
                             cmp_workspace_c_data[x_data[j] - 1].f1.size[1]);
              k = 0;
              do {
                exitg4 = 0;
                if (k <= pow2p - 1) {
                  if (cmp_workspace_c_data[pmin].f1.data[k] !=
                      cmp_workspace_c_data[x_data[j] - 1].f1.data[k]) {
                    varargout_1 =
                        (cmp_workspace_c_data[pmin].f1.data[k] <
                         cmp_workspace_c_data[x_data[j] - 1].f1.data[k]);
                    exitg4 = 1;
                  } else {
                    k++;
                  }
                } else {
                  if (cmp_workspace_c_data[pmin].f1.size[1] ==
                      cmp_workspace_c_data[pmax - 1].f1.size[1]) {
                    varargout_1 = (pmin + 1 < pmax);
                  }
                  exitg4 = 1;
                }
              } while (exitg4 == 0);
              if (varargout_1) {
                j--;
              } else {
                exitg3 = 1;
              }
            } while (exitg3 == 0);
            if (i + 1 >= j + 1) {
              exitg2 = 1;
            } else {
              pmax = x_data[i];
              x_data[i] = x_data[j];
              x_data[j] = pmax;
            }
          } while (exitg2 == 0);
          x_data[expl_temp.xend - 2] = x_data[i];
          x_data[i] = pmin + 1;
          if (i + 2 < expl_temp.xend) {
            st_d_data[st_n].xstart = i + 2;
            st_d_data[st_n].xend = expl_temp.xend;
            st_d_data[st_n].depth = expl_temp.depth + 1;
            st_n++;
          }
          if (expl_temp.xstart < i + 1) {
            st_d_data[st_n].xstart = expl_temp.xstart;
            st_d_data[st_n].xend = i + 1;
            st_d_data[st_n].depth = expl_temp.depth + 1;
            st_n++;
          }
        }
      }
    }
  }
}

} // namespace internal
} // namespace coder

// End of code generation (introsort.cu)
