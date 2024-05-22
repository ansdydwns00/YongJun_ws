//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: createAnchorsPointPillars.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

// Include Files
#include "createAnchorsPointPillars.h"
#include "cat.h"
#include "deployedPointPillarModel_internal_types.h"
#include "repelem.h"
#include "rt_nonfinite.h"
#include "coder_array.h"

// Function Definitions
//
// Arguments    : const cell_wrap_5 anchorBoxes[1]
//                array<double, 2U> &anchors3D
//                array<double, 2U> &anchorsBEV
// Return Type  : void
//
namespace coder {
namespace lidar {
namespace internal {
namespace cnn {
void createAnchorsPointPillars(const cell_wrap_5 anchorBoxes[1],
                               array<double, 2U> &anchors3D,
                               array<double, 2U> &anchorsBEV)
{
  static const double dv[248]{-39.52,
                              -39.2,
                              -38.88,
                              -38.56,
                              -38.24,
                              -37.92,
                              -37.6,
                              -37.28,
                              -36.96,
                              -36.64,
                              -36.32,
                              -36.0,
                              -35.68,
                              -35.36,
                              -35.04,
                              -34.72,
                              -34.4,
                              -34.08,
                              -33.76,
                              -33.44,
                              -33.12,
                              -32.8,
                              -32.480000000000004,
                              -32.160000000000004,
                              -31.84,
                              -31.52,
                              -31.2,
                              -30.88,
                              -30.560000000000002,
                              -30.240000000000002,
                              -29.92,
                              -29.6,
                              -29.28,
                              -28.96,
                              -28.64,
                              -28.32,
                              -28.0,
                              -27.68,
                              -27.36,
                              -27.04,
                              -26.72,
                              -26.400000000000002,
                              -26.080000000000002,
                              -25.76,
                              -25.44,
                              -25.12,
                              -24.8,
                              -24.48,
                              -24.16,
                              -23.84,
                              -23.52,
                              -23.2,
                              -22.88,
                              -22.56,
                              -22.240000000000002,
                              -21.92,
                              -21.6,
                              -21.28,
                              -20.96,
                              -20.64,
                              -20.32,
                              -20.0,
                              -19.68,
                              -19.36,
                              -19.04,
                              -18.72,
                              -18.400000000000002,
                              -18.080000000000002,
                              -17.76,
                              -17.44,
                              -17.12,
                              -16.8,
                              -16.48,
                              -16.16,
                              -15.84,
                              -15.52,
                              -15.200000000000001,
                              -14.88,
                              -14.56,
                              -14.24,
                              -13.92,
                              -13.6,
                              -13.280000000000001,
                              -12.96,
                              -12.64,
                              -12.32,
                              -12.0,
                              -11.68,
                              -11.36,
                              -11.040000000000001,
                              -10.72,
                              -10.4,
                              -10.08,
                              -9.76,
                              -9.44,
                              -9.120000000000001,
                              -8.8,
                              -8.48,
                              -8.16,
                              -7.84,
                              -7.5200000000000005,
                              -7.2,
                              -6.88,
                              -6.5600000000000005,
                              -6.24,
                              -5.92,
                              -5.6000000000000005,
                              -5.28,
                              -4.96,
                              -4.64,
                              -4.32,
                              -4.0,
                              -3.68,
                              -3.36,
                              -3.04,
                              -2.72,
                              -2.4,
                              -2.08,
                              -1.76,
                              -1.44,
                              -1.12,
                              -0.8,
                              -0.48,
                              -0.16,
                              0.16,
                              0.48,
                              0.8,
                              1.12,
                              1.44,
                              1.76,
                              2.08,
                              2.4,
                              2.72,
                              3.04,
                              3.36,
                              3.68,
                              4.0,
                              4.32,
                              4.64,
                              4.96,
                              5.28,
                              5.6000000000000005,
                              5.92,
                              6.24,
                              6.5600000000000005,
                              6.88,
                              7.2,
                              7.5200000000000005,
                              7.84,
                              8.16,
                              8.48,
                              8.8,
                              9.120000000000001,
                              9.44,
                              9.76,
                              10.08,
                              10.4,
                              10.72,
                              11.040000000000001,
                              11.36,
                              11.68,
                              12.0,
                              12.32,
                              12.64,
                              12.96,
                              13.280000000000001,
                              13.6,
                              13.92,
                              14.24,
                              14.56,
                              14.88,
                              15.200000000000001,
                              15.52,
                              15.84,
                              16.16,
                              16.48,
                              16.8,
                              17.12,
                              17.44,
                              17.76,
                              18.080000000000002,
                              18.400000000000002,
                              18.72,
                              19.04,
                              19.36,
                              19.68,
                              20.0,
                              20.32,
                              20.64,
                              20.96,
                              21.28,
                              21.6,
                              21.92,
                              22.240000000000002,
                              22.56,
                              22.88,
                              23.2,
                              23.52,
                              23.84,
                              24.16,
                              24.48,
                              24.8,
                              25.12,
                              25.44,
                              25.76,
                              26.080000000000002,
                              26.400000000000002,
                              26.72,
                              27.04,
                              27.36,
                              27.68,
                              28.0,
                              28.32,
                              28.64,
                              28.96,
                              29.28,
                              29.6,
                              29.92,
                              30.240000000000002,
                              30.560000000000002,
                              30.88,
                              31.2,
                              31.52,
                              31.84,
                              32.160000000000004,
                              32.480000000000004,
                              32.8,
                              33.12,
                              33.44,
                              33.76,
                              34.08,
                              34.4,
                              34.72,
                              35.04,
                              35.36,
                              35.68,
                              36.0,
                              36.32,
                              36.64,
                              36.96,
                              37.28,
                              37.6,
                              37.92,
                              38.24,
                              38.56,
                              38.88,
                              39.2,
                              39.52};
  static double tmp[107136];
  static double xx[53568];
  static double yy[53568];
  array<double, 2U> anchors3dMod;
  array<double, 2U> anchorsDim;
  array<double, 2U> b_anchors3dMod;
  array<double, 2U> b_tmp;
  array<double, 2U> c_anchors3dMod;
  array<double, 2U> dv1;
  int iacol;
  int nrows;
  for (nrows = 0; nrows < 248; nrows++) {
    for (iacol = 0; iacol < 216; iacol++) {
      yy[iacol + 216 * nrows] = dv[nrows];
      xx[iacol + 216 * nrows] =
          0.32000000000000006 * static_cast<double>(iacol) + 0.16;
    }
  }
  for (nrows = 0; nrows < 53568; nrows++) {
    tmp[nrows] = xx[nrows];
    tmp[nrows + 53568] = yy[nrows];
  }
  repelem(tmp, 2.0, b_tmp);
  anchors3D.set_size(107136, 7);
  for (nrows = 0; nrows < 749952; nrows++) {
    anchors3D[nrows] = 0.0;
  }
  for (nrows = 0; nrows < 2; nrows++) {
    for (iacol = 0; iacol < 107136; iacol++) {
      anchors3D[iacol + anchors3D.size(0) * nrows] =
          b_tmp[iacol + b_tmp.size(0) * nrows];
    }
  }
  dv1.set_size(2, 5);
  for (nrows = 0; nrows < 5; nrows++) {
    dv1[dv1.size(0) * nrows] = anchorBoxes[0].f1[nrows << 1];
    dv1[dv1.size(0) * nrows + 1] = anchorBoxes[0].f1[(nrows << 1) + 1];
  }
  anchorsDim.set_size(dv1.size(0) * 53568, 5);
  nrows = dv1.size(0);
  for (int jcol{0}; jcol < 5; jcol++) {
    int ibmat;
    iacol = jcol * nrows;
    ibmat = jcol * (nrows * 53568);
    for (int itilerow{0}; itilerow < 53568; itilerow++) {
      int ibcol;
      ibcol = ibmat + itilerow * nrows;
      for (int k{0}; k < nrows; k++) {
        anchorsDim[ibcol + k] = dv1[iacol + k];
      }
    }
  }
  for (nrows = 0; nrows < 107136; nrows++) {
    anchors3D[nrows + anchors3D.size(0) * 2] =
        anchorsDim[nrows + anchorsDim.size(0) * 3];
  }
  for (nrows = 0; nrows < 3; nrows++) {
    for (iacol = 0; iacol < 107136; iacol++) {
      anchors3D[iacol + anchors3D.size(0) * (nrows + 3)] =
          anchorsDim[iacol + anchorsDim.size(0) * nrows];
    }
  }
  for (nrows = 0; nrows < 107136; nrows++) {
    anchors3D[nrows + anchors3D.size(0) * 6] =
        anchorsDim[nrows + anchorsDim.size(0) * 4];
  }
  anchors3dMod.set_size(107136, 7);
  for (nrows = 0; nrows < 749952; nrows++) {
    anchors3dMod[nrows] = anchors3D[nrows];
  }
  b_anchors3dMod.set_size(107136, 2);
  c_anchors3dMod.set_size(107136, 2);
  for (nrows = 0; nrows < 2; nrows++) {
    for (iacol = 0; iacol < 53568; iacol++) {
      anchors3dMod[((iacol << 1) + anchors3dMod.size(0) * (nrows + 3)) + 1] =
          anchors3D[((iacol << 1) + anchors3D.size(0) * (4 - nrows)) + 1];
    }
    for (iacol = 0; iacol < 107136; iacol++) {
      double d;
      double d1;
      d = anchors3dMod[iacol + anchors3dMod.size(0) * nrows];
      d1 = anchors3dMod[iacol + anchors3dMod.size(0) * (nrows + 3)];
      b_anchors3dMod[iacol + b_anchors3dMod.size(0) * nrows] = d - d1 / 2.0;
      c_anchors3dMod[iacol + c_anchors3dMod.size(0) * nrows] = d + d1 / 2.0;
    }
  }
  cat(b_anchors3dMod, c_anchors3dMod, anchorsBEV);
}

} // namespace cnn
} // namespace internal
} // namespace lidar
} // namespace coder

//
// File trailer for createAnchorsPointPillars.cu
//
// [EOF]
//
