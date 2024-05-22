//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: PointCloud2Types.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "PointCloud2Types.h"
#include "rt_nonfinite.h"
#include "coder_array.h"

// Function Definitions
//
// Arguments    : unsigned char type
//                array<char, 2U> &mlType
//                double *numBytes
// Return Type  : void
//
namespace coder {
namespace ros {
namespace msg {
namespace sensor_msgs {
namespace internal {
void PointCloud2Types_rosToMATLABType(unsigned char type,
                                      array<char, 2U> &mlType, double *numBytes)
{
  static const char cv3[6]{'u', 'i', 'n', 't', '1', '6'};
  static const char cv5[6]{'u', 'i', 'n', 't', '3', '2'};
  static const char cv6[6]{'s', 'i', 'n', 'g', 'l', 'e'};
  static const char cv7[6]{'d', 'o', 'u', 'b', 'l', 'e'};
  static const char cv1[5]{'u', 'i', 'n', 't', '8'};
  static const char cv2[5]{'i', 'n', 't', '1', '6'};
  static const char cv4[5]{'i', 'n', 't', '3', '2'};
  int b_numBytes;
  switch (type) {
  case 1U:
    mlType.set_size(1, 4);
    mlType[0] = 'i';
    mlType[1] = 'n';
    mlType[2] = 't';
    mlType[3] = '8';
    b_numBytes = 1;
    break;
  case 2U:
    mlType.set_size(1, 5);
    for (b_numBytes = 0; b_numBytes < 5; b_numBytes++) {
      mlType[b_numBytes] = cv1[b_numBytes];
    }
    b_numBytes = 1;
    break;
  case 3U:
    mlType.set_size(1, 5);
    for (b_numBytes = 0; b_numBytes < 5; b_numBytes++) {
      mlType[b_numBytes] = cv2[b_numBytes];
    }
    b_numBytes = 2;
    break;
  case 4U:
    mlType.set_size(1, 6);
    for (b_numBytes = 0; b_numBytes < 6; b_numBytes++) {
      mlType[b_numBytes] = cv3[b_numBytes];
    }
    b_numBytes = 2;
    break;
  case 5U:
    mlType.set_size(1, 5);
    for (b_numBytes = 0; b_numBytes < 5; b_numBytes++) {
      mlType[b_numBytes] = cv4[b_numBytes];
    }
    b_numBytes = 4;
    break;
  case 6U:
    mlType.set_size(1, 6);
    for (b_numBytes = 0; b_numBytes < 6; b_numBytes++) {
      mlType[b_numBytes] = cv5[b_numBytes];
    }
    b_numBytes = 4;
    break;
  case 7U:
    mlType.set_size(1, 6);
    for (b_numBytes = 0; b_numBytes < 6; b_numBytes++) {
      mlType[b_numBytes] = cv6[b_numBytes];
    }
    b_numBytes = 4;
    break;
  case 8U:
    mlType.set_size(1, 6);
    for (b_numBytes = 0; b_numBytes < 6; b_numBytes++) {
      mlType[b_numBytes] = cv7[b_numBytes];
    }
    b_numBytes = 8;
    break;
  }
  *numBytes = b_numBytes;
}

} // namespace internal
} // namespace sensor_msgs
} // namespace msg
} // namespace ros
} // namespace coder

//
// File trailer for PointCloud2Types.cu
//
// [EOF]
//
