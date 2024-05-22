//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: deployedPointPillarModel_data.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 22-May-2024 17:11:54
//

#ifndef DEPLOYEDPOINTPILLARMODEL_DATA_H
#define DEPLOYEDPOINTPILLARMODEL_DATA_H

// Include Files
#include "rtwtypes.h"
#include <cstddef>
#include <cstdlib>

// Variable Declarations
extern unsigned char pauseState;
extern const bool bv[128];
extern double (*global_gpu_dv)[248];
extern double (*global_gpu_xq)[216];
extern double (*b_global_gpu_dv)[248];
extern double (*b_global_gpu_xq)[216];
extern bool isInitialized_deployedPointPillarModel;

#endif
//
// File trailer for deployedPointPillarModel_data.h
//
// [EOF]
//
