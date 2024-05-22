//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: ipermute.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "ipermute.h"
#include "rt_nonfinite.h"
#include "MWCudaDimUtility.hpp"

// Function Declarations
static __global__ void ipermute_kernel25(const float b[6856704],
                                         float a[6856704]);

// Function Definitions
//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const float b[6856704]
//                float a[6856704]
// Return Type  : void
//
static __global__
    __launch_bounds__(512, 1) void ipermute_kernel25(const float b[6856704],
                                                     float a[6856704])
{
  unsigned long long threadId;
  int b_k;
  int c_k;
  int k;
  threadId =
      static_cast<unsigned long long>(mwGetGlobalThreadIndexInXDimension());
  c_k = static_cast<int>(threadId % 248ULL);
  threadId = (threadId - static_cast<unsigned long long>(c_k)) / 248ULL;
  b_k = static_cast<int>(threadId % 216ULL);
  threadId = (threadId - static_cast<unsigned long long>(b_k)) / 216ULL;
  k = static_cast<int>(threadId);
  if ((k < 128) && (b_k < 216) && (c_k < 248)) {
    a[(b_k + 216 * c_k) + 53568 * k] = b[(c_k + 248 * b_k) + 53568 * k];
  }
}

//
// Arguments    : const float b[6856704]
//                float a[6856704]
// Return Type  : void
//
namespace coder {
void ipermute(const float b[6856704], float a[6856704])
{
  ipermute_kernel25<<<dim3(13392U, 1U, 1U), dim3(512U, 1U, 1U)>>>(b, a);
}

} // namespace coder

//
// File trailer for ipermute.cu
//
// [EOF]
//
