//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: _coder_deployedPointPillarModel_mex.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

#ifndef _CODER_DEPLOYEDPOINTPILLARMODEL_MEX_H
#define _CODER_DEPLOYEDPOINTPILLARMODEL_MEX_H

// Include Files
#include "emlrt.h"
#include "mex.h"
#include "tmwtypes.h"

// Function Declarations
MEXFUNCTION_LINKAGE void mexFunction(int32_T nlhs, mxArray *plhs[],
                                     int32_T nrhs, const mxArray *prhs[]);

emlrtCTX mexFunctionCreateRootTLS();

void unsafe_deployedPointPillarModel_mexFunction(int32_T nlhs, int32_T nrhs);

#endif
//
// File trailer for _coder_deployedPointPillarModel_mex.h
//
// [EOF]
//
