//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: div.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "div.h"
#include "rt_nonfinite.h"
#include "coder_array.h"

// Function Definitions
//
// Arguments    : coder::array<float, 2U> &in1
//                const coder::array<float, 2U> &in2
//                const coder::array<float, 2U> &in3
//                const coder::array<float, 2U> &in4
//                const coder::array<float, 2U> &in5
// Return Type  : void
//
void binary_expand_op_11(coder::array<float, 2U> &in1,
                         const coder::array<float, 2U> &in2,
                         const coder::array<float, 2U> &in3,
                         const coder::array<float, 2U> &in4,
                         const coder::array<float, 2U> &in5)
{
  int b;
  int i;
  int stride_0_1;
  int stride_1_1;
  int stride_2_1;
  int stride_3_1;
  int stride_4_1;
  int stride_5_1;
  if (in5.size(1) == 1) {
    b = in3.size(1);
    i = in4.size(1);
  } else {
    b = in5.size(1);
    i = in5.size(1);
  }
  if (b == 1) {
    if (i == 1) {
      if (in3.size(1) == 1) {
        b = in2.size(1);
      } else {
        b = in3.size(1);
      }
    } else if (in5.size(1) == 1) {
      b = in4.size(1);
    } else {
      b = in5.size(1);
    }
  } else if (in5.size(1) == 1) {
    b = in3.size(1);
  } else {
    b = in5.size(1);
  }
  in1.set_size(1, b);
  stride_0_1 = (in2.size(1) != 1);
  stride_1_1 = (in3.size(1) != 1);
  stride_2_1 = (in4.size(1) != 1);
  stride_3_1 = (in5.size(1) != 1);
  stride_4_1 = (in3.size(1) != 1);
  stride_5_1 = (in5.size(1) != 1);
  if (in5.size(1) == 1) {
    b = in3.size(1);
    i = in4.size(1);
  } else {
    b = in5.size(1);
    i = in5.size(1);
  }
  if (b == 1) {
    if (i == 1) {
      if (in3.size(1) == 1) {
        b = in2.size(1);
      } else {
        b = in3.size(1);
      }
    } else if (in5.size(1) == 1) {
      b = in4.size(1);
    } else {
      b = in5.size(1);
    }
  } else if (in5.size(1) == 1) {
    b = in3.size(1);
  } else {
    b = in5.size(1);
  }
  for (i = 0; i < b; i++) {
    in1[i] = (in2[i * stride_0_1] * in3[i * stride_1_1] -
              in4[i * stride_2_1] * in5[i * stride_3_1]) /
             (in3[i * stride_4_1] - in5[i * stride_5_1]);
  }
}

//
// File trailer for div.cu
//
// [EOF]
//
