/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * preprocessing2_data.c
 *
 * Code generation for function 'preprocessing2_data'
 *
 */

/* Include files */
#include "preprocessing2_data.h"
#include "rt_nonfinite.h"

/* Variable Definitions */
emlrtCTX emlrtRootTLSGlobal = NULL;

emlrtContext emlrtContextGlobal = {
    true,                                               /* bFirstTime */
    false,                                              /* bInitialized */
    131643U,                                            /* fVersionInfo */
    NULL,                                               /* fErrorFunction */
    "preprocessing2",                                   /* fFunctionName */
    NULL,                                               /* fRTCallStack */
    false,                                              /* bDebugMode */
    {4011232378U, 74312624U, 1784358846U, 3578146184U}, /* fSigWrd */
    NULL                                                /* fSigMem */
};

emlrtRSInfo f_emlrtRSI = {
    33,                      /* lineNo */
    "pointCloud/pointCloud", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

emlrtRSInfo g_emlrtRSI = {
    34,                      /* lineNo */
    "pointCloud/pointCloud", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

emlrtRSInfo h_emlrtRSI = {
    43,                      /* lineNo */
    "pointCloud/pointCloud", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+codegen/+pc/pointCloud.m" /* pathName */
};

emlrtRSInfo l_emlrtRSI = {
    89,                              /* lineNo */
    "pointCloudBase/pointCloudBase", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

emlrtRSInfo p_emlrtRSI = {
    76,       /* lineNo */
    "repmat", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repmat.m" /* pathName
                                                                      */
};

emlrtRSInfo q_emlrtRSI = {
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

emlrtRSInfo cb_emlrtRSI = {
    39,                                                            /* lineNo */
    "find",                                                        /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/find.m" /* pathName
                                                                    */
};

emlrtRSInfo db_emlrtRSI = {
    144,                                                           /* lineNo */
    "eml_find",                                                    /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/find.m" /* pathName
                                                                    */
};

emlrtRSInfo eb_emlrtRSI = {
    402,                                                           /* lineNo */
    "find_first_indices",                                          /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/find.m" /* pathName
                                                                    */
};

emlrtRSInfo gb_emlrtRSI = {
    207,                         /* lineNo */
    "pointCloudBase/subsetImpl", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pathName */
};

emlrtRSInfo hb_emlrtRSI = {
    38,       /* lineNo */
    "repmat", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repmat.m" /* pathName
                                                                      */
};

emlrtRSInfo ib_emlrtRSI = {
    79,       /* lineNo */
    "repmat", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repmat.m" /* pathName
                                                                      */
};

emlrtRSInfo jb_emlrtRSI = {
    81,       /* lineNo */
    "repmat", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/repmat.m" /* pathName
                                                                      */
};

emlrtRSInfo hc_emlrtRSI =
    {
        93,                   /* lineNo */
        "validateattributes", /* fcnName */
        "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/lang/"
        "validateattributes.m" /* pathName */
};

emlrtRSInfo xc_emlrtRSI = {
    15,    /* lineNo */
    "sum", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/sum.m" /* pathName
                                                                     */
};

emlrtRSInfo yc_emlrtRSI =
    {
        99,        /* lineNo */
        "sumprod", /* fcnName */
        "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/private/"
        "sumprod.m" /* pathName */
};

emlrtRSInfo ad_emlrtRSI = {
    149,                     /* lineNo */
    "combineVectorElements", /* fcnName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/datafun/private/"
    "combineVectorElements.m" /* pathName */
};

emlrtRTEInfo emlrtRTEI = {
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

emlrtRTEInfo l_emlrtRTEI = {
    14,               /* lineNo */
    37,               /* colNo */
    "validatefinite", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/+valattr/"
    "validatefinite.m" /* pName */
};

emlrtRTEInfo n_emlrtRTEI = {
    13,                /* lineNo */
    37,                /* colNo */
    "validatenonzero", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/eml/+coder/+internal/+valattr/"
    "validatenonzero.m" /* pName */
};

emlrtRTEInfo ab_emlrtRTEI = {
    144,              /* lineNo */
    13,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

emlrtRTEInfo ib_emlrtRTEI = {
    369,                                                           /* lineNo */
    24,                                                            /* colNo */
    "find",                                                        /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/find.m" /* pName */
};

emlrtRTEInfo kb_emlrtRTEI = {
    1,           /* lineNo */
    1,           /* colNo */
    "getSubset", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/+pc/getSubset.p" /* pName */
};

emlrtRTEInfo mb_emlrtRTEI = {
    31,                                                            /* lineNo */
    6,                                                             /* colNo */
    "find",                                                        /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/eml/lib/matlab/elmat/find.m" /* pName */
};

emlrtRTEInfo fc_emlrtRTEI = {
    208,              /* lineNo */
    17,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

emlrtRTEInfo gc_emlrtRTEI = {
    208,              /* lineNo */
    32,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

emlrtRTEInfo hc_emlrtRTEI = {
    208,              /* lineNo */
    62,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

emlrtRTEInfo ic_emlrtRTEI = {
    209,              /* lineNo */
    17,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

emlrtRTEInfo jc_emlrtRTEI = {
    209,              /* lineNo */
    33,               /* colNo */
    "pointCloudBase", /* fName */
    "/usr/local/MATLAB/R2024a/toolbox/shared/pointclouds/+pointclouds/"
    "+internal/pointCloudBase.m" /* pName */
};

covrtInstance emlrtCoverageInstance;

/* End of code generation (preprocessing2_data.c) */
