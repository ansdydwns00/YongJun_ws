/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: main.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 29-Jun-2024 20:44:43
 */

/*************************************************************************/
/* This automatically generated example C main file shows how to call    */
/* entry-point functions that MATLAB Coder generated. You must customize */
/* this file for your application. Do not modify this file directly.     */
/* Instead, make a copy of this file, modify it, and integrate it into   */
/* your development environment.                                         */
/*                                                                       */
/* This file initializes entry-point function arguments to a default     */
/* size and value before calling the entry-point functions. It does      */
/* not store or use any values returned from the entry-point functions.  */
/* If necessary, it does pre-allocate memory for returned values.        */
/* You can use this file as a starting point for a main function that    */
/* you can deploy in your application.                                   */
/*                                                                       */
/* After you copy the file, and before you deploy it, you must make the  */
/* following changes:                                                    */
/* * For variable-size function arguments, change the example sizes to   */
/* the sizes that your application requires.                             */
/* * Change the example values of function arguments to the values that  */
/* your application requires.                                            */
/* * If the entry-point functions return values, store these values or   */
/* otherwise use them as required by your application.                   */
/*                                                                       */
/*************************************************************************/

/* Include Files */
#include "main.h"
#include "Avia_parsing_single.h"
#include "Avia_parsing_single_emxAPI.h"
#include "Avia_parsing_single_terminate.h"
#include "Avia_parsing_single_types.h"
#include "rt_nonfinite.h"

/* Function Declarations */
static void argInit_1362x1_real32_T(float result[1362]);

static float argInit_real32_T(void);

/* Function Definitions */
/*
 * Arguments    : float result[1362]
 * Return Type  : void
 */
static void argInit_1362x1_real32_T(float result[1362])
{
  int idx0;
  /* Loop over the array to initialize each element. */
  for (idx0 = 0; idx0 < 1362; idx0++) {
    /* Set the value of the array element.
Change this value to the value that the application requires. */
    result[idx0] = argInit_real32_T();
  }
}

/*
 * Arguments    : void
 * Return Type  : float
 */
static float argInit_real32_T(void)
{
  return 0.0F;
}

/*
 * Arguments    : int argc
 *                char **argv
 * Return Type  : int
 */
int main(int argc, char **argv)
{
  (void)argc;
  (void)argv;
  /* The initialize function is being called automatically from your entry-point
   * function. So, a call to initialize is not included here. */
  /* Invoke the entry-point functions.
You can call entry-point functions multiple times. */
  main_Avia_parsing_single();
  /* Terminate the application.
You do not need to do this more than one time. */
  Avia_parsing_single_terminate();
  return 0;
}

/*
 * Arguments    : void
 * Return Type  : void
 */
void main_Avia_parsing_single(void)
{
  emxArray_real32_T *xyzCoords;
  emxArray_real32_T *xyzIntensity;
  float fv[1362];
  bool isValid;
  /* Initialize function 'Avia_parsing_single' input arguments. */
  /* Initialize function input argument 'packet'. */
  /* Call the entry-point 'Avia_parsing_single'. */
  emxInitArray_real32_T(&xyzCoords, 2);
  emxInitArray_real32_T(&xyzIntensity, 2);
  argInit_1362x1_real32_T(fv);
  Avia_parsing_single(fv, argInit_real32_T(), xyzCoords, xyzIntensity,
                      &isValid);
  emxDestroyArray_real32_T(xyzCoords);
  emxDestroyArray_real32_T(xyzIntensity);
}

/*
 * File trailer for main.c
 *
 * [EOF]
 */
