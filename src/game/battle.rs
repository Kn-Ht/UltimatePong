use raylib::prelude::*;

pub struct Battle {

}

impl Battle {
    pub fn new() -> Self {
        Self {}
    }
}

pub trait BattleManager {
    fn update_battle(&mut self);
    fn draw_battle(&mut self);
}

impl BattleManager for crate::Game {
    fn draw_battle(&mut self) {
        
    }
    fn update_battle(&mut self) {
        
    }
}