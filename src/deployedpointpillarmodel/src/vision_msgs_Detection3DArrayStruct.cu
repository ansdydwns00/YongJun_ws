//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: vision_msgs_Detection3DArrayStruct.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "vision_msgs_Detection3DArrayStruct.h"
#include "deployedPointPillarModel_types.h"
#include "rt_nonfinite.h"
#include "std_msgs_HeaderStruct.h"
#include "vision_msgs_Detection3DStruct.h"
#include "coder_array.h"

// Function Definitions
//
// Message struct definition for vision_msgs/Detection3DArray
//
// Arguments    : vision_msgs_Detection3DArrayStruct_T *msg
// Return Type  : void
//
void vision_msgs_Detection3DArrayStruct(
    vision_msgs_Detection3DArrayStruct_T *msg)
{
  static const char b_cv[28]{'v', 'i', 's', 'i', 'o', 'n', '_', 'm', 's', 'g',
                             's', '/', 'D', 'e', 't', 'e', 'c', 't', 'i', 'o',
                             'n', '3', 'D', 'A', 'r', 'r', 'a', 'y'};
  vision_msgs_Detection3DStruct_T expl_temp;
  for (int i{0}; i < 28; i++) {
    msg->MessageType[i] = b_cv[i];
  }
  std_msgs_HeaderStruct(&msg->header);
  vision_msgs_Detection3DStruct(&expl_temp);
  msg->detections.set_size(1);
  for (int i{0}; i < 23; i++) {
    msg->detections[0].MessageType[i] = expl_temp.MessageType[i];
  }
  for (int i{0}; i < 15; i++) {
    msg->detections[0].header.MessageType[i] = expl_temp.header.MessageType[i];
  }
  for (int i{0}; i < 23; i++) {
    msg->detections[0].header.stamp.MessageType[i] =
        expl_temp.header.stamp.MessageType[i];
  }
  msg->detections[0].header.stamp.sec = expl_temp.header.stamp.sec;
  msg->detections[0].header.stamp.nanosec = expl_temp.header.stamp.nanosec;
  msg->detections[0].header.frame_id.set_size(
      1, expl_temp.header.frame_id.size(1));
  for (int i{0}; i < expl_temp.header.frame_id.size(1); i++) {
    msg->detections[0].header.frame_id[i] = expl_temp.header.frame_id[i];
  }
  msg->detections[0].results.set_size(expl_temp.results.size(0));
  for (int i{0}; i < expl_temp.results.size(0); i++) {
    msg->detections[0].results[i] = expl_temp.results[i];
  }
  for (int i{0}; i < 25; i++) {
    msg->detections[0].bbox.MessageType[i] = expl_temp.bbox.MessageType[i];
  }
  for (int i{0}; i < 18; i++) {
    msg->detections[0].bbox.center.MessageType[i] =
        expl_temp.bbox.center.MessageType[i];
  }
  for (int i{0}; i < 19; i++) {
    msg->detections[0].bbox.center.position.MessageType[i] =
        expl_temp.bbox.center.position.MessageType[i];
  }
  msg->detections[0].bbox.center.position.x = expl_temp.bbox.center.position.x;
  msg->detections[0].bbox.center.position.y = expl_temp.bbox.center.position.y;
  msg->detections[0].bbox.center.position.z = expl_temp.bbox.center.position.z;
  for (int i{0}; i < 24; i++) {
    msg->detections[0].bbox.center.orientation.MessageType[i] =
        expl_temp.bbox.center.orientation.MessageType[i];
  }
  msg->detections[0].bbox.center.orientation.x =
      expl_temp.bbox.center.orientation.x;
  msg->detections[0].bbox.center.orientation.y =
      expl_temp.bbox.center.orientation.y;
  msg->detections[0].bbox.center.orientation.z =
      expl_temp.bbox.center.orientation.z;
  msg->detections[0].bbox.center.orientation.w =
      expl_temp.bbox.center.orientation.w;
  for (int i{0}; i < 21; i++) {
    msg->detections[0].bbox.size.MessageType[i] =
        expl_temp.bbox.size.MessageType[i];
  }
  msg->detections[0].bbox.size.x = expl_temp.bbox.size.x;
  msg->detections[0].bbox.size.y = expl_temp.bbox.size.y;
  msg->detections[0].bbox.size.z = expl_temp.bbox.size.z;
  msg->detections[0].id.set_size(1, expl_temp.id.size(1));
  for (int i{0}; i < expl_temp.id.size(1); i++) {
    msg->detections[0].id[i] = expl_temp.id[i];
  }
  msg->detections.set_size(0);
  //(msg);
}

//
// File trailer for vision_msgs_Detection3DArrayStruct.cu
//
// [EOF]
//
