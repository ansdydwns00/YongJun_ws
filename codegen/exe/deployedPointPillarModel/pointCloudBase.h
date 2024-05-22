//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: pointCloudBase.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

#ifndef POINTCLOUDBASE_H
#define POINTCLOUDBASE_H

// Include Files
#include "rtwtypes.h"
#include "coder_array.h"
#include <cstddef>
#include <cstdlib>

namespace coder {
struct pointCloud;

}

// Function Declarations
namespace coder {
void pointCloudBase_set_Color(pointCloud *b_this,
                              const array<unsigned char, 2U> &b_value);

}

#endif
//
// File trailer for pointCloudBase.h
//
// [EOF]
//
