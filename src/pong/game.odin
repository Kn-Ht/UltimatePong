package pong

import rl "vendor:raylib"
import "../assets"

State :: enum {
    Menu,
    Battle,
    Paused,
}

Game :: struct {
    should_close: bool,
    state: State,
    fonts: assets.Fonts,
    battle_bg, menu_bg: rl.RenderTexture,
}

game_init :: proc() -> (g: Game) {
    g.should_close = false
    g.state = State.Menu
    g.fonts = assets.load_fonts()
    g.battle_bg = assets.generate_image(assets.GenImgType.Battle)
    g.menu_bg = assets.generate_image(assets.GenImgType.Menu)

    ui_apply_style(g.fonts.pixel_operator)

    return
}

game_free :: proc(using g: ^Game) {
    assets.unload_fonts(&fonts)
    rl.UnloadRenderTexture(battle_bg)
}

game_draw :: proc(using g: ^Game) {
    switch state {
        case .Menu:
            menu_draw(g)
        case .Battle:
            battle_draw(g)
        case .Paused:
            pause_draw(g)
    }
}

game_update :: proc(using g: ^Game) {
    should_close |= rl.WindowShouldClose()

    switch state {
        case .Menu:
            menu_update(g)
        case .Battle:
            battle_update(g)
        case .Paused:
            pause_update(g)
    }
}
