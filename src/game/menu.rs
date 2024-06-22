use raylib::prelude::*;

pub struct Menu {

}

pub trait MenuManager {
    fn update_menu(&mut self);
    fn draw_menu(&mut self);
}

impl MenuManager for crate::Game {
    fn update_menu(&mut self) {
        
    }
    fn draw_menu(&mut self) {
        let mut dr = self.rl.begin_drawing(&self.thread);
        dr.clear_background(Color::BLACK);
    }
}

impl Menu {
    pub fn new() -> Self {
        Self {}
    }
}