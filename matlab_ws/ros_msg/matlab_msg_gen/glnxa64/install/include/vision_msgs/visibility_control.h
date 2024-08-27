#ifndef VISION_MSGS__VISIBILITY_CONTROL_H_
#define VISION_MSGS__VISIBILITY_CONTROL_H_
#if defined _WIN32 || defined __CYGWIN__
  #ifdef __GNUC__
    #define VISION_MSGS_EXPORT __attribute__ ((dllexport))
    #define VISION_MSGS_IMPORT __attribute__ ((dllimport))
  #else
    #define VISION_MSGS_EXPORT __declspec(dllexport)
    #define VISION_MSGS_IMPORT __declspec(dllimport)
  #endif
  #ifdef VISION_MSGS_BUILDING_LIBRARY
    #define VISION_MSGS_PUBLIC VISION_MSGS_EXPORT
  #else
    #define VISION_MSGS_PUBLIC VISION_MSGS_IMPORT
  #endif
  #define VISION_MSGS_PUBLIC_TYPE VISION_MSGS_PUBLIC
  #define VISION_MSGS_LOCAL
#else
  #define VISION_MSGS_EXPORT __attribute__ ((visibility("default")))
  #define VISION_MSGS_IMPORT
  #if __GNUC__ >= 4
    #define VISION_MSGS_PUBLIC __attribute__ ((visibility("default")))
    #define VISION_MSGS_LOCAL  __attribute__ ((visibility("hidden")))
  #else
    #define VISION_MSGS_PUBLIC
    #define VISION_MSGS_LOCAL
  #endif
  #define VISION_MSGS_PUBLIC_TYPE
#endif
#endif  // VISION_MSGS__VISIBILITY_CONTROL_H_
// Generated 27-Aug-2024 16:54:05
 