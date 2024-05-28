/* Copyright 2018-2019 The MathWorks, Inc. */

#ifndef __MW_THRUST_FUNCTORS_H__
#define __MW_THRUST_FUNCTORS_H__

#ifdef __CUDACC__

#define MW_HOST_DEVICE __host__ __device__

template <typename T>
struct customGreater
{
    typedef T first_argument_type;
    typedef T second_argument_type;   
    typedef bool result_type;

    MW_HOST_DEVICE bool operator()(const T &lhs, const T &rhs) const {
        return lhs > rhs;
    }
};

template <>
struct customGreater <double>
{
    typedef double first_argument_type;
    typedef double second_argument_type;   
    typedef bool result_type;

    MW_HOST_DEVICE bool operator()(const double &lhs, const double &rhs) const {
        if(isnan(lhs) && isnan(rhs)) {
            return false;
        } else {
            return isnan(lhs) || lhs > rhs;
        }
    }
};

template <>
struct customGreater <float>
{
    typedef float first_argument_type;
    typedef float second_argument_type;   
    typedef bool result_type;

    MW_HOST_DEVICE bool operator()(const float &lhs, const float &rhs) const {
        if(isnan(lhs) && isnan(rhs)) {
            return false;
        } else {
            return isnan(lhs) || lhs > rhs;
        }
    }
};

template <typename T>
struct customLesser
{
    typedef T first_argument_type;
    typedef T second_argument_type;   
    typedef bool result_type;

    MW_HOST_DEVICE bool operator()(const T &lhs, const T &rhs) const {
        return lhs < rhs;
    }
};

template <>
struct customLesser <double>
{
    typedef double first_argument_type;
    typedef double second_argument_type;   
    typedef bool result_type;

    MW_HOST_DEVICE bool operator()(const double &lhs, const double &rhs) const {
        if(isnan(lhs) && isnan(rhs)) {
            return false;
        } else {
            return isnan(rhs) || lhs < rhs;
        }
    }
};

template <>
struct customLesser <float>
{
    typedef float first_argument_type;
    typedef float second_argument_type;   
    typedef bool result_type;

    MW_HOST_DEVICE bool operator()(const float &lhs, const float &rhs) const {
        if(isnan(lhs) && isnan(rhs)) {
            return false;
        } else {
            return isnan(rhs) || lhs < rhs;
        }
    }
};

#endif

#endif
