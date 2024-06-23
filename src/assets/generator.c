#pragma once

#include "../rl.h"

//! generator.c: functions for generating assets instead of pre-packing them.

typedef enum imgtype {
    IMG_BATTLE
} imgtype_t;

RenderTexture2D generate_img(imgtype_t type) {
    i32 width, height;

    switch (type) {
        case IMG_BATTLE: {width = 100; height = 100;} break;
    }

    RenderTexture2D target = LoadRenderTexture(width, height);

    BeginDrawing();
    BeginTextureMode(target);

    switch (type) {
    case IMG_BATTLE: {
        Color bg = {20, 20, 20, 255};
        ClearBackground(bg);
        for (i32 y = 0; y < height; y++) {
            for (i32 x = 0; x < width; x++) {
                Color color = random_color((Color){40, 40, 40, 200}, (Color){40, 40, 40, 255});
                if (x % 4 + y % 4 == 0) DrawPixel(x, y, color);
            }
        }

        Color diag_color = {50, 50, 50, 255};
        for (i32 y = 0; y < height; y++) {
            for (i32 x = 0; x < width; x++) {
                if (x == y || x == width - 1 - y) DrawPixel(x, y, diag_color);
            }
        }
    } break;
    }

    EndTextureMode();
    EndDrawing();

    return target;
}