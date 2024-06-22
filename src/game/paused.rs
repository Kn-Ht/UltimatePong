use raylib::prelude::*;

pub trait Pausable {
    fn update_paused(&mut self);
    fn draw_paused_overlay(&mut self);
}

impl Pausable for crate::Game {
    fn update_paused(&mut self) {
        
    }
    fn draw_paused_overlay(&mut self) {
        
    }
}