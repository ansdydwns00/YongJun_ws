//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: ros2publisher.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "ros2publisher.h"
#include "deployedPointPillarModel_internal_types.h"
#include "deployedPointPillarModel_types.h"
#include "rt_nonfinite.h"
#include "setQOSProfile.h"
#include "vision_msgs_Detection3DArrayStruct.h"
#include "mlros2_node.h"
#include "mlros2_pub.h"
#include "rmw/qos_profiles.h"

// Function Definitions
//
// Arguments    : ros2publisher *obj
//                const ros2node *node
// Return Type  : ros2publisher *
//
namespace coder {
ros2publisher *ros2publisher_ros2publisher(ros2publisher *obj,
                                           const ros2node *node)
{
  static const char resolvedTopic[17]{'/', 'o', 'b', 'j', 'D', 'e',
                                      't', 'e', 'c', 't', 'i', 'o',
                                      'n', 'I', 'n', 'f', 'o'};
  static const char b_cv[8]{'k', 'e', 'e', 'p', 'l', 'a', 's', 't'};
  static const char cv1[8]{'r', 'e', 'l', 'i', 'a', 'b', 'l', 'e'};
  static const char cv2[8]{'v', 'o', 'l', 'a', 't', 'i', 'l', 'e'};
  ros2publisher *b_obj;
  vision_msgs_Detection3DArrayStruct_T r;
  b_obj = obj;
  for (int i{0}; i < 17; i++) {
    b_obj->TopicName[i] = resolvedTopic[i];
  }
  b_obj->Depth = 1.0;
  for (int i{0}; i < 8; i++) {
    b_obj->History[i] = b_cv[i];
    b_obj->Reliability[i] = cv1[i];
    b_obj->Durability[i] = cv2[i];
  }
  rmw_qos_profile_t qos_profile;
  qos_profile = ros::ros2::internal::setQOSProfile(
      rmw_qos_profile_default, b_obj->Depth, b_obj->Reliability);
  vision_msgs_Detection3DArrayStruct(&r);
  b_obj->PublisherHelper = std::unique_ptr<
      MATLABROS2Publisher<vision_msgs::msg::Detection3DArray,
                          vision_msgs_Detection3DArrayStruct_T>>(
      new MATLABROS2Publisher<vision_msgs::msg::Detection3DArray,
                              vision_msgs_Detection3DArrayStruct_T>{}); //();
  MATLABROS2Publisher_createPublisher(b_obj->PublisherHelper, node->NodeHandle,
                                      &b_obj->TopicName[0], 17.0, qos_profile);
  return b_obj;
}

} // namespace coder

//
// File trailer for ros2publisher.cu
//
// [EOF]
//
