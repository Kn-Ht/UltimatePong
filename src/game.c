#pragma once

#include "rl.h"

typedef enum gamestate {
    GM_MENU = 0,
    GM_BATTLE_PVP,
    GM_BATTLE_PVE,
} gamestate_t;

typedef struct game {
    bool should_close;
    bool paused;
    gamestate_t gamestate;
} game_t;


#include "menu/menu.c"
#include "assets/assets.c"
#include "ui_style.c"

game_t game_new() {
    // Load assets
    GuiLoadStyleDark();
    load_fonts();
    generate_images();

    game_t g = {0};

    return g;
}

void game_update(game_t* g) {
    g->should_close |= WindowShouldClose();
    screen.width = (f32)GetScreenWidth();
    screen.height = (f32)GetScreenHeight();

    switch (g->gamestate) {
        case GM_MENU: 
            menu_update(g);
            break;
        case GM_BATTLE_PVP:
            break;
        case GM_BATTLE_PVE:
            break;
    }
}

void game_draw(game_t* g) {
    switch (g->gamestate) {
        case GM_MENU:
            menu_draw(g);
            break;
        case GM_BATTLE_PVP:
            break;
        case GM_BATTLE_PVE:
            break;
    }

#if DEBUG
    DrawFPS(0, 0);
#endif
    EndDrawing();
}

void game_close(game_t* g) {
    unload_fonts();
    unload_generated_images();
}