//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: rosReadField.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "rosReadField.h"
#include "PointCloud2Types.h"
#include "deployedPointPillarModel_internal_types.h"
#include "deployedPointPillarModel_types.h"
#include "rt_nonfinite.h"
#include "coder_array.h"
#include <cmath>
#include <cstddef>
#include <cstring>

// Function Definitions
//
// Arguments    : unsigned int msg_height
//                unsigned int msg_width
//                const array<sensor_msgs_PointFieldStruct_T, 1U> &msg_fields
//                unsigned int msg_point_step
//                const array<unsigned char, 1U> &msg_data
//                array<float, 2U> &fieldData
// Return Type  : void
//
namespace coder {
void rosReadField(unsigned int msg_height, unsigned int msg_width,
                  const array<sensor_msgs_PointFieldStruct_T, 1U> &msg_fields,
                  unsigned int msg_point_step,
                  const array<unsigned char, 1U> &msg_data,
                  array<float, 2U> &fieldData)
{
  static const char b_cv[9]{'i', 'n', 't', 'e', 'n', 's', 'i', 't', 'y'};
  array<cell_wrap_6, 2U> allFieldNames;
  array<double, 2U> byteIdx;
  array<double, 2U> c;
  array<double, 2U> c_y;
  array<float, 2U> validPoints;
  array<float, 1U> fv;
  array<unsigned int, 2U> dv;
  array<unsigned int, 2U> pointIndices;
  array<int, 2U> r;
  array<int, 2U> r1;
  array<int, 2U> r2;
  array<unsigned int, 1U> a;
  array<char, 2U> a__4;
  array<unsigned char, 1U> rawData;
  array<bool, 1U> b_x;
  double b_y;
  unsigned long long u;
  int acoef;
  int bcoef;
  int fieldIdx;
  int n;
  unsigned int numPointsActual;
  unsigned int qY;
  int varargin_3;
  bool b_bool;
  bool exitg2;
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
  fieldIdx = -1;
  if ((allFieldNames.size(0) == 0) || (allFieldNames.size(1) == 0)) {
    n = 0;
  } else {
    n = allFieldNames.size(1);
  }
  for (acoef = 0; acoef < n; acoef++) {
    b_bool = false;
    if (allFieldNames[acoef].f1.size(1) == 9) {
      bcoef = 0;
      int exitg1;
      do {
        exitg1 = 0;
        if (bcoef + 1 < 10) {
          if (allFieldNames[acoef].f1[bcoef] != b_cv[bcoef]) {
            exitg1 = 1;
          } else {
            bcoef++;
          }
        } else {
          b_bool = true;
          exitg1 = 1;
        }
      } while (exitg1 == 0);
    }
    if (b_bool) {
      fieldIdx = acoef;
    }
  }
  u = static_cast<unsigned long long>(msg_width) * msg_height;
  if (u > 4294967295ULL) {
    u = 4294967295ULL;
  }
  if (static_cast<unsigned int>(u) < 1U) {
    n = 0;
  } else {
    n = static_cast<int>(u);
  }
  pointIndices.set_size(1, n);
  for (int k{0}; k < n; k++) {
    pointIndices[k] = static_cast<unsigned int>(k + 1);
  }
  u = static_cast<unsigned long long>(msg_height) * msg_width;
  if (u > 4294967295ULL) {
    u = 4294967295ULL;
  }
  b_y = std::trunc(static_cast<double>(msg_data.size(0)) /
                   static_cast<double>(msg_point_step));
  if (b_y < 4.294967296E+9) {
    qY = static_cast<unsigned int>(b_y);
  } else if (b_y >= 4.294967296E+9) {
    qY = MAX_uint32_T;
  } else {
    qY = 0U;
  }
  if ((!std::isnan(b_y)) && (static_cast<unsigned int>(u) > b_y)) {
    numPointsActual = qY;
  } else {
    numPointsActual = static_cast<unsigned int>(u);
  }
  ros::msg::sensor_msgs::internal::PointCloud2Types_rosToMATLABType(
      msg_fields[fieldIdx].datatype, a__4, &b_y);
  b_y *= static_cast<double>(msg_fields[fieldIdx].count);
  byteIdx.set_size(pointIndices.size(1), static_cast<int>(b_y));
  for (varargin_3 = 0;
       varargin_3 < pointIndices.size(1) * static_cast<int>(b_y);
       varargin_3++) {
    byteIdx[varargin_3] = 0.0;
  }
  if (b_y < 1.0) {
    c_y.set_size(1, 0);
  } else {
    c_y.set_size(1, static_cast<int>(b_y - 1.0) + 1);
    for (varargin_3 = 0; varargin_3 <= static_cast<int>(b_y - 1.0);
         varargin_3++) {
      c_y[varargin_3] = static_cast<double>(varargin_3) + 1.0;
    }
  }
  n = pointIndices.size(1) - 1;
  bcoef = 0;
  for (acoef = 0; acoef <= n; acoef++) {
    qY = pointIndices[acoef];
    if ((static_cast<int>(qY) > 0) && (qY <= numPointsActual)) {
      bcoef++;
    }
  }
  a.set_size(bcoef);
  bcoef = 0;
  for (acoef = 0; acoef <= n; acoef++) {
    qY = pointIndices[acoef];
    if ((static_cast<int>(qY) > 0) && (qY <= numPointsActual)) {
      unsigned int q0;
      q0 = msg_fields[fieldIdx].offset;
      u = static_cast<unsigned long long>(msg_point_step) * (qY - 1U);
      if (u > 4294967295ULL) {
        u = 4294967295ULL;
      }
      qY = q0 + static_cast<unsigned int>(u);
      if (qY < q0) {
        qY = MAX_uint32_T;
      }
      a[bcoef] = qY;
      bcoef++;
    }
  }
  c.set_size(a.size(0), c_y.size(1));
  if ((a.size(0) != 0) && (c_y.size(1) != 0)) {
    bcoef = (c_y.size(1) != 1);
    n = c_y.size(1) - 1;
    acoef = (a.size(0) != 1);
    for (int k{0}; k <= n; k++) {
      int i3;
      varargin_3 = bcoef * k;
      i3 = c.size(0) - 1;
      for (int b_k{0}; b_k <= i3; b_k++) {
        c[b_k + c.size(0) * k] =
            static_cast<double>(a[acoef * b_k]) + c_y[varargin_3];
      }
    }
  }
  n = pointIndices.size(1) - 1;
  bcoef = 0;
  for (acoef = 0; acoef <= n; acoef++) {
    qY = pointIndices[acoef];
    if ((static_cast<int>(qY) > 0) && (qY <= numPointsActual)) {
      bcoef++;
    }
  }
  r.set_size(1, bcoef);
  bcoef = 0;
  for (acoef = 0; acoef <= n; acoef++) {
    qY = pointIndices[acoef];
    if ((static_cast<int>(qY) > 0) && (qY <= numPointsActual)) {
      r[bcoef] = acoef;
      bcoef++;
    }
  }
  n = r.size(1);
  bcoef = static_cast<int>(b_y);
  for (varargin_3 = 0; varargin_3 < bcoef; varargin_3++) {
    for (acoef = 0; acoef < n; acoef++) {
      byteIdx[r[acoef] + byteIdx.size(0) * varargin_3] =
          c[acoef + n * varargin_3];
    }
  }
  n = pointIndices.size(1) - 1;
  bcoef = 0;
  for (acoef = 0; acoef <= n; acoef++) {
    qY = pointIndices[acoef];
    if ((static_cast<int>(qY) > 0) && (qY <= numPointsActual)) {
      bcoef++;
    }
  }
  r1.set_size(1, bcoef);
  bcoef = 0;
  for (acoef = 0; acoef <= n; acoef++) {
    qY = pointIndices[acoef];
    if ((static_cast<int>(qY) > 0) && (qY <= numPointsActual)) {
      r1[bcoef] = acoef;
      bcoef++;
    }
  }
  dv.set_size(byteIdx.size(1), r1.size(1));
  for (varargin_3 = 0; varargin_3 < r1.size(1); varargin_3++) {
    for (acoef = 0; acoef < byteIdx.size(1); acoef++) {
      dv[acoef + dv.size(0) * varargin_3] = static_cast<unsigned int>(
          byteIdx[r1[varargin_3] + byteIdx.size(0) * acoef]);
    }
  }
  rawData.set_size(dv.size(0) * dv.size(1));
  for (varargin_3 = 0; varargin_3 < dv.size(0) * dv.size(1); varargin_3++) {
    rawData[varargin_3] = msg_data[static_cast<int>(dv[varargin_3]) - 1];
  }
  if (dv.size(0) * dv.size(1) == 0) {
    bcoef = 0;
  } else {
    bcoef = (dv.size(0) * dv.size(1)) >> 2;
  }
  fv.set_size(bcoef);
  std::memcpy((void *)&(fv.data())[0], (void *)&(rawData.data())[0],
              (unsigned int)((size_t)bcoef * sizeof(float)));
  if (static_cast<int>(msg_fields[fieldIdx].count) > 0) {
    qY = msg_fields[fieldIdx].count;
    if (qY == 0U) {
      bcoef = MAX_int32_T;
    } else {
      bcoef = static_cast<int>(static_cast<unsigned int>(fv.size(0)) / qY);
    }
  } else {
    bcoef = 0;
  }
  n = static_cast<int>(msg_fields[fieldIdx].count);
  validPoints.set_size(bcoef, static_cast<int>(msg_fields[fieldIdx].count));
  for (varargin_3 = 0; varargin_3 < n; varargin_3++) {
    for (acoef = 0; acoef < bcoef; acoef++) {
      validPoints[acoef + validPoints.size(0) * varargin_3] =
          fv[varargin_3 + n * acoef];
    }
  }
  bcoef = pointIndices.size(1);
  b_x.set_size(pointIndices.size(1));
  for (varargin_3 = 0; varargin_3 < bcoef; varargin_3++) {
    qY = pointIndices[varargin_3];
    b_x[varargin_3] = ((static_cast<int>(qY) <= 0) || (qY > numPointsActual));
  }
  b_bool = false;
  bcoef = 1;
  exitg2 = false;
  while ((!exitg2) && (bcoef <= b_x.size(0))) {
    if (b_x[bcoef - 1]) {
      b_bool = true;
      exitg2 = true;
    } else {
      bcoef++;
    }
  }
  if (b_bool) {
    fieldData.set_size(pointIndices.size(1),
                       static_cast<int>(msg_fields[fieldIdx].count));
    bcoef = pointIndices.size(1);
    for (varargin_3 = 0;
         varargin_3 < bcoef * static_cast<int>(msg_fields[fieldIdx].count);
         varargin_3++) {
      fieldData[varargin_3] = rtNaNF;
    }
    n = pointIndices.size(1) - 1;
    bcoef = 0;
    for (acoef = 0; acoef <= n; acoef++) {
      qY = pointIndices[acoef];
      if ((static_cast<int>(qY) > 0) && (qY <= numPointsActual)) {
        bcoef++;
      }
    }
    r2.set_size(1, bcoef);
    bcoef = 0;
    for (acoef = 0; acoef <= n; acoef++) {
      qY = pointIndices[acoef];
      if ((static_cast<int>(qY) > 0) && (qY <= numPointsActual)) {
        r2[bcoef] = acoef;
        bcoef++;
      }
    }
    n = r2.size(1);
    bcoef = static_cast<int>(msg_fields[fieldIdx].count);
    for (varargin_3 = 0; varargin_3 < bcoef; varargin_3++) {
      for (acoef = 0; acoef < n; acoef++) {
        fieldData[r2[acoef] + fieldData.size(0) * varargin_3] =
            validPoints[acoef + n * varargin_3];
      }
    }
  } else {
    fieldData.set_size(validPoints.size(0), validPoints.size(1));
    for (varargin_3 = 0; varargin_3 < validPoints.size(0) * validPoints.size(1);
         varargin_3++) {
      fieldData[varargin_3] = validPoints[varargin_3];
    }
  }
}

} // namespace coder

//
// File trailer for rosReadField.cu
//
// [EOF]
//
