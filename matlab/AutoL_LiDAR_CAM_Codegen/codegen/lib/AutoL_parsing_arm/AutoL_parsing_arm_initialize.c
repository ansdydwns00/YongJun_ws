/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: AutoL_parsing_arm_initialize.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 28-May-2024 17:15:30
 */

/* Include Files */
#include "AutoL_parsing_arm_initialize.h"
#include "AutoL_parsing_arm.h"
#include "AutoL_parsing_arm_data.h"
#include "rt_nonfinite.h"

/* Function Definitions */
/*
 * Arguments    : void
 * Return Type  : void
 */
void AutoL_parsing_arm_initialize(void)
{
  AutoL_parsing_arm_init();
  isInitialized_AutoL_parsing_arm = true;
}

/*
 * File trailer for AutoL_parsing_arm_initialize.c
 *
 * [EOF]
 */
