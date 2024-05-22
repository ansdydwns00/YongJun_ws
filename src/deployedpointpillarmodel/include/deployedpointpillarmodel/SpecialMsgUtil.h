//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: SpecialMsgUtil.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

#ifndef SPECIALMSGUTIL_H
#define SPECIALMSGUTIL_H

// Include Files
#include "rtwtypes.h"
#include "coder_array.h"
#include <cstddef>
#include <cstdlib>

// Function Declarations
namespace coder {
namespace ros {
namespace internal {
namespace ros2 {
void SpecialMsgUtil_readFieldFromData(const array<unsigned char, 1U> &b_data,
                                      const array<double, 2U> &byteIdx,
                                      const array<bool, 2U> &pointIdxIsValid,
                                      array<float, 1U> &fieldPoints);

}
} // namespace internal
} // namespace ros
} // namespace coder

#endif
//
// File trailer for SpecialMsgUtil.h
//
// [EOF]
//
