use raylib::prelude::*;

pub struct Game {
    should_close: bool,
    rl: RaylibHandle,
    thread: RaylibThread
}

impl Game {
    pub fn init() -> Self {
        let (mut rl, thread) = raylib::init()
            .size(800, 600)
            .resizable()
            .title("Ultimate Pong")
            .build();
        
        rl.set_exit_key(None);

        Self {
            should_close: false,
            rl, thread
        }
    }
    #[inline]
    pub fn should_close(&self) -> bool {
        self.should_close
    }
    pub fn update(&mut self) {
        self.should_close |= self.rl.window_should_close();
    }
    pub fn draw(&mut self) {
        let mut dr = self.rl.begin_drawing(&self.thread);
        dr.clear_background(Color::BLACK);

        if cfg!(debug_assertions) {
            dr.draw_fps(0, 0);
        }
    }
}