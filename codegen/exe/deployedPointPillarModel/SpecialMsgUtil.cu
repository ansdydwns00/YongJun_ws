//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: SpecialMsgUtil.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "SpecialMsgUtil.h"
#include "rt_nonfinite.h"
#include "coder_array.h"
#include <cstddef>
#include <cstring>

// Function Definitions
//
// Arguments    : const array<unsigned char, 1U> &b_data
//                const array<double, 2U> &byteIdx
//                const array<bool, 2U> &pointIdxIsValid
//                array<float, 1U> &fieldPoints
// Return Type  : void
//
namespace coder {
namespace ros {
namespace internal {
namespace ros2 {
void SpecialMsgUtil_readFieldFromData(const array<unsigned char, 1U> &b_data,
                                      const array<double, 2U> &byteIdx,
                                      const array<bool, 2U> &pointIdxIsValid,
                                      array<float, 1U> &fieldPoints)
{
  array<float, 1U> fv;
  array<float, 1U> validPoints;
  array<unsigned int, 2U> dv;
  array<int, 2U> r;
  array<int, 2U> r1;
  array<unsigned char, 1U> rawData;
  array<bool, 1U> b_x;
  int end;
  int ny;
  bool b_y;
  bool exitg1;
  end = pointIdxIsValid.size(1) - 1;
  ny = 0;
  for (int i{0}; i <= end; i++) {
    if (pointIdxIsValid[i]) {
      ny++;
    }
  }
  r.set_size(1, ny);
  ny = 0;
  for (int i{0}; i <= end; i++) {
    if (pointIdxIsValid[i]) {
      r[ny] = i;
      ny++;
    }
  }
  dv.set_size(byteIdx.size(1), r.size(1));
  for (end = 0; end < r.size(1); end++) {
    for (ny = 0; ny < byteIdx.size(1); ny++) {
      dv[ny + dv.size(0) * end] =
          static_cast<unsigned int>(byteIdx[r[end] + byteIdx.size(0) * ny]);
    }
  }
  rawData.set_size(dv.size(0) * dv.size(1));
  for (end = 0; end < dv.size(0) * dv.size(1); end++) {
    rawData[end] = b_data[static_cast<int>(dv[end]) - 1];
  }
  if (dv.size(0) * dv.size(1) == 0) {
    ny = 0;
  } else {
    ny = (dv.size(0) * dv.size(1)) >> 2;
  }
  fv.set_size(ny);
  std::memcpy((void *)&(fv.data())[0], (void *)&(rawData.data())[0],
              (unsigned int)((size_t)ny * sizeof(float)));
  ny = fv.size(0);
  validPoints.set_size(fv.size(0));
  for (end = 0; end < ny; end++) {
    validPoints[end] = fv[end];
  }
  b_x.set_size(pointIdxIsValid.size(1));
  for (end = 0; end < pointIdxIsValid.size(1); end++) {
    b_x[end] = !pointIdxIsValid[end];
  }
  b_y = false;
  ny = 1;
  exitg1 = false;
  while ((!exitg1) && (ny <= b_x.size(0))) {
    if (b_x[ny - 1]) {
      b_y = true;
      exitg1 = true;
    } else {
      ny++;
    }
  }
  if (b_y) {
    fieldPoints.set_size(pointIdxIsValid.size(1));
    for (end = 0; end < pointIdxIsValid.size(1); end++) {
      fieldPoints[end] = rtNaNF;
    }
    end = pointIdxIsValid.size(1) - 1;
    ny = 0;
    for (int i{0}; i <= end; i++) {
      if (pointIdxIsValid[i]) {
        ny++;
      }
    }
    r1.set_size(1, ny);
    ny = 0;
    for (int i{0}; i <= end; i++) {
      if (pointIdxIsValid[i]) {
        r1[ny] = i;
        ny++;
      }
    }
    ny = r1.size(1);
    for (end = 0; end < ny; end++) {
      fieldPoints[r1[end]] = validPoints[end];
    }
  } else {
    fieldPoints.set_size(validPoints.size(0));
    for (end = 0; end < validPoints.size(0); end++) {
      fieldPoints[end] = validPoints[end];
    }
  }
}

} // namespace ros2
} // namespace internal
} // namespace ros
} // namespace coder

//
// File trailer for SpecialMsgUtil.cu
//
// [EOF]
//
