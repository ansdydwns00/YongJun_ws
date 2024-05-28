//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// heapsort.cu
//
// Code generation for function 'heapsort'
//

// Include files
#include "heapsort.h"
#include "pointpillarsDetect_types.h"
#include "rt_nonfinite.h"
#include <cmath>

// Function Definitions
namespace coder {
namespace internal {
void b_heapsort(int32_T x_data[], int32_T xstart, int32_T xend,
                const cell_wrap_6 cmp_workspace_c_data[])
{
  int32_T b_n;
  int32_T cmpIdx;
  int32_T exitg2;
  int32_T extremum;
  int32_T extremumIdx;
  int32_T k;
  int32_T leftIdx;
  int32_T n;
  int32_T t;
  int32_T xcmp;
  int32_T xr;
  boolean_T changed;
  boolean_T exitg1;
  boolean_T varargout_1;
  n = (xend - xstart) - 1;
  for (t = 0; t <= n + 1; t++) {
    changed = true;
    extremumIdx = (n - t) + xstart;
    leftIdx = ((((n - t) + 2) << 1) + xstart) - 2;
    exitg1 = false;
    while ((!exitg1) && (leftIdx + 1 < xend)) {
      changed = false;
      extremum = x_data[extremumIdx];
      cmpIdx = leftIdx;
      xcmp = x_data[leftIdx] - 1;
      xr = x_data[leftIdx + 1];
      b_n = static_cast<int32_T>(std::fmin(
          static_cast<real_T>(
              cmp_workspace_c_data[x_data[leftIdx] - 1].f1.size[1]),
          static_cast<real_T>(
              cmp_workspace_c_data[x_data[leftIdx + 1] - 1].f1.size[1])));
      varargout_1 = (cmp_workspace_c_data[x_data[leftIdx] - 1].f1.size[1] <
                     cmp_workspace_c_data[x_data[leftIdx + 1] - 1].f1.size[1]);
      k = 0;
      do {
        exitg2 = 0;
        if (k <= b_n - 1) {
          if (cmp_workspace_c_data[x_data[leftIdx] - 1].f1.data[k] !=
              cmp_workspace_c_data[x_data[leftIdx + 1] - 1].f1.data[k]) {
            varargout_1 =
                (cmp_workspace_c_data[x_data[leftIdx] - 1].f1.data[k] <
                 cmp_workspace_c_data[x_data[leftIdx + 1] - 1].f1.data[k]);
            exitg2 = 1;
          } else {
            k++;
          }
        } else {
          if (cmp_workspace_c_data[xcmp].f1.size[1] ==
              cmp_workspace_c_data[xr - 1].f1.size[1]) {
            varargout_1 = (xcmp + 1 < xr);
          }
          exitg2 = 1;
        }
      } while (exitg2 == 0);
      if (varargout_1) {
        cmpIdx = leftIdx + 1;
        xcmp = x_data[leftIdx + 1] - 1;
      }
      b_n = static_cast<int32_T>(std::fmin(
          static_cast<real_T>(
              cmp_workspace_c_data[x_data[extremumIdx] - 1].f1.size[1]),
          static_cast<real_T>(cmp_workspace_c_data[xcmp].f1.size[1])));
      varargout_1 = (cmp_workspace_c_data[x_data[extremumIdx] - 1].f1.size[1] <
                     cmp_workspace_c_data[xcmp].f1.size[1]);
      k = 0;
      do {
        exitg2 = 0;
        if (k <= b_n - 1) {
          if (cmp_workspace_c_data[x_data[extremumIdx] - 1].f1.data[k] !=
              cmp_workspace_c_data[xcmp].f1.data[k]) {
            varargout_1 =
                (cmp_workspace_c_data[x_data[extremumIdx] - 1].f1.data[k] <
                 cmp_workspace_c_data[xcmp].f1.data[k]);
            exitg2 = 1;
          } else {
            k++;
          }
        } else {
          if (cmp_workspace_c_data[extremum - 1].f1.size[1] ==
              cmp_workspace_c_data[xcmp].f1.size[1]) {
            varargout_1 = (extremum < xcmp + 1);
          }
          exitg2 = 1;
        }
      } while (exitg2 == 0);
      if (varargout_1) {
        x_data[extremumIdx] = xcmp + 1;
        x_data[cmpIdx] = extremum;
        extremumIdx = cmpIdx;
        leftIdx = ((((cmpIdx - xstart) + 2) << 1) + xstart) - 2;
        changed = true;
      } else {
        exitg1 = true;
      }
    }
    if (changed && (leftIdx + 1 <= xend)) {
      extremum = x_data[extremumIdx];
      xcmp = x_data[leftIdx];
      b_n = static_cast<int32_T>(std::fmin(
          static_cast<real_T>(
              cmp_workspace_c_data[x_data[extremumIdx] - 1].f1.size[1]),
          static_cast<real_T>(
              cmp_workspace_c_data[x_data[leftIdx] - 1].f1.size[1])));
      varargout_1 = (cmp_workspace_c_data[x_data[extremumIdx] - 1].f1.size[1] <
                     cmp_workspace_c_data[x_data[leftIdx] - 1].f1.size[1]);
      k = 0;
      do {
        exitg2 = 0;
        if (k <= b_n - 1) {
          if (cmp_workspace_c_data[x_data[extremumIdx] - 1].f1.data[k] !=
              cmp_workspace_c_data[x_data[leftIdx] - 1].f1.data[k]) {
            varargout_1 =
                (cmp_workspace_c_data[x_data[extremumIdx] - 1].f1.data[k] <
                 cmp_workspace_c_data[x_data[leftIdx] - 1].f1.data[k]);
            exitg2 = 1;
          } else {
            k++;
          }
        } else {
          if (cmp_workspace_c_data[extremum - 1].f1.size[1] ==
              cmp_workspace_c_data[xcmp - 1].f1.size[1]) {
            varargout_1 = (extremum < xcmp);
          }
          exitg2 = 1;
        }
      } while (exitg2 == 0);
      if (varargout_1) {
        x_data[extremumIdx] = x_data[leftIdx];
        x_data[leftIdx] = extremum;
      }
    }
  }
  for (k = 0; k <= n; k++) {
    t = x_data[(xend - k) - 1];
    x_data[(xend - k) - 1] = x_data[xstart - 1];
    x_data[xstart - 1] = t;
    changed = true;
    extremumIdx = xstart - 1;
    leftIdx = xstart;
    exitg1 = false;
    while ((!exitg1) && (leftIdx + 1 < (xend - k) - 1)) {
      changed = false;
      extremum = x_data[extremumIdx];
      cmpIdx = leftIdx;
      xcmp = x_data[leftIdx] - 1;
      xr = x_data[leftIdx + 1];
      b_n = static_cast<int32_T>(std::fmin(
          static_cast<real_T>(
              cmp_workspace_c_data[x_data[leftIdx] - 1].f1.size[1]),
          static_cast<real_T>(
              cmp_workspace_c_data[x_data[leftIdx + 1] - 1].f1.size[1])));
      varargout_1 = (cmp_workspace_c_data[x_data[leftIdx] - 1].f1.size[1] <
                     cmp_workspace_c_data[x_data[leftIdx + 1] - 1].f1.size[1]);
      t = 0;
      do {
        exitg2 = 0;
        if (t <= b_n - 1) {
          if (cmp_workspace_c_data[x_data[leftIdx] - 1].f1.data[t] !=
              cmp_workspace_c_data[x_data[leftIdx + 1] - 1].f1.data[t]) {
            varargout_1 =
                (cmp_workspace_c_data[x_data[leftIdx] - 1].f1.data[t] <
                 cmp_workspace_c_data[x_data[leftIdx + 1] - 1].f1.data[t]);
            exitg2 = 1;
          } else {
            t++;
          }
        } else {
          if (cmp_workspace_c_data[xcmp].f1.size[1] ==
              cmp_workspace_c_data[xr - 1].f1.size[1]) {
            varargout_1 = (xcmp + 1 < xr);
          }
          exitg2 = 1;
        }
      } while (exitg2 == 0);
      if (varargout_1) {
        cmpIdx = leftIdx + 1;
        xcmp = x_data[leftIdx + 1] - 1;
      }
      b_n = static_cast<int32_T>(std::fmin(
          static_cast<real_T>(
              cmp_workspace_c_data[x_data[extremumIdx] - 1].f1.size[1]),
          static_cast<real_T>(cmp_workspace_c_data[xcmp].f1.size[1])));
      varargout_1 = (cmp_workspace_c_data[x_data[extremumIdx] - 1].f1.size[1] <
                     cmp_workspace_c_data[xcmp].f1.size[1]);
      t = 0;
      do {
        exitg2 = 0;
        if (t <= b_n - 1) {
          if (cmp_workspace_c_data[x_data[extremumIdx] - 1].f1.data[t] !=
              cmp_workspace_c_data[xcmp].f1.data[t]) {
            varargout_1 =
                (cmp_workspace_c_data[x_data[extremumIdx] - 1].f1.data[t] <
                 cmp_workspace_c_data[xcmp].f1.data[t]);
            exitg2 = 1;
          } else {
            t++;
          }
        } else {
          if (cmp_workspace_c_data[extremum - 1].f1.size[1] ==
              cmp_workspace_c_data[xcmp].f1.size[1]) {
            varargout_1 = (extremum < xcmp + 1);
          }
          exitg2 = 1;
        }
      } while (exitg2 == 0);
      if (varargout_1) {
        x_data[extremumIdx] = xcmp + 1;
        x_data[cmpIdx] = extremum;
        extremumIdx = cmpIdx;
        leftIdx = ((((cmpIdx - xstart) + 2) << 1) + xstart) - 2;
        changed = true;
      } else {
        exitg1 = true;
      }
    }
    if (changed && (leftIdx + 1 <= (xend - k) - 1)) {
      extremum = x_data[extremumIdx];
      xcmp = x_data[leftIdx];
      b_n = static_cast<int32_T>(std::fmin(
          static_cast<real_T>(
              cmp_workspace_c_data[x_data[extremumIdx] - 1].f1.size[1]),
          static_cast<real_T>(
              cmp_workspace_c_data[x_data[leftIdx] - 1].f1.size[1])));
      varargout_1 = (cmp_workspace_c_data[x_data[extremumIdx] - 1].f1.size[1] <
                     cmp_workspace_c_data[x_data[leftIdx] - 1].f1.size[1]);
      t = 0;
      do {
        exitg2 = 0;
        if (t <= b_n - 1) {
          if (cmp_workspace_c_data[x_data[extremumIdx] - 1].f1.data[t] !=
              cmp_workspace_c_data[x_data[leftIdx] - 1].f1.data[t]) {
            varargout_1 =
                (cmp_workspace_c_data[x_data[extremumIdx] - 1].f1.data[t] <
                 cmp_workspace_c_data[x_data[leftIdx] - 1].f1.data[t]);
            exitg2 = 1;
          } else {
            t++;
          }
        } else {
          if (cmp_workspace_c_data[extremum - 1].f1.size[1] ==
              cmp_workspace_c_data[xcmp - 1].f1.size[1]) {
            varargout_1 = (extremum < xcmp);
          }
          exitg2 = 1;
        }
      } while (exitg2 == 0);
      if (varargout_1) {
        x_data[extremumIdx] = x_data[leftIdx];
        x_data[leftIdx] = extremum;
      }
    }
  }
}

} // namespace internal
} // namespace coder

// End of code generation (heapsort.cu)
