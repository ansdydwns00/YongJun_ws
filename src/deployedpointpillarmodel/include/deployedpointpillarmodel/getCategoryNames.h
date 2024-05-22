//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: getCategoryNames.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

#ifndef GETCATEGORYNAMES_H
#define GETCATEGORYNAMES_H

// Include Files
#include "deployedPointPillarModel_internal_types.h"
#include "rtwtypes.h"
#include "coder_array.h"
#include <cstddef>
#include <cstdlib>

// Function Declarations
namespace coder {
void categorical_getCategoryNames(const array<cell_wrap_6, 1U> &valueSet,
                                  array<cell_wrap_6, 1U> &outCategoryNames);

}

#endif
//
// File trailer for getCategoryNames.h
//
// [EOF]
//
