//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// pointpillardetect_data.cu
//
// Code generation for function 'pointpillardetect_data'
//

// Include files
#include "pointpillardetect_data.h"
#include "rt_nonfinite.h"

// Variable Definitions
emlrtCTX emlrtRootTLSGlobal{nullptr};

emlrtContext emlrtContextGlobal{
    true,                                                // bFirstTime
    false,                                               // bInitialized
    131643U,                                             // fVersionInfo
    nullptr,                                             // fErrorFunction
    "pointpillardetect",                                 // fFunctionName
    nullptr,                                             // fRTCallStack
    false,                                               // bDebugMode
    {3443680596U, 3000263301U, 219871498U, 2289390528U}, // fSigWrd
    nullptr                                              // fSigMem
};

real_T (*global_gpu_dv3)[248];

real_T (*global_gpu_xq)[216];

real_T (*b_global_gpu_xq)[248];

real_T (*c_global_gpu_xq)[216];

real_T (*d_global_gpu_xq)[248];

// End of code generation (pointpillardetect_data.cu)
