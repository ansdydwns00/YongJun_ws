/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * sumMatrixIncludeNaN.c
 *
 * Code generation for function 'sumMatrixIncludeNaN'
 *
 */

/* Include files */
#include "sumMatrixIncludeNaN.h"
#include "eml_int_forloop_overflow_check.h"
#include "preprocessing_data.h"
#include "preprocessing_types.h"
#include "rt_nonfinite.h"

/* Variable Definitions */
static emlrtRSInfo ef_emlrtRSI = {
    178,          /* lineNo */
    "sumColumnB", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/private/"
    "sumMatrixIncludeNaN.m" /* pathName */
};

static emlrtRSInfo ff_emlrtRSI = {
    183,          /* lineNo */
    "sumColumnB", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/private/"
    "sumMatrixIncludeNaN.m" /* pathName */
};

static emlrtRSInfo gf_emlrtRSI = {
    189,          /* lineNo */
    "sumColumnB", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/private/"
    "sumMatrixIncludeNaN.m" /* pathName */
};

static emlrtRSInfo hf_emlrtRSI = {
    210,         /* lineNo */
    "sumColumn", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/private/"
    "sumMatrixIncludeNaN.m" /* pathName */
};

/* Function Definitions */
real32_T b_sumColumnB(const emlrtStack *sp, const emxArray_real32_T *x,
                      int32_T vlen, int32_T vstart)
{
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack st;
  int32_T b_k;
  int32_T k;
  const real32_T *x_data;
  real32_T y;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  x_data = x->data;
  if (vlen <= 1024) {
    st.site = &ef_emlrtRSI;
    y = x_data[vstart - 1];
    b_st.site = &hf_emlrtRSI;
    if (vlen - 1 > 2147483646) {
      c_st.site = &r_emlrtRSI;
      check_forloop_overflow_error(&c_st);
    }
    for (k = 0; k <= vlen - 2; k++) {
      y += x_data[vstart + k];
    }
  } else {
    int32_T b_vstart;
    int32_T inb;
    int32_T nfb;
    real32_T b_y;
    nfb = vlen / 1024;
    inb = nfb << 10;
    y = x_data[vstart - 1];
    for (k = 0; k < 1023; k++) {
      y += x_data[vstart + k];
    }
    st.site = &ff_emlrtRSI;
    for (k = 2; k <= nfb; k++) {
      b_vstart = vstart + ((k - 1) << 10);
      b_y = x_data[b_vstart - 1];
      for (b_k = 0; b_k < 1023; b_k++) {
        b_y += x_data[b_vstart + b_k];
      }
      y += b_y;
    }
    if (vlen > inb) {
      b_vstart = vstart + inb;
      st.site = &gf_emlrtRSI;
      b_y = x_data[b_vstart - 1];
      nfb = vlen - inb;
      b_st.site = &hf_emlrtRSI;
      for (k = 0; k <= nfb - 2; k++) {
        b_y += x_data[b_vstart + k];
      }
      y += b_y;
    }
  }
  return y;
}

real32_T c_sumColumnB(const real32_T x[3])
{
  return (x[0] + x[1]) + x[2];
}

real32_T sumColumnB(const emlrtStack *sp, const emxArray_real32_T *x,
                    int32_T vlen)
{
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack st;
  int32_T b_k;
  int32_T k;
  const real32_T *x_data;
  real32_T y;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  x_data = x->data;
  if (vlen <= 1024) {
    int32_T nfb;
    st.site = &ef_emlrtRSI;
    y = x_data[0];
    b_st.site = &hf_emlrtRSI;
    if (vlen - 1 > 2147483646) {
      c_st.site = &r_emlrtRSI;
      check_forloop_overflow_error(&c_st);
    }
    nfb = (uint16_T)(vlen - 1);
    for (k = 0; k < nfb; k++) {
      y += x_data[k + 1];
    }
  } else {
    int32_T inb;
    int32_T nfb;
    real32_T b_y;
    nfb = vlen / 1024;
    inb = nfb << 10;
    y = x_data[0];
    for (k = 0; k < 1023; k++) {
      y += x_data[k + 1];
    }
    st.site = &ff_emlrtRSI;
    for (k = 2; k <= nfb; k++) {
      int32_T vstart;
      vstart = (k - 1) << 10;
      b_y = x_data[vstart];
      for (b_k = 0; b_k < 1023; b_k++) {
        b_y += x_data[(vstart + b_k) + 1];
      }
      y += b_y;
    }
    if (vlen > inb) {
      st.site = &gf_emlrtRSI;
      b_y = x_data[inb];
      nfb = vlen - inb;
      b_st.site = &hf_emlrtRSI;
      for (k = 0; k <= nfb - 2; k++) {
        b_y += x_data[(inb + k) + 1];
      }
      y += b_y;
    }
  }
  return y;
}

real32_T sumColumnB4(const emxArray_real32_T *x, int32_T vstart)
{
  int32_T k;
  const real32_T *x_data;
  real32_T psum1;
  real32_T psum2;
  real32_T psum3;
  real32_T psum4;
  x_data = x->data;
  psum1 = x_data[vstart - 1];
  psum2 = x_data[vstart + 1023];
  psum3 = x_data[vstart + 2047];
  psum4 = x_data[vstart + 3071];
  for (k = 0; k < 1023; k++) {
    int32_T psum1_tmp;
    psum1_tmp = vstart + k;
    psum1 += x_data[psum1_tmp];
    psum2 += x_data[psum1_tmp + 1024];
    psum3 += x_data[psum1_tmp + 2048];
    psum4 += x_data[psum1_tmp + 3072];
  }
  return (psum1 + psum2) + (psum3 + psum4);
}

/* End of code generation (sumMatrixIncludeNaN.c) */
