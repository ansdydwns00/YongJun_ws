// Copyright 2021-2022 The MathWorks, Inc.
#ifndef _MLROS2_NODE_H_
#define _MLROS2_NODE_H_

#include "rclcpp/rclcpp.hpp"

#define UNUSED_PARAM(x)

// Shared pointer to global node is defined elsewhere
extern rclcpp::Node::SharedPtr gNodePtr;

static std::vector<std::string> stringVecParamValues_{};
static std::vector<unsigned char> uint8VecParamValues_{};

namespace MATLAB {

inline rclcpp::Node::SharedPtr getGlobalNodeHandle() {
    return gNodePtr;
}

/**
 * Get the value for a named parameter.
 * @param paramName The name of the parameter
 * @param paramValue The pointer to data variable. The retrieved parameter
 * value will be written to this location.
 */

template <typename CppParamType>
inline CppParamType getParameter(std::string paramName, bool* status) {
    CppParamType paramValue;
    try {
        *status = gNodePtr->get_parameter(paramName, paramValue);
    } catch (...) {
        *status = false;
    }
    return paramValue;
}

/**
 * Get the length of a string parameter.
 * @param paramName The name of the parameter
 */
inline uint32_t getStringParameterLength(std::string paramName) {
    try {
        std::string stringParamValue;
        bool status = gNodePtr->get_parameter(paramName, stringParamValue);
        if (status) {
            return stringParamValue.length();
        } else {
            return 0;
        }
    } catch (...) {
        return 0;
    }
}

/**
 * Get the string parameter given parameter name.
 * @param paramName The name of the parameter
 * @param paramValue The pointer to data variable. The retrieved parameter
 * value will be written to this location.
 */
inline bool getStringParameter(std::string paramName, char* paramValue) {
    bool status = false;
    try {
        if (paramValue != nullptr) {
            std::string pStringValue(paramValue);
            status = gNodePtr->get_parameter(paramName, pStringValue);
            if (status) {
                const char* pStr = pStringValue.c_str();
                size_t paramValueLength = strlen(pStr);
                strncpy(paramValue, pStr, paramValueLength);
                paramValue[paramValueLength] = 0;
            } else {
                paramValue[0] = 0;
            }
        }
    } catch (...) {
        return false;
    }
    return status;
}

/**
 * Set a ROS 2 parameter for primitive datatypes.
 * @param paramName The name of the parameter
 * @param value The parameter value that is about to set to parameter
 */
template <typename CppParamType>
inline void setParameter(std::string paramName, const CppParamType value) {
    gNodePtr->set_parameter(rclcpp::Parameter(paramName, value));
}

/**
 * Set a ROS 2 int64_t parameter.
 * @param paramName The name of the parameter
 * @param value The parameter value that is about to set to parameter
 */
template <typename IntParamType>
inline void setIntParameter(std::string paramName, const IntParamType value) {
    gNodePtr->set_parameter(rclcpp::Parameter(paramName, (int64_t)value));
}

/**
 * Set string value.
 * @param data The input string.
 */
inline void setStringValues(std::string data) {

    if (!data.empty()) {
        stringVecParamValues_.push_back(data);
    } else {
        stringVecParamValues_.push_back("");
    }
}

/**
 * Set the string array parameter.
 * @param paramName The name of the parameter
 */
inline void setStringArrayParameter(std::string paramName) {
    gNodePtr->set_parameter(rclcpp::Parameter(paramName, stringVecParamValues_));
    stringVecParamValues_ = {};
}

/**
 * Set uint8 value.
 * @param data The input unsigned char data.
 */
inline void setUint8Values(unsigned char data) {

    uint8VecParamValues_.push_back(data);
}

/**
 * Set the uint8 array parameter.
 * @param paramName The name of the parameter
 */
inline void setUint8ArrayParameter(std::string paramName) {
    gNodePtr->set_parameter(rclcpp::Parameter(paramName, uint8VecParamValues_));
    uint8VecParamValues_ = {};
}

/**
 * Set the other array of parameter.
 * @param paramName The name of the parameter
 * @param dataPtr Pointer to the data for assignment
 * @param arrLength Length of the new data
 */
template <typename CppParamType>
inline void setArrayParameter(std::string paramName, CppParamType* dataPtr, uint32_t arrLength) {

    std::vector<CppParamType> data(dataPtr, dataPtr + arrLength);
    gNodePtr->set_parameter(rclcpp::Parameter(paramName, data));
}

/**
 * Set int64_t of parameter.
 * @param paramName The name of the parameter
 * @param dataPtr Pointer to the data for assignment
 * @param arrLength Length of the new data
 */
template <typename IntParamType>
inline void setIntArrayParameter(std::string paramName, IntParamType* dataPtr, uint32_t arrLength) {

    std::vector<int64_t> data(dataPtr, dataPtr + arrLength);
    gNodePtr->set_parameter(rclcpp::Parameter(paramName, data));
}

} // namespace MATLAB

#endif
