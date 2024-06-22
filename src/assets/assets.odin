package assets

import rl "vendor:raylib"

PIXEL_OPERATOR_BYTES := #load("pixel_operator/PixelOperator.ttf", []u8);
ARCADE_8BIT_BYTES := #load("8_bit_arcade/8-bit Arcade In.ttf", []u8);

Fonts :: struct {
    pixel_operator,
    arcade_8bit: rl.Font
}

load_font :: #force_inline proc($path: string, $ext: cstring) -> rl.Font {
    bytes := #load(path, []u8)
    size := i32(len(bytes))
    return rl.LoadFontFromMemory(ext, &bytes[0], size, 10, nil, 0)
}

load_fonts :: proc() -> (f: Fonts) {
    f.pixel_operator = load_font("pixel_operator/PixelOperator.ttf", ".ttf")
    f.arcade_8bit = load_font("8_bit_arcade/8-bit Arcade In.ttf", ".ttf")
    return f;
}

unload_fonts :: proc(using f: ^Fonts) {
    unl :: rl.UnloadFont;
    unl(pixel_operator);
    unl(arcade_8bit)
}