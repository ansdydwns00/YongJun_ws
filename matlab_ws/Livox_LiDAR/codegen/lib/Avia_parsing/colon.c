/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: colon.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 30-Jun-2024 15:39:37
 */

/* Include Files */
#include "colon.h"
#include "Avia_parsing_emxutil.h"
#include "Avia_parsing_types.h"
#include "rt_nonfinite.h"
#include <math.h>

/* Function Definitions */
/*
 * Arguments    : float a
 *                float b
 *                emxArray_real32_T *y
 * Return Type  : void
 */
void eml_float_colon(float a, float b, emxArray_real32_T *y)
{
  double apnd;
  double cdiff;
  double ndbl;
  float b1;
  float *y_data;
  int k;
  int n;
  int nm1d2;
  ndbl = floor(((double)b - a) + 0.5);
  apnd = a + ndbl;
  cdiff = apnd - b;
  if (fabs(cdiff) < 2.384185791015625E-7 * fmax(fabs(a), fabs(b))) {
    ndbl++;
    b1 = b;
  } else if (cdiff > 0.0) {
    b1 = (float)(a + (ndbl - 1.0));
  } else {
    ndbl++;
    b1 = (float)apnd;
  }
  if (ndbl >= 0.0) {
    n = (int)ndbl;
  } else {
    n = 0;
  }
  nm1d2 = y->size[0] * y->size[1];
  y->size[0] = 1;
  y->size[1] = n;
  emxEnsureCapacity_real32_T(y, nm1d2);
  y_data = y->data;
  if (n > 0) {
    y_data[0] = a;
    if (n > 1) {
      y_data[n - 1] = b1;
      nm1d2 = (n - 1) / 2;
      for (k = 0; k <= nm1d2 - 2; k++) {
        y_data[k + 1] = a + (float)(k + 1);
        y_data[(n - k) - 2] = b1 - (float)(k + 1);
      }
      if (nm1d2 << 1 == n - 1) {
        y_data[nm1d2] = (a + b1) / 2.0F;
      } else {
        y_data[nm1d2] = a + (float)nm1d2;
        y_data[nm1d2 + 1] = b1 - (float)nm1d2;
      }
    }
  }
}

/*
 * File trailer for colon.c
 *
 * [EOF]
 */
