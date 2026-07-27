#pragma once



#include "vec.cuh"




// 3D vector specialisation of vec. Implements:
//		- Cross product + assignment operator
//		- clean x,y,z aliases
template<typename num_T>
struct vec<3, num_T> : vec_base<3, vec<3, num_T>, num_T> {



    union {
        num_T data[3];
        struct { num_T x, y, z; };
    };




    constexpr vec() = default;

    __host__ __device__ constexpr vec(num_T _x, num_T _y, num_T _z) noexcept : x(_x), y(_y), z(_z) {}

	constexpr vec(const vec& other) = default;

	constexpr vec& operator=(const vec& other) = default;




    // Cross product
    __host__ __device__ constexpr vec operator^(const vec& other) const noexcept {
        vec res = *this;
        res ^= other;
        return res;
    }
    __host__ __device__ constexpr vec& operator^=(const vec& other) noexcept {
        num_T _x = x, _y = y, _z = z;
        x = _y * other.z - _z * other.y;
        y = _z * other.x - _x * other.z;
        z = _x * other.y - _y * other.x;
        return *this;
    }



};
