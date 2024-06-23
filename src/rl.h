//! rl.h: Includes Raylib and Raygui and provides convenience functions
#pragma once

#define RAYGUI_IMPLEMENTATION

#include "raylib.h"
#include "raymath.h"
#include "raygui.h"
#include <stdbool.h>
#include <stdint.h>

typedef signed char i8;
typedef signed short i16;
typedef signed int i32;
typedef signed long i64;
typedef signed long long i128;

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long u64;
typedef unsigned long long u128;

typedef float f32;
typedef double f64;

typedef Vector2 v2;
typedef Rectangle rect;

#define vec2(X, Y) (v2){(float)(X), (float)(Y)}
#define rect_new(X, Y, W, H) (rect){(float)(X), (float)(Y), (float)(W), (float)(H)}

#define VEC2ZERO (Vector2){0.0f, 0.0f}
#define vec2add Vector2Add
#define vec2addv Vector2AddValue
#define vec2sub Vector2Subtract
#define vec2subv Vector2SubtractValue
#define vec2div Vector2Divide
#define vec2mul Vector2Multiply

Color random_color(Color min, Color max) {
    #define rand_u8(MN, MX) ((MN < MX)? (u8)GetRandomValue(MN, MX) : MN)
    return (Color) {
        .r = rand_u8(min.r, max.r),
        .g = rand_u8(min.g, max.g),
        .b = rand_u8(min.b, max.b),
        .a = rand_u8(min.a, max.a)
    };
}

static rect screen = {0};