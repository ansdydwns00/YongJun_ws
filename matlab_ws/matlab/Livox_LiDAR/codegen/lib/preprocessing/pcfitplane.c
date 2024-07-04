/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: pcfitplane.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 26-Jun-2024 13:22:25
 */

/* Include Files */
#include "pcfitplane.h"
#include "preprocessing_emxutil.h"
#include "preprocessing_types.h"
#include "rt_nonfinite.h"
#include <math.h>
#include <xmmintrin.h>

/* Function Definitions */
/*
 * Arguments    : const float model_data[]
 *                const emxArray_real32_T *points
 *                emxArray_real32_T *dis
 * Return Type  : void
 */
void evalPlane(const float model_data[], const emxArray_real32_T *points,
               emxArray_real32_T *dis)
{
  emxArray_real32_T *y;
  const float *points_data;
  float model;
  float *dis_data;
  float *y_data;
  int b_i;
  int i;
  int m_tmp;
  int vectorUB;
  points_data = points->data;
  m_tmp = points->size[0];
  emxInit_real32_T(&y, 1);
  i = y->size[0];
  y->size[0] = points->size[0];
  emxEnsureCapacity_real32_T(y, i);
  y_data = y->data;
  for (b_i = 0; b_i < m_tmp; b_i++) {
    y_data[b_i] = (points_data[b_i] * model_data[0] +
                   points_data[points->size[0] + b_i] * model_data[1]) +
                  points_data[(points->size[0] << 1) + b_i] * model_data[2];
  }
  model = model_data[3];
  b_i = (y->size[0] / 4) << 2;
  vectorUB = b_i - 4;
  for (i = 0; i <= vectorUB; i += 4) {
    __m128 r;
    r = _mm_loadu_ps(&y_data[i]);
    _mm_storeu_ps(&y_data[i], _mm_add_ps(r, _mm_set1_ps(model)));
  }
  for (i = b_i; i < m_tmp; i++) {
    y_data[i] += model;
  }
  b_i = y->size[0];
  i = dis->size[0];
  dis->size[0] = y->size[0];
  emxEnsureCapacity_real32_T(dis, i);
  dis_data = dis->data;
  for (vectorUB = 0; vectorUB < b_i; vectorUB++) {
    dis_data[vectorUB] = fabsf(y_data[vectorUB]);
  }
  emxFree_real32_T(&y);
}

/*
 * File trailer for pcfitplane.c
 *
 * [EOF]
 */
