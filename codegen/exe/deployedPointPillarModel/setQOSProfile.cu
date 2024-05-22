//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: setQOSProfile.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "setQOSProfile.h"
#include "rt_nonfinite.h"
#include "mlros2_qos.h"
#include "rmw/qos_profiles.h"
#include "rmw/types.h"
#include <cstddef>

// Function Definitions
//
// Arguments    : rmw_qos_profile_t rmwProfile
//                double qosDepth
//                const char qosReliability[8]
// Return Type  : rmw_qos_profile_t
//
namespace coder {
namespace ros {
namespace ros2 {
namespace internal {
rmw_qos_profile_t setQOSProfile(rmw_qos_profile_t rmwProfile, double qosDepth,
                                const char qosReliability[8])
{
  static const char b_cv[8]{'r', 'e', 'l', 'i', 'a', 'b', 'l', 'e'};
  rmw_qos_reliability_policy_t reliability;
  int k;
  char s[8];
  bool exitg1;
  bool p;
  for (k = 0; k < 8; k++) {
    char c;
    c = qosReliability[k];
    s[k] = c;
    if ((c >= 'A') && (c <= 'Z')) {
      s[k] = static_cast<char>(static_cast<unsigned int>(c) + 32U);
    }
  }
  p = true;
  k = 0;
  exitg1 = false;
  while ((!exitg1) && (k < 8)) {
    if (s[k] != b_cv[k]) {
      p = false;
      exitg1 = true;
    } else {
      k++;
    }
  }
  if (p) {
    reliability = RMW_QOS_POLICY_RELIABILITY_RELIABLE;
  } else {
    reliability = RMW_QOS_POLICY_RELIABILITY_BEST_EFFORT;
  }
  SET_QOS_VALUES(rmwProfile, RMW_QOS_POLICY_HISTORY_KEEP_LAST, (size_t)qosDepth,
                 RMW_QOS_POLICY_DURABILITY_VOLATILE, reliability);
  return rmwProfile;
}

} // namespace internal
} // namespace ros2
} // namespace ros
} // namespace coder

//
// File trailer for setQOSProfile.cu
//
// [EOF]
//
