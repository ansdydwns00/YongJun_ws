/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: AutoL_parsing_initialize.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 28-May-2024 16:51:43
 */

/* Include Files */
#include "AutoL_parsing_initialize.h"
#include "AutoL_parsing.h"
#include "AutoL_parsing_data.h"
#include "rt_nonfinite.h"

/* Function Definitions */
/*
 * Arguments    : void
 * Return Type  : void
 */
void AutoL_parsing_initialize(void)
{
  AutoL_parsing_init();
  isInitialized_AutoL_parsing = true;
}

/*
 * File trailer for AutoL_parsing_initialize.c
 *
 * [EOF]
 */
