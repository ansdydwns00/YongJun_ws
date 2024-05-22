/////////////////////////////////////////////////////////////////////
// This file contains the core implementation for createPillars function.
// Copyright 2021-2022 The MathWorks, Inc.
/////////////////////////////////////////////////////////////////////

#include "createPillars.hpp"
#include <unordered_map>
#include <vector>
#include <cmath>

struct IntPairHash
{
    std::size_t operator()(const std::pair<uint32_T, uint32_T>& p) const
    {
        //Shift first integer over to make room for the second integer. The two are
        //then packed side by side.

        return (((uint64_T)p.first) << 32) | ((uint64_T)p.second);
    }
};

template <typename T>
void createPillarsImpl(T* outFeature, T* outIndices,const T* points,
            int numObservations, int maxPointsPerPillar, int maxPillars, 
            T xStep, T yStep,T xMin, T xMax,T yMin, T yMax, T zMin, T zMax)        
   
{ 
    int rows = numObservations;
    const int Xn = (int)std::floor((xMax - xMin) / xStep);
    const int Yn = (int)std::floor((yMax - yMin) / yStep);

    std::unordered_map<std::pair<uint32_T, uint32_T>, std::vector<int>, IntPairHash> map;

    for (int i = 0; i < rows; ++i) //pcbin
    {
        if ((points[i] >= xMin) && (points[i] <= xMax) && 
        (points[i+rows] >= yMin) && (points[i+rows]  <= yMax) &&
        (points[i+2*rows] >= zMin) && (points[i+2*rows]  <= zMax))
        {
            auto xIndex = static_cast<uint32_T>(std::floor((points[i] - xMin) / xStep));
            auto yIndex = static_cast<uint32_T>(std::floor((points[i + rows] - yMin) / yStep));
        
            map[{xIndex, yIndex}].emplace_back(i);
        }
    }
   
    int count = 0;

    for (auto &mapItr:map) 
    {
        if(count >= maxPillars){
            break;
        }
        outIndices[count] = (T)(mapItr.first).first + 1;
        outIndices[count+maxPillars] = (T)(mapItr.first).second + 1;

        T xMean = 0;
        T yMean = 0;
        T zMean = 0;
        
        std::vector<int>::iterator vectorItr;

        for (vectorItr = mapItr.second.begin(); vectorItr != mapItr.second.end(); ++vectorItr)
        {
            xMean += points[*vectorItr];
            yMean += points[*vectorItr + rows];
            zMean += points[*vectorItr + 2*rows];
        }
        
        xMean /= maxPointsPerPillar;
        yMean /= maxPointsPerPillar;
        zMean /= maxPointsPerPillar;

        int j = 0; 
      
        for (vectorItr = mapItr.second.begin(); vectorItr != mapItr.second.end(); ++vectorItr, ++j)
        {
            if (j >= maxPointsPerPillar){
                break;
            }

            outFeature[count + maxPillars*j] = points[*vectorItr];
            outFeature[count + maxPillars*j + maxPillars*maxPointsPerPillar] = points[*vectorItr + rows];
            outFeature[count + maxPillars*j + 2*maxPillars*maxPointsPerPillar] = points[*vectorItr + 2*rows];
            outFeature[count + maxPillars*j + 3*maxPillars*maxPointsPerPillar] = points[*vectorItr + 3*rows];

            //Distance from Centroid
            outFeature[count + maxPillars*j + 4*maxPillars*maxPointsPerPillar] = points[*vectorItr] - xMean;
            outFeature[count + maxPillars*j + 5*maxPillars*maxPointsPerPillar] = points[*vectorItr + rows] - yMean;
            outFeature[count + maxPillars*j + 6*maxPillars*maxPointsPerPillar] = points[*vectorItr + 2*rows] - zMean;

            //Distance from pillar center
            outFeature[count + maxPillars*j + 7*maxPillars*maxPointsPerPillar] = points[*vectorItr] - (xMin + xStep * (mapItr.first).first + xStep / 2);
            outFeature[count + maxPillars*j + 8*maxPillars*maxPointsPerPillar] = points[*vectorItr + rows] - (yMin + yStep * (mapItr.first).second + yStep / 2);
        }

        ++count;
    }
}


void createPillarsImplDouble(double* outFeature, double* outIndices,const double* points,
            int numObservations, int maxPointsPerPillar, int maxPillars, 
            double xStep, double yStep,double xMin, double xMax,double yMin, double yMax, double zMin, double zMax)        
   
{ 
  return createPillarsImpl<double>(outFeature,outIndices, points,
            numObservations, maxPointsPerPillar,maxPillars, 
            xStep, yStep,xMin, xMax,yMin, yMax, zMin, zMax);
}


void createPillarsImplSingle(float* outFeature, float* outIndices,const float* points,
            int numObservations, int maxPointsPerPillar, int maxPillars, 
            float xStep, float yStep,float xMin, float xMax,float yMin, float yMax, float zMin, float zMax)        
   
{ 
    return createPillarsImpl<float>(outFeature,outIndices, points,
            numObservations, maxPointsPerPillar,maxPillars, 
            xStep, yStep,xMin, xMax,yMin, yMax, zMin, zMax);
}
