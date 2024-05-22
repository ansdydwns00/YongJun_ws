//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: getCategoryNames.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "getCategoryNames.h"
#include "deployedPointPillarModel_internal_types.h"
#include "rt_nonfinite.h"
#include "coder_array.h"

// Function Definitions
//
// Arguments    : const array<cell_wrap_6, 1U> &valueSet
//                array<cell_wrap_6, 1U> &outCategoryNames
// Return Type  : void
//
namespace coder {
void categorical_getCategoryNames(const array<cell_wrap_6, 1U> &valueSet,
                                  array<cell_wrap_6, 1U> &outCategoryNames)
{
  if (valueSet.size(0) != 0) {
    int i2;
    i2 = valueSet.size(0);
    outCategoryNames.set_size(valueSet.size(0));
    for (int i{0}; i < i2; i++) {
      int loop_ub;
      loop_ub = valueSet[i].f1.size(1);
      outCategoryNames[i].f1.set_size(1, valueSet[i].f1.size(1));
      for (int b_i{0}; b_i < loop_ub; b_i++) {
        outCategoryNames[i].f1[b_i] = valueSet[i].f1[b_i];
      }
    }
  } else {
    outCategoryNames.set_size(0);
  }
}

} // namespace coder

//
// File trailer for getCategoryNames.cu
//
// [EOF]
//
