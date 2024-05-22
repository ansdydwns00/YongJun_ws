//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: sensor_msgs_PointCloud2Struct.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "sensor_msgs_PointCloud2Struct.h"
#include "deployedPointPillarModel_types.h"
#include "rt_nonfinite.h"
#include "sensor_msgs_PointFieldStruct.h"
#include "std_msgs_HeaderStruct.h"
#include "coder_array.h"

// Function Definitions
//
// Message struct definition for sensor_msgs/PointCloud2
//
// Arguments    : sensor_msgs_PointCloud2Struct_T *msg
// Return Type  : void
//
void sensor_msgs_PointCloud2Struct(sensor_msgs_PointCloud2Struct_T *msg)
{
  static const char b_cv[23]{'s', 'e', 'n', 's', 'o', 'r', '_', 'm',
                             's', 'g', 's', '/', 'P', 'o', 'i', 'n',
                             't', 'C', 'l', 'o', 'u', 'd', '2'};
  sensor_msgs_PointFieldStruct_T expl_temp;
  for (int i{0}; i < 23; i++) {
    msg->MessageType[i] = b_cv[i];
  }
  std_msgs_HeaderStruct(&msg->header);
  sensor_msgs_PointFieldStruct(&expl_temp);
  msg->height = 0U;
  msg->width = 0U;
  msg->fields.set_size(1);
  for (int i{0}; i < 22; i++) {
    msg->fields[0].MessageType[i] = expl_temp.MessageType[i];
  }
  msg->fields[0].INT8 = expl_temp.INT8;
  msg->fields[0].UINT8 = expl_temp.UINT8;
  msg->fields[0].INT16 = expl_temp.INT16;
  msg->fields[0].UINT16 = expl_temp.UINT16;
  msg->fields[0].INT32 = expl_temp.INT32;
  msg->fields[0].UINT32 = expl_temp.UINT32;
  msg->fields[0].FLOAT32 = expl_temp.FLOAT32;
  msg->fields[0].FLOAT64 = expl_temp.FLOAT64;
  msg->fields[0].name.set_size(1, expl_temp.name.size(1));
  for (int i{0}; i < expl_temp.name.size(1); i++) {
    msg->fields[0].name[i] = expl_temp.name[i];
  }
  msg->fields[0].offset = expl_temp.offset;
  msg->fields[0].datatype = expl_temp.datatype;
  msg->fields[0].count = expl_temp.count;
  msg->is_bigendian = false;
  msg->point_step = 0U;
  msg->row_step = 0U;
  msg->data.set_size(1);
  msg->data[0] = 0U;
  msg->is_dense = false;
  msg->fields.set_size(0);
  //(msg);
}

//
// File trailer for sensor_msgs_PointCloud2Struct.cu
//
// [EOF]
//
