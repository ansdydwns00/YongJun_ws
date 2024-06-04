//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: ros2rate.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

#ifndef ROS2RATE_H
#define ROS2RATE_H

// Include Files
#include "rtwtypes.h"
#include <cstddef>
#include <cstdlib>

namespace coder {
struct ros2rate;

}

// Function Declarations
namespace coder {
double ros2rate_getCurrentTime();

void ros2rate_internalSleep(const ros2rate *obj, double sleepTime);

ros2rate *ros2rate_ros2rate(ros2rate *obj);

} // namespace coder

#endif
//
// File trailer for ros2rate.h
//
// [EOF]
//
