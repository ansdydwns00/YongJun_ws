/////////////////////////////////////////////////////////////////////
// This file contains the header for built-in createPillars function.
// Copyright 2021 The MathWorks, Inc.
////////////////////////////////////////////////////////////////////

#ifndef CREATEPILLARS_HPP
#define CREATEPILLARS_HPP

#include "lidar_defines.h"
#include <vector>

#ifdef COMPILE_FOR_LIDAR_BUILTINS
    #include "mex.h"
    #include "fl/except/MsgIDException.hpp"
    #include "resources/lidar/lidarLib.hpp"
    #include "matrix/unique_mxarray_ptr.hpp"

template<typename T> void createPillarsImpl(T* outFeature, T* outIndices,const T* points,
            int numObservations, int maxPointsPerPillar, int maxPillars, 
            T xStep, T yStep,T xMin, T xMax,T yMin, T yMax, T zMin, T zMax);
                      
#endif

// Find pillars and indices for type double
EXTERN_C LIBMWLTRT_API void createPillarsImplDouble(double* outFeature, 
               double* outIndices,const double* points,
               int numObservations, int maxPointsPerPillar, int maxPillars, 
               double xStep, double yStep,double xMin, double xMax,double yMin, 
               double yMax, double zMin, double zMax);

// Find pillars and indices for type single
EXTERN_C LIBMWLTRT_API void createPillarsImplSingle(float* outFeature, 
               float* outIndices,const float* points,
               int numObservations, int maxPointsPerPillar, int maxPillars, 
               float xStep, float yStep,float xMin, float xMax,float yMin, 
               float yMax, float zMin, float zMax);


#endif