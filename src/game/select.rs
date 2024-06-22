use raylib::prelude::*;

pub trait Selector {
    fn update_selector(&mut self);
    fn draw_selector(&mut self);
}

impl Selector for crate::Game {
    fn draw_selector(&mut self) {
        
    }
    fn update_selector(&mut self) {
        
    }
}