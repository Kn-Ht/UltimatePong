package main

import rl "vendor:raylib"
import "src/pong"

main :: proc() {
    p := pong.pong();
    flags :: rl.ConfigFlags{.WINDOW_RESIZABLE}

    pong.init(&p, flags);

    defer pong.close(&p);
    defer pong.free(&p);

    for !p.should_close {
        pong.update(&p);
        pong.draw(&p);
    }
}