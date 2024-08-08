/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: main.c
 *
 * MATLAB Coder version            : 24.1
 * C/C++ source code generated on  : 28-May-2024 15:54:00
 */

/*************************************************************************/
/* This automatically generated example C main file shows how to call    */
/* entry-point functions that MATLAB Coder generated. You must customize */
/* this file for your application. Do not modify this file directly.     */
/* Instead, make a copy of this file, modify it, and integrate it into   */
/* your development environment.                                         */
/*                                                                       */
/* This file initializes entry-point function arguments to a default     */
/* size and value before calling the entry-point functions. It does      */
/* not store or use any values returned from the entry-point functions.  */
/* If necessary, it does pre-allocate memory for returned values.        */
/* You can use this file as a starting point for a main function that    */
/* you can deploy in your application.                                   */
/*                                                                       */
/* After you copy the file, and before you deploy it, you must make the  */
/* following changes:                                                    */
/* * For variable-size function arguments, change the example sizes to   */
/* the sizes that your application requires.                             */
/* * Change the example values of function arguments to the values that  */
/* your application requires.                                            */
/* * If the entry-point functions return values, store these values or   */
/* otherwise use them as required by your application.                   */
/*                                                                       */
/*************************************************************************/

/* Include Files */

/*매트랩 생성 헤더 파일*/
#include "main.h"
#include "G32_parsing.h"
#include "G32_parsing_emxAPI.h"
#include "G32_parsing_terminate.h"
#include "G32_parsing_types.h"
#include "rt_nonfinite.h"

/*소켓 통신 헤더 파일*/
#include <arpa/inet.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <unistd.h>

/*기타 헤더 파일*/
#include <pthread.h> //쓰레드 헤더 파일
#include <time.h> //함수 시간 측정 헤더 파일

#define BUF_SIZE 1330

/* 함수 선언 */
static void argInit_1330x1_real32_T(float result[178][BUF_SIZE]);
/* 
패킷 배열 초기화 함수(void)(float [178][1330])
1330 바이트 = 1패킷,
178 패킷 = 1 Frame
즉, 1 Frame 만큼 데이터를 담을 수 있는 배열 초기화
*/

static float argInit_real32_T(void);
/*
초기화 값 리턴 함수(float)(void)
배열 초기화에 사용되는 0 값 리턴 함수
Return : 0.0F
*/

void error_handling(char *message);
/*
에러 핸들링 함수(void)(char [])
에러가 발생하면 인자로 전달받은 메시지 출력,
그 후에 프로그램 종료
*/

static void msg_to_float(unsigned char (*message)[BUF_SIZE],
                         float (*arr)[BUF_SIZE]);
/* 
패킷 float 변환 함수(void)(char[178][1330],float[178][1330])
파싱 함수가 float 형식의 배열을 취급하기에
char 형식의 메시지 패킷을 float 패킷으로 전환
*/

void *receive_udp_packets(void *arg);
/* 
udp 패킷 receive 함수(void)(void *)
udp 패킷을 전달받는 함수, 1330 * 178 개의 char 데이터를 전달받으며
pthread 라이브러리를 사용하여 mutex를 통해 전역 변수에 패킷 저장
*/




/* 전역 변수 선언 */
unsigned char packets[178][BUF_SIZE]; //패킷 저장용 전역 변수
pthread_mutex_t mutex;

int main(int argc, char **argv)
{
  emxArray_real32_T *xyzCoords;
  emxArray_real32_T *xyzIntensity;

  float chn[178][BUF_SIZE];
  boolean_T isValid;
  float esti_time = 0;
  pthread_t recv_thread;

  int frame_num = 0;
  float reset_flag = 0.0F;

  struct timespec begin, end;

  emxInitArray_real32_T(&xyzCoords, 2); //좌표 담을 구조체 초기화
  emxInitArray_real32_T(&xyzIntensity, 2);
  argInit_1330x1_real32_T(chn); // 메인스레드 패킷 변수 초기화

  // 소켓 디스크립터
  int serv_sock;

  // 클라이언트로 부터 수신 받은 문자열 길이
  int str_len;

  socklen_t clnt_adr_sz;

  struct sockaddr_in serv_adr, clnt_adr;

  // 실행파일 경로 /port 번호 입력받기
  if (argc != 2) {
    printf("Usage : %s <port>\n", argv[0]);
    exit(1);
  }

  // udp 소켓 생성
  serv_sock = socket(PF_INET, SOCK_DGRAM, 0);
  if (serv_sock == -1) {
    error_handling("udp socket creation error");
  }

  // 서버 주소 정보 초기화
  memset(&serv_adr, 0, sizeof(serv_adr));
  serv_adr.sin_family = AF_INET;
  serv_adr.sin_addr.s_addr = htonl(INADDR_ANY);
  serv_adr.sin_port = htons(atoi(argv[1]));

  // 서버 주소 정보 할당
  if (bind(serv_sock, (struct sockaddr *)&serv_adr, sizeof(serv_adr)) == -1) {
    error_handling("bind creation error");
  }

  //쓰레드 생성
  if (pthread_create(&recv_thread, NULL, receive_udp_packets,
                     (void *)&serv_sock) != 0)
    error_handling("pthread_create() error");

  // 메인 스레드에서 다른 작업 수행
  while (1) {
    
    pthread_mutex_lock(&mutex); // 뮤텍스를 사용하여 공유 데이터 접근
    msg_to_float(packets, chn); //지역 변수로 복사
    pthread_mutex_unlock(&mutex); //공유 데이터 접근 해제

    for (int i = 0; i < 178; i++) {
      G32_parsing(chn[i], reset_flag, xyzCoords, xyzIntensity, &isValid); //1330바이트 패킷 178번 파싱
      if (isValid) { // 1 프레임이 성공적으로 파싱되면
        for (int j = 0; j < 22784; j++) { 
          if (xyzCoords->data[j * 3] > 0) //x 좌표 0 이상이면 출력
            printf("x:%f y:%f z:%f i:%f \n", xyzCoords->data[j * 3],
                   xyzCoords->data[j * 3 + 1], xyzCoords->data[j * 3 + 2],
                   xyzIntensity->data[j]);
        }
      }
    }
    reset_flag = 1.0F;
    sleep(0.3); // 다른 작업을 수행하는 동안 0.3초 대기
  }

  // 수신 스레드 종료 대기
  pthread_join(recv_thread, NULL);
  pthread_mutex_destroy(&mutex); // 뮤텍스 소멸

  // udp 소켓 종료
  close(serv_sock);
  emxDestroyArray_real32_T(xyzCoords);
  emxDestroyArray_real32_T(xyzIntensity);
  G32_parsing_terminate();
  printf("end!\n");

  return 0;
}

/*함수 구현부*/
void error_handling(char *message)
{
  fputs(message, stderr);
  fputc('\n', stderr);
  exit(1);
}

static void msg_to_float(unsigned char (*message)[BUF_SIZE],
                         float (*arr)[BUF_SIZE])
{
  for (int j = 0; j < 178; j++) {
    for (int i = 0; i < BUF_SIZE; i++) {
      arr[j][i] = (int)message[j][i];
    }
  }
}

void *receive_udp_packets(void *arg)
{
  int sock = *(int *)arg;
  struct sockaddr_in clnt_addr;
  socklen_t clnt_addr_size;
  unsigned char buffer[178][BUF_SIZE];
  clnt_addr_size = sizeof(clnt_addr);   
  while (1) {
    for (int i = 0; i < 178; i++) {
      int str_len = recvfrom(sock, buffer[i], BUF_SIZE, 0,
                             (struct sockaddr *)&clnt_addr, &clnt_addr_size);
      if (str_len < 0) {
        fprintf(stderr, "recvfrom() error\n");
        continue;
      }
      buffer[i][str_len] = '\0'; // 버퍼 메모리 마지막 부분 Null 처리
    }
    pthread_mutex_lock(&mutex);
    memcpy(packets, buffer, sizeof(buffer));
    pthread_mutex_unlock(&mutex);
    sleep(0.3);
  }
  return NULL;
}

static void argInit_1330x1_real32_T(float result[178][BUF_SIZE])
{
  int idx0, idx1;
  for (idx1 = 0; idx1 < 178; idx1++) {
    for (idx0 = 0; idx0 < 1330; idx0++) {
      result[idx1][idx0] = argInit_real32_T();
    }
  }
}

static float argInit_real32_T(void)
{
  return 0.0F;
}

/*
 * File trailer for main.c
 *
 * [EOF]
 */