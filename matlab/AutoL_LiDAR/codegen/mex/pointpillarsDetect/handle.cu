//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// handle.cu
//
// Code generation for function 'handle'
//

// Include files
#include "handle.h"
#include "pointpillarsDetect_types.h"
#include "rt_nonfinite.h"
#include "cvstCG_kdtree.h"

// Function Definitions
namespace coder {
void handle_matlabCodegenDestructor(pointCloud *obj)
{
  if (!obj->matlabCodegenIsDeleted) {
    obj->matlabCodegenIsDeleted = true;
    if (obj->HasLocationHandleAllocated) {
      kdtreeDeleteLocationDataPointer_single(obj->LocationHandle);
      obj->HasLocationHandleAllocated = false;
    }
    if (obj->HasKdtreeConstructed) {
      kdtreeDeleteObj_single(obj->Kdtree);
      obj->HasKdtreeConstructed = false;
    }
  }
}

void handle_matlabCodegenDestructor(b_pointCloud *obj)
{
  if (!obj->matlabCodegenIsDeleted) {
    obj->matlabCodegenIsDeleted = true;
    if (obj->HasLocationHandleAllocated) {
      kdtreeDeleteLocationDataPointer_single(obj->LocationHandle);
      obj->HasLocationHandleAllocated = false;
    }
    if (obj->HasKdtreeConstructed) {
      kdtreeDeleteObj_single(obj->Kdtree);
      obj->HasKdtreeConstructed = false;
    }
  }
}

} // namespace coder

// End of code generation (handle.cu)
