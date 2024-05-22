/* Copyright 2018-2019 The MathWorks, Inc. */

#ifndef __MW_SCAN_FUNCTORS_H__
#define __MW_SCAN_FUNCTORS_H__

#ifdef __CUDACC__

#define MW_HOST_DEVICE __host__ __device__

template <typename T>
struct checkNaN
{
    typedef T input_argument_type;   
    typedef T result_type;

    MW_HOST_DEVICE bool operator()(T &in) {
        return false;
    }
};

template <>
struct checkNaN <double>
{
    typedef double input_argument_type;   
    typedef double result_type;

    MW_HOST_DEVICE bool operator()(double &in) {
        return isnan(in);
    }
};

template <>
struct checkNaN <float>
{
    typedef float input_argument_type;   
    typedef float result_type;

    MW_HOST_DEVICE bool operator()(float &in) {
        return isnan(in);
    }
};

#endif

#endif
