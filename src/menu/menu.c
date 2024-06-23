#pragma once

#include "../game.c"
#include "../assets/assets.c"

static rect button_bounds;
static v2 screen_center;
#define BUTTON_SPACING 10.0

void menu_draw(struct game* g) {
    BeginDrawing();
    ClearBackground(BLACK);

    GuiButton(button_bounds, "Hello world!");
}

void menu_update(struct game* g) {
    screen_center.x = screen.width / 2.0;
    screen_center.y = screen.height / 2.0;

    button_bounds.width = screen.width / 3.0;
    button_bounds.height = screen.height / 10.0;
    button_bounds.x = screen_center.x - button_bounds.width / 2.0;
    button_bounds.y = screen_center.y - button_bounds.height / 2.0;
}