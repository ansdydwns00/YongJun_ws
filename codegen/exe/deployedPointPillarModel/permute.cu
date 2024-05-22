//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: permute.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "permute.h"
#include "rt_nonfinite.h"
#include "MWCudaDimUtility.hpp"

// Function Declarations
static __global__ void permute_kernel23(const float a[3428352],
                                        float b[3428352]);

static __global__ void permute_kernel28(const float a[1714176],
                                        float b[1714176]);

// Function Definitions
//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const float a[3428352]
//                float b[3428352]
// Return Type  : void
//
static __global__
    __launch_bounds__(512, 1) void permute_kernel23(const float a[3428352],
                                                    float b[3428352])
{
  unsigned long long threadId;
  int b_k;
  int c_k;
  int k;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  c_k = static_cast<int>(threadId % 216ULL);
  threadId = (threadId - static_cast<unsigned long long>(c_k)) / 216ULL;
  b_k = static_cast<int>(threadId % 124ULL);
  threadId = (threadId - static_cast<unsigned long long>(b_k)) / 124ULL;
  k = static_cast<int>(threadId);
  if ((k < 128) && (b_k < 124) && (c_k < 216)) {
    b[(b_k + 124 * c_k) + 26784 * k] = a[(c_k + 216 * b_k) + 26784 * k];
  }
}

//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const float a[1714176]
//                float b[1714176]
// Return Type  : void
//
static __global__
    __launch_bounds__(512, 1) void permute_kernel28(const float a[1714176],
                                                    float b[1714176])
{
  unsigned long long threadId;
  int b_k;
  int c_k;
  int k;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  c_k = static_cast<int>(threadId % 216ULL);
  threadId = (threadId - static_cast<unsigned long long>(c_k)) / 216ULL;
  b_k = static_cast<int>(threadId % 62ULL);
  threadId = (threadId - static_cast<unsigned long long>(b_k)) / 62ULL;
  k = static_cast<int>(threadId);
  if ((k < 128) && (b_k < 62) && (c_k < 216)) {
    b[(b_k + 62 * c_k) + 13392 * k] = a[(c_k + 216 * b_k) + 13392 * k];
  }
}

//
// Arguments    : const float a[1714176]
//                float b[1714176]
// Return Type  : void
//
namespace coder {
void b_permute(const float a[1714176], float b[1714176])
{
  permute_kernel28<<<dim3(3348U, 1U, 1U), dim3(512U, 1U, 1U)>>>(a, b);
}

//
// Arguments    : const float a[3428352]
//                float b[3428352]
// Return Type  : void
//
void permute(const float a[3428352], float b[3428352])
{
  permute_kernel23<<<dim3(6696U, 1U, 1U), dim3(512U, 1U, 1U)>>>(a, b);
}

} // namespace coder

//
// File trailer for permute.cu
//
// [EOF]
//
