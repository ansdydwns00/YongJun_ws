//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: ros2subscriber.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

#ifndef ROS2SUBSCRIBER_H
#define ROS2SUBSCRIBER_H

// Include Files
#include "deployedPointPillarModel_types.h"
#include "rtwtypes.h"
#include "coder_array.h"
#include <cstddef>
#include <cstdlib>

namespace coder {
struct ros2subscriber;

struct ros2node;

} // namespace coder

// Function Declarations
namespace coder {
void ros2subscriber_receive(
    const ros2subscriber *obj, char receivedMsg_MessageType[23],
    unsigned int *receivedMsg_height, unsigned int *receivedMsg_width,
    array<sensor_msgs_PointFieldStruct_T, 1U> &receivedMsg_fields,
    unsigned int *receivedMsg_point_step,
    array<unsigned char, 1U> &receivedMsg_data);

ros2subscriber *ros2subscriber_ros2subscriber(ros2subscriber *obj,
                                              const ros2node *node);

} // namespace coder

#endif
//
// File trailer for ros2subscriber.h
//
// [EOF]
//
