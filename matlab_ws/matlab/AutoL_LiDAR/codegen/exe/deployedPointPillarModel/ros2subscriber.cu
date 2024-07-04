//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: ros2subscriber.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "ros2subscriber.h"
#include "deployedPointPillarModel_internal_types.h"
#include "deployedPointPillarModel_types.h"
#include "rt_nonfinite.h"
#include "sensor_msgs_PointCloud2Struct.h"
#include "setQOSProfile.h"
#include "coder_array.h"
#include "mlros2_node.h"
#include "mlros2_sub.h"
#include "rmw/qos_profiles.h"

// Function Declarations
namespace coder {
static void ros2subscriber_callback(ros2subscriber *obj);

}

// Function Definitions
//
// Arguments    : ros2subscriber *obj
// Return Type  : void
//
namespace coder {
static void ros2subscriber_callback(ros2subscriber *obj)
{
  obj->MessageCount++;
}

//
// Arguments    : const ros2subscriber *obj
//                char receivedMsg_MessageType[23]
//                unsigned int *receivedMsg_height
//                unsigned int *receivedMsg_width
//                array<sensor_msgs_PointFieldStruct_T, 1U> &receivedMsg_fields
//                unsigned int *receivedMsg_point_step
//                array<unsigned char, 1U> &receivedMsg_data
// Return Type  : void
//
void ros2subscriber_receive(
    const ros2subscriber *obj, char receivedMsg_MessageType[23],
    unsigned int *receivedMsg_height, unsigned int *receivedMsg_width,
    array<sensor_msgs_PointFieldStruct_T, 1U> &receivedMsg_fields,
    unsigned int *receivedMsg_point_step,
    array<unsigned char, 1U> &receivedMsg_data)
{
  double nMessages;
  char statusText[7];
  nMessages = obj->MessageCount;
  while (obj->MessageCount == nMessages) {
    std::make_shared<rclcpp::Clock>(RCL_ROS_TIME); //();
  }
  getStatusText(true, &statusText[0]);
  MATLABROS2Subscriber_lock(obj->SubscriberHelper);
  for (int i{0}; i < 23; i++) {
    receivedMsg_MessageType[i] = obj->MsgStruct.MessageType[i];
  }
  receivedMsg_fields.set_size(obj->MsgStruct.fields.size(0));
  for (int i{0}; i < obj->MsgStruct.fields.size(0); i++) {
    receivedMsg_fields[i] = obj->MsgStruct.fields[i];
  }
  receivedMsg_data.set_size(obj->MsgStruct.data.size(0));
  for (int i{0}; i < obj->MsgStruct.data.size(0); i++) {
    receivedMsg_data[i] = obj->MsgStruct.data[i];
  }
  MATLABROS2Subscriber_unlock(obj->SubscriberHelper);
  *receivedMsg_height = obj->MsgStruct.height;
  *receivedMsg_width = obj->MsgStruct.width;
  *receivedMsg_point_step = obj->MsgStruct.point_step;
}

//
// Arguments    : ros2subscriber *obj
//                const ros2node *node
// Return Type  : ros2subscriber *
//
ros2subscriber *ros2subscriber_ros2subscriber(ros2subscriber *obj,
                                              const ros2node *node)
{
  static const char b_cv[8]{'k', 'e', 'e', 'p', 'l', 'a', 's', 't'};
  static const char cv1[8]{'r', 'e', 'l', 'i', 'a', 'b', 'l', 'e'};
  static const char cv2[8]{'v', 'o', 'l', 'a', 't', 'i', 'l', 'e'};
  static const char resolvedTopic[5]{'/', 'A', 'v', 'i', 'a'};
  ros2subscriber *b_obj;
  b_obj = obj;
  for (int i{0}; i < 5; i++) {
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
  b_obj->MessageCount = 0.0;
  sensor_msgs_PointCloud2Struct(&b_obj->MsgStruct);
  auto structPtr = (&b_obj->MsgStruct);
  b_obj->SubscriberHelper =
      std::unique_ptr<MATLABROS2Subscriber<sensor_msgs::msg::PointCloud2,
                                           sensor_msgs_PointCloud2Struct_T>>(
          new MATLABROS2Subscriber<sensor_msgs::msg::PointCloud2,
                                   sensor_msgs_PointCloud2Struct_T>(
              structPtr, [obj] { ros2subscriber_callback(obj); })); //();
  MATLABROS2Subscriber_createSubscriber(b_obj->SubscriberHelper,
                                        node->NodeHandle, &b_obj->TopicName[0],
                                        5.0, qos_profile);
  ros2subscriber_callback(b_obj);
  return b_obj;
}

} // namespace coder

//
// File trailer for ros2subscriber.cu
//
// [EOF]
//
