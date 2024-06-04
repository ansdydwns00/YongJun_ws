//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: pointCloudBase.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

// Include Files
#include "pointCloudBase.h"
#include "deployedPointPillarModel_internal_types.h"
#include "rt_nonfinite.h"
#include "coder_array.h"

// Function Definitions
//
// Arguments    : pointCloud *b_this
//                const array<unsigned char, 2U> &b_value
// Return Type  : void
//
namespace coder {
void pointCloudBase_set_Color(pointCloud *b_this,
                              const array<unsigned char, 2U> &b_value)
{
  unsigned int numPoints[2];
  int k;
  bool exitg1;
  bool p;
  numPoints[0] = static_cast<unsigned int>(b_value.size(0));
  numPoints[1] = static_cast<unsigned int>(b_value.size(1));
  p = true;
  k = 0;
  exitg1 = false;
  while ((!exitg1) && (k < 2)) {
    if (static_cast<int>(numPoints[k]) != (k << 1) + 1) {
      p = false;
      exitg1 = true;
    } else {
      k++;
    }
  }
  if (p) {
    int ncols;
    int nrows;
    int ntilerows;
    numPoints[0] = static_cast<unsigned int>(b_this->Location.size(0));
    b_this->Color.set_size(b_value.size(0) * static_cast<int>(numPoints[0]),
                           b_value.size(1));
    nrows = b_value.size(0);
    ncols = b_value.size(1);
    ntilerows = static_cast<int>(numPoints[0]);
    for (int jcol{0}; jcol < ncols; jcol++) {
      int iacol;
      int ibmat;
      iacol = jcol * nrows;
      ibmat = jcol * (nrows * ntilerows);
      for (int itilerow{0}; itilerow < ntilerows; itilerow++) {
        int ibcol;
        ibcol = ibmat + itilerow * nrows;
        for (k = 0; k < nrows; k++) {
          b_this->Color[ibcol + k] = b_value[iacol + k];
        }
      }
    }
  } else {
    b_this->Color.set_size(b_value.size(0), b_value.size(1));
    for (int nrows{0}; nrows < b_value.size(0) * b_value.size(1); nrows++) {
      b_this->Color[nrows] = b_value[nrows];
    }
  }
}

} // namespace coder

//
// File trailer for pointCloudBase.cu
//
// [EOF]
//
