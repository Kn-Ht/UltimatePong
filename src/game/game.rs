use raylib::prelude::*;

use super::battle::{Battle, BattleManager};
use super::menu::{Menu, MenuManager};
use super::paused::Pausable;
use super::select::Selector;

#[derive(Clone, Copy)]
pub enum State {
    Menu,
    Select,
    Battle,
    Paused
}

pub struct Game {
    // Raylib
    pub rl: RaylibHandle    ,
    pub thread: RaylibThread,
    // Game State
    pub state: State,
    pub menu: Menu,
    pub battle: Option<Battle>,
    // Window State
    pub should_close: bool,
}

impl Game {
    pub fn new(mut rl: RaylibHandle, thread: RaylibThread) -> Self {
        Self {
            state: State::Menu,
            menu: Menu::new(),
            battle: None,
            rl, thread,
            should_close: false
        }
    }
    pub fn update(&mut self) {
        self.should_close |= self.rl.window_should_close();
    
        match self.state {
            State::Menu => self.update_menu(),
            State::Select => self.update_selector(),
            State::Battle => self.update_battle(),
            State::Paused => self.update_paused(),
        }
    }
    pub fn draw(&mut self) {
        match self.state {
            State::Menu => self.draw_menu(),
            State::Select => self.draw_selector(),
            State::Battle => self.draw_battle(),
            State::Paused => {
                self.draw_battle();
                self.draw_paused_overlay();
            }
        }
    }
}