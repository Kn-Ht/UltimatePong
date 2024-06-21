mod game;

use game::Game;

fn main() {
    let mut game = Game::init();

    while !game.should_close() {
        game.update();
        game.draw();
    }
}
