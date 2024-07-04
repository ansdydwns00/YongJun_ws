/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * randperm.c
 *
 * Code generation for function 'randperm'
 *
 */

/* Include files */
#include "randperm.h"
#include "preprocessing2_data.h"
#include "rt_nonfinite.h"
#include "mwmathutil.h"

/* Variable Definitions */
static emlrtRTEInfo x_emlrtRTEI = {
    12,         /* lineNo */
    15,         /* colNo */
    "randperm", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/randfun/randperm.m" /* pName
                                                                          */
};

static emlrtRTEInfo y_emlrtRTEI = {
    23,         /* lineNo */
    19,         /* colNo */
    "randperm", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/randfun/randperm.m" /* pName
                                                                          */
};

/* Function Definitions */
void randperm(const emlrtStack *sp, real_T n, real_T p_data[],
              int32_T p_size[2])
{
  real_T pt;
  real_T selectedLoc;
  int32_T m;
  if (!(n == muDoubleScalarFloor(n))) {
    emlrtErrorWithMessageIdR2018a(sp, &x_emlrtRTEI, "MATLAB:randperm:inputType",
                                  "MATLAB:randperm:inputType", 0);
  }
  if (!(n >= 3.0)) {
    emlrtErrorWithMessageIdR2018a(sp, &y_emlrtRTEI,
                                  "MATLAB:randperm:inputKTooLarge",
                                  "MATLAB:randperm:inputKTooLarge", 0);
  }
  p_size[0] = 1;
  p_size[1] = 3;
  p_data[1] = 0.0;
  p_data[2] = 0.0;
  if (n <= 3.0) {
    real_T j;
    p_data[0] = 1.0;
    emlrtRandu(&pt, 1);
    j = muDoubleScalarFloor(pt * 2.0);
    p_data[1] = p_data[(int32_T)(j + 1.0) - 1];
    p_data[(int32_T)(j + 1.0) - 1] = 2.0;
    emlrtRandu(&pt, 1);
    j = muDoubleScalarFloor(pt * 3.0);
    p_data[2] = p_data[(int32_T)(j + 1.0) - 1];
    p_data[(int32_T)(j + 1.0) - 1] = 3.0;
  } else if (n / 4.0 <= 3.0) {
    real_T j;
    real_T newEntry;
    real_T nleftm1;
    nleftm1 = 0.0;
    newEntry = n;
    pt = 3.0 / n;
    emlrtRandu(&selectedLoc, 1);
    while (selectedLoc > pt) {
      nleftm1++;
      newEntry--;
      pt += (1.0 - pt) * (3.0 / newEntry);
    }
    nleftm1++;
    emlrtRandu(&pt, 1);
    p_data[0] = 0.0;
    p_data[(int32_T)(muDoubleScalarFloor(pt) + 1.0) - 1] = nleftm1;
    newEntry = n - nleftm1;
    pt = 2.0 / newEntry;
    emlrtRandu(&selectedLoc, 1);
    while (selectedLoc > pt) {
      nleftm1++;
      newEntry--;
      pt += (1.0 - pt) * (2.0 / newEntry);
    }
    nleftm1++;
    emlrtRandu(&pt, 1);
    j = muDoubleScalarFloor(pt * 2.0);
    p_data[1] = p_data[(int32_T)(j + 1.0) - 1];
    p_data[(int32_T)(j + 1.0) - 1] = nleftm1;
    newEntry = n - nleftm1;
    pt = 1.0 / newEntry;
    emlrtRandu(&selectedLoc, 1);
    while (selectedLoc > pt) {
      nleftm1++;
      newEntry--;
      pt += (1.0 - pt) * (1.0 / newEntry);
    }
    nleftm1++;
    emlrtRandu(&pt, 1);
    j = muDoubleScalarFloor(pt * 3.0);
    p_data[2] = p_data[(int32_T)(j + 1.0) - 1];
    p_data[(int32_T)(j + 1.0) - 1] = nleftm1;
  } else {
    real_T hashTbl_data[3];
    real_T link_data[3];
    real_T loc_data[3];
    real_T val_data[3];
    real_T newEntry;
    hashTbl_data[0] = 0.0;
    link_data[0] = 0.0;
    val_data[0] = 0.0;
    loc_data[0] = 0.0;
    hashTbl_data[1] = 0.0;
    link_data[1] = 0.0;
    val_data[1] = 0.0;
    loc_data[1] = 0.0;
    hashTbl_data[2] = 0.0;
    link_data[2] = 0.0;
    val_data[2] = 0.0;
    loc_data[2] = 0.0;
    newEntry = 1.0;
    p_size[0] = 1;
    p_size[1] = 3;
    for (m = 0; m < 3; m++) {
      real_T j;
      real_T nleftm1;
      nleftm1 = n - ((real_T)m + 1.0);
      emlrtRandu(&pt, 1);
      selectedLoc = muDoubleScalarFloor(pt * (nleftm1 + 1.0));
      if (muDoubleScalarIsNaN(selectedLoc) ||
          muDoubleScalarIsInf(selectedLoc)) {
        pt = rtNaN;
      } else if (selectedLoc == 0.0) {
        pt = 0.0;
      } else {
        pt = muDoubleScalarRem(selectedLoc, 3.0);
        if (pt == 0.0) {
          pt = 0.0;
        } else if (selectedLoc < 0.0) {
          pt += 3.0;
        }
      }
      j = hashTbl_data[(int32_T)(pt + 1.0) - 1];
      while ((j > 0.0) && (loc_data[(int32_T)j - 1] != selectedLoc)) {
        j = link_data[(int32_T)j - 1];
      }
      if (j > 0.0) {
        p_data[m] = val_data[(int32_T)j - 1] + 1.0;
      } else {
        p_data[m] = selectedLoc + 1.0;
        j = newEntry;
        newEntry++;
        loc_data[(int32_T)j - 1] = selectedLoc;
        link_data[(int32_T)j - 1] = hashTbl_data[(int32_T)(pt + 1.0) - 1];
        hashTbl_data[(int32_T)(pt + 1.0) - 1] = j;
      }
      if (m + 1 < 3) {
        if (muDoubleScalarIsInf(nleftm1)) {
          pt = rtNaN;
        } else {
          pt = muDoubleScalarRem(nleftm1, 3.0);
        }
        selectedLoc = hashTbl_data[(int32_T)(pt + 1.0) - 1];
        while ((selectedLoc > 0.0) &&
               (loc_data[(int32_T)selectedLoc - 1] != nleftm1)) {
          selectedLoc = link_data[(int32_T)selectedLoc - 1];
        }
        if (selectedLoc > 0.0) {
          val_data[(int32_T)j - 1] = val_data[(int32_T)selectedLoc - 1];
        } else {
          val_data[(int32_T)j - 1] = nleftm1;
        }
      }
    }
  }
}

/* End of code generation (randperm.c) */
