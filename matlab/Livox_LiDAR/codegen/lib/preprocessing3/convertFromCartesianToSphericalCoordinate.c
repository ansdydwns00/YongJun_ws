/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: convertFromCartesianToSphericalCoordinate.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 26-Jun-2024 14:35:29
 */

/* Include Files */
#include "convertFromCartesianToSphericalCoordinate.h"
#include "rt_nonfinite.h"
#include "rt_defines.h"
#include "rt_nonfinite.h"
#include <math.h>
#include <xmmintrin.h>

/* Function Declarations */
static float rt_atan2f_snf(float u0, float u1);

/* Function Definitions */
/*
 * Arguments    : float u0
 *                float u1
 * Return Type  : float
 */
static float rt_atan2f_snf(float u0, float u1)
{
  float y;
  if (rtIsNaNF(u0) || rtIsNaNF(u1)) {
    y = rtNaNF;
  } else if (rtIsInfF(u0) && rtIsInfF(u1)) {
    int i;
    int i1;
    if (u0 > 0.0F) {
      i = 1;
    } else {
      i = -1;
    }
    if (u1 > 0.0F) {
      i1 = 1;
    } else {
      i1 = -1;
    }
    y = atan2f((float)i, (float)i1);
  } else if (u1 == 0.0F) {
    if (u0 > 0.0F) {
      y = RT_PIF / 2.0F;
    } else if (u0 < 0.0F) {
      y = -(RT_PIF / 2.0F);
    } else {
      y = 0.0F;
    }
  } else {
    y = atan2f(u0, u1);
  }
  return y;
}

/*
 * Arguments    : const float xyzData[172800]
 *                float rangeData[172800]
 * Return Type  : void
 */
void c_convertFromCartesianToSpheric(const float xyzData[172800],
                                     float rangeData[172800])
{
  static float pitch[57600];
  static float range[57600];
  __m128 r;
  int i;
  int k;
  for (k = 0; k <= 57596; k += 4) {
    __m128 r1;
    __m128 r2;
    r = _mm_loadu_ps(&xyzData[k]);
    r1 = _mm_loadu_ps(&xyzData[k + 57600]);
    r2 = _mm_loadu_ps(&xyzData[k + 115200]);
    _mm_storeu_ps(
        &range[k],
        _mm_sqrt_ps(_mm_add_ps(_mm_add_ps(_mm_mul_ps(r, r), _mm_mul_ps(r1, r1)),
                               _mm_mul_ps(r2, r2))));
  }
  for (k = 0; k < 1800; k++) {
    for (i = 0; i <= 28; i += 4) {
      int i1;
      i1 = i + (k << 5);
      r = _mm_loadu_ps(&range[i1]);
      _mm_storeu_ps(&pitch[i1],
                    _mm_div_ps(_mm_loadu_ps(&xyzData[i1 + 115200]), r));
    }
  }
  for (k = 0; k < 57600; k++) {
    float f;
    float f1;
    f = asinf(pitch[k]);
    pitch[k] = f;
    f1 = rt_atan2f_snf(xyzData[k], xyzData[k + 57600]);
    if (f1 < 0.0F) {
      f1 += 6.28318548F;
    }
    rangeData[k] = range[k];
    rangeData[k + 57600] = f;
    rangeData[k + 115200] = f1;
  }
}

/*
 * File trailer for convertFromCartesianToSphericalCoordinate.c
 *
 * [EOF]
 */
