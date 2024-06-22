package pong

import rl "vendor:raylib"
import "core:mem"

DARK_STYLE_PROPS := [][]i64 {
    { 0, 0, 0x878787ff },    // DEFAULT_BORDER_COLOR_NORMAL 
    { 0, 1, 0x2c2c2cff },    // DEFAULT_BASE_COLOR_NORMAL 
    { 0, 2, 0xc3c3c3ff },    // DEFAULT_TEXT_COLOR_NORMAL 
    { 0, 3, 0xe1e1e1ff },    // DEFAULT_BORDER_COLOR_FOCUSED 
    { 0, 4, 0x848484ff },    // DEFAULT_BASE_COLOR_FOCUSED 
    { 0, 5, 0x181818ff },    // DEFAULT_TEXT_COLOR_FOCUSED 
    { 0, 6, 0x000000ff },    // DEFAULT_BORDER_COLOR_PRESSED 
    { 0, 7, 0xefefefff },    // DEFAULT_BASE_COLOR_PRESSED 
    { 0, 8, 0x202020ff },    // DEFAULT_TEXT_COLOR_PRESSED 
    { 0, 9, 0x6a6a6aff },    // DEFAULT_BORDER_COLOR_DISABLED 
    { 0, 10, 0x818181ff },    // DEFAULT_BASE_COLOR_DISABLED 
    { 0, 11, 0x606060ff },    // DEFAULT_TEXT_COLOR_DISABLED 
    { 0, 16, 0x0000001e },    // DEFAULT_TEXT_SIZE 
    { 0, 17, 0x00000000 },    // DEFAULT_TEXT_SPACING 
    { 0, 18, 0x9d9d9dff },    // DEFAULT_LINE_COLOR 
    { 0, 19, 0x3c3c3cff },    // DEFAULT_BACKGROUND_COLOR 
    { 0, 20, 0x00000018 },    // DEFAULT_TEXT_LINE_SPACING 
    { 1, 5, 0xf7f7f7ff },    // LABEL_TEXT_COLOR_FOCUSED 
    { 1, 8, 0x898989ff },    // LABEL_TEXT_COLOR_PRESSED 
    { 4, 5, 0xb0b0b0ff },    // SLIDER_TEXT_COLOR_FOCUSED 
    { 5, 5, 0x848484ff },    // PROGRESSBAR_TEXT_COLOR_FOCUSED 
    { 9, 5, 0xf5f5f5ff },    // TEXTBOX_TEXT_COLOR_FOCUSED 
    { 10, 5, 0xf6f6f6ff },    // VALUEBOX_TEXT_COLOR_FOCUSED 
};

malloc :: proc($T: typeid, size: i32) -> [^]T {
    buf, _err := mem.alloc(int(size * size_of(T)))
    return cast([^]T)buf
}

ui_apply_style :: proc(font: rl.Font) {
    using rl

    for style in DARK_STYLE_PROPS {
        GuiSetStyle(
            auto_cast style[0],
            GuiStyleProp{auto_cast style[1], 0, 0},
            auto_cast style[2])
    }

    GuiSetFont(font);
}