#pragma once

#include "rl.h"
#include "game.c"

typedef struct pong {
    i32 screen_width;
    i32 screen_height;
    game_t game;
} pong_t;

pong_t pong_new(i32 w, i32 h) {
    return (pong_t) {
        .screen_width = w,
        .screen_height = h,
    };
}

void pong_init(pong_t* p, u32 flags) {
    SetConfigFlags(flags);
    InitWindow(p->screen_width, p->screen_height, "Ultimate Pong");

    p->game = game_new();
}

void pong_update(pong_t* p) {
    game_update(&p->game);
}

void pong_draw(pong_t* p) {
    game_draw(&p->game);
}

void pong_close(pong_t* p) {
    game_close(&p->game);
    CloseWindow();
}