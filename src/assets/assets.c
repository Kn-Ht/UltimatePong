#pragma once

#include "../rl.h"
#include "generator.c"
#include "8_bit_arcade/arcade_8bit_in.h"
#include "8_bit_arcade/arcade_8bit_out.h"
#include "pixel_operator/PixelOperator.h"

// TODO: compress all data (it was not working before)

typedef struct fonts {
    Font pixel_operator, arcade_8bit;
} fonts_t;

static fonts_t fonts;

Font load_font(const char* type, const u8* data, i32 size) {
    return LoadFontFromMemory(
        type, data, size, 100, NULL, 0
    );
}


static RenderTexture2D battle_bg;
void generate_images() {
    battle_bg = generate_img(IMG_BATTLE);
}
void unload_generated_images() {
    UnloadRenderTexture(battle_bg);
}

void load_fonts() {
    fonts.pixel_operator = GuiGetFont();
    fonts.arcade_8bit = load_font(".ttf", ARCADE_8BIT_IN_DATA, ARCADE_8BIT_IN_DATA_SIZE);
}

void unload_fonts() {
    UnloadFont(fonts.arcade_8bit);
    UnloadFont(fonts.pixel_operator);
}