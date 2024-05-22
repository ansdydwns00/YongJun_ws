//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: arrayfun.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

#ifndef ARRAYFUN_H
#define ARRAYFUN_H

// Include Files
#include "deployedPointPillarModel_internal_types.h"
#include "rtwtypes.h"
#include "coder_array.h"
#include <cstddef>
#include <cstdlib>

// Function Declarations
namespace coder {
void applyArrayFunction(const float fun_workspace_predLoc[321408],
                        const array<cell_wrap_60, 2U> &fun_workspace_newAnchors,
                        const array<double, 1U> &varargin_1,
                        const array<double, 1U> &varargin_2,
                        const array<double, 1U> &varargin_3,
                        const array<double, 1U> &varargin_4,
                        array<float, 1U> &varargout_1);

void arrayfun(const float fun_workspace_predLoc[321408],
              const array<cell_wrap_60, 2U> &fun_workspace_newAnchors,
              const array<double, 1U> &varargin_1,
              const array<double, 1U> &varargin_2,
              const array<double, 1U> &varargin_3,
              array<float, 1U> &varargout_1);

void arrayfun(const float fun_workspace_predAngle[107136],
              const array<cell_wrap_60, 2U> &fun_workspace_newAnchors,
              const array<double, 1U> &varargin_1,
              const array<double, 1U> &varargin_2,
              const array<double, 1U> &varargin_3,
              const array<float, 1U> &varargin_4,
              array<float, 1U> &varargout_1);

void b_applyArrayFunction(
    const float fun_workspace_predLoc[321408],
    const array<cell_wrap_60, 2U> &fun_workspace_newAnchors,
    const array<double, 1U> &varargin_1, const array<double, 1U> &varargin_2,
    const array<double, 1U> &varargin_3, const array<double, 1U> &varargin_4,
    array<float, 1U> &varargout_1);

} // namespace coder

#endif
//
// File trailer for arrayfun.h
//
// [EOF]
//
