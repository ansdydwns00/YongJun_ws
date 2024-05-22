//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: vision_msgs_Detection3DStruct.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "vision_msgs_Detection3DStruct.h"
#include "deployedPointPillarModel_types.h"
#include "rt_nonfinite.h"
#include "std_msgs_HeaderStruct.h"
#include "vision_msgs_BoundingBox3DStruct.h"
#include "vision_msgs_ObjectHypothesisWithPoseStruct.h"
#include "coder_array.h"

// Function Definitions
//
// Message struct definition for vision_msgs/Detection3D
//
// Arguments    : vision_msgs_Detection3DStruct_T *msg
// Return Type  : void
//
void vision_msgs_Detection3DStruct(vision_msgs_Detection3DStruct_T *msg)
{
  static const char b_cv[23]{'v', 'i', 's', 'i', 'o', 'n', '_', 'm',
                             's', 'g', 's', '/', 'D', 'e', 't', 'e',
                             'c', 't', 'i', 'o', 'n', '3', 'D'};
  vision_msgs_ObjectHypothesisWithPoseStruct_T expl_temp;
  for (int i{0}; i < 23; i++) {
    msg->MessageType[i] = b_cv[i];
  }
  std_msgs_HeaderStruct(&msg->header);
  vision_msgs_ObjectHypothesisWithPoseStruct(&expl_temp);
  vision_msgs_BoundingBox3DStruct(&msg->bbox);
  msg->results.set_size(1);
  for (int i{0}; i < 36; i++) {
    msg->results[0].MessageType[i] = expl_temp.MessageType[i];
  }
  for (int i{0}; i < 28; i++) {
    msg->results[0].hypothesis.MessageType[i] =
        expl_temp.hypothesis.MessageType[i];
  }
  msg->results[0].hypothesis.class_id.set_size(
      1, expl_temp.hypothesis.class_id.size(1));
  for (int i{0}; i < expl_temp.hypothesis.class_id.size(1); i++) {
    msg->results[0].hypothesis.class_id[i] = expl_temp.hypothesis.class_id[i];
  }
  msg->results[0].hypothesis.score = expl_temp.hypothesis.score;
  for (int i{0}; i < 32; i++) {
    msg->results[0].pose.MessageType[i] = expl_temp.pose.MessageType[i];
  }
  for (int i{0}; i < 18; i++) {
    msg->results[0].pose.pose.MessageType[i] =
        expl_temp.pose.pose.MessageType[i];
  }
  for (int i{0}; i < 19; i++) {
    msg->results[0].pose.pose.position.MessageType[i] =
        expl_temp.pose.pose.position.MessageType[i];
  }
  msg->results[0].pose.pose.position.x = expl_temp.pose.pose.position.x;
  msg->results[0].pose.pose.position.y = expl_temp.pose.pose.position.y;
  msg->results[0].pose.pose.position.z = expl_temp.pose.pose.position.z;
  for (int i{0}; i < 24; i++) {
    msg->results[0].pose.pose.orientation.MessageType[i] =
        expl_temp.pose.pose.orientation.MessageType[i];
  }
  msg->results[0].pose.pose.orientation.x = expl_temp.pose.pose.orientation.x;
  msg->results[0].pose.pose.orientation.y = expl_temp.pose.pose.orientation.y;
  msg->results[0].pose.pose.orientation.z = expl_temp.pose.pose.orientation.z;
  msg->results[0].pose.pose.orientation.w = expl_temp.pose.pose.orientation.w;
  for (int i{0}; i < 36; i++) {
    msg->results[0].pose.covariance[i] = expl_temp.pose.covariance[i];
  }
  msg->id.set_size(1, 0);
  msg->results.set_size(0);
  //(msg);
}

//
// File trailer for vision_msgs_Detection3DStruct.cu
//
// [EOF]
//
