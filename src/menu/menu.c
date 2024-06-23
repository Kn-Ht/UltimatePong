#pragma once

#include "../game.c"
#include "../assets/assets.c"

static rect button_bounds;
static v2 screen_center;
#define BUTTON_SPACING 10.0

void menu_draw(struct game* g) {
    static f32 time_passed = 0.0f;
    const f32 bg_time_max = 10.0;

    Color bg = {40, 40, 40, 255};
    Color smalltext = {80, 80, 80, 255};

    BeginDrawing();
    ClearBackground(bg);

    const char* title = "ULTIMATE PONG";
    f32 font_size = screen.width * 0.08;
    v2 title_size = MeasureTextEx(fonts.arcade_8bit, title, font_size, 1.0);
    v2 title_center = vec2divv(title_size, 2.0);
    v2 text_pos = vec2sub(screen_center, title_center);
    text_pos.y -= font_size * 2;

    DrawTextPro(fonts.arcade_8bit, title, text_pos, VEC2ZERO, 0.0, font_size, 1.0, WHITE);

    GuiButton(button_bounds, "Play");
    button_bounds.y += button_bounds.height + BUTTON_SPACING;
    if (GuiButton(button_bounds, "Exit")) {
        g->should_close = true;
    }

    // Draw small text
    #define SMALLTEXT(TEXT) DrawTextPro(fonts.pixel_operator, TEXT, smalltext_pos, VEC2ZERO, 0.0, smalltext_size, 1.0, smalltext);

    f32 smalltext_size = 20.0;
    v2 smalltext_pos = {0, screen.height - smalltext_size};
    SMALLTEXT("Version " VERSION);
    smalltext_pos.y -= smalltext_size;
    
    i32 prev_size = GuiGetStyle(0, TEXT_SIZE);
    i32 prev_color = GuiGetStyle(0, TEXT_COLOR_NORMAL);
    GuiSetStyle(0, TEXT_SIZE, (i32)smalltext_size);
    GuiSetStyle(0, TEXT_COLOR_NORMAL, 0x606060ff);

    if (GuiLabelButton((rect){0, smalltext_pos.y, 10 * smalltext_size, smalltext_size}, "Link to Repository")) {
        OpenURL("https://github.com/Kn-Ht/UltimatePong");
    }

    GuiSetStyle(0, TEXT_SIZE, prev_size);
    GuiSetStyle(0, TEXT_COLOR_NORMAL, prev_color);
}

void menu_update(struct game* g) {
    screen_center.x = screen.width / 2.0;
    screen_center.y = screen.height / 2.0;

    button_bounds.width = screen.width / 3.0;
    button_bounds.height = screen.height / 10.0;
    button_bounds.x = screen_center.x - button_bounds.width / 2.0;
    button_bounds.y = screen_center.y - button_bounds.height / 2.0;
}