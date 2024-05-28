//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// selectStrongestBboxMulticlass.cu
//
// Code generation for function 'selectStrongestBboxMulticlass'
//

// Include files
#include "selectStrongestBboxMulticlass.h"
#include "overlapPolygonRotatedRects.h"
#include "pointpillarsDetect_types.h"
#include "rt_nonfinite.h"
#include <cfloat>
#include <cmath>

// Function Declarations
static real32_T rt_remf_snf(real32_T u0, real32_T u1);

// Function Definitions
static real32_T rt_remf_snf(real32_T u0, real32_T u1)
{
  real32_T y;
  if (std::isnan(u0) || std::isnan(u1) || std::isinf(u0)) {
    y = rtNaNF;
  } else if (std::isinf(u1)) {
    y = u0;
  } else if ((u1 != 0.0F) && (u1 != std::trunc(u1))) {
    real32_T q;
    q = std::abs(u0 / u1);
    if (!(std::abs(q - std::floor(q + 0.5F)) > FLT_EPSILON * q)) {
      y = 0.0F * u0;
    } else {
      y = std::fmod(u0, u1);
    }
  } else {
    y = std::fmod(u0, u1);
  }
  return y;
}

namespace coder {
void b_selectStrongestBboxCodegen(pointpillarsDetectStackData *SD,
                                  const real32_T bbox_data[],
                                  const int32_T bbox_size[2],
                                  const real32_T label_data[],
                                  boolean_T selectedIndex_data[],
                                  int32_T selectedIndex_size[1])
{
  real_T overlapPoly_data[50];
  real_T overlapedPolyPts_data[48];
  int32_T u_size[2];
  int32_T v_size[2];
  int32_T bbox_size_idx_0;
  int32_T i;
  int32_T inidx;
  int32_T npages;
  int32_T vidx;
  int32_T x_size_idx_0;
  real32_T absx;
  real32_T xmin;
  int8_T n;
  selectedIndex_size[0] = bbox_size[0];
  for (int32_T j{0}; j < bbox_size[0]; j++) {
    selectedIndex_data[j] = true;
  }
  for (int32_T j{0}; j < (bbox_size[0] << 2); j++) {
    SD->f1.X_data[j] = 0.0F;
    SD->f1.Y_data[j] = 0.0F;
  }
  for (int32_T k{0}; k < bbox_size[0]; k++) {
    SD->f1.r_data[k] = bbox_data[k + bbox_size[0] * 4];
    xmin = bbox_data[k + bbox_size[0] * 4];
    SD->f1.b_x_data[k] = xmin;
    if (std::isinf(xmin) || std::isnan(xmin)) {
      SD->f1.b_x_data[k] = rtNaNF;
    } else {
      xmin = rt_remf_snf(xmin, 360.0F);
      absx = std::abs(xmin);
      if (absx > 180.0F) {
        if (xmin > 0.0F) {
          xmin -= 360.0F;
        } else {
          xmin += 360.0F;
        }
        absx = std::abs(xmin);
      }
      if (absx <= 45.0F) {
        xmin *= 0.0174532924F;
        n = 0;
      } else if (absx <= 135.0F) {
        if (xmin > 0.0F) {
          xmin = 0.0174532924F * (xmin - 90.0F);
          n = 1;
        } else {
          xmin = 0.0174532924F * (xmin + 90.0F);
          n = -1;
        }
      } else if (xmin > 0.0F) {
        xmin = 0.0174532924F * (xmin - 180.0F);
        n = 2;
      } else {
        xmin = 0.0174532924F * (xmin + 180.0F);
        n = -2;
      }
      if (n == 0) {
        SD->f1.b_x_data[k] = std::cos(xmin);
      } else if (n == 1) {
        SD->f1.b_x_data[k] = -std::sin(xmin);
      } else if (n == -1) {
        SD->f1.b_x_data[k] = std::sin(xmin);
      } else {
        SD->f1.b_x_data[k] = -std::cos(xmin);
      }
    }
    xmin = bbox_data[k + bbox_size[0] * 4];
    SD->f1.c_x_data[k] = xmin;
    if (std::isinf(xmin) || std::isnan(xmin)) {
      SD->f1.c_x_data[k] = rtNaNF;
    } else {
      xmin = rt_remf_snf(xmin, 360.0F);
      absx = std::abs(xmin);
      if (absx > 180.0F) {
        if (xmin > 0.0F) {
          xmin -= 360.0F;
        } else {
          xmin += 360.0F;
        }
        absx = std::abs(xmin);
      }
      if (absx <= 45.0F) {
        xmin *= 0.0174532924F;
        n = 0;
      } else if (absx <= 135.0F) {
        if (xmin > 0.0F) {
          xmin = 0.0174532924F * (xmin - 90.0F);
          n = 1;
        } else {
          xmin = 0.0174532924F * (xmin + 90.0F);
          n = -1;
        }
      } else if (xmin > 0.0F) {
        xmin = 0.0174532924F * (xmin - 180.0F);
        n = 2;
      } else {
        xmin = 0.0174532924F * (xmin + 180.0F);
        n = -2;
      }
      if (n == 0) {
        SD->f1.c_x_data[k] = std::sin(xmin);
      } else if (n == 1) {
        SD->f1.c_x_data[k] = std::cos(xmin);
      } else if (n == -1) {
        SD->f1.c_x_data[k] = -std::cos(xmin);
      } else {
        SD->f1.c_x_data[k] = -std::sin(xmin);
      }
    }
  }
  npages = bbox_size[0];
  vidx = bbox_size[0];
  inidx = bbox_size[0];
  for (int32_T j{0}; j < vidx; j++) {
    xmin = bbox_data[j + bbox_size[0] * 2];
    SD->f1.bbox_data[j] = xmin / 2.0F;
    SD->f1.bbox_data[j + npages] = xmin / 2.0F;
    SD->f1.x_data[j] = SD->f1.b_x_data[j];
    SD->f1.x_data[j + inidx] = SD->f1.c_x_data[j];
  }
  u_size[0] = bbox_size[0];
  for (int32_T j{0}; j < (npages << 1); j++) {
    SD->f1.u_data[j] = SD->f1.bbox_data[j] * SD->f1.x_data[j];
  }
  for (int32_T k{0}; k < bbox_size[0]; k++) {
    xmin = bbox_data[k + bbox_size[0] * 4];
    SD->f1.b_x_data[k] = xmin;
    if (std::isinf(xmin) || std::isnan(xmin)) {
      SD->f1.b_x_data[k] = rtNaNF;
    } else {
      xmin = rt_remf_snf(xmin, 360.0F);
      absx = std::abs(xmin);
      if (absx > 180.0F) {
        if (xmin > 0.0F) {
          xmin -= 360.0F;
        } else {
          xmin += 360.0F;
        }
        absx = std::abs(xmin);
      }
      if (absx <= 45.0F) {
        xmin *= 0.0174532924F;
        n = 0;
      } else if (absx <= 135.0F) {
        if (xmin > 0.0F) {
          xmin = 0.0174532924F * (xmin - 90.0F);
          n = 1;
        } else {
          xmin = 0.0174532924F * (xmin + 90.0F);
          n = -1;
        }
      } else if (xmin > 0.0F) {
        xmin = 0.0174532924F * (xmin - 180.0F);
        n = 2;
      } else {
        xmin = 0.0174532924F * (xmin + 180.0F);
        n = -2;
      }
      if (n == 0) {
        SD->f1.b_x_data[k] = std::sin(xmin);
      } else if (n == 1) {
        SD->f1.b_x_data[k] = std::cos(xmin);
      } else if (n == -1) {
        SD->f1.b_x_data[k] = -std::cos(xmin);
      } else {
        SD->f1.b_x_data[k] = -std::sin(xmin);
      }
    }
    if (std::isinf(SD->f1.r_data[k]) || std::isnan(SD->f1.r_data[k])) {
      SD->f1.r_data[k] = rtNaNF;
    } else {
      xmin = rt_remf_snf(SD->f1.r_data[k], 360.0F);
      absx = std::abs(xmin);
      if (absx > 180.0F) {
        if (xmin > 0.0F) {
          xmin -= 360.0F;
        } else {
          xmin += 360.0F;
        }
        absx = std::abs(xmin);
      }
      if (absx <= 45.0F) {
        xmin *= 0.0174532924F;
        n = 0;
      } else if (absx <= 135.0F) {
        if (xmin > 0.0F) {
          xmin = 0.0174532924F * (xmin - 90.0F);
          n = 1;
        } else {
          xmin = 0.0174532924F * (xmin + 90.0F);
          n = -1;
        }
      } else if (xmin > 0.0F) {
        xmin = 0.0174532924F * (xmin - 180.0F);
        n = 2;
      } else {
        xmin = 0.0174532924F * (xmin + 180.0F);
        n = -2;
      }
      if (n == 0) {
        SD->f1.r_data[k] = std::cos(xmin);
      } else if (n == 1) {
        SD->f1.r_data[k] = -std::sin(xmin);
      } else if (n == -1) {
        SD->f1.r_data[k] = std::sin(xmin);
      } else {
        SD->f1.r_data[k] = -std::cos(xmin);
      }
    }
  }
  bbox_size_idx_0 = bbox_size[0];
  vidx = bbox_size[0];
  x_size_idx_0 = bbox_size[0];
  for (int32_T j{0}; j < vidx; j++) {
    xmin = bbox_data[j + bbox_size[0] * 3];
    SD->f1.bbox_data[j] = xmin / 2.0F;
    SD->f1.bbox_data[j + bbox_size_idx_0] = xmin / 2.0F;
    SD->f1.x_data[j] = -SD->f1.b_x_data[j];
    SD->f1.x_data[j + x_size_idx_0] = SD->f1.r_data[j];
  }
  v_size[0] = bbox_size[0];
  for (int32_T j{0}; j < (bbox_size_idx_0 << 1); j++) {
    SD->f1.v_data[j] = SD->f1.bbox_data[j] * SD->f1.x_data[j];
  }
  npages = bbox_size[0];
  for (int32_T j{0}; j < npages; j++) {
    SD->f1.X_data[4 * j] = (bbox_data[j] - SD->f1.u_data[j]) - SD->f1.v_data[j];
  }
  npages = bbox_size[0];
  for (int32_T j{0}; j < npages; j++) {
    SD->f1.Y_data[4 * j] =
        (bbox_data[j + bbox_size[0]] - SD->f1.u_data[j + u_size[0]]) -
        SD->f1.v_data[j + v_size[0]];
  }
  npages = bbox_size[0];
  for (int32_T j{0}; j < npages; j++) {
    SD->f1.X_data[4 * j + 1] =
        (bbox_data[j] + SD->f1.u_data[j]) - SD->f1.v_data[j];
  }
  npages = bbox_size[0];
  for (int32_T j{0}; j < npages; j++) {
    SD->f1.Y_data[4 * j + 1] =
        (bbox_data[j + bbox_size[0]] + SD->f1.u_data[j + u_size[0]]) -
        SD->f1.v_data[j + v_size[0]];
  }
  npages = bbox_size[0];
  for (int32_T j{0}; j < npages; j++) {
    SD->f1.X_data[4 * j + 2] =
        (bbox_data[j] + SD->f1.u_data[j]) + SD->f1.v_data[j];
  }
  npages = bbox_size[0];
  for (int32_T j{0}; j < npages; j++) {
    SD->f1.Y_data[4 * j + 2] =
        (bbox_data[j + bbox_size[0]] + SD->f1.u_data[j + u_size[0]]) +
        SD->f1.v_data[j + v_size[0]];
  }
  npages = bbox_size[0];
  for (int32_T j{0}; j < npages; j++) {
    SD->f1.X_data[4 * j + 3] =
        (bbox_data[j] - SD->f1.u_data[j]) + SD->f1.v_data[j];
  }
  npages = bbox_size[0];
  for (int32_T j{0}; j < npages; j++) {
    SD->f1.Y_data[4 * j + 3] =
        (bbox_data[j + bbox_size[0]] - SD->f1.u_data[j + u_size[0]]) +
        SD->f1.v_data[j + v_size[0]];
  }
  npages = bbox_size[0];
  for (i = 0; i < npages; i++) {
    inidx = i << 2;
    vidx = i << 2;
    SD->f1.r_data[i] = std::abs(
        (((SD->f1.X_data[vidx] - SD->f1.X_data[vidx + 3]) *
              (SD->f1.Y_data[vidx] + SD->f1.Y_data[vidx + 3]) / 2.0F +
          (SD->f1.X_data[inidx + 1] - SD->f1.X_data[inidx]) *
              (SD->f1.Y_data[inidx + 1] + SD->f1.Y_data[inidx]) / 2.0F) +
         (SD->f1.X_data[inidx + 2] - SD->f1.X_data[inidx + 1]) *
             (SD->f1.Y_data[inidx + 2] + SD->f1.Y_data[inidx + 1]) / 2.0F) +
        (SD->f1.X_data[inidx + 3] - SD->f1.X_data[inidx + 2]) *
            (SD->f1.Y_data[inidx + 3] + SD->f1.Y_data[inidx + 2]) / 2.0F);
  }
  inidx = -1;
  i = bbox_size[0];
  for (x_size_idx_0 = 0; x_size_idx_0 < i; x_size_idx_0++) {
    real32_T xIndices1_data[4];
    real32_T yIndices1_data[4];
    inidx = x_size_idx_0;
    xIndices1_data[0] = SD->f1.X_data[4 * x_size_idx_0];
    yIndices1_data[0] = SD->f1.Y_data[4 * x_size_idx_0];
    xIndices1_data[1] = SD->f1.X_data[4 * x_size_idx_0 + 1];
    yIndices1_data[1] = SD->f1.Y_data[4 * x_size_idx_0 + 1];
    xIndices1_data[2] = SD->f1.X_data[4 * x_size_idx_0 + 2];
    yIndices1_data[2] = SD->f1.Y_data[4 * x_size_idx_0 + 2];
    xIndices1_data[3] = SD->f1.X_data[4 * x_size_idx_0 + 3];
    yIndices1_data[3] = SD->f1.Y_data[4 * x_size_idx_0 + 3];
    if (std::isnan(label_data[x_size_idx_0])) {
      selectedIndex_data[x_size_idx_0] = false;
    } else {
      if (selectedIndex_data[x_size_idx_0]) {
        vidx = 2;
      } else {
        vidx = 1;
      }
      if (vidx != 1) {
        vidx = bbox_size[0] - x_size_idx_0;
        for (int32_T j{0}; j <= vidx - 2; j++) {
          bbox_size_idx_0 = (x_size_idx_0 + j) + 1;
          if (selectedIndex_data[bbox_size_idx_0] &&
              (!(label_data[bbox_size_idx_0] != label_data[x_size_idx_0]))) {
            real32_T xIndices2_data[4];
            real32_T yIndices2_data[4];
            real32_T b_xmin;
            real32_T b_ymax;
            real32_T b_ymin;
            real32_T xmax;
            real32_T ymax;
            real32_T ymin;
            xIndices2_data[0] = SD->f1.X_data[4 * bbox_size_idx_0];
            yIndices2_data[0] = SD->f1.Y_data[4 * bbox_size_idx_0];
            xIndices2_data[1] = SD->f1.X_data[4 * bbox_size_idx_0 + 1];
            yIndices2_data[1] = SD->f1.Y_data[4 * bbox_size_idx_0 + 1];
            xIndices2_data[2] = SD->f1.X_data[4 * bbox_size_idx_0 + 2];
            yIndices2_data[2] = SD->f1.Y_data[4 * bbox_size_idx_0 + 2];
            xIndices2_data[3] = SD->f1.X_data[4 * bbox_size_idx_0 + 3];
            yIndices2_data[3] = SD->f1.Y_data[4 * bbox_size_idx_0 + 3];
            xmin = SD->f1.X_data[4 * x_size_idx_0];
            absx = xmin;
            ymin = SD->f1.Y_data[4 * x_size_idx_0];
            ymax = ymin;
            b_xmin = SD->f1.X_data[4 * bbox_size_idx_0];
            xmax = SD->f1.X_data[4 * bbox_size_idx_0];
            b_ymin = SD->f1.Y_data[4 * bbox_size_idx_0];
            b_ymax = SD->f1.Y_data[4 * bbox_size_idx_0];
            for (npages = 0; npages < 3; npages++) {
              boolean_T p;
              if (std::isnan(xIndices1_data[npages + 1])) {
                p = false;
              } else if (std::isnan(xmin)) {
                p = true;
              } else {
                p = (xmin > SD->f1.X_data[(npages + 4 * x_size_idx_0) + 1]);
              }
              if (p) {
                xmin = SD->f1.X_data[(npages + 4 * x_size_idx_0) + 1];
              }
              if (std::isnan(xIndices1_data[npages + 1])) {
                p = false;
              } else if (std::isnan(absx)) {
                p = true;
              } else {
                p = (absx < SD->f1.X_data[(npages + 4 * x_size_idx_0) + 1]);
              }
              if (p) {
                absx = SD->f1.X_data[(npages + 4 * x_size_idx_0) + 1];
              }
              if (std::isnan(yIndices1_data[npages + 1])) {
                p = false;
              } else if (std::isnan(ymin)) {
                p = true;
              } else {
                p = (ymin > SD->f1.Y_data[(npages + 4 * x_size_idx_0) + 1]);
              }
              if (p) {
                ymin = SD->f1.Y_data[(npages + 4 * x_size_idx_0) + 1];
              }
              if (std::isnan(yIndices1_data[npages + 1])) {
                p = false;
              } else if (std::isnan(ymax)) {
                p = true;
              } else {
                p = (ymax < SD->f1.Y_data[(npages + 4 * x_size_idx_0) + 1]);
              }
              if (p) {
                ymax = SD->f1.Y_data[(npages + 4 * x_size_idx_0) + 1];
              }
              if (std::isnan(xIndices2_data[npages + 1])) {
                p = false;
              } else if (std::isnan(b_xmin)) {
                p = true;
              } else {
                p = (b_xmin >
                     SD->f1.X_data[(npages + 4 * bbox_size_idx_0) + 1]);
              }
              if (p) {
                b_xmin = SD->f1.X_data[(npages + 4 * bbox_size_idx_0) + 1];
              }
              if (std::isnan(xIndices2_data[npages + 1])) {
                p = false;
              } else if (std::isnan(xmax)) {
                p = true;
              } else {
                p = (xmax < SD->f1.X_data[(npages + 4 * bbox_size_idx_0) + 1]);
              }
              if (p) {
                xmax = SD->f1.X_data[(npages + 4 * bbox_size_idx_0) + 1];
              }
              if (std::isnan(yIndices2_data[npages + 1])) {
                p = false;
              } else if (std::isnan(b_ymin)) {
                p = true;
              } else {
                p = (b_ymin >
                     SD->f1.Y_data[(npages + 4 * bbox_size_idx_0) + 1]);
              }
              if (p) {
                b_ymin = SD->f1.Y_data[(npages + 4 * bbox_size_idx_0) + 1];
              }
              if (std::isnan(yIndices2_data[npages + 1])) {
                p = false;
              } else if (std::isnan(b_ymax)) {
                p = true;
              } else {
                p = (b_ymax <
                     SD->f1.Y_data[(npages + 4 * bbox_size_idx_0) + 1]);
              }
              if (p) {
                b_ymax = SD->f1.Y_data[(npages + 4 * bbox_size_idx_0) + 1];
              }
            }
            if ((!(std::fmin(absx, xmax) - std::fmax(xmin, b_xmin) <= 0.0F)) &&
                (!(std::fmin(ymax, b_ymax) - std::fmax(ymin, b_ymin) <=
                   0.0F))) {
              vision::internal::detector::c_overlapPolygonRotatedRects_fi(
                  xIndices1_data, yIndices1_data, xIndices2_data,
                  yIndices2_data, overlapedPolyPts_data, u_size);
              if (u_size[1] != 0) {
                real_T s;
                vision::internal::detector::d_overlapPolygonRotatedRects_fi(
                    overlapedPolyPts_data, u_size, overlapPoly_data, v_size);
                npages = v_size[1];
                s = (overlapPoly_data[0] -
                     overlapPoly_data[2 * (v_size[1] - 1)]) *
                    (overlapPoly_data[1] +
                     overlapPoly_data[2 * (v_size[1] - 1) + 1]) /
                    2.0;
                for (int32_T k{0}; k <= npages - 2; k++) {
                  s += (overlapPoly_data[2 * (k + 1)] -
                        overlapPoly_data[2 * k]) *
                       (overlapPoly_data[2 * (k + 1) + 1] +
                        overlapPoly_data[2 * k + 1]) /
                       2.0;
                }
                if (static_cast<real32_T>(std::abs(s)) /
                        std::fmin(SD->f1.r_data[x_size_idx_0],
                                  SD->f1.r_data[bbox_size_idx_0]) >
                    0.1) {
                  selectedIndex_data[bbox_size_idx_0] = false;
                }
              }
            }
          }
        }
      }
    }
  }
  if (inidx + 2 > bbox_size[0]) {
    inidx = 0;
    npages = 0;
  } else {
    inidx++;
    npages = bbox_size[0];
  }
  vidx = npages - inidx;
  for (int32_T j{0}; j < vidx; j++) {
    selectedIndex_data[inidx + j] = false;
  }
}

} // namespace coder

// End of code generation (selectStrongestBboxMulticlass.cu)
