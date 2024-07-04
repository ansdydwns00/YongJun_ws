/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: main.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 26-Jun-2024 13:33:54
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
#include "preprocessing2.h"
#include "preprocessing2_emxAPI.h"
#include "preprocessing2_terminate.h"
#include "preprocessing2_types.h"
#include "rt_nonfinite.h"

/* Function Declarations */
static void argInit_1x3_real32_T(float result[3]);

static void argInit_1x6_real32_T(float result[6]);

static void argInit_57600x1_real32_T(float result[57600]);

static void argInit_57600x3_real32_T(float result[172800]);

static float argInit_real32_T(void);

/* Function Definitions */
/*
 * Arguments    : float result[3]
 * Return Type  : void
 */
static void argInit_1x3_real32_T(float result[3])
{
  int idx1;
  /* Loop over the array to initialize each element. */
  for (idx1 = 0; idx1 < 3; idx1++) {
    /* Set the value of the array element.
Change this value to the value that the application requires. */
    result[idx1] = argInit_real32_T();
  }
}

/*
 * Arguments    : float result[6]
 * Return Type  : void
 */
static void argInit_1x6_real32_T(float result[6])
{
  int idx1;
  /* Loop over the array to initialize each element. */
  for (idx1 = 0; idx1 < 6; idx1++) {
    /* Set the value of the array element.
Change this value to the value that the application requires. */
    result[idx1] = argInit_real32_T();
  }
}

/*
 * Arguments    : float result[57600]
 * Return Type  : void
 */
static void argInit_57600x1_real32_T(float result[57600])
{
  int idx0;
  /* Loop over the array to initialize each element. */
  for (idx0 = 0; idx0 < 57600; idx0++) {
    /* Set the value of the array element.
Change this value to the value that the application requires. */
    result[idx0] = argInit_real32_T();
  }
}

/*
 * Arguments    : float result[172800]
 * Return Type  : void
 */
static void argInit_57600x3_real32_T(float result[172800])
{
  int i;
  /* Loop over the array to initialize each element. */
  for (i = 0; i < 172800; i++) {
    /* Set the value of the array element.
Change this value to the value that the application requires. */
    result[i] = argInit_real32_T();
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
  main_preprocessing2();
  /* Terminate the application.
You do not need to do this more than one time. */
  preprocessing2_terminate();
  return 0;
}

/*
 * Arguments    : void
 * Return Type  : void
 */
void main_preprocessing2(void)
{
  static float fv[172800];
  static float fv1[57600];
  emxArray_real32_T *Intensity;
  emxArray_real32_T *Points;
  float fv2[6];
  float fv3[3];
  float GroundMaxDistance_tmp;
  /* Initialize function 'preprocessing2' input arguments. */
  /* Initialize function input argument 'points'. */
  /* Initialize function input argument 'intensity'. */
  /* Initialize function input argument 'ROI'. */
  GroundMaxDistance_tmp = argInit_real32_T();
  /* Initialize function input argument 'GroundReferenceVector'. */
  /* Call the entry-point 'preprocessing2'. */
  emxInitArray_real32_T(&Points, 2);
  emxInitArray_real32_T(&Intensity, 1);
  argInit_57600x3_real32_T(fv);
  argInit_57600x1_real32_T(fv1);
  argInit_1x6_real32_T(fv2);
  argInit_1x3_real32_T(fv3);
  preprocessing2(fv, fv1, fv2, GroundMaxDistance_tmp, fv3,
                 GroundMaxDistance_tmp, Points, Intensity);
  emxDestroyArray_real32_T(Points);
  emxDestroyArray_real32_T(Intensity);
}

/*
 * File trailer for main.c
 *
 * [EOF]
 */
