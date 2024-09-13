# This file will be configured to contain variables for CPack. These variables
# should be set in the CMake list file of the project before CPack module is
# included. The list of available CPACK_xxx variables and their associated
# documentation may be obtained using
#  cpack --help-variable-list
#
# Some variables are common to all generators (e.g. CPACK_PACKAGE_NAME)
# and some are specific to a generator
# (e.g. CPACK_NSIS_EXTRA_INSTALL_COMMANDS). The generator specific variables
# usually begin with CPACK_<GENNAME>_xxxx.


set(CPACK_BUILD_SOURCE_DIRS "/home/aiv/YongJun_ws/ros2_ws/src/ugv_sdk;/home/aiv/YongJun_ws/ros2_ws/build/ugv_sdk")
set(CPACK_CMAKE_GENERATOR "Unix Makefiles")
set(CPACK_COMPONENT_UNSPECIFIED_HIDDEN "TRUE")
set(CPACK_COMPONENT_UNSPECIFIED_REQUIRED "TRUE")
set(CPACK_DEBIAN_FILE_NAME "DEB-DEFAULT")
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libasio-dev")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Ruixiang Du (ruixiang.du@westonrobot.com)")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_FILE "/home/aiv/.local/lib/python3.8/site-packages/cmake/data/share/cmake-3.25/Templates/CPack.GenericDescription.txt")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_SUMMARY "ugv_sdk built using CMake")
set(CPACK_DMG_SLA_USE_RESOURCE_FILE_LICENSE "ON")
set(CPACK_GENERATOR "DEB")
set(CPACK_INSTALL_CMAKE_PROJECTS "/home/aiv/YongJun_ws/ros2_ws/build/ugv_sdk;ugv_sdk;ALL;/")
set(CPACK_INSTALL_PREFIX "/home/aiv/YongJun_ws/ros2_ws/install/ugv_sdk")
set(CPACK_MODULE_PATH "/home/aiv/YongJun_ws/ros2_ws/src/ugv_sdk/cmake/modules")
set(CPACK_NSIS_DISPLAY_NAME "ugv_sdk 0.8.0")
set(CPACK_NSIS_INSTALLER_ICON_CODE "")
set(CPACK_NSIS_INSTALLER_MUI_ICON_CODE "")
set(CPACK_NSIS_INSTALL_ROOT "$PROGRAMFILES")
set(CPACK_NSIS_PACKAGE_NAME "ugv_sdk 0.8.0")
set(CPACK_NSIS_UNINSTALL_NAME "Uninstall")
set(CPACK_OBJCOPY_EXECUTABLE "/usr/bin/objcopy")
set(CPACK_OBJDUMP_EXECUTABLE "/usr/bin/objdump")
set(CPACK_OUTPUT_CONFIG_FILE "/home/aiv/YongJun_ws/ros2_ws/build/ugv_sdk/CPackConfig.cmake")
set(CPACK_PACKAGE_DEFAULT_LOCATION "/")
set(CPACK_PACKAGE_DESCRIPTION_FILE "/home/aiv/.local/lib/python3.8/site-packages/cmake/data/share/cmake-3.25/Templates/CPack.GenericDescription.txt")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "UGV SDK for Robots from AgileX/WestonRobot")
set(CPACK_PACKAGE_FILE_NAME "ugv_sdk-0.8.0-Linux")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "ugv_sdk 0.8.0")
set(CPACK_PACKAGE_INSTALL_REGISTRY_KEY "ugv_sdk 0.8.0")
set(CPACK_PACKAGE_NAME "ugv_sdk")
set(CPACK_PACKAGE_RELOCATABLE "true")
set(CPACK_PACKAGE_VENDOR "Weston Robot")
set(CPACK_PACKAGE_VERSION "0.8.0")
set(CPACK_PACKAGE_VERSION_MAJOR "0")
set(CPACK_PACKAGE_VERSION_MINOR "8")
set(CPACK_PACKAGE_VERSION_PATCH "0")
set(CPACK_READELF_EXECUTABLE "/usr/bin/readelf")
set(CPACK_RESOURCE_FILE_LICENSE "/home/aiv/YongJun_ws/ros2_ws/src/ugv_sdk/LICENSE")
set(CPACK_RESOURCE_FILE_README "/home/aiv/YongJun_ws/ros2_ws/src/ugv_sdk/README.md")
set(CPACK_RESOURCE_FILE_WELCOME "/home/aiv/.local/lib/python3.8/site-packages/cmake/data/share/cmake-3.25/Templates/CPack.GenericWelcome.txt")
set(CPACK_SET_DESTDIR "OFF")
set(CPACK_SOURCE_GENERATOR "TBZ2;TGZ;TXZ;TZ")
set(CPACK_SOURCE_IGNORE_FILES ".git;dist;.*build.*;/\\.DS_Store")
set(CPACK_SOURCE_OUTPUT_CONFIG_FILE "/home/aiv/YongJun_ws/ros2_ws/build/ugv_sdk/CPackSourceConfig.cmake")
set(CPACK_SOURCE_RPM "OFF")
set(CPACK_SOURCE_TBZ2 "ON")
set(CPACK_SOURCE_TGZ "ON")
set(CPACK_SOURCE_TXZ "ON")
set(CPACK_SOURCE_TZ "ON")
set(CPACK_SOURCE_ZIP "OFF")
set(CPACK_SYSTEM_NAME "Linux")
set(CPACK_THREADS "1")
set(CPACK_TOPLEVEL_TAG "Linux")
set(CPACK_WIX_SIZEOF_VOID_P "8")

if(NOT CPACK_PROPERTIES_FILE)
  set(CPACK_PROPERTIES_FILE "/home/aiv/YongJun_ws/ros2_ws/build/ugv_sdk/CPackProperties.cmake")
endif()

if(EXISTS ${CPACK_PROPERTIES_FILE})
  include(${CPACK_PROPERTIES_FILE})
endif()
