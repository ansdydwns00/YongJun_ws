//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: ros2rate.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "ros2rate.h"
#include "builtin_interfaces_TimeStruct.h"
#include "deployedPointPillarModel_data.h"
#include "deployedPointPillarModel_internal_types.h"
#include "deployedPointPillarModel_types.h"
#include "rt_nonfinite.h"
#include "coder_posix_time.h"
#include "mlros2_time.h"
#include "rclcpp/rclcpp.hpp"
#include <cmath>

// Function Definitions
//
// Arguments    : void
// Return Type  : double
//
namespace coder {
double ros2rate_getCurrentTime()
{
  builtin_interfaces_TimeStruct_T timeStruct;
  bool isSimTime;
  builtin_interfaces_TimeStruct();
  isSimTime = getSimTime();
  time2struct(&timeStruct, !isSimTime);
  return static_cast<double>(timeStruct.sec) +
         static_cast<double>(timeStruct.nanosec) * 1.0E-9;
}

//
// Arguments    : const ros2rate *obj
//                double sleepTime
// Return Type  : void
//
void ros2rate_internalSleep(const ros2rate *obj, double sleepTime)
{
  coderTimespec b_timespec;
  double elapsedTime;
  double endTime;
  double lastWakeTime;
  bool exitg1;
  lastWakeTime = ros2rate_getCurrentTime() - obj->StartTime;
  endTime = lastWakeTime + sleepTime;
  elapsedTime = ros2rate_getCurrentTime() - obj->StartTime;
  exitg1 = false;
  while ((!exitg1) && (elapsedTime < endTime)) {
    elapsedTime = std::fmin(sleepTime, obj->CheckPeriod);
    if (pauseState == 0) {
      double delayInt;
      if ((elapsedTime < 0.0) || std::isnan(elapsedTime)) {
        elapsedTime = 0.0;
      }
      delayInt = std::floor(elapsedTime);
      if (delayInt > 4.294967295E+9) {
        delayInt = 4.294967295E+9;
      }
      elapsedTime -= delayInt;
      if (elapsedTime > 0.0) {
        b_timespec.tv_nsec = std::floor(elapsedTime * 1.0E+9);
      } else {
        b_timespec.tv_nsec = 0.0;
      }
      b_timespec.tv_sec = delayInt;
      coderTimeSleep(&b_timespec);
    }
    elapsedTime = ros2rate_getCurrentTime() - obj->StartTime;
    if (elapsedTime < lastWakeTime) {
      exitg1 = true;
    } else {
      lastWakeTime = elapsedTime;
      sleepTime = endTime - elapsedTime;
    }
  }
}

//
// Arguments    : ros2rate *obj
// Return Type  : ros2rate *
//
ros2rate *ros2rate_ros2rate(ros2rate *obj)
{
  ros2rate *b_obj;
  bool isTimeValid;
  b_obj = obj;
  b_obj->CheckPeriod = 0.01;
  isTimeValid = false;
  while (!isTimeValid) {
    isTimeValid = (ros2rate_getCurrentTime() > 0.0);
  }
  b_obj->DesiredRate = 20.0;
  b_obj->DesiredPeriod = 1.0 / b_obj->DesiredRate;
  b_obj->PreviousPeriod = ros2rate_getCurrentTime();
  b_obj->OverrunAction[0] = 's';
  b_obj->OverrunAction[1] = 'l';
  b_obj->OverrunAction[2] = 'i';
  b_obj->OverrunAction[3] = 'p';
  b_obj->LastWakeTime = rtNaN;
  b_obj->LastWakeTime = 0.0;
  b_obj->StartTime = ros2rate_getCurrentTime();
  b_obj->NextExecutionIndex = 0.0;
  b_obj->ExecutionStartTime = 0.0;
  b_obj->ExecutionStartTime = ros2rate_getCurrentTime();
  return b_obj;
}

} // namespace coder

//
// File trailer for ros2rate.cu
//
// [EOF]
//
