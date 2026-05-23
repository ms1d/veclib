#pragma once



#include "vec.cuh"




// 2D vector specialisation of vec. Implements:
//		- clean x,y,z aliases
template<typename num_T>
struct vec<2, num_T> : vec_base<2, vec<2, num_T>, num_T> {



    union {
        num_T data[2];
        struct { num_T x, y; };
    };




	constexpr vec() = default;

    __host__ __device__ constexpr vec(num_T x, num_T y) noexcept : x(x), y(y) {}

	constexpr vec(const vec& other) = default;

	constexpr vec& operator=(const vec& other) = default;



};
