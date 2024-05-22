//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: rosReadXYZ.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

#ifndef ROSREADXYZ_H
#define ROSREADXYZ_H

// Include Files
#include "deployedPointPillarModel_types.h"
#include "rtwtypes.h"
#include "coder_array.h"
#include <cstddef>
#include <cstdlib>

// Function Declarations
namespace coder {
void rosReadXYZ(unsigned int msg_height, unsigned int msg_width,
                const array<sensor_msgs_PointFieldStruct_T, 1U> &msg_fields,
                unsigned int msg_point_step,
                const array<unsigned char, 1U> &msg_data,
                array<float, 2U> &xyz);

}

#endif
//
// File trailer for rosReadXYZ.h
//
// [EOF]
//
