//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: rosReadXYZ.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "rosReadXYZ.h"
#include "PointCloud2Types.h"
#include "SpecialMsgUtil.h"
#include "deployedPointPillarModel_internal_types.h"
#include "deployedPointPillarModel_types.h"
#include "rt_nonfinite.h"
#include "coder_array.h"
#include <cmath>

// Type Definitions
struct cell_wrap_28 {
  coder::array<float, 1U> f1;
};

// Function Definitions
//
// Arguments    : unsigned int msg_height
//                unsigned int msg_width
//                const array<sensor_msgs_PointFieldStruct_T, 1U> &msg_fields
//                unsigned int msg_point_step
//                const array<unsigned char, 1U> &msg_data
//                array<float, 2U> &xyz
// Return Type  : void
//
namespace coder {
void rosReadXYZ(unsigned int msg_height, unsigned int msg_width,
                const array<sensor_msgs_PointFieldStruct_T, 1U> &msg_fields,
                unsigned int msg_point_step,
                const array<unsigned char, 1U> &msg_data, array<float, 2U> &xyz)
{
  array<cell_wrap_6, 2U> allFieldNames;
  array<cell_wrap_6, 2U> b_allFieldNames;
  array<cell_wrap_6, 2U> c_allFieldNames;
  array<double, 2U> b_byteIdx;
  array<double, 2U> b_y;
  array<double, 2U> byteIdx;
  array<double, 2U> c;
  array<double, 2U> c_byteIdx;
  array<unsigned int, 2U> pointIndices;
  array<int, 2U> r;
  array<unsigned int, 1U> a;
  array<char, 2U> a__4;
  array<bool, 2U> pointIdxIsValid;
  cell_wrap_28 reshapes[3];
  double numBytes;
  double zOff;
  unsigned long long u;
  int acoef;
  int bcoef;
  int end;
  unsigned int numPointsActual;
  int varargin_3;
  int xIdx;
  int yIdx;
  int zIdx;
  bool b_bool;
  if (msg_fields.size(0) == 0) {
    allFieldNames.set_size(0, 0);
  } else {
    bcoef = msg_fields.size(0);
    allFieldNames.set_size(1, msg_fields.size(0));
    for (acoef = 0; acoef < bcoef; acoef++) {
      allFieldNames[acoef].f1.set_size(1, msg_fields[acoef].name.size(1));
      for (varargin_3 = 0; varargin_3 < msg_fields[acoef].name.size(1);
           varargin_3++) {
        allFieldNames[acoef].f1[varargin_3] =
            msg_fields[acoef].name[varargin_3];
      }
    }
  }
  xIdx = -1;
  if ((allFieldNames.size(0) == 0) || (allFieldNames.size(1) == 0)) {
    bcoef = 0;
  } else {
    bcoef = allFieldNames.size(1);
  }
  for (acoef = 0; acoef < bcoef; acoef++) {
    b_bool = false;
    if ((allFieldNames[acoef].f1.size(1) == 1) &&
        (allFieldNames[acoef].f1[0] == 'x')) {
      b_bool = true;
    }
    if (b_bool) {
      xIdx = acoef;
    }
  }
  if (msg_fields.size(0) == 0) {
    b_allFieldNames.set_size(0, 0);
  } else {
    bcoef = msg_fields.size(0);
    b_allFieldNames.set_size(1, msg_fields.size(0));
    for (acoef = 0; acoef < bcoef; acoef++) {
      b_allFieldNames[acoef].f1.set_size(1, msg_fields[acoef].name.size(1));
      for (varargin_3 = 0; varargin_3 < msg_fields[acoef].name.size(1);
           varargin_3++) {
        b_allFieldNames[acoef].f1[varargin_3] =
            msg_fields[acoef].name[varargin_3];
      }
    }
  }
  yIdx = -1;
  if ((b_allFieldNames.size(0) == 0) || (b_allFieldNames.size(1) == 0)) {
    bcoef = 0;
  } else {
    bcoef = b_allFieldNames.size(1);
  }
  for (acoef = 0; acoef < bcoef; acoef++) {
    b_bool = false;
    if ((b_allFieldNames[acoef].f1.size(1) == 1) &&
        (b_allFieldNames[acoef].f1[0] == 'y')) {
      b_bool = true;
    }
    if (b_bool) {
      yIdx = acoef;
    }
  }
  if (msg_fields.size(0) == 0) {
    c_allFieldNames.set_size(0, 0);
  } else {
    bcoef = msg_fields.size(0);
    c_allFieldNames.set_size(1, msg_fields.size(0));
    for (acoef = 0; acoef < bcoef; acoef++) {
      c_allFieldNames[acoef].f1.set_size(1, msg_fields[acoef].name.size(1));
      for (varargin_3 = 0; varargin_3 < msg_fields[acoef].name.size(1);
           varargin_3++) {
        c_allFieldNames[acoef].f1[varargin_3] =
            msg_fields[acoef].name[varargin_3];
      }
    }
  }
  zIdx = -1;
  if ((c_allFieldNames.size(0) == 0) || (c_allFieldNames.size(1) == 0)) {
    bcoef = 0;
  } else {
    bcoef = c_allFieldNames.size(1);
  }
  for (acoef = 0; acoef < bcoef; acoef++) {
    b_bool = false;
    if ((c_allFieldNames[acoef].f1.size(1) == 1) &&
        (c_allFieldNames[acoef].f1[0] == 'z')) {
      b_bool = true;
    }
    if (b_bool) {
      zIdx = acoef;
    }
  }
  u = static_cast<unsigned long long>(msg_width) * msg_height;
  if (u > 4294967295ULL) {
    u = 4294967295ULL;
  }
  if (static_cast<unsigned int>(u) < 1U) {
    bcoef = 0;
  } else {
    bcoef = static_cast<int>(u);
  }
  pointIndices.set_size(1, bcoef);
  for (int k{0}; k < bcoef; k++) {
    pointIndices[k] = static_cast<unsigned int>(k + 1);
  }
  u = static_cast<unsigned long long>(msg_height) * msg_width;
  if (u > 4294967295ULL) {
    u = 4294967295ULL;
  }
  numBytes = std::trunc(static_cast<double>(msg_data.size(0)) /
                        static_cast<double>(msg_point_step));
  if (numBytes < 4.294967296E+9) {
    numPointsActual = static_cast<unsigned int>(numBytes);
  } else if (numBytes >= 4.294967296E+9) {
    numPointsActual = MAX_uint32_T;
  } else {
    numPointsActual = 0U;
  }
  if (std::isnan(numBytes) || (!(static_cast<unsigned int>(u) > numBytes))) {
    numPointsActual = static_cast<unsigned int>(u);
  }
  ros::msg::sensor_msgs::internal::PointCloud2Types_rosToMATLABType(
      msg_fields[xIdx].datatype, a__4, &numBytes);
  byteIdx.set_size(pointIndices.size(1), static_cast<int>(numBytes));
  for (varargin_3 = 0;
       varargin_3 < pointIndices.size(1) * static_cast<int>(numBytes);
       varargin_3++) {
    byteIdx[varargin_3] = 0.0;
  }
  pointIdxIsValid.set_size(1, pointIndices.size(1));
  for (varargin_3 = 0; varargin_3 < pointIndices.size(1); varargin_3++) {
    pointIdxIsValid[varargin_3] =
        ((static_cast<int>(pointIndices[varargin_3]) > 0) &&
         (pointIndices[varargin_3] <= numPointsActual));
  }
  if (numBytes < 1.0) {
    b_y.set_size(1, 0);
  } else {
    b_y.set_size(1, static_cast<int>(numBytes - 1.0) + 1);
    for (varargin_3 = 0; varargin_3 <= static_cast<int>(numBytes - 1.0);
         varargin_3++) {
      b_y[varargin_3] = static_cast<double>(varargin_3) + 1.0;
    }
  }
  end = pointIdxIsValid.size(1) - 1;
  bcoef = 0;
  for (acoef = 0; acoef <= end; acoef++) {
    if (pointIdxIsValid[acoef]) {
      bcoef++;
    }
  }
  a.set_size(bcoef);
  bcoef = 0;
  for (acoef = 0; acoef <= end; acoef++) {
    if (pointIdxIsValid[acoef]) {
      unsigned int qY;
      numPointsActual = msg_fields[xIdx].offset;
      u = static_cast<unsigned long long>(msg_point_step) *
          (pointIndices[acoef] - 1U);
      if (u > 4294967295ULL) {
        u = 4294967295ULL;
      }
      qY = numPointsActual + static_cast<unsigned int>(u);
      if (qY < numPointsActual) {
        qY = MAX_uint32_T;
      }
      a[bcoef] = qY;
      bcoef++;
    }
  }
  c.set_size(a.size(0), b_y.size(1));
  if ((a.size(0) != 0) && (b_y.size(1) != 0)) {
    bcoef = (b_y.size(1) != 1);
    end = b_y.size(1) - 1;
    acoef = (a.size(0) != 1);
    for (int k{0}; k <= end; k++) {
      int i7;
      varargin_3 = bcoef * k;
      i7 = c.size(0) - 1;
      for (int b_k{0}; b_k <= i7; b_k++) {
        c[b_k + c.size(0) * k] =
            static_cast<double>(a[acoef * b_k]) + b_y[varargin_3];
      }
    }
  }
  end = pointIdxIsValid.size(1) - 1;
  bcoef = 0;
  for (acoef = 0; acoef <= end; acoef++) {
    if (pointIdxIsValid[acoef]) {
      bcoef++;
    }
  }
  r.set_size(1, bcoef);
  bcoef = 0;
  for (acoef = 0; acoef <= end; acoef++) {
    if (pointIdxIsValid[acoef]) {
      r[bcoef] = acoef;
      bcoef++;
    }
  }
  bcoef = r.size(1);
  end = static_cast<int>(numBytes);
  for (varargin_3 = 0; varargin_3 < end; varargin_3++) {
    for (acoef = 0; acoef < bcoef; acoef++) {
      byteIdx[r[acoef] + byteIdx.size(0) * varargin_3] =
          c[acoef + bcoef * varargin_3];
    }
  }
  numBytes = static_cast<double>(msg_fields[yIdx].offset) -
             static_cast<double>(msg_fields[xIdx].offset);
  zOff = static_cast<double>(msg_fields[zIdx].offset) -
         static_cast<double>(msg_fields[xIdx].offset);
  ros::internal::ros2::SpecialMsgUtil_readFieldFromData(
      msg_data, byteIdx, pointIdxIsValid, reshapes[0].f1);
  b_byteIdx.set_size(byteIdx.size(0), byteIdx.size(1));
  for (varargin_3 = 0; varargin_3 < byteIdx.size(0) * byteIdx.size(1);
       varargin_3++) {
    b_byteIdx[varargin_3] = byteIdx[varargin_3] + numBytes;
  }
  ros::internal::ros2::SpecialMsgUtil_readFieldFromData(
      msg_data, b_byteIdx, pointIdxIsValid, reshapes[1].f1);
  c_byteIdx.set_size(byteIdx.size(0), byteIdx.size(1));
  for (varargin_3 = 0; varargin_3 < byteIdx.size(0) * byteIdx.size(1);
       varargin_3++) {
    c_byteIdx[varargin_3] = byteIdx[varargin_3] + zOff;
  }
  ros::internal::ros2::SpecialMsgUtil_readFieldFromData(
      msg_data, c_byteIdx, pointIdxIsValid, reshapes[2].f1);
  xyz.set_size(reshapes[0].f1.size(0), 3);
  bcoef = reshapes[0].f1.size(0);
  for (varargin_3 = 0; varargin_3 < bcoef; varargin_3++) {
    xyz[varargin_3] = reshapes[0].f1[varargin_3];
  }
  bcoef = reshapes[1].f1.size(0);
  for (varargin_3 = 0; varargin_3 < bcoef; varargin_3++) {
    xyz[varargin_3 + xyz.size(0)] = reshapes[1].f1[varargin_3];
  }
  bcoef = reshapes[2].f1.size(0);
  for (varargin_3 = 0; varargin_3 < bcoef; varargin_3++) {
    xyz[varargin_3 + xyz.size(0) * 2] = reshapes[2].f1[varargin_3];
  }
}

} // namespace coder

//
// File trailer for rosReadXYZ.cu
//
// [EOF]
//
