/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: msac.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 26-Jun-2024 13:33:54
 */

/* Include Files */
#include "msac.h"
#include "pcfitplane.h"
#include "preprocessing2_emxutil.h"
#include "preprocessing2_types.h"
#include "rand.h"
#include "rt_nonfinite.h"
#include "rt_nonfinite.h"
#include <math.h>
#include <string.h>

/* Function Declarations */
static float rt_powf_snf(float u0, float u1);

/* Function Definitions */
/*
 * Arguments    : float u0
 *                float u1
 * Return Type  : float
 */
static float rt_powf_snf(float u0, float u1)
{
  float y;
  if (rtIsNaNF(u0) || rtIsNaNF(u1)) {
    y = rtNaNF;
  } else {
    float f;
    float f1;
    f = fabsf(u0);
    f1 = fabsf(u1);
    if (rtIsInfF(u1)) {
      if (f == 1.0F) {
        y = 1.0F;
      } else if (f > 1.0F) {
        if (u1 > 0.0F) {
          y = rtInfF;
        } else {
          y = 0.0F;
        }
      } else if (u1 > 0.0F) {
        y = 0.0F;
      } else {
        y = rtInfF;
      }
    } else if (f1 == 0.0F) {
      y = 1.0F;
    } else if (f1 == 1.0F) {
      if (u1 > 0.0F) {
        y = u0;
      } else {
        y = 1.0F / u0;
      }
    } else if (u1 == 2.0F) {
      y = u0 * u0;
    } else if ((u1 == 0.5F) && (u0 >= 0.0F)) {
      y = sqrtf(u0);
    } else if ((u0 < 0.0F) && (u1 > floorf(u1))) {
      y = rtNaNF;
    } else {
      y = powf(u0, u1);
    }
  }
  return y;
}

/*
 * Arguments    : const emxArray_real32_T *allPoints
 *                float params_maxDistance
 *                const double varargin_1_data[]
 *                double varargin_2
 *                float bestModelParams_data[]
 *                int bestModelParams_size[2]
 * Return Type  : boolean_T
 */
boolean_T msac(const emxArray_real32_T *allPoints, float params_maxDistance,
               const double varargin_1_data[], double varargin_2,
               float bestModelParams_data[], int bestModelParams_size[2])
{
  emxArray_boolean_T *bestInliers;
  emxArray_real32_T *dis;
  float modelParams_data[4];
  const float *allPoints_data;
  float angle;
  float bestDis;
  float *dis_data;
  int ib;
  int idxTrial;
  int k;
  int loop_ub;
  int nleftm1;
  int numPts_tmp;
  int numTrials;
  int nz;
  int skipTrials;
  boolean_T x_data[4];
  boolean_T exitg1;
  boolean_T isFound;
  boolean_T isValidModel;
  boolean_T *bestInliers_data;
  allPoints_data = allPoints->data;
  numPts_tmp = allPoints->size[0];
  idxTrial = 1;
  numTrials = 1000;
  bestDis = params_maxDistance * (float)allPoints->size[0];
  bestModelParams_size[0] = 0;
  bestModelParams_size[1] = 0;
  skipTrials = 0;
  emxInit_boolean_T(&bestInliers, 1);
  nz = bestInliers->size[0];
  bestInliers->size[0] = allPoints->size[0];
  emxEnsureCapacity_boolean_T(bestInliers, nz);
  bestInliers_data = bestInliers->data;
  for (nz = 0; nz < numPts_tmp; nz++) {
    bestInliers_data[nz] = false;
  }
  emxInit_real32_T(&dis, 1);
  while ((idxTrial <= numTrials) && (skipTrials < 10000)) {
    double indices_data[3];
    double newEntry;
    double selectedLoc;
    double u;
    float samplePoints_data[9];
    float a[3];
    float b[3];
    float bsum;
    float normal_idx_0;
    float normal_idx_1;
    float normal_idx_2;
    float samplePoints;
    int modelParams_size_idx_0;
    int modelParams_size_idx_1;
    indices_data[1] = 0.0;
    indices_data[2] = 0.0;
    if (numPts_tmp <= 3) {
      double j;
      indices_data[0] = 1.0;
      j = b_rand() * 2.0;
      j = floor(j);
      indices_data[1] = indices_data[(int)(j + 1.0) - 1];
      indices_data[(int)(j + 1.0) - 1] = 2.0;
      j = b_rand() * 3.0;
      j = floor(j);
      indices_data[2] = indices_data[(int)(j + 1.0) - 1];
      indices_data[(int)(j + 1.0) - 1] = 3.0;
    } else if ((double)numPts_tmp / 4.0 <= 3.0) {
      double j;
      double t;
      t = 0.0;
      newEntry = numPts_tmp;
      selectedLoc = 3.0 / (double)numPts_tmp;
      u = b_rand();
      while (u > selectedLoc) {
        t++;
        newEntry--;
        selectedLoc += (1.0 - selectedLoc) * (3.0 / newEntry);
      }
      t++;
      j = b_rand();
      j = floor(j);
      indices_data[0] = 0.0;
      indices_data[(int)(j + 1.0) - 1] = t;
      newEntry = (double)numPts_tmp - t;
      selectedLoc = 2.0 / newEntry;
      u = b_rand();
      while (u > selectedLoc) {
        t++;
        newEntry--;
        selectedLoc += (1.0 - selectedLoc) * (2.0 / newEntry);
      }
      t++;
      j = b_rand() * 2.0;
      j = floor(j);
      indices_data[1] = indices_data[(int)(j + 1.0) - 1];
      indices_data[(int)(j + 1.0) - 1] = t;
      newEntry = (double)numPts_tmp - t;
      selectedLoc = 1.0 / newEntry;
      u = b_rand();
      while (u > selectedLoc) {
        t++;
        newEntry--;
        selectedLoc += (1.0 - selectedLoc) * (1.0 / newEntry);
      }
      t++;
      j = b_rand() * 3.0;
      j = floor(j);
      indices_data[2] = indices_data[(int)(j + 1.0) - 1];
      indices_data[(int)(j + 1.0) - 1] = t;
    } else {
      double hashTbl_data[3];
      double link_data[3];
      double loc_data[3];
      int val_data[3];
      hashTbl_data[0] = 0.0;
      link_data[0] = 0.0;
      val_data[0] = 0;
      loc_data[0] = 0.0;
      hashTbl_data[1] = 0.0;
      link_data[1] = 0.0;
      val_data[1] = 0;
      loc_data[1] = 0.0;
      hashTbl_data[2] = 0.0;
      link_data[2] = 0.0;
      val_data[2] = 0;
      loc_data[2] = 0.0;
      newEntry = 1.0;
      for (nz = 0; nz < 3; nz++) {
        double j;
        nleftm1 = (numPts_tmp - nz) - 1;
        selectedLoc = b_rand() * ((double)nleftm1 + 1.0);
        selectedLoc = floor(selectedLoc);
        if (selectedLoc == 0.0) {
          u = 0.0;
        } else {
          u = fmod(selectedLoc, 3.0);
          if (u == 0.0) {
            u = 0.0;
          }
        }
        j = hashTbl_data[(int)(u + 1.0) - 1];
        while ((j > 0.0) && (loc_data[(int)j - 1] != selectedLoc)) {
          j = link_data[(int)j - 1];
        }
        if (j > 0.0) {
          indices_data[nz] = (double)val_data[(int)j - 1] + 1.0;
        } else {
          indices_data[nz] = selectedLoc + 1.0;
          j = newEntry;
          newEntry++;
          loc_data[(int)j - 1] = selectedLoc;
          link_data[(int)j - 1] = hashTbl_data[(int)(u + 1.0) - 1];
          hashTbl_data[(int)(u + 1.0) - 1] = j;
        }
        if (nz + 1 < 3) {
          selectedLoc = hashTbl_data[(int)fmod(nleftm1, 3.0)];
          while ((selectedLoc > 0.0) &&
                 (loc_data[(int)selectedLoc - 1] != nleftm1)) {
            selectedLoc = link_data[(int)selectedLoc - 1];
          }
          if (selectedLoc > 0.0) {
            val_data[(int)j - 1] = val_data[(int)selectedLoc - 1];
          } else {
            val_data[(int)j - 1] = nleftm1;
          }
        }
      }
    }
    selectedLoc = indices_data[0];
    u = indices_data[1];
    newEntry = indices_data[2];
    for (nz = 0; nz < 3; nz++) {
      angle = allPoints_data[((int)selectedLoc + allPoints->size[0] * nz) - 1];
      samplePoints_data[3 * nz] = angle;
      bsum = allPoints_data[((int)u + allPoints->size[0] * nz) - 1];
      samplePoints_data[3 * nz + 1] = bsum;
      samplePoints =
          allPoints_data[((int)newEntry + allPoints->size[0] * nz) - 1];
      samplePoints_data[3 * nz + 2] = samplePoints;
      a[nz] = bsum - angle;
      b[nz] = samplePoints - angle;
    }
    normal_idx_0 = a[1] * b[2] - b[1] * a[2];
    normal_idx_1 = b[0] * a[2] - a[0] * b[2];
    normal_idx_2 = a[0] * b[1] - b[0] * a[1];
    angle = (normal_idx_0 * normal_idx_0 + normal_idx_1 * normal_idx_1) +
            normal_idx_2 * normal_idx_2;
    if (angle < 1.1920929E-7F) {
      modelParams_size_idx_0 = 0;
      modelParams_size_idx_1 = 0;
    } else {
      angle = sqrtf(angle);
      bsum = normal_idx_0 / angle;
      samplePoints = -samplePoints_data[0] * bsum;
      normal_idx_0 = bsum;
      bsum = normal_idx_1 / angle;
      samplePoints += -samplePoints_data[3] * bsum;
      normal_idx_1 = bsum;
      bsum = normal_idx_2 / angle;
      samplePoints += -samplePoints_data[6] * bsum;
      modelParams_size_idx_0 = 1;
      modelParams_size_idx_1 = 4;
      modelParams_data[0] = normal_idx_0;
      modelParams_data[1] = normal_idx_1;
      modelParams_data[2] = bsum;
      modelParams_data[3] = samplePoints;
    }
    loop_ub = modelParams_size_idx_0 * modelParams_size_idx_1;
    for (nz = 0; nz < loop_ub; nz++) {
      angle = modelParams_data[nz];
      x_data[nz] = ((!rtIsInfF(angle)) && (!rtIsNaNF(angle)));
    }
    isValidModel = true;
    nleftm1 = 1;
    exitg1 = false;
    while ((!exitg1) && (nleftm1 <= loop_ub)) {
      if (!x_data[nleftm1 - 1]) {
        isValidModel = false;
        exitg1 = true;
      } else {
        nleftm1++;
      }
    }
    isValidModel = ((loop_ub == 4) && isValidModel);
    if (isValidModel) {
      angle = fabsf(acosf(fminf(
          1.0F,
          fmaxf(-1.0F, ((float)varargin_1_data[0] * modelParams_data[0] +
                        (float)varargin_1_data[1] * modelParams_data[1]) +
                           (float)varargin_1_data[2] * modelParams_data[2]))));
      angle = fminf(angle, 3.14159274F - angle);
      isValidModel = (angle < varargin_2);
    }
    if (isValidModel) {
      evalPlane(modelParams_data, allPoints, dis);
      dis_data = dis->data;
      nleftm1 = dis->size[0] - 1;
      for (nz = 0; nz <= nleftm1; nz++) {
        if (dis_data[nz] > params_maxDistance) {
          dis_data[nz] = params_maxDistance;
        }
      }
      if (dis->size[0] == 0) {
        angle = 0.0F;
      } else {
        int lastBlockLength;
        int nblocks;
        if (dis->size[0] <= 1024) {
          nleftm1 = dis->size[0];
          lastBlockLength = 0;
          nblocks = 1;
        } else {
          nleftm1 = 1024;
          nblocks = (int)((unsigned int)dis->size[0] >> 10);
          lastBlockLength = dis->size[0] - (nblocks << 10);
          if (lastBlockLength > 0) {
            nblocks++;
          } else {
            lastBlockLength = 1024;
          }
        }
        angle = dis_data[0];
        for (k = 2; k <= nleftm1; k++) {
          angle += dis_data[k - 1];
        }
        for (ib = 2; ib <= nblocks; ib++) {
          nleftm1 = (ib - 1) << 10;
          bsum = dis_data[nleftm1];
          if (ib == nblocks) {
            nz = lastBlockLength;
          } else {
            nz = 1024;
          }
          for (k = 2; k <= nz; k++) {
            bsum += dis_data[(nleftm1 + k) - 1];
          }
          angle += bsum;
        }
      }
      if (angle < bestDis) {
        bestDis = angle;
        nleftm1 = dis->size[0];
        nz = bestInliers->size[0];
        bestInliers->size[0] = dis->size[0];
        emxEnsureCapacity_boolean_T(bestInliers, nz);
        bestInliers_data = bestInliers->data;
        for (nz = 0; nz < nleftm1; nz++) {
          bestInliers_data[nz] = (dis_data[nz] < params_maxDistance);
        }
        bestModelParams_size[0] = modelParams_size_idx_0;
        bestModelParams_size[1] = modelParams_size_idx_1;
        if (loop_ub - 1 >= 0) {
          memcpy(&bestModelParams_data[0], &modelParams_data[0],
                 (unsigned int)loop_ub * sizeof(float));
        }
        if (bestInliers->size[0] == 0) {
          nz = 0;
        } else {
          nz = bestInliers_data[0];
          for (k = 2; k <= nleftm1; k++) {
            nz += bestInliers_data[k - 1];
          }
        }
        angle = rt_powf_snf((float)nz / (float)numPts_tmp, 3.0F);
        if (angle < 1.1920929E-7F) {
          nleftm1 = MAX_int32_T;
        } else {
          angle = ceilf(-2.00000048F / log10f(1.0F - angle));
          if (angle < 2.14748365E+9F) {
            nleftm1 = (int)angle;
          } else {
            nleftm1 = 0;
          }
        }
        if (numTrials > nleftm1) {
          numTrials = nleftm1;
        }
      }
      idxTrial++;
    } else {
      skipTrials++;
    }
  }
  emxFree_real32_T(&dis);
  loop_ub = bestModelParams_size[0] * bestModelParams_size[1];
  for (nz = 0; nz < loop_ub; nz++) {
    angle = bestModelParams_data[nz];
    x_data[nz] = ((!rtIsInfF(angle)) && (!rtIsNaNF(angle)));
  }
  isValidModel = true;
  nleftm1 = 1;
  exitg1 = false;
  while ((!exitg1) && (nleftm1 <= loop_ub)) {
    if (!x_data[nleftm1 - 1]) {
      isValidModel = false;
      exitg1 = true;
    } else {
      nleftm1++;
    }
  }
  isValidModel = ((loop_ub == 4) && isValidModel);
  if (isValidModel) {
    angle = fabsf(acosf(fminf(
        1.0F, fmaxf(-1.0F,
                    ((float)varargin_1_data[0] * bestModelParams_data[0] +
                     (float)varargin_1_data[1] * bestModelParams_data[1]) +
                        (float)varargin_1_data[2] * bestModelParams_data[2]))));
    angle = fminf(angle, 3.14159274F - angle);
    isValidModel = (angle < varargin_2);
  }
  if (isValidModel && (bestInliers->size[0] != 0)) {
    nleftm1 = bestInliers->size[0];
    nz = bestInliers_data[0];
    for (k = 2; k <= nleftm1; k++) {
      nz += bestInliers_data[k - 1];
    }
    if (nz >= 3) {
      isFound = true;
    } else {
      isFound = false;
    }
  } else {
    isFound = false;
  }
  emxFree_boolean_T(&bestInliers);
  return isFound;
}

/*
 * File trailer for msac.c
 *
 * [EOF]
 */
