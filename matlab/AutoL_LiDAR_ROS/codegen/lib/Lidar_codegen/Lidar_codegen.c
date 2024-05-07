/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: Lidar_codegen.c
 *
 * MATLAB Coder version            : 23.2
 * C/C++ source code generated on  : 03-May-2024 21:18:42
 */

/* Include Files */
#include "Lidar_codegen.h"
#include <string.h>

/* Function Definitions */
/*
 * [x,y,z] 좌표 값 사전 할당(178 packet * 128 points) -> 코드 속도를 위해 사전
 * 할당
 *
 * Arguments    : double points[68352]
 * Return Type  : void
 */
void Lidar_codegen(double points[68352])
{
  double k;
  int i;
  int i1;
  int ii;
  memset(&points[0], 0, 68352U * sizeof(double));
  k = 1.0;
  for (ii = 0; ii < 1000; ii++) {
    double b_k;
    /*  패킷 1개 parsing */
    /*  Payload Header와 Payload로 분할(UDP Header는 잘려서 수신 받음) */
    /*  [1 x 28] */
    /*  [1 x 1296] ( Timestamp, ProductID 제외)   */
    /* ------------------------------------payload_header------------------------------------%
     */
    /*  A5 = 165, B3 = 179, C2 = 194, 01 = 1, AA(종료) = 170, CC(에러) = 204,
     * 프레임이 종료인지 아닌지는 6번째 열을 확인  */
    /*  패킷 1개에 해당하는 pointCloud 검출  */
    /*  하부 프레임 */
    /*  상부 프레임 */
    /*  해당 프레임이 상부 프레임인지 하부 프레임인지 확인 */
    /*  정밀 방위각 계산을 위해 방위각 offset을 적용 */
    /*  방위각에 대한 값, 8개 (3 echo mode) */
    /*  방위각에 대한 ToF, 값 [8*16] */
    /*  [16 x 8] 재배열 */
    /*  [x,y,z] 좌표값 구하기 */
    /*  패킷 속 xyz 좌표값 저장 */
    b_k = (k - 1.0) * 128.0 + 1.0;
    for (i = 0; i < 3; i++) {
      for (i1 = 0; i1 < 128; i1++) {
        points[((int)(b_k + (double)i1) + 22784 * i) - 1] = 0.0;
      }
    }
    k++;
    /*  1 프레임 종료 확인(하부 프레임 89개 다음 상부 프레임 89개 수신 받으면
     * 180 패킷 == 1 프레임);  */
  }
}

/*
 * File trailer for Lidar_codegen.c
 *
 * [EOF]
 */
