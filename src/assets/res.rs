use raylib::prelude::*;
use crate::Game;

pub struct Fonts {
    pixel_operator: Font,
    arcade_8bit: Font,
}

pub trait AssetManager {
    fn load_fonts(&mut self) -> Fonts;
}