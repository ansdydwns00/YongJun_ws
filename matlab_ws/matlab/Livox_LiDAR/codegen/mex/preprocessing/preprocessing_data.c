/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * preprocessing_data.c
 *
 * Code generation for function 'preprocessing_data'
 *
 */

/* Include files */
#include "preprocessing_data.h"
#include "rt_nonfinite.h"

/* Variable Definitions */
emlrtCTX emlrtRootTLSGlobal = NULL;

emlrtContext emlrtContextGlobal = {
    true,                                               /* bFirstTime */
    false,                                              /* bInitialized */
    131643U,                                            /* fVersionInfo */
    NULL,                                               /* fErrorFunction */
    "preprocessing",                                    /* fFunctionName */
    NULL,                                               /* fRTCallStack */
    false,                                              /* bDebugMode */
    {4011232378U, 74312624U, 1784358846U, 3578146184U}, /* fSigWrd */
    NULL                                                /* fSigMem */
};

emlrtRSInfo q_emlrtRSI = {
    76,       /* lineNo */
    "repmat", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repmat.m" /* pathName
                                                                      */
};

emlrtRSInfo r_emlrtRSI = {
    20,                               /* lineNo */
    "eml_int_forloop_overflow_check", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/eml/"
    "eml_int_forloop_overflow_check.m" /* pathName */
};

emlrtRSInfo bb_emlrtRSI = {
    509,                                /* lineNo */
    "pointCloudBase/arrayNotSupported", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

emlrtRSInfo eb_emlrtRSI =
    {
        93,                   /* lineNo */
        "validateattributes", /* fcnName */
        "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/lang/"
        "validateattributes.m" /* pathName */
};

emlrtRSInfo gb_emlrtRSI = {
    39,                                                            /* lineNo */
    "find",                                                        /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/find.m" /* pathName
                                                                    */
};

emlrtRSInfo hb_emlrtRSI = {
    144,                                                           /* lineNo */
    "eml_find",                                                    /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/find.m" /* pathName
                                                                    */
};

emlrtRSInfo ib_emlrtRSI = {
    402,                                                           /* lineNo */
    "find_first_indices",                                          /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/find.m" /* pathName
                                                                    */
};

emlrtRSInfo kb_emlrtRSI = {
    230,                 /* lineNo */
    "pointCloud/select", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

emlrtRSInfo lb_emlrtRSI = {
    228,                 /* lineNo */
    "pointCloud/select", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

emlrtRSInfo mb_emlrtRSI = {
    220,                 /* lineNo */
    "pointCloud/select", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

emlrtRSInfo nb_emlrtRSI = {
    166,                 /* lineNo */
    "pointCloud/select", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

emlrtRSInfo ob_emlrtRSI = {
    154,                 /* lineNo */
    "pointCloud/select", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

emlrtRSInfo yb_emlrtRSI = {
    207,                         /* lineNo */
    "pointCloudBase/subsetImpl", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

emlrtRSInfo ac_emlrtRSI = {
    38,       /* lineNo */
    "repmat", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repmat.m" /* pathName
                                                                      */
};

emlrtRSInfo bc_emlrtRSI = {
    79,       /* lineNo */
    "repmat", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repmat.m" /* pathName
                                                                      */
};

emlrtRSInfo cc_emlrtRSI = {
    81,       /* lineNo */
    "repmat", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repmat.m" /* pathName
                                                                      */
};

emlrtRSInfo od_emlrtRSI = {
    15,    /* lineNo */
    "sum", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/sum.m" /* pathName
                                                                     */
};

emlrtRSInfo pd_emlrtRSI =
    {
        99,        /* lineNo */
        "sumprod", /* fcnName */
        "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/private/"
        "sumprod.m" /* pathName */
};

emlrtRSInfo qd_emlrtRSI = {
    149,                     /* lineNo */
    "combineVectorElements", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/private/"
    "combineVectorElements.m" /* pathName */
};

emlrtRTEInfo emlrtRTEI = {
    166,                 /* lineNo */
    21,                  /* colNo */
    "pointCloud/select", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pName */
};

emlrtRTEInfo b_emlrtRTEI = {
    510,                                /* lineNo */
    17,                                 /* colNo */
    "pointCloudBase/arrayNotSupported", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

emlrtBCInfo emlrtBCI = {
    -1,          /* iFirst */
    -1,          /* iLast */
    1,           /* lineNo */
    1,           /* colNo */
    "",          /* aName */
    "getSubset", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+pc/getSubset.p", /* pName */
    0                            /* checkKind */
};

emlrtRTEInfo e_emlrtRTEI = {
    14,               /* lineNo */
    37,               /* colNo */
    "validatenonnan", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/+valattr/"
    "validatenonnan.m" /* pName */
};

emlrtRTEInfo o_emlrtRTEI = {
    14,               /* lineNo */
    37,               /* colNo */
    "validatefinite", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/+valattr/"
    "validatefinite.m" /* pName */
};

emlrtRTEInfo q_emlrtRTEI = {
    13,                /* lineNo */
    37,                /* colNo */
    "validatenonzero", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/+valattr/"
    "validatenonzero.m" /* pName */
};

emlrtRTEInfo cb_emlrtRTEI = {
    208,              /* lineNo */
    62,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

emlrtRTEInfo db_emlrtRTEI = {
    1,           /* lineNo */
    1,           /* colNo */
    "getSubset", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+pc/getSubset.p" /* pName */
};

emlrtRTEInfo mb_emlrtRTEI = {
    369,                                                           /* lineNo */
    24,                                                            /* colNo */
    "find",                                                        /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/find.m" /* pName */
};

emlrtRTEInfo pb_emlrtRTEI = {
    31,                                                            /* lineNo */
    6,                                                             /* colNo */
    "find",                                                        /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/find.m" /* pName */
};

covrtInstance emlrtCoverageInstance;

/* End of code generation (preprocessing_data.c) */
