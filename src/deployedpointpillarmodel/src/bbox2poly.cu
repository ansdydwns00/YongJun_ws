//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: bbox2poly.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "bbox2poly.h"
#include "rt_nonfinite.h"
#include "coder_array.h"

// Function Definitions
//
// Arguments    : coder::array<float, 2U> &in1
//                const coder::array<float, 2U> &in2
//                const coder::array<double, 1U> &in3
//                const coder::array<float, 2U> &in4
//                const coder::array<float, 2U> &in5
// Return Type  : void
//
void binary_expand_op(coder::array<float, 2U> &in1,
                      const coder::array<float, 2U> &in2,
                      const coder::array<double, 1U> &in3,
                      const coder::array<float, 2U> &in4,
                      const coder::array<float, 2U> &in5)
{
  int stride_0_1;
  int stride_1_1;
  int stride_2_1;
  int unnamed_idx_1;
  unnamed_idx_1 = in1.size(1);
  stride_0_1 = (in3.size(0) != 1);
  stride_1_1 = (in4.size(0) != 1);
  stride_2_1 = (in5.size(0) != 1);
  for (int i{0}; i < unnamed_idx_1; i++) {
    in1[4 * i + 3] = (in2[i * stride_0_1 + in2.size(0)] -
                      in4[i * stride_1_1 + in4.size(0)]) +
                     in5[i * stride_2_1 + in5.size(0)];
  }
}

//
// Arguments    : coder::array<float, 2U> &in1
//                const coder::array<float, 2U> &in2
//                const coder::array<double, 1U> &in3
//                const coder::array<float, 2U> &in4
//                const coder::array<float, 2U> &in5
// Return Type  : void
//
void binary_expand_op_1(coder::array<float, 2U> &in1,
                        const coder::array<float, 2U> &in2,
                        const coder::array<double, 1U> &in3,
                        const coder::array<float, 2U> &in4,
                        const coder::array<float, 2U> &in5)
{
  int stride_0_1;
  int stride_1_1;
  int stride_2_1;
  int unnamed_idx_1;
  unnamed_idx_1 = in1.size(1);
  stride_0_1 = (in3.size(0) != 1);
  stride_1_1 = (in4.size(0) != 1);
  stride_2_1 = (in5.size(0) != 1);
  for (int i{0}; i < unnamed_idx_1; i++) {
    in1[4 * i + 3] =
        (in2[i * stride_0_1] - in4[i * stride_1_1]) + in5[i * stride_2_1];
  }
}

//
// Arguments    : coder::array<float, 2U> &in1
//                const coder::array<float, 2U> &in2
//                const coder::array<double, 1U> &in3
//                const coder::array<float, 2U> &in4
//                const coder::array<float, 2U> &in5
// Return Type  : void
//
void binary_expand_op_2(coder::array<float, 2U> &in1,
                        const coder::array<float, 2U> &in2,
                        const coder::array<double, 1U> &in3,
                        const coder::array<float, 2U> &in4,
                        const coder::array<float, 2U> &in5)
{
  int stride_0_1;
  int stride_1_1;
  int stride_2_1;
  int unnamed_idx_1;
  unnamed_idx_1 = in1.size(1);
  stride_0_1 = (in3.size(0) != 1);
  stride_1_1 = (in4.size(0) != 1);
  stride_2_1 = (in5.size(0) != 1);
  for (int i{0}; i < unnamed_idx_1; i++) {
    in1[4 * i + 2] = (in2[i * stride_0_1 + in2.size(0)] +
                      in4[i * stride_1_1 + in4.size(0)]) +
                     in5[i * stride_2_1 + in5.size(0)];
  }
}

//
// Arguments    : coder::array<float, 2U> &in1
//                const coder::array<float, 2U> &in2
//                const coder::array<double, 1U> &in3
//                const coder::array<float, 2U> &in4
//                const coder::array<float, 2U> &in5
// Return Type  : void
//
void binary_expand_op_3(coder::array<float, 2U> &in1,
                        const coder::array<float, 2U> &in2,
                        const coder::array<double, 1U> &in3,
                        const coder::array<float, 2U> &in4,
                        const coder::array<float, 2U> &in5)
{
  int stride_0_1;
  int stride_1_1;
  int stride_2_1;
  int unnamed_idx_1;
  unnamed_idx_1 = in1.size(1);
  stride_0_1 = (in3.size(0) != 1);
  stride_1_1 = (in4.size(0) != 1);
  stride_2_1 = (in5.size(0) != 1);
  for (int i{0}; i < unnamed_idx_1; i++) {
    in1[4 * i + 2] =
        (in2[i * stride_0_1] + in4[i * stride_1_1]) + in5[i * stride_2_1];
  }
}

//
// Arguments    : coder::array<float, 2U> &in1
//                const coder::array<float, 2U> &in2
//                const coder::array<double, 1U> &in3
//                const coder::array<float, 2U> &in4
//                const coder::array<float, 2U> &in5
// Return Type  : void
//
void binary_expand_op_4(coder::array<float, 2U> &in1,
                        const coder::array<float, 2U> &in2,
                        const coder::array<double, 1U> &in3,
                        const coder::array<float, 2U> &in4,
                        const coder::array<float, 2U> &in5)
{
  int stride_0_1;
  int stride_1_1;
  int stride_2_1;
  int unnamed_idx_1;
  unnamed_idx_1 = in1.size(1);
  stride_0_1 = (in3.size(0) != 1);
  stride_1_1 = (in4.size(0) != 1);
  stride_2_1 = (in5.size(0) != 1);
  for (int i{0}; i < unnamed_idx_1; i++) {
    in1[4 * i + 1] = (in2[i * stride_0_1 + in2.size(0)] +
                      in4[i * stride_1_1 + in4.size(0)]) -
                     in5[i * stride_2_1 + in5.size(0)];
  }
}

//
// Arguments    : coder::array<float, 2U> &in1
//                const coder::array<float, 2U> &in2
//                const coder::array<double, 1U> &in3
//                const coder::array<float, 2U> &in4
//                const coder::array<float, 2U> &in5
// Return Type  : void
//
void binary_expand_op_5(coder::array<float, 2U> &in1,
                        const coder::array<float, 2U> &in2,
                        const coder::array<double, 1U> &in3,
                        const coder::array<float, 2U> &in4,
                        const coder::array<float, 2U> &in5)
{
  int stride_0_1;
  int stride_1_1;
  int stride_2_1;
  int unnamed_idx_1;
  unnamed_idx_1 = in1.size(1);
  stride_0_1 = (in3.size(0) != 1);
  stride_1_1 = (in4.size(0) != 1);
  stride_2_1 = (in5.size(0) != 1);
  for (int i{0}; i < unnamed_idx_1; i++) {
    in1[4 * i + 1] =
        (in2[i * stride_0_1] + in4[i * stride_1_1]) - in5[i * stride_2_1];
  }
}

//
// Arguments    : coder::array<float, 2U> &in1
//                const coder::array<double, 1U> &in2
//                const coder::array<float, 2U> &in3
//                const coder::array<float, 2U> &in4
//                const coder::array<float, 2U> &in5
// Return Type  : void
//
void binary_expand_op_6(coder::array<float, 2U> &in1,
                        const coder::array<double, 1U> &in2,
                        const coder::array<float, 2U> &in3,
                        const coder::array<float, 2U> &in4,
                        const coder::array<float, 2U> &in5)
{
  int stride_0_1;
  int stride_1_1;
  int stride_2_1;
  int unnamed_idx_1;
  unnamed_idx_1 = in2.size(0);
  stride_0_1 = (in2.size(0) != 1);
  stride_1_1 = (in4.size(0) != 1);
  stride_2_1 = (in5.size(0) != 1);
  for (int i{0}; i < unnamed_idx_1; i++) {
    in1[4 * i] = (in3[i * stride_0_1 + in3.size(0)] -
                  in4[i * stride_1_1 + in4.size(0)]) -
                 in5[i * stride_2_1 + in5.size(0)];
  }
}

//
// Arguments    : coder::array<float, 2U> &in1
//                const coder::array<double, 1U> &in2
//                const coder::array<float, 2U> &in3
//                const coder::array<float, 2U> &in4
//                const coder::array<float, 2U> &in5
// Return Type  : void
//
void binary_expand_op_7(coder::array<float, 2U> &in1,
                        const coder::array<double, 1U> &in2,
                        const coder::array<float, 2U> &in3,
                        const coder::array<float, 2U> &in4,
                        const coder::array<float, 2U> &in5)
{
  int stride_0_1;
  int stride_1_1;
  int stride_2_1;
  int unnamed_idx_1;
  unnamed_idx_1 = in2.size(0);
  stride_0_1 = (in2.size(0) != 1);
  stride_1_1 = (in4.size(0) != 1);
  stride_2_1 = (in5.size(0) != 1);
  for (int i{0}; i < unnamed_idx_1; i++) {
    in1[4 * i] =
        (in3[i * stride_0_1] - in4[i * stride_1_1]) - in5[i * stride_2_1];
  }
}

//
// Arguments    : coder::array<float, 2U> &in1
//                const coder::array<float, 2U> &in2
//                const coder::array<double, 1U> &in3
//                const coder::array<float, 1U> &in4
//                const coder::array<float, 1U> &in5
// Return Type  : void
//
void binary_expand_op_8(coder::array<float, 2U> &in1,
                        const coder::array<float, 2U> &in2,
                        const coder::array<double, 1U> &in3,
                        const coder::array<float, 1U> &in4,
                        const coder::array<float, 1U> &in5)
{
  coder::array<float, 2U> b_in2;
  coder::array<float, 2U> b_in4;
  int b;
  int loop_ub;
  int stride_1_0;
  b_in2.set_size(in3.size(0), 2);
  loop_ub = in3.size(0);
  for (int i{0}; i < loop_ub; i++) {
    float f;
    f = in2[i + in2.size(0) * 3];
    b_in2[i] = f / 2.0F;
    b_in2[i + b_in2.size(0)] = f / 2.0F;
  }
  b_in4.set_size(in4.size(0), 2);
  loop_ub = in4.size(0);
  for (int i{0}; i < loop_ub; i++) {
    b_in4[i] = -in4[i];
  }
  loop_ub = in5.size(0);
  for (int i{0}; i < loop_ub; i++) {
    b_in4[i + b_in4.size(0)] = in5[i];
  }
  if (b_in4.size(0) == 1) {
    b = b_in2.size(0);
  } else {
    b = b_in4.size(0);
  }
  in1.set_size(b, 2);
  loop_ub = (b_in2.size(0) != 1);
  stride_1_0 = (b_in4.size(0) != 1);
  for (int i{0}; i < 2; i++) {
    if (b_in4.size(0) == 1) {
      b = b_in2.size(0);
    } else {
      b = b_in4.size(0);
    }
    for (int i1{0}; i1 < b; i1++) {
      in1[i1 + in1.size(0) * i] = b_in2[i1 * loop_ub + b_in2.size(0) * i] *
                                  b_in4[i1 * stride_1_0 + b_in4.size(0) * i];
    }
  }
}

//
// Arguments    : coder::array<float, 2U> &in1
//                const coder::array<float, 2U> &in2
//                const coder::array<double, 1U> &in3
//                const coder::array<float, 1U> &in4
//                const coder::array<float, 1U> &in5
// Return Type  : void
//
void binary_expand_op_9(coder::array<float, 2U> &in1,
                        const coder::array<float, 2U> &in2,
                        const coder::array<double, 1U> &in3,
                        const coder::array<float, 1U> &in4,
                        const coder::array<float, 1U> &in5)
{
  coder::array<float, 2U> b_in2;
  coder::array<float, 2U> b_in4;
  int b;
  int loop_ub;
  int stride_1_0;
  b_in2.set_size(in3.size(0), 2);
  loop_ub = in3.size(0);
  for (int i{0}; i < loop_ub; i++) {
    float f;
    f = in2[i + in2.size(0) * 2];
    b_in2[i] = f / 2.0F;
    b_in2[i + b_in2.size(0)] = f / 2.0F;
  }
  b_in4.set_size(in4.size(0), 2);
  loop_ub = in4.size(0);
  for (int i{0}; i < loop_ub; i++) {
    b_in4[i] = in4[i];
  }
  loop_ub = in5.size(0);
  for (int i{0}; i < loop_ub; i++) {
    b_in4[i + b_in4.size(0)] = in5[i];
  }
  if (b_in4.size(0) == 1) {
    b = b_in2.size(0);
  } else {
    b = b_in4.size(0);
  }
  in1.set_size(b, 2);
  loop_ub = (b_in2.size(0) != 1);
  stride_1_0 = (b_in4.size(0) != 1);
  for (int i{0}; i < 2; i++) {
    if (b_in4.size(0) == 1) {
      b = b_in2.size(0);
    } else {
      b = b_in4.size(0);
    }
    for (int i1{0}; i1 < b; i1++) {
      in1[i1 + in1.size(0) * i] = b_in2[i1 * loop_ub + b_in2.size(0) * i] *
                                  b_in4[i1 * stride_1_0 + b_in4.size(0) * i];
    }
  }
}

//
// File trailer for bbox2poly.cu
//
// [EOF]
//
