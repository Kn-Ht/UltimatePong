mod assets;
mod game;
use game::game::Game;

fn main() {
    let (mut rl, thread) = raylib::init()
        .title("Ultimate Pong")
        .size(800, 600)
        .resizable()
        .build();

    let mut game = Game::new(rl, thread);

    while !game.should_close {
        game.update();
        game.draw();
    }
}
