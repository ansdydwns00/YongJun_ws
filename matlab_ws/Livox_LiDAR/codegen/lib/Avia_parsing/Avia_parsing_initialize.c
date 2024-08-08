/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: Avia_parsing_initialize.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 30-Jun-2024 15:39:37
 */

/* Include Files */
#include "Avia_parsing_initialize.h"
#include "Avia_parsing.h"
#include "Avia_parsing_data.h"
#include "rt_nonfinite.h"

/* Function Definitions */
/*
 * Arguments    : void
 * Return Type  : void
 */
void Avia_parsing_initialize(void)
{
  Avia_parsing_init();
  isInitialized_Avia_parsing = true;
}

/*
 * File trailer for Avia_parsing_initialize.c
 *
 * [EOF]
 */
