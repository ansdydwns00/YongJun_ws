//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: PointCloud2Types.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

#ifndef POINTCLOUD2TYPES_H
#define POINTCLOUD2TYPES_H

// Include Files
#include "rtwtypes.h"
#include "coder_array.h"
#include <cstddef>
#include <cstdlib>

// Function Declarations
namespace coder {
namespace ros {
namespace msg {
namespace sensor_msgs {
namespace internal {
void PointCloud2Types_rosToMATLABType(unsigned char type,
                                      array<char, 2U> &mlType,
                                      double *numBytes);

}
} // namespace sensor_msgs
} // namespace msg
} // namespace ros
} // namespace coder

#endif
//
// File trailer for PointCloud2Types.h
//
// [EOF]
//
