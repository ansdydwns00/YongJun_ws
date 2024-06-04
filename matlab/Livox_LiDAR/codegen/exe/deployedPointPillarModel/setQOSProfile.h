//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: setQOSProfile.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

#ifndef SETQOSPROFILE_H
#define SETQOSPROFILE_H

// Include Files
#include "rtwtypes.h"
#include "rmw/qos_profiles.h"
#include <cstddef>
#include <cstdlib>

// Function Declarations
namespace coder {
namespace ros {
namespace ros2 {
namespace internal {
rmw_qos_profile_t setQOSProfile(rmw_qos_profile_t rmwProfile, double qosDepth,
                                const char qosReliability[8]);

}
} // namespace ros2
} // namespace ros
} // namespace coder

#endif
//
// File trailer for setQOSProfile.h
//
// [EOF]
//
