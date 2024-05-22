//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: arrayfun.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "arrayfun.h"
#include "deployedPointPillarModel_internal_types.h"
#include "rt_nonfinite.h"
#include "coder_array.h"
#include <cmath>

// Function Definitions
//
// Arguments    : const float fun_workspace_predLoc[321408]
//                const array<cell_wrap_60, 2U> &fun_workspace_newAnchors
//                const array<double, 1U> &varargin_1
//                const array<double, 1U> &varargin_2
//                const array<double, 1U> &varargin_3
//                const array<double, 1U> &varargin_4
//                array<float, 1U> &varargout_1
// Return Type  : void
//
namespace coder {
void applyArrayFunction(const float fun_workspace_predLoc[321408],
                        const array<cell_wrap_60, 2U> &fun_workspace_newAnchors,
                        const array<double, 1U> &varargin_1,
                        const array<double, 1U> &varargin_2,
                        const array<double, 1U> &varargin_3,
                        const array<double, 1U> &varargin_4,
                        array<float, 1U> &varargout_1)
{
  int n;
  varargout_1.set_size(varargin_1.size(0));
  n = varargin_1.size(0);
  for (int k{0}; k < n; k++) {
    varargout_1[k] =
        fun_workspace_predLoc[((static_cast<int>(varargin_1[k]) +
                                216 * (static_cast<int>(varargin_2[k]) - 1)) +
                               53568 * (static_cast<int>(varargin_3[k]) - 1)) -
                              1] *
            static_cast<float>(std::sqrt(
                fun_workspace_newAnchors[static_cast<int>(varargin_3[k]) - 1]
                        .f1[0] *
                    fun_workspace_newAnchors[static_cast<int>(varargin_3[k]) -
                                             1]
                        .f1[0] +
                fun_workspace_newAnchors[static_cast<int>(varargin_3[k]) - 1]
                        .f1[1] *
                    fun_workspace_newAnchors[static_cast<int>(varargin_3[k]) -
                                             1]
                        .f1[1])) +
        static_cast<float>(varargin_4[k]);
  }
}

//
// Arguments    : const float fun_workspace_predLoc[321408]
//                const array<cell_wrap_60, 2U> &fun_workspace_newAnchors
//                const array<double, 1U> &varargin_1
//                const array<double, 1U> &varargin_2
//                const array<double, 1U> &varargin_3
//                array<float, 1U> &varargout_1
// Return Type  : void
//
void arrayfun(const float fun_workspace_predLoc[321408],
              const array<cell_wrap_60, 2U> &fun_workspace_newAnchors,
              const array<double, 1U> &varargin_1,
              const array<double, 1U> &varargin_2,
              const array<double, 1U> &varargin_3,
              array<float, 1U> &varargout_1)
{
  int n;
  varargout_1.set_size(varargin_1.size(0));
  n = varargin_1.size(0);
  for (int k{0}; k < n; k++) {
    varargout_1[k] =
        fun_workspace_predLoc[((static_cast<int>(varargin_1[k]) +
                                216 * (static_cast<int>(varargin_2[k]) - 1)) +
                               53568 * (static_cast<int>(varargin_3[k]) - 1)) +
                              214271] *
            static_cast<float>(
                fun_workspace_newAnchors[static_cast<int>(varargin_3[k]) - 1]
                    .f1[2]) +
        static_cast<float>(
            fun_workspace_newAnchors[static_cast<int>(varargin_3[k]) - 1]
                .f1[3]);
  }
}

//
// Arguments    : const float fun_workspace_predAngle[107136]
//                const array<cell_wrap_60, 2U> &fun_workspace_newAnchors
//                const array<double, 1U> &varargin_1
//                const array<double, 1U> &varargin_2
//                const array<double, 1U> &varargin_3
//                const array<float, 1U> &varargin_4
//                array<float, 1U> &varargout_1
// Return Type  : void
//
void arrayfun(const float fun_workspace_predAngle[107136],
              const array<cell_wrap_60, 2U> &fun_workspace_newAnchors,
              const array<double, 1U> &varargin_1,
              const array<double, 1U> &varargin_2,
              const array<double, 1U> &varargin_3,
              const array<float, 1U> &varargin_4, array<float, 1U> &varargout_1)
{
  int n;
  varargout_1.set_size(varargin_1.size(0));
  n = varargin_1.size(0);
  for (int k{0}; k < n; k++) {
    varargout_1[k] =
        varargin_4[k] *
            std::asin(fun_workspace_predAngle
                          [((static_cast<int>(varargin_1[k]) +
                             216 * (static_cast<int>(varargin_2[k]) - 1)) +
                            53568 * (static_cast<int>(varargin_3[k]) - 1)) -
                           1]) +
        static_cast<float>(
            fun_workspace_newAnchors[static_cast<int>(varargin_3[k]) - 1]
                .f1[4]);
  }
}

//
// Arguments    : const float fun_workspace_predLoc[321408]
//                const array<cell_wrap_60, 2U> &fun_workspace_newAnchors
//                const array<double, 1U> &varargin_1
//                const array<double, 1U> &varargin_2
//                const array<double, 1U> &varargin_3
//                const array<double, 1U> &varargin_4
//                array<float, 1U> &varargout_1
// Return Type  : void
//
void b_applyArrayFunction(
    const float fun_workspace_predLoc[321408],
    const array<cell_wrap_60, 2U> &fun_workspace_newAnchors,
    const array<double, 1U> &varargin_1, const array<double, 1U> &varargin_2,
    const array<double, 1U> &varargin_3, const array<double, 1U> &varargin_4,
    array<float, 1U> &varargout_1)
{
  int n;
  varargout_1.set_size(varargin_1.size(0));
  n = varargin_1.size(0);
  for (int k{0}; k < n; k++) {
    varargout_1[k] =
        fun_workspace_predLoc[((static_cast<int>(varargin_1[k]) +
                                216 * (static_cast<int>(varargin_2[k]) - 1)) +
                               53568 * (static_cast<int>(varargin_3[k]) - 1)) +
                              107135] *
            static_cast<float>(std::sqrt(
                fun_workspace_newAnchors[static_cast<int>(varargin_3[k]) - 1]
                        .f1[0] *
                    fun_workspace_newAnchors[static_cast<int>(varargin_3[k]) -
                                             1]
                        .f1[0] +
                fun_workspace_newAnchors[static_cast<int>(varargin_3[k]) - 1]
                        .f1[1] *
                    fun_workspace_newAnchors[static_cast<int>(varargin_3[k]) -
                                             1]
                        .f1[1])) +
        static_cast<float>(varargin_4[k]);
  }
}

} // namespace coder

//
// File trailer for arrayfun.cu
//
// [EOF]
//
