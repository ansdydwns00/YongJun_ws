//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: predict.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

#ifndef PREDICT_H
#define PREDICT_H

// Include Files
#include "rtwtypes.h"
#include <cstddef>
#include <cstdlib>

class detector0_0;

// Function Declarations
namespace coder {
namespace internal {
void dlnetwork_predict(detector0_0 *obj, const float varargin_1_Data[24000],
                       const float varargin_2_Data[10800000],
                       float varargout_1_Data[321408],
                       float varargout_2_Data[321408],
                       float varargout_3_Data[107136],
                       float varargout_4_Data[107136],
                       float varargout_5_Data[107136],
                       float varargout_6_Data[107136]);

}
} // namespace coder

#endif
//
// File trailer for predict.h
//
// [EOF]
//
