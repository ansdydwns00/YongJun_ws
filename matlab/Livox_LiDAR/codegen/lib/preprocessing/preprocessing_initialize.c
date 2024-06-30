/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: preprocessing_initialize.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 26-Jun-2024 13:22:25
 */

/* Include Files */
#include "preprocessing_initialize.h"
#include "eml_rand_mt19937ar_stateful.h"
#include "preprocessing_data.h"
#include "rt_nonfinite.h"

/* Function Definitions */
/*
 * Arguments    : void
 * Return Type  : void
 */
void preprocessing_initialize(void)
{
  c_eml_rand_mt19937ar_stateful_i();
  isInitialized_preprocessing = true;
}

/*
 * File trailer for preprocessing_initialize.c
 *
 * [EOF]
 */
