/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: G32_parsing_initialize.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 29-Jul-2024 11:53:30
 */

/* Include Files */
#include "G32_parsing_initialize.h"
#include "G32_parsing.h"
#include "G32_parsing_data.h"
#include "rt_nonfinite.h"

/* Function Definitions */
/*
 * Arguments    : void
 * Return Type  : void
 */
void G32_parsing_initialize(void)
{
  G32_parsing_init();
  isInitialized_G32_parsing = true;
}

/*
 * File trailer for G32_parsing_initialize.c
 *
 * [EOF]
 */
