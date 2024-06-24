#include "src/pong.c"

int main(void) {
    pong_t pong = pong_new(800, 600);
    u32 flags = FLAG_WINDOW_RESIZABLE;

    pong_init(&pong, flags);

    while (!pong.game.should_close) {
        pong_update(&pong);
        pong_draw(&pong);
    }

    pong_close(&pong);
    return 0;
}
