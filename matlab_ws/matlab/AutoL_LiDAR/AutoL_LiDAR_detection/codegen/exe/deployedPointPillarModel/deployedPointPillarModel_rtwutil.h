//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: deployedPointPillarModel_rtwutil.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 04-Jun-2024 16:24:05
//

#ifndef DEPLOYEDPOINTPILLARMODEL_RTWUTIL_H
#define DEPLOYEDPOINTPILLARMODEL_RTWUTIL_H

// Include Files
#include "rtwtypes.h"
#include <cstddef>
#include <cstdlib>

// Function Declarations
extern long long computeEndIdx(long long start, long long end,
                               long long stride);

extern float rt_remf_snf(float u0, float u1);

#endif
//
// File trailer for deployedPointPillarModel_rtwutil.h
//
// [EOF]
//
