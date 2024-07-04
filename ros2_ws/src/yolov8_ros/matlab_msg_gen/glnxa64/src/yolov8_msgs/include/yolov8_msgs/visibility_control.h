#ifndef YOLOV8_MSGS__VISIBILITY_CONTROL_H_
#define YOLOV8_MSGS__VISIBILITY_CONTROL_H_
#if defined _WIN32 || defined __CYGWIN__
  #ifdef __GNUC__
    #define YOLOV8_MSGS_EXPORT __attribute__ ((dllexport))
    #define YOLOV8_MSGS_IMPORT __attribute__ ((dllimport))
  #else
    #define YOLOV8_MSGS_EXPORT __declspec(dllexport)
    #define YOLOV8_MSGS_IMPORT __declspec(dllimport)
  #endif
  #ifdef YOLOV8_MSGS_BUILDING_LIBRARY
    #define YOLOV8_MSGS_PUBLIC YOLOV8_MSGS_EXPORT
  #else
    #define YOLOV8_MSGS_PUBLIC YOLOV8_MSGS_IMPORT
  #endif
  #define YOLOV8_MSGS_PUBLIC_TYPE YOLOV8_MSGS_PUBLIC
  #define YOLOV8_MSGS_LOCAL
#else
  #define YOLOV8_MSGS_EXPORT __attribute__ ((visibility("default")))
  #define YOLOV8_MSGS_IMPORT
  #if __GNUC__ >= 4
    #define YOLOV8_MSGS_PUBLIC __attribute__ ((visibility("default")))
    #define YOLOV8_MSGS_LOCAL  __attribute__ ((visibility("hidden")))
  #else
    #define YOLOV8_MSGS_PUBLIC
    #define YOLOV8_MSGS_LOCAL
  #endif
  #define YOLOV8_MSGS_PUBLIC_TYPE
#endif
#endif  // YOLOV8_MSGS__VISIBILITY_CONTROL_H_
// Generated 04-Jul-2024 19:36:13
 